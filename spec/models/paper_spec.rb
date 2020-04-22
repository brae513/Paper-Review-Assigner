# spec/models/paper_spec.rb

require 'rails_helper'
require 'paper'

RSpec.describe Paper, :type => :model do
    subject {
        described_class.create(title: "Paper Test",
                               paper_id: "123456",
                               description: "This paper is about testing the papers model.")
    }
    describe 'Validations' do
        # Basic validations
        it { should be_valid }
        it { should validate_presence_of(:title) }
        it { should validate_uniqueness_of(:title) }
        it { should validate_presence_of(:paper_id) }
        it { should validate_uniqueness_of(:paper_id) }
        it { should validate_presence_of(:description) }
    
        # Format validations
        it { expect(subject).to allow_value('paper').for(:title) }
        it { expect(subject).to_not allow_value('', nil).for(:title) }
        it { expect(subject).to_not allow_value('', nil).for(:paper_id) } 
    end
end