# Handles HTTP requests for platform resources.
#
# Platforms represent gaming consoles and serve as the main navigation hub.
# Each platform page displays a chronological timeline of discovered exploits.
# This controller manages platform CRUD operations and index listing.
#
# @see https://guides.rubyonrails.org/routing.html#resource-routing-the-default-rails-rest-convention RESTful Routing
class PlatformsController < ApplicationController
  before_action :set_platform, only: [ :show, :edit, :update, :destroy ]

  # Displays all platforms in alphabetical order for the Hall of Fame view.
  # Why: Alphabetical ordering makes it easy for users to find specific consoles.
  #
  # @return [void] Renders the index view with @platforms populated
  def index
    @platforms = Platform.alphabetical
  end

  # Displays a single platform with its chronological exploit timeline.
  # Why: Chronological ordering shows evolution of exploits and security research
  # progress over time for this specific platform.
  #
  # @return [void] Renders the show view with @platform and @exploits populated
  def show
    @exploits = @platform.exploits.chronological
  end

  # Renders form for creating a new platform.
  #
  # @return [void] Renders the new view with an empty @platform instance
  def new
    @platform = Platform.new
  end

  # Creates a new platform with provided attributes.
  # Why: Redirect to slug-based URL for SEO-friendly access to the new resource.
  #
  # @param platform_params [ActionController::Parameters] Whitelisted platform attributes
  # @return [void] Redirects to platform show page on success, renders :new on failure
  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      redirect_to platform_path(slug: @platform.slug), notice: "Platform created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Renders form for editing an existing platform.
  #
  # @return [void] Renders the edit view with @platform populated
  def edit
  end

  # Updates an existing platform with provided parameters.
  # Why: Redirect to slug-based URL even if slug changed to use canonical URL.
  #
  # @param platform_params [ActionController::Parameters] Whitelisted platform attributes
  # @return [void] Redirects to platform show page on success, renders :edit on failure
  def update
    if @platform.update(platform_params)
      redirect_to platform_path(slug: @platform.slug), notice: "Platform updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Removes a platform and all associated exploits from the database.
  # Why: Dependent destroy on exploits ensures no orphaned records remain.
  #
  # @return [void] Redirects to platforms index after deletion
  def destroy
    @platform.destroy
    redirect_to platforms_path, notice: "Platform deleted successfully."
  end

  private

  # Retrieves platform by slug from URL parameters.
  # Why: Slug-based lookup provides human-readable URLs (/platforms/wii vs /platforms/1).
  # Raises ActiveRecord::RecordNotFound if slug doesn't exist.
  #
  # @return [void] Sets @platform instance variable
  # @raise [ActiveRecord::RecordNotFound] If slug doesn't exist in database
  def set_platform
    @platform = Platform.find_by!(slug: params[:slug])
  end

  # Whitelists permitted parameters for platform mass assignment.
  # Why: Strong parameters prevent mass assignment vulnerabilities by only
  # allowing explicitly permitted attributes.
  #
  # @return [ActionController::Parameters] Permitted platform attributes
  def platform_params
    params.require(:platform).permit(:name, :slug, :manufacturer, :release_date, :generation)
  end
end
