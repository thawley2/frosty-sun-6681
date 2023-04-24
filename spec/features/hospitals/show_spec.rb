require 'rails_helper'

RSpec.describe '/hospitals/:id#show', type: :feature do
  let!(:hospital) {Hospital.create!(name: 'Saint Anthonys')}

  let!(:doctor1) {hospital.doctors.create!(name: 'Thomas', specialty: 'Oncology', university: 'UCO')}
  let!(:doctor2) {hospital.doctors.create!(name: 'Jeff', specialty: 'Oncology', university: 'UCO')}

  let!(:patient1) {Patient.create!(name: 'Janey', age: 30)}
  let!(:patient2) {Patient.create!(name: 'Ringo', age: 16)}
  let!(:patient3) {Patient.create!(name: 'Starsky', age: 1)}

  let!(:link1) {DoctorPatient.create!(doctor: doctor1, patient: patient1)}
  let!(:link2) {DoctorPatient.create!(doctor: doctor1, patient: patient2)}
  let!(:link3) {DoctorPatient.create!(doctor: doctor1, patient: patient3)}
  let!(:link4) {DoctorPatient.create!(doctor: doctor2, patient: patient3)}
  let!(:link5) {DoctorPatient.create!(doctor: doctor2, patient: patient2)}

  describe 'When I visit a hospitals show page' do
    it 'I see the hospitals name and all the doctors that work their' do
      visit hospital_path(hospital)

      expect(page).to have_content('Saint Anthonys')
      expect(page).to have_content('Doctor: Thomas')
      expect(page).to have_content('Doctor: Jeff')

    end

    it 'Next to each doctor I see the number of patients associated with the doctor and listed from most to least patients' do
      visit hospital_path(hospital)

      within "#doctor_#{doctor1.id}" do
        expect(page).to have_content('Doctor: Thomas')
        expect(page).to have_content('Number of Patients: 3')
      end
      within "#doctor_#{doctor2.id}" do
        expect(page).to have_content('Doctor: Jeff')
        expect(page).to have_content('Number of Patients: 2')
      end
      expect('Doctor: Thomas').to appear_before('Doctor: Jeff')
    end
  end
end