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
end
