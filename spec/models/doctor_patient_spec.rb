require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  it {should belong_to :doctor}
  it {should belong_to :patient}
end