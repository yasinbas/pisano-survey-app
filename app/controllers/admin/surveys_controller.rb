class Admin::SurveysController < Admin::BaseController
  def index
    @surveys = Survey.includes(:user, :tags)
                    .order(created_at: :desc)
                    .page(params[:page])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    
    if @survey.save
      redirect_to admin_surveys_path, notice: 'Anket başarıyla oluşturuldu'
    else
      render :new
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, :status, :expires_at, :is_public, tag_ids: [])
  end
end 