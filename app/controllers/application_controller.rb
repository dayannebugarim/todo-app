class ApplicationController < ActionController::Base
    helper_method :priority_emoji

    def priority_emoji(priority)
        case priority
        when 'high'
            '🔥 alta prioridade'
        when 'medium'
            '⚡️ média prioridade'
        when 'low'
            '💧 baixa prioridade'
        else
            ''
        end
    end

    def render_errors(object)
        if object.errors.any?
          content_tag :div, id: "error_explanation" do
            concat content_tag(:h2, "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:")
            concat(content_tag(:ul) do
              object.errors.full_messages.each do |message|
                concat content_tag(:li, message)
              end
            end)
          end
        end
    end
end
