class Paper < ApplicationRecord
    serialize :students_assigned, Array
    validates(:title,
              :presence     => { :message => 'can\'t be blank' },
              :uniqueness   => { :message => 'has already been taken'})
    
    validates(:paper_id,
              :presence     => { :message => 'can\'t be blank' },
              :uniqueness   => { :message => 'has already been taken'},
              format: { with: /\d/ })
    
    validates(:description,
              :presence     => { :message => 'can\'t be blank' })
end
