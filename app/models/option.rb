class Option < ApplicationRecord
  belongs_to :question
  has_many :error_reports, dependent: :destroy
  has_many :reporting_users, through: :error_reports, source: :user

  # Anket türleri için enum tanımlama
  enum survey_type: {
    multiple_choice: 0,    # Çoktan seçmeli
    single_choice: 1,      # Tek seçmeli
    rating_scale: 2,       # Derecelendirme ölçeği
    open_ended: 3,         # Açık uçlu
    yes_no: 4             # Evet/Hayır
  }

  # Anket türüne göre validasyonlar
  validates :survey_type, presence: true

  # Hata raporu oluşturma metodu
  def report_error(user, description)
    error_reports.create(user: user, description: description)
  end

  # Toplam hata raporu sayısını döndürme metodu
  def total_error_reports
    error_reports.count
  end
end

  options_attributes: [:id, :content, :question_id, :survey_type, :_destroy]
