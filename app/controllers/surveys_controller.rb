class SurveysController < ApplicationController
    def show
      survey = Survey.includes(questions: :options).find(params[:id])
      render json: survey, include: { questions: { include: :options } }
    end
  
    def feedback
      survey = Survey.find(params[:id])
      feedback = survey.feedbacks.create
      params[:responses].each do |response_params|
        feedback.responses.create(response_params)
      end
      render json: feedback, status: :created
    end
  end
  