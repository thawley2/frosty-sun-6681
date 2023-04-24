require 'rails_helper'

RSpec.describe '/patients#index', type: :feature do

  let!(:hospital) {Hospital.create!(name: 'Saint Anthonys')}

  let!(:doctor1) {hospital.doctors.create!(name: 'Thomas', specialty: 'Oncology', university: 'UCO')}
  let!(:doctor2) {hospital.doctors.create!(name: 'Jeff', specialty: 'Oncology', university: 'UCO')}

  let!(:patient1) {Patient.create!(name: 'Janey', age: 30)}
  let!(:patient2) {Patient.create!(name: 'Ringo', age: 16)}
  let!(:patient3) {Patient.create!(name: 'Starsky', age: 10)}
  let!(:patient4) {Patient.create!(name: 'Penny', age: 18)}
  let!(:patient5) {Patient.create!(name: 'Alex', age: 36)}
  let!(:patient6) {Patient.create!(name: 'Bruce', age: 50)}

  let!(:link1) {DoctorPatient.create!(doctor: doctor1, patient: patient1)}
  let!(:link2) {DoctorPatient.create!(doctor: doctor1, patient: patient2)}
  let!(:link3) {DoctorPatient.create!(doctor: doctor1, patient: patient3)}
  let!(:link4) {DoctorPatient.create!(doctor: doctor2, patient: patient3)}

  describe 'When I visit the patients index page' do
    it 'I see the names of all adult patients age > 18 listed in alphabetical order' do
      visit patients_path

      expect('Alex').to appear_before('Bruce')
      expect('Bruce').to appear_before('Janey')
      expect('Janey').to appear_before('Penny')
      expect(page).to_not have_content('Ringo')
      expect(page).to_not have_content('Starsky')
    end
  end
end