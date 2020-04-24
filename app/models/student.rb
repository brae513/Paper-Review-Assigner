class Student < ApplicationRecord

    validates(:name,
              :presence     => { :message => 'can\'t be blank' },)
              
    validates(:email,
              :presence     => { :message => 'can\'t be blank' },
              :uniqueness   => { :message => 'has already been taken' },
              format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i } )
              
    validates(:paper_history,
               length: { in: 0..20 },
               allow_blank: true,
               allow_nil: true)

    serialize :paper_preference, Array

end
