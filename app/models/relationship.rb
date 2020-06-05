class Relationship < ApplicationRecord
  belongs_to :listener
  belongs_to :follow, class_name: 'Listener'

  validates :listener_id, presence: true
  validates :follow_id, presence: true
end
