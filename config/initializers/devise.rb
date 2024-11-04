# frozen_string_literal: true

Devise.setup do |config|
  # Devise tarafından kullanılan gizli anahtar. 
  # Varsayılan olarak `secret_key_base` kullanılır.
  # config.secret_key = 'your_secret_key'

  # E-posta adresi için ayarlar.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # ORM ayarları.
  require 'devise/orm/active_record'

  # Kullanıcı doğrulama anahtarları.
  config.authentication_keys = [:email]
  
  # Kullanıcı e-postalarının büyük/küçük harf duyarsızlığını ayarlayın.
  config.case_insensitive_keys = [:email]

  # Kullanıcı e-postalarında boşlukları kaldırın.
  config.strip_whitespace_keys = [:email]

  # Şifre için gerekli uzunluk.
  config.password_length = 6..128

  # E-posta formatı doğrulama için regex.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # Kullanıcıyı oturumdan çıkardıktan sonra tüm hatırlama token'larını geçersiz kılın.
  config.expire_all_remember_me_on_sign_out = true

  # Yeni kullanıcı kayıtlarında otomatik oturum açma.
  config.sign_in_after_change_password = true

  # Şifre sıfırlama anahtarları.
  config.reset_password_keys = [:email]
  config.reset_password_within = 6.hours

  # Hata yanıtları için durum kodları.
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  # Diğer ayarlar...
end
