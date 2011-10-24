module ApplicationHelper
  def title
    base_title = "TETCO Fleet Management"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    logo = image_tag("logo.png")
  end
end
