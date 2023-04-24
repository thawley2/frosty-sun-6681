require 'rails_helper'

RSpec.describe '/doctors/:id', type: :feature do

  let!(:hospital) {Hospital.create!(name: 'Saint Anthonys')}

  let!(:doctor1) {hospital.doctors.create!(name: 'Thomas', specialty: 'Oncology', university: 'UCO')}

  let!(:patient1) {Patient.create!(name: 'Janey', age: 30)}
  let!(:patient2) {Patient.create!(name: 'Ringo', age: 16)}
  let!(:patient3) {Patient.create!(name: 'Starsky', age: 1)}

  let!(:link1) {DoctorPatient.create!(doctor: doctor1, patient: patient1)}
  let!(:link2) {DoctorPatient.create!(doctor: doctor1, patient: patient2)}
  let!(:link3) {DoctorPatient.create!(doctor: doctor1, patient: patient3)}

  describe 'When I visit a doctors show page' do
    it 'I see all of that doctors information (name, specialty, university)' do
      visit doctor_path(doctor1)

      expect(page).to have_content('Doctor: Thomas')
      expect(page).to have_content('Specialty: Oncology')
      expect(page).to have_content('University Attended: UCO')
    end

    it 'I see the name of the hospibal where this doctor works' do
      visit doctor_path(doctor1)

      expect(page).to have_content('Hospital Attending: Saint Anthonys')
    end

    it 'I see the names of all of the patients this doctor has' do
      visit doctor_path(doctor1)
save_and_open_page
      expect(page).to have_content('Patients: Janey, Ringo, and Starsky')
    end
  end
end