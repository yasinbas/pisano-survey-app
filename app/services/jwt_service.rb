class JwtService
  HMAC_SECRET = Rails.application.credentials.secret_key_base
  ALGORITHM = 'HS256'.freeze
  EXPIRY_TIME = 24.hours.to_i

  class << self
    def encode(payload)
      payload = payload.dup
      payload['exp'] = Time.now.to_i + EXPIRY_TIME
      JWT.encode(payload, HMAC_SECRET, ALGORITHM)
    end

    def decode(token)
      JWT.decode(token, HMAC_SECRET, true, { algorithm: ALGORITHM }).first
    rescue JWT::ExpiredSignature
      raise 'Token has expired'
    rescue JWT::DecodeError
      raise 'Invalid token'
    end
  end
end 