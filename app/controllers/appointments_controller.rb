class AppointmentsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource except: [:create]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    if params[:search]
       @appointments = Appointment.search(params[:search]).order("created_at DESC")
     else
       @appointments = Appointment.order("created_at DESC")
     end
  end


  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @user = current_user
    @appointment = @user.appointments.new(appointment_params)
      AppointmentMailer.appointmentMail_created(current_user, @appointment.user, @appointment.customer_name, @appointment.appointment_note, @appointment.technician_name, @appointment.phone_number, @appointment.appointment_type, @appointment.address, @appointment.product_model, @appointment.appointment_date).deliver
      respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:customer_name, :appointment_note, :technician_name, :phone_number, :appointment_type, :address, :product_model, :appointment_date, :status)
    end
end
