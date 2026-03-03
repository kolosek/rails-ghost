class FormsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @form = Form.new(form_params)
    @form.source_url = request.referer

    if @form.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form_response", partial: success_partial, locals: success_locals) }
        format.json { render json: { status: "success", form: @form }, status: :created }
        format.html { redirect_back fallback_location: root_path, notice: "Form submitted successfully." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form_response", partial: "forms/error", locals: { form: @form }) }
        format.json { render json: { status: "error", errors: @form.errors.full_messages }, status: :unprocessable_entity }
        format.html { redirect_back fallback_location: root_path, alert: @form.errors.full_messages.join(", ") }
      end
    end
  end

  private

  def form_params
    params.require(:form).permit(:form_type, :name, :email, data: {})
  end

  def success_partial
    @form.form_type == "migration" ? "forms/migration_success" : "forms/success"
  end

  def success_locals
    return {} unless @form.form_type == "migration"

    source = @form.data&.dig("source")
    button_text = source == "pivotal-tracker-shutdown" ? "Book a restoration now" : "Book a migration now"
    { button_text: button_text }
  end
end
