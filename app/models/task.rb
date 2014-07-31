class Task < ActiveRecord::Base
  belongs_to :project

  validates :name,   presence: true
  validates :status, inclusion: { in: %w(todo doing done), message: "%{value} is not a valid status" }
end
