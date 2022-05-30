# frozen_string_literal: true

module CondominiumScope
  extend ActiveSupport::Concern

  class_methods do
    def validate_condominium_id(only_at: [])
      before_action :validate_condominium_id_presence, only: only_at
    end
  end

  private

  def validate_condominium_id_presence
    return render_missing_param_error unless params[:condominium_id]
  end

  def render_missing_param_error
    render(json: { errors: 'Missing condominium_id param' }, status: :bad_request)
  end
end
