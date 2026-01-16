# Represents an individual or team credited with discovering exploits.
#
# Hackers are identified by a unique handle (username/team name).
# The team boolean distinguishes between individual hackers and groups.
#
# @see https://guides.rubyonrails.org/association_basics.html#has-many-associations Has Many Associations
class Hacker < ApplicationRecord
  has_many :credits, dependent: :destroy
  has_many :exploits, through: :credits

  # Why: Handle is required as the unique identifier for hacker attribution.
  # Uniqueness ensures no duplicate handles exist, preventing identity confusion
  # in credits (e.g., two different "geohot" entries).
  validates :handle, presence: true, uniqueness: true

  # Why: Provide consistent display name interface for views and serializers.
  # Currently returns handle directly, but this abstraction allows for
  # future enhancements (e.g., capitalization, special characters) without
  # changing callers.
  def display_name
    handle
  end
end
