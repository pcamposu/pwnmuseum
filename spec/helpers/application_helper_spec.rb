require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#youtube_video_id" do
    it "extracts video ID from standard youtube.com URL" do
      url = "https://www.youtube.com/watch?v=12345678901"
      expect(helper.youtube_video_id(url)).to eq("12345678901")
    end

    it "extracts video ID from short youtu.be URL" do
      url = "https://youtu.be/12345678901"
      expect(helper.youtube_video_id(url)).to eq("12345678901")
    end

    it "extracts video ID from embed URL" do
      url = "https://www.youtube.com/embed/12345678901"
      expect(helper.youtube_video_id(url)).to eq("12345678901")
    end

    it "extracts video ID from youtube.com URL with additional params" do
      url = "https://www.youtube.com/watch?v=12345678901&t=10s"
      expect(helper.youtube_video_id(url)).to eq("12345678901")
    end

    it "returns nil for invalid URL" do
      url = "https://example.com/video"
      expect(helper.youtube_video_id(url)).to be_nil
    end

    it "returns nil for empty string" do
      expect(helper.youtube_video_id("")).to be_nil
    end

    it "returns nil for nil" do
      expect(helper.youtube_video_id(nil)).to be_nil
    end
  end

  describe "#youtube_embed" do
    let(:video_id) { "12345678901" }

    it "generates iframe embed code" do
      url = "https://www.youtube.com/watch?v=#{video_id}"
      result = helper.youtube_embed(url, width: 640, height: 360)

      expect(result).to include("<iframe")
      expect(result).to include("src=\"https://www.youtube.com/embed/#{video_id}\"")
      expect(result).to include("width=\"640\"")
      expect(result).to include("height=\"360\"")
    end

    it "includes allowfullscreen attribute" do
      url = "https://www.youtube.com/watch?v=#{video_id}"
      result = helper.youtube_embed(url)

      expect(result).to include("allowfullscreen")
    end

    it "includes security attributes" do
      url = "https://www.youtube.com/watch?v=#{video_id}"
      result = helper.youtube_embed(url)

      expect(result).to include("allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\"")
      expect(result).to include("referrerpolicy=\"strict-origin-when-cross-origin\"")
    end

    it "handles nil URL gracefully" do
      result = helper.youtube_embed(nil)
      expect(result).to be_nil
    end

    it "handles invalid URL gracefully" do
      result = helper.youtube_embed("https://example.com/video")
      expect(result).to be_nil
    end

    it "accepts custom width and height" do
      url = "https://www.youtube.com/watch?v=#{video_id}"
      result = helper.youtube_embed(url, width: 800, height: 450)

      expect(result).to include("width=\"800\"")
      expect(result).to include("height=\"450\"")
    end

    it "accepts custom class" do
      url = "https://www.youtube.com/watch?v=#{video_id}"
      result = helper.youtube_embed(url, html_class: "my-custom-class")

      expect(result).to include("class=\"my-custom-class\"")
    end
  end
end
