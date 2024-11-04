class Rack::Attack
  # Redis yerine Memory Store kullanalım (development için)
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Brute force koruması
  throttle('login/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.ip
    end
  end

  # API rate limiting
  throttle('api/ip', limit: 100, period: 5.minutes) do |req|
    if req.path.start_with?('/api/')
      req.ip
    end
  end

  # Şüpheli IP'leri engelle
  blocklist('block suspicious IPs') do |req|
    Rack::Attack::Allow2Ban.filter(req.ip, 
      maxretry: 3,
      findtime: 10.minutes, 
      bantime: 1.hour
    ) do
      req.path.start_with?('/users/sign_in') && req.post?
    end
  end
end 