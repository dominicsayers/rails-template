# frozen_string_literal: true

module ApplicationHelper
  def label_and_text_field(form, field)
    capture do
      concat form.label(field)
      concat form.text_field(field)
    end
  end

  def description_list(source, *fields)
    content_tag(:dl) do
      fields.each do |field|
        concat content_tag(:dt, field.to_s.humanize)
        concat content_tag(:dd, source.send(field))
      end
    end
  end
end
