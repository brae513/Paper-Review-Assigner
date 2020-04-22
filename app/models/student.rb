class Student < ApplicationRecord
    validates(:name,
              :presence     => { :message => 'can\'t be blank' },)
              
    validates(:email,
              :presence     => { :message => 'can\'t be blank' },
              :uniqueness   => { :message => 'has already been taken' },
              format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i } )
              
    validates(:classification,
              :presence     => { :message => 'can\'t be blank' },
              inclusion: { in: %w(senior junior)})
              
    validates(:paper_history,
               length: { in: 0..20 },
               allow_blank: true,
               allow_nil: true)
end
