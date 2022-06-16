class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  private
  def record_not_found(exception)
    return render json: {errors: exception}, status: :unprocessable_entity
  end

  def record_invalid
    return render json: {errors: "Invalid data"}, status: :invalid
  end
end
