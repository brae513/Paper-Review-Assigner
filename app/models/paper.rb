class Paper < ApplicationRecord
    validates(:title,
              :presence     => { :message => 'can\'t be blank' },
              :uniqueness   => { :message => 'has already been taken'})
              
    validates(:paper_id,
              :presence     => { :message => 'can\'t be blank' },
              :uniqueness   => { :message => 'has already been taken'})
              
    validates(:description,
              :presence     => { :message => 'can\'t be blank'})
              
    serialize :students_assigned, Array
end
