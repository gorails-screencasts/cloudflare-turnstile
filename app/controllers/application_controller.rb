class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def verify_turnstile
    verified = Turnstile.verify(token: params["cf-turnstile-response"], ip: request.remote_ip)
    flash[:alert] = "Challenge failed, please try again." unless verified
    verified
  end
end
