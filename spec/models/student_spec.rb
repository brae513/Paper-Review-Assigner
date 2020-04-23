# spec/student_spec.rb

require 'rails_helper'
require 'student'

RSpec.describe Student, :type => :model do
    subject {
        described_class.create(name: "Test",
                               email: "test@test.edu",
                               classification: "senior",
                               paper_history: 1)
    }
    describe 'Validations' do
        # Basic validations
        it { should be_valid }
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email) }
        it { should validate_presence_of(:classification) }
        it { should_not validate_presence_of(:paper_history) }
        
        # Format validations
        it { expect(subject).to_not allow_value('', nil).for(:name) }
            # Devise also handles invalid email addresses
        it { expect(subject).to allow_value("email@test.edu").for(:email) }
        it { expect(subject).to_not allow_value("email@test").for(:email) }
        it { expect(subject).to_not allow_value("blah").for(:email) }
        it { expect(subject).to_not allow_value('freshman').for(:classification) }
        it { expect(subject).to allow_value('', nil).for(:paper_history) }

    end
end
