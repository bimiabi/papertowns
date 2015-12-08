class AppointmentMailer < ActionMailer::Base

  def appointmentMail_created(current_user,appointment_user, customer_name, appointment_note, technician_name, phone_number, appointment_type, address, product_model, appointment_date)

    @current_user = current_user
    @appointment_user = appointment_user
    @customer_name = customer_name
    @appointment_note = appointment_note
    @technician_name = technician_name
    @phone_number = phone_number
    @appointment_type = appointment_type
    @address = address
    @product_model = product_model
    @appointment_date = appointment_date


  #  if appointment_date < 24.hours.from_now  # we can use this logic to send automated email if the appointment date is 24 hours from the now
      mail(to: appointment_user.email,
           from: "airdbapp@gmail.com", #using Gmail smtp settings it will override "from:" so it doesnt matter what we put here
           subject: "Appointment Created",
      )
  #  end

  end

end
