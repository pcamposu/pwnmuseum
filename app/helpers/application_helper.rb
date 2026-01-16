module ApplicationHelper
  # Extract YouTube video ID from various YouTube URL formats
  #
  # @param url [String] YouTube URL
  # @return [String, nil] Video ID or nil if invalid
  #
  # Supported formats:
  # - https://www.youtube.com/watch?v=VIDEO_ID
  # - https://youtu.be/VIDEO_ID
  # - https://www.youtube.com/embed/VIDEO_ID
  def youtube_video_id(url)
    return nil if url.blank?

    # Match standard youtube.com URLs with ?v= parameter
    if match = url.match(/[?&]v=([a-zA-Z0-9_-]+)/)
      match[1]
    # Match short youtu.be URLs and embed URLs
    elsif match = url.match(/(?:youtu\.be\/|youtube\.com\/embed\/)([a-zA-Z0-9_-]+)/)
      match[1]
    else
      nil
    end
  end

  # Generate YouTube embed iframe
  #
  # @param url [String] YouTube URL
  # @param width [Integer] iframe width (default: 560)
  # @param height [Integer] iframe height (default: 315)
  # @param html_class [String] CSS class for iframe (optional)
  # @return [String, nil] HTML iframe tag or nil if invalid URL
  def youtube_embed(url, width: 560, height: 315, html_class: nil)
    video_id = youtube_video_id(url)
    return nil if video_id.blank?

    embed_url = "https://www.youtube.com/embed/#{video_id}"

    content_tag(:iframe, nil,
      src: embed_url,
      width: width,
      height: height,
      frameborder: 0,
      allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",
      referrerpolicy: "strict-origin-when-cross-origin",
      allowfullscreen: true,
      class: html_class
    )
  end
end
