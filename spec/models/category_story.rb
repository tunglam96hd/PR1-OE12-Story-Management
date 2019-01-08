RSpec.describe Category_story, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:story) }
  end
end
