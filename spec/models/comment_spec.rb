require 'rails_helper'

describe Comment, type: :model do
  describe 'validations' do
    it {should belong_to(:article)}
    it {should validate_presence_of(:author)}
    it {should validate_presence_of(:body)}
  end
end
