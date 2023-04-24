class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def hospital_name
    hospital.name
  end

  def find_join_id(pat)
    doctor_patients.where(doctor_patients: {patient_id: pat.id}).pluck(:id).first
  end
end
