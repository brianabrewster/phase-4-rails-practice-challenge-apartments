class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

def render_not_found
    render json: {error: "Record not found"}, status: :not_found
end

def render_invalid(invalid)
    render json: {error: invalid.record.errors}, status: :unprocessable_entity
end

end