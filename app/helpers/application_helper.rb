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

  def parallax(text)
    pLax = "<div class='markdown'>#{markdown(text)}</div>"

    def reformat(pLax)
      pString = ""
      # t = pLax.gsub(/[<]/, '|')
      t = pLax.split('<')

      ignore = [0]
      t.each_with_index do |match, index|
        next if ignore.include?(index)
        p index
        if match != ""
          nString = ""
          p match
          nIndex = index + 1


          # P Tags
          if match.include? "p>"
            if t[nIndex].include? "img src="
              nString = "<div class='parallax-container'><div class='parallax'><" + t[nIndex] + "</div></div>"
              ignore.push(nIndex)
              ignore.push(nIndex + 1)
            elsif !match.include? "/"
              nString = "<"+match.insert(1, " class='grey-text text-darken-3 lighten-3'")
            else
              nString = "<"+match
            end


          else
            # Other tags
            if match.include? "h1>" or match.include? "h2>" or match.include? "h3>" or match.include? "h4>" or match.include? "h5>" or match.include? "h6>" and !match.include? "/"

              nString = "<div class ='section white'><div class='row container'><"+match.insert(2, ' class= "header"')


              (nIndex..(t.count()) - 1). each do |i|
p "Troubleshooting " + t[i]

                if t[i].include? "img src="
                  p "Troubleshooting Insert" + t[i-2]

                   t[i - 2] = t[i-2] + "</div></div>"
                end

              end


            else
              nString = "<"+match
            end
          end
          # if match.include? "/>"
          #   nString = "<"+match
          # end


          pString += nString
        end
      end

      # a = pLax.match('\w(<|>)\w')


      return pString

    end

    # reformat(pLax)
    reformat(pLax).html_safe


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


