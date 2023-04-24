require 'rails_helper'

RSpec.describe Patient, type: :model do

  let!(:patient1) {Patient.create!(name: 'Janey', age: 30)}
  let!(:patient2) {Patient.create!(name: 'Ringo', age: 16)}
  let!(:patient3) {Patient.create!(name: 'Starsky', age: 10)}
  let!(:patient4) {Patient.create!(name: 'Penny', age: 18)}
  let!(:patient5) {Patient.create!(name: 'Alex', age: 36)}
  let!(:patient6) {Patient.create!(name: 'Bruce', age: 50)}

  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  describe 'class methods' do
    describe '::list' do
      it 'returns a list of patients that are over the age of 18 and orders then in alphabetical order' do
        expect(Patient.list).to match_array([patient5, patient6, patient1, patient4])
      end
    end
  end
end