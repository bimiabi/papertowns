class AddAppointmentNoteToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_note, :string
  end
end
