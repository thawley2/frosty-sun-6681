require 'rails_helper'

RSpec.describe '/doctors/:id', type: :feature do

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

      within "#patient_#{patient1.id}" do
        expect(page).to have_content('Janey')
      end
      within "#patient_#{patient2.id}" do
        expect(page).to have_content('Ringo')
      end
      within "#patient_#{patient3.id}" do
        expect(page).to have_content('Starsky')
      end
    end

    it 'I see a button next to each patient to remove that patient from the doctor' do
      visit doctor_path(doctor1)

      within "#patient_#{patient1.id}" do
        expect(page).to have_content('Janey')
        expect(page).to have_button('Remove Patient')
      end
      within "#patient_#{patient2.id}" do
        expect(page).to have_content('Ringo')
        expect(page).to have_button('Remove Patient')
      end
      within "#patient_#{patient3.id}" do
        expect(page).to have_content('Starsky')
        expect(page).to have_button('Remove Patient')
      end
    end

    it 'When I click on a remove button it returns to the doctors show page and the patient is gone' do
      visit doctor_path(doctor1)

      within "#patient_#{patient3.id}" do
        click_button('Remove Patient')
      end

      expect(current_path).to eq(doctor_path(doctor1))
      expect(page).to_not have_content(patient3.name)
    end

    it 'When a patient is removed the patient is still apart of other doctors' do
      visit doctor_path(doctor1)

      within "#patient_#{patient3.id}" do
        expect(page).to have_content(patient3.name)
        click_button('Remove Patient')
      end

      expect(current_path).to eq(doctor_path(doctor1))
      expect(page).to_not have_content(patient3.name)

      visit doctor_path(doctor2)

      expect(page).to have_content(patient3.name)
    end
  end
end