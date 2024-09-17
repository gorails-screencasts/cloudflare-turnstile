require "net/http"

class Turnstile
  URL = URI("https://challenges.cloudflare.com/turnstile/v0/siteverify")
  HEADERS = { "Content-Type" => "application/json" }

  def self.verify(...)
    new.verify(...)
  end

  def verify(token:, ip:)
    body = {
      secret: ENV["TURNSTILE_SECRET_KEY"],
      response: token,
      remoteip: ip
    }
    response = Net::HTTP.post(URL, body.to_json, HEADERS)
    JSON.parse(response.body).dig("success")
  end
end
