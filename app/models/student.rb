class Student < ApplicationRecord
    serialize :paper_preference, Array
end
