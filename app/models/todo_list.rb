class TodoList < ApplicationRecord
    has_many :list_items, dependent: :destroy

    validates :title, presence: true
    validates :color, allow_blank: true, inclusion: { in: ["#5E93E3", "#E35E5E", "#5EE393", "#E37ACC", "#EDCE7E", "#8D91F4"], allow_nil: true }
    validates :done, inclusion: { in: [true, false] }
  
    before_validation :set_defaults
  
    private
  
    def set_defaults
      self.done = false if done.nil?
    end
end
