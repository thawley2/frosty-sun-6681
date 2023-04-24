class PatientsController < ApplicationController
  def index
    @patients = Patient.list
  end
end