class ListItem < ApplicationRecord
  belongs_to :todo_list

  validates :title, presence: true
  validates :done, inclusion: { in: [true, false] }
  validates :priority, allow_blank: true, inclusion: { in: ["high", "medium", "low"], allow_nil: true }

  before_validation :set_defaults

  private

  def set_defaults
    self.done = false if done.nil?
  end
end
