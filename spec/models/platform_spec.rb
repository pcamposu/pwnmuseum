require 'rails_helper'

RSpec.describe Platform, type: :model do
  describe "associations" do
    it { should have_many(:exploits).dependent(:destroy) }
    it { should have_many(:hackers).through(:exploits) }
  end

  describe "validations" do
    subject { build(:platform) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
  end

  describe "scopes" do
    it "returns platforms in alphabetical order" do
      ps3 = create(:platform, name: "PlayStation 3")
      wii = create(:platform, name: "Wii")
      xbox = create(:platform, name: "Xbox 360")

      expect(Platform.alphabetical).to eq([ ps3, wii, xbox ])
    end
  end

  describe "methods" do
    it "returns exploits chronologically" do
      platform = create(:platform)
      old_exploit = create(:exploit, platform: platform, date_discovered: 5.years.ago.to_date)
      new_exploit = create(:exploit, platform: platform, date_discovered: 1.year.ago.to_date)

      expect(platform.chronological_exploits).to eq([ old_exploit, new_exploit ])
    end

    it "uses slug as param" do
      platform = create(:platform, slug: "ps3")
      expect(platform.to_param).to eq("ps3")
    end
  end
end
