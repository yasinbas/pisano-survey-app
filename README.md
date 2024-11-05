# Pisano Survey App

Pisano Survey App, kullanıcıların anket oluşturmasına, yönetmesine ve sonuçları analiz etmesine olanak tanıyan bir web uygulamasıdır. Bu uygulama, Ruby on Rails çerçevesi kullanılarak geliştirilmiştir.

## Gereksinimler

- **Ruby**: 3.3.5
- **Rails**: 7.1.3.4
- **PostgreSQL**: Veritabanı yönetimi için

## Kurulum

1. **Depoyu Klonlayın**:
   ```bash
   git clone https://github.com/yasinbas/pisano-survey-app.git
   cd pisano-survey-app
   ```

2. **Gerekli Gem'leri Yükleyin**:
   ```bash
   bundle install
   ```

3. **Veritabanını Ayarlayın**:
   Veritabanı yapılandırmasını `config/database.yml` dosyasında güncelleyin ve ardından:
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Ortam Değişkenlerini Ayarlayın**:
   `.env` dosyasını oluşturun ve gerekli API anahtarlarını ve gizli bilgileri ekleyin:
   ```
   GITHUB_CLIENT_ID=your_github_client_id
   GITHUB_CLIENT_SECRET=your_github_client_secret
   ```

5. **Sunucuyu Başlatın**:
   ```bash
   rails server
   ```

## Özellikler

- **Kullanıcı Kimlik Doğrulama**: Devise ve OmniAuth kullanılarak GitHub ile giriş yapma.
- **Yetkilendirme**: CanCanCan ve Pundit ile rol tabanlı erişim kontrolü.
- **Anket Yönetimi**: Anket oluşturma, düzenleme ve silme.
- **API Desteği**: JSON formatında API endpoint'leri.
- **Arka Plan İşlemleri**: Sidekiq ile arka plan işlerini yönetme.
- **Performans ve Güvenlik**: Rack::Attack ile brute force koruması ve rate limiting.

## Testler

Testler RSpec kullanılarak yazılmıştır. Testleri çalıştırmak için:
```bash
bundle exec rspec
```

## Katkıda Bulunma

1. Bu depoyu forklayın.
2. Yeni bir dal oluşturun (`git checkout -b feature/your-feature`).
3. Değişikliklerinizi commit edin (`git commit -am 'Add some feature'`).
4. Dalınızı push edin (`git push origin feature/your-feature`).
5. Bir Pull Request oluşturun.

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır. Daha fazla bilgi için `LICENSE` dosyasına bakın.