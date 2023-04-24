class DoctorPatientsController < ApplicationController

  def destroy
    doctor_patient = DoctorPatient.find(params[:id])
    doctor = Doctor.find(doctor_patient.doctor.id)
    doctor_patient.destroy
    redirect_to doctor_path(doctor)
  end
end