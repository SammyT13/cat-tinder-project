class Cat < ApplicationRecord
    # Validates the name, age, enjoys fields (attributes)
    validates :name, :age, :enjoys, presence: true
    # Validates enjoys minimum characters
    validates :enjoys, length: { minimum: 10 }
end
