# Join table linking exploits to their discoverers (hackers).
#
# Credits represent many-to-many relationships between exploits and hackers,
# allowing exploits to have multiple discoverers and hackers to be credited
# for multiple exploits. This schema supports attribution metadata in future
# extensions (e.g., contribution type, discovery date).
#
# @see https://guides.rubyonrails.org/association_basics.html#the-has-many-through-association Has Many Through
class Credit < ApplicationRecord
  belongs_to :exploit
  belongs_to :hacker

  # Why: Prevent duplicate attribution of the same hacker to the same exploit.
  # Each hacker-exploit pair must be unique to ensure accurate credit assignment.
  validates :exploit, uniqueness: { scope: :hacker, message: "has already been credited" }
end
