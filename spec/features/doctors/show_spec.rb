require 'rails_helper'

RSpec.describe '/doctors/:id', type: :feature do

  let!(:hospital) {Hospital.create!(name: 'Saint Anthonys')}

  let!(:doctor1) {hospital.doctors.create!(name: 'Thomas', specialty: 'Oncology', university: 'UCO')}



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
  end
end