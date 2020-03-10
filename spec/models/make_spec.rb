require 'rails_helper'

RSpec.describe Make, type: :model do
    describe 'validations' do
    it { should validate_presence_of(:make) }
  end
end
