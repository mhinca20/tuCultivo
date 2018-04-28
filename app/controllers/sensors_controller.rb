class SensorsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_sensor, only: [:show, :edit, :update, :destroy,:values,:create_value]
  before_action :set_node, only: [:new,:edit,:index]

  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = @node.sensors
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
    @values = @sensor.values
  end

  # GET /sensors/new
  def new
    @sensor = Sensor.new
  end

  # GET /sensors/1/edit
  def edit
  end

  # POST /sensors
  # POST /sensors.json
  def create

    @sensor = Sensor.new(sensor_params)
    respond_to do |format|
      if @sensor.save
        format.html { redirect_to action: "show", id:@sensor.id, notice: 'Sensor was successfully created.' }
        format.json { render :show, status: :created, location: @sensor }
      else
        format.html { render :new }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to @sensor, notice: 'Sensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.html { render :edit }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    @sensor.destroy
    respond_to do |format|
      format.html { redirect_to sensors_url, notice: 'Sensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /sensors/id
  def create_value
    @value = @sensor.values.create(value_params)
  end

  def values
    @values = @sensor.values
  end

  private

    def set_node
      @node = Node.find(params[:node_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    def set_node
      @node = Node.find(params[:node_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:name, :node_id)
    end

    def value_params
      params.require(:sensor).permit(:value)
    end


end
