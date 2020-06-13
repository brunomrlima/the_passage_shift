module ApplicationHelper

  private

    def page_title(curr_page = '')
      base_title = 'The Passage Shift'
      if curr_page.empty?
        base_title
      else
        curr_page + ' | ' + base_title
      end
    end
end
