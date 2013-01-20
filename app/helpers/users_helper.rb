module UsersHelper
  def date_header(date)
    if date == Date.today
      content_tag(:span, class: "today") do
        "Today:"
      end
    elsif date == (Date.today - 1.day)
      content_tag(:span, class: "today") do
        "Yesterday:"
      end
    elsif date == (Date.today + 1.day)
      content_tag(:span, class: "today") do
        "Tomorrow:"
      end
    else
      content_tag(:span, class: "today") do
      end
    end
  end
end
