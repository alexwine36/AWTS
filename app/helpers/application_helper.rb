module ApplicationHelper

  # Markdown
  def self.markdown(text)
    options = {
        filter_html: true,
        hard_wrap: true,
        link_attributes: {rel: 'nofollow', target: 'blank'},
        space_after_headers: true,
        fenced_code_blocks: true
    }

    extensions = {
        autolink: true,
        superscript: true,
        disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def markdown(text)
    ApplicationHelper.markdown(text)
  end


  # Copyright
  def copyright_notice_year_range(start_year)
    start_year = start_year.to_i

    current_year = Time.new.year

    if current_year > start_year && start_year > 2000
      "#{start_year} - #{current_year}"
    elsif start_year > 2000
      "#{start_year}"
    else
      "#{current_year}"
    end
  end
end


