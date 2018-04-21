class PlagueReportsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_groove, only: [:create, :index]
  before_action :set_plague_report, only: [:show]

  def create
    @plague_report = @groove.plague_reports.create(plague_reports_params)
  end

  def index
    @plague_reports = @groove.plague_reports
    @data = [["hola","dos"]]
    @datos = PlagueReport.all
    @datos.each{|d| @data.push([d.reportDate.to_s,d.quantity.to_f])}   
  end

  def show

  end
  private
  def plague_reports_params
    params.require(:plague_report).permit(:quantity, :reportDate, :description)
  end

  def set_plague_report
    @plague_report = PlagueReport.find(params[:id])
  end

  def set_groove
    @groove = Groove.find(params[:groofe_id])
  end
end
