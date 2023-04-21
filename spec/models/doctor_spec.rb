require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
end
