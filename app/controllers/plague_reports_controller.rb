class PlagueReportsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_groove, only: [:create, :index,:show]
  before_action :set_plague_report, only: [:show]
  before_action :set_plague_report_by_date, only: [:create]
  before_action :set_user, only: [:create]

  def create
    if @plague_report.blank?
      p "No hay reporte en esa fecha, creando uno..."
      @plague_report = @groove.plague_reports.new(plague_reports_params)    
      if new_report_params[:result] == true
        @plague_report.quantity = 1
        send_alert
      else
        @plague_report.quantity = 0
      end   
      if @plague_report.save
        p "Operación realizada en plague reports"
      else
        p "Error realizando operación create en plague reports"
      end
    else
      p "Reporte encontrado"
      if new_report_params[:result] == true
        p "Encontró plaga"
        send_alert
        @plague_report.update(quantity: @plague_report.quantity +=1) 
      end    
    end
  
  end

  def index
    column_chart_data(@groove.plague_reports)
  end

  def column_chart_data(reports)
    gon.column_chart_data = reports.map { |a| [a.reportDate,a.quantity] } 
  end

  def show
    plagues_n = @plague_report.quantity
    no_plagues_n = @groove.quantity-plagues_n
    gon.graphic_data = [
      ['Estado','Cantidad'],
      ['Con plagas',plagues_n],
      ['Sin plagas',no_plagues_n]
    ]
    gon.reportDate = @plague_report.reportDate
  end
  
  def send_alert
    ReportMailer.sample_email(@user).deliver
#      format.html { redirect_to farm_lot_, notice: 'Hay una plaga en el cultivo' }
#      format.json { render :show, status: :created, location: @user }
  end
  
  def find_reports
    dates = params[:dates]
    initial_date = params[:dates][:initial_date]
    final_date = params[:dates][:final_date]
    @plague_reports = PlagueReport.where(reportDate: initial_date..final_date)
    column_chart_data(@plague_reports)
  end

  private

  def plague_reports_params
    params.require(:plague_report).permit(:reportDate)
  end

  def set_user
    @user = Farm.find(params[:farm_id]).user
  end
  
  def set_plague_report
    @plague_report = PlagueReport.find(params[:id])
  end

  def set_plague_report_by_date
    @plague_report = PlagueReport.find_by(reportDate: plague_reports_params[:reportDate])
  end

  def new_report_params
    params.require(:plague_report).permit(:result)
  end

  def set_groove
    @groove = Groove.find(params[:groofe_id])
  end
end
