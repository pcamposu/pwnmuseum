require 'rails_helper'

RSpec.describe Hacker, type: :model do
  describe "associations" do
    it { should have_many(:credits).dependent(:destroy) }
    it { should have_many(:exploits).through(:credits) }
  end

  describe "validations" do
    subject { build(:hacker) }

    it { should validate_presence_of(:handle) }
    it { should validate_uniqueness_of(:handle) }
  end

  describe "methods" do
    it "returns handle as display name" do
      hacker = build(:hacker, handle: "geohot")
      expect(hacker.display_name).to eq("geohot")
    end
  end
end
