require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}

  let!(:hospital) {Hospital.create!(name: 'Saint Anthonys')}
  let!(:hospital2) {Hospital.create!(name: 'Main st clinic')}
  let!(:hospital3) {Hospital.create!(name: 'South st clinic')}

  let!(:doctor1) {hospital.doctors.create!(name: 'Thomas', specialty: 'Oncology', university: 'UCO')}
  let!(:doctor2) {hospital2.doctors.create!(name: 'Jerry', specialty: 'Oncology', university: 'UCO')}
  let!(:doctor3) {hospital3.doctors.create!(name: 'Rigby', specialty: 'Oncology', university: 'UCO')}

  describe 'instance methods' do
    describe '#hospital_name' do
      it 'returns the name of the hospital the doctor works for' do
        expect(doctor1.hospital_name).to eq('Saint Anthonys')
        expect(doctor2.hospital_name).to eq('Main st clinic')
        expect(doctor3.hospital_name).to eq('South st clinic')
      end
    end
  end
end
