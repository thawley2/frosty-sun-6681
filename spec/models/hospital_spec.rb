require 'rails_helper'

RSpec.describe Hospital do
  it {should have_many :doctors}
end
