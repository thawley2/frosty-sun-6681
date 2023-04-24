require 'rails_helper'

RSpec.describe '/patients#index', type: :feature do

  let!(:patient1) {Patient.create!(name: 'Janey', age: 30)}
  let!(:patient2) {Patient.create!(name: 'Ringo', age: 16)}
  let!(:patient3) {Patient.create!(name: 'Starsky', age: 10)}
  let!(:patient4) {Patient.create!(name: 'Penny', age: 18)}
  let!(:patient5) {Patient.create!(name: 'Alex', age: 36)}
  let!(:patient6) {Patient.create!(name: 'Bruce', age: 50)}

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