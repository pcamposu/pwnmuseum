require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe "associations" do
    it { should belong_to(:exploit) }
    it { should belong_to(:hacker) }
  end

  describe "validations" do
    subject { build(:credit) }

    it "validates uniqueness of exploit scoped to hacker" do
      exploit = create(:exploit)
      hacker = create(:hacker)
      create(:credit, exploit: exploit, hacker: hacker)

      duplicate = build(:credit, exploit: exploit, hacker: hacker)

      expect(duplicate).not_to be_valid
    end

    it "allows same hacker to be credited for different exploits" do
      hacker = create(:hacker)
      exploit1 = create(:exploit)
      exploit2 = create(:exploit)

      credit1 = create(:credit, exploit: exploit1, hacker: hacker)
      credit2 = build(:credit, exploit: exploit2, hacker: hacker)

      expect(credit2).to be_valid
    end

    it "allows different hackers to be credited for same exploit" do
      exploit = create(:exploit)
      hacker1 = create(:hacker)
      hacker2 = create(:hacker)

      credit1 = create(:credit, exploit: exploit, hacker: hacker1)
      credit2 = build(:credit, exploit: exploit, hacker: hacker2)

      expect(credit2).to be_valid
    end
  end
end
