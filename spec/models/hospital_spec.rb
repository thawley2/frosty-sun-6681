require 'rails_helper'

RSpec.describe Hospital do
  let!(:hospital) {Hospital.create!(name: 'Saint Anthonys')}

  let!(:doctor1) {hospital.doctors.create!(name: 'Thomas', specialty: 'Oncology', university: 'UCO')}
  let!(:doctor2) {hospital.doctors.create!(name: 'Jeff', specialty: 'Oncology', university: 'UCO')}

  let!(:patient1) {Patient.create!(name: 'Janey', age: 30)}
  let!(:patient2) {Patient.create!(name: 'Ringo', age: 16)}
  let!(:patient3) {Patient.create!(name: 'Starsky', age: 1)}
  let!(:patient4) {Patient.create!(name: 'Sam', age: 27)}

  let!(:link1) {DoctorPatient.create!(doctor: doctor1, patient: patient1)}
  let!(:link2) {DoctorPatient.create!(doctor: doctor1, patient: patient2)}
  let!(:link3) {DoctorPatient.create!(doctor: doctor1, patient: patient3)}
  let!(:link4) {DoctorPatient.create!(doctor: doctor2, patient: patient3)}
  let!(:link5) {DoctorPatient.create!(doctor: doctor2, patient: patient2)}

  it {should have_many :doctors}
  it {should have_many(:doctor_patients).through(:doctors)}
  it {should have_many(:patients).through(:doctor_patients)}

  describe 'doctors_patient_count' do
    it 'should return an array of doctors ordered by patient count and having a virtual attribute for the count of patients' do
      expect(hospital.doctors_patient_count).to eq([doctor1, doctor2])
      expect(hospital.doctors_patient_count.first.num_patients).to eq(3)
      expect(hospital.doctors_patient_count.first.name).to eq('Thomas')
      expect(hospital.doctors_patient_count[1].num_patients).to eq(2)
      expect(hospital.doctors_patient_count[1].name).to eq('Jeff')

      DoctorPatient.create!(doctor: doctor2, patient: patient1)
      DoctorPatient.create!(doctor: doctor2, patient: patient4)

      expect(hospital.doctors_patient_count).to eq([doctor2, doctor1])
      expect(hospital.doctors_patient_count.first.num_patients).to eq(4)
      expect(hospital.doctors_patient_count.first.name).to eq('Jeff')
    end
  end
end
