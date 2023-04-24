class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors
  has_many :patients, through: :doctor_patients

  def doctors_patient_count
    doctors.joins(:patients)
    .select('doctors.*, count(patients) as num_patients')
    .group(:id)
    .order(num_patients: :desc)
  end
end
