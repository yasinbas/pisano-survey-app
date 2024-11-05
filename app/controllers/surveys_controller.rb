class SurveysController < ApplicationController
  before_action :authenticate_user!, only: [:feedback]

  def show
    survey = Survey.includes(questions: :options).find_by(id: params[:id])
    if survey
      render json: survey, include: { questions: { include: :options } }
    else
      render json: { error: 'Survey not found' }, status: :not_found
    end
  end

  def feedback
    survey = Survey.find_by(id: params[:id])
    if survey
      feedback = survey.feedbacks.create(user: current_user)
      if feedback.persisted?
        params[:responses].each do |response_params|
          feedback.responses.create(response_params.permit(:question_id, :option_id, :text))
        end
        render json: feedback, status: :created
      else
        render json: { error: 'Feedback could not be created' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Survey not found' }, status: :not_found
    end
  end
end