# Handles HTTP requests for hacker resources.
#
# Hackers represent individuals or teams credited with discovering exploits.
# This controller provides basic CRUD operations for hacker management.
# Hackers are listed alphabetically and can be marked as teams.
#
# @see https://guides.rubyonrails.org/routing.html RESTful Routing
class HackersController < ApplicationController
  before_action :set_hacker, only: [ :edit, :update, :destroy ]

  # Displays all hackers in alphabetical order.
  # Why: Alphabetical ordering makes it easy to locate specific hackers
  # in the credits view.
  #
  # @return [void] Renders the index view with @hackers populated
  def index
    @hackers = Hacker.order(:handle)
  end

  # Renders form for creating a new hacker.
  #
  # @return [void] Renders the new view with an empty @hacker instance
  def new
    @hacker = Hacker.new
  end

  # Creates a new hacker with provided attributes.
  #
  # @param hacker_params [ActionController::Parameters] Whitelisted hacker attributes
  # @return [void] Redirects to hackers index on success, renders :new on failure
  def create
    @hacker = Hacker.new(hacker_params)

    if @hacker.save
      redirect_to hackers_path, notice: "Hacker created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Renders form for editing an existing hacker.
  #
  # @return [void] Renders the edit view with @hacker populated
  def edit
  end

  # Updates an existing hacker with provided parameters.
  #
  # @param hacker_params [ActionController::Parameters] Whitelisted hacker attributes
  # @return [void] Redirects to hackers index on success, renders :edit on failure
  def update
    if @hacker.update(hacker_params)
      redirect_to hackers_path, notice: "Hacker updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Removes a hacker from the database.
  # Why: Dependent destroy on credits ensures no orphaned credit records remain.
  #
  # @return [void] Redirects to hackers index after deletion
  def destroy
    @hacker.destroy
    redirect_to hackers_path, notice: "Hacker deleted successfully."
  end

  private

  # Retrieves hacker by ID from URL parameters.
  # Why: Numeric ID lookup is appropriate for admin interface where
  # SEO-friendly URLs are less critical.
  # Raises ActiveRecord::RecordNotFound if ID doesn't exist.
  #
  # @return [void] Sets @hacker instance variable
  # @raise [ActiveRecord::RecordNotFound] If hacker ID doesn't exist in database
  def set_hacker
    @hacker = Hacker.find(params[:id])
  end

  # Whitelists permitted parameters for hacker mass assignment.
  # Why: Strong parameters prevent mass assignment vulnerabilities by only
  # allowing explicitly permitted attributes.
  #
  # @return [ActionController::Parameters] Permitted hacker attributes
  def hacker_params
    params.require(:hacker).permit(:handle, :team)
  end
end
