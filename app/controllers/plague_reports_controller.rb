class PlagueReportsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_groove, only: [:create, :index,:show]
  before_action :set_plague_report, only: [:show]
  before_action :set_plague_report_by_date, only: [:create]
  before_action :set_user, only: [:create]

  def create
    # validar que location <= quantity
    if @plague_report.blank?
      p "No hay reporte en esa fecha, creando uno..."
      @plague_report = @groove.plague_reports.new(plague_reports_params)    
      if @plague_report.save
        p "Operación realizada en plague reports"
        sick_plant = @plague_report.sick_plants.create(sick_plant_params)
      else
        p "Error realizando operación create en plague reports"
      end
    else
      p "Reporte encontrado"  
      sick_plant = @plague_report.sick_plants.create(sick_plant_params)
    end
    send_alert
  end

  def index
    column_chart_data(@groove.plague_reports)
  end

  def column_chart_data(reports)
    gon.column_chart_data = reports.map { |a| [a.reportDate,a.sick_plants.count] } 
  end

  def show
    quantity = @groove.quantity
    
    # pie chart
    sick_plants_n = @plague_report.sick_plants.count
    healthy_plants_n = quantity-sick_plants_n
    gon.graphic_data = [
      ['Estado','Cantidad'],
      ['Sanas',healthy_plants_n],
      ['Enfermas',sick_plants_n]
    ]

    data = []
    (0..quantity-1).each_with_index do |i|
      data.push([i,0,0])
    end
    print data

    @plague_report.sick_plants.each do |plant|
      data[plant.location] = [plant.location,0,1]
    end

    print data
    # heatline chart
    gon.heatline_data = data
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

  def sick_plant_params
    params.require(:sick_plant).permit(:location)
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

  
  def set_groove
    @groove = Groove.find(params[:groofe_id])
  end
end
