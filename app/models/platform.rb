# Represents a gaming console platform (e.g., Wii, PS3, Xbox 360).
#
# Platforms serve as the primary organizational entity for exploits.
# Each platform has a unique slug for SEO-friendly URLs and stores
# manufacturer information and release date for historical context.
#
# @see https://guides.rubyonrails.org/active_record_basics.html#overriding-default-naming Overriding to_param
class Platform < ApplicationRecord
  has_many :exploits, dependent: :destroy, inverse_of: :platform
  has_many :hackers, through: :exploits

  # Why: Platform name is the primary human-readable identifier and required
  # for proper display in the UI. Must correspond to official console names
  # (e.g., "PlayStation 3", "Wii") for historical accuracy.
  validates :name, presence: true

  # Why: Slug is required for SEO-friendly URLs and must be unique to prevent
  # routing conflicts. Enables human-readable URLs like /platforms/wii instead
  # of /platforms/1. Uniqueness constraint enforced at database level.
  validates :slug, presence: true, uniqueness: true

  scope :alphabetical, -> { order(:name) }

  # Why: Expose exploits in chronological order to visualize evolution
  # of security vulnerabilities on this platform over time.
  def chronological_exploits
    exploits.chronological
  end

  # Why: Override to_param to use slug instead of numeric ID in URLs.
  # This creates human-readable, SEO-friendly URLs like /platforms/wii
  # instead of /platforms/1. Slugs remain stable even if database is restored.
  def to_param
    slug
  end
end
