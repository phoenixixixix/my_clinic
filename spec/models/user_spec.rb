require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Behavior" do
    context "Different types of Users" do
      context "Doctor" do
        before do
          @user = User.new(
            type: "Doctor",
            email: "user_doctor@mail.com",
            password: "user_doctor",
            password_confirmation: "user_doctor"
          )
        end

        it "should have doctor type" do
          expect(@user.model_name.human).to eq("Doctor")
        end
      end

      context "Patient" do
        before do
          @user = User.new(
            type: "Patient",
            email: "user_patient@mail.com",
            password: "user_patient",
            password_confirmation: "user_patient"
          )
        end

        it "should have patient type" do
          expect(@user.model_name.human).to eq("Patient")
        end
      end
    end
  end
end
