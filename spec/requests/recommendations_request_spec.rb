require 'rails_helper'

RSpec.describe "Recommendations", type: :request do
  let(:doctor) { build(:doctor) }
  let(:patient) { build(:patient) }
  let(:valid_params) do
    {
    diagnosis: "Test diagnosis",
    instruction: "Test instructions"
    }
  end

  describe "POST /recommendations" do
    before do
      @appointment = Appointment.create!(
        doctor: doctor,
        patient: patient
      )
    end

    it "should create Recommendation" do
      expect {
        recommendation = Recommendation.new(valid_params)
        recommendation.appointment = @appointment
        recommendation.save
        post "/appointments/#{@appointment.id}/recommendations", params: { recommendation: valid_params }
      }.to change(Recommendation, :count).by(1)
    end
  end
end
