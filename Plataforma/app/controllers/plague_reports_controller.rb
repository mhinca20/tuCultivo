class PlagueReportsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_groove, only: [:create]

  def create
    @plague_report = @groove.plague_reports.create(plague_reports_params)
  end
  private
  def plague_reports_params
    params.require(:plague_report).permit(:quantity, :reportDate, :description)
  end

  def set_groove
    @groove = Groove.find(params[:groove_id])
  end
end
