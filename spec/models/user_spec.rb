require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Methods" do
    before do
      @template_user = User.new(
        type: "Doctor",
        email: "template_user@mail.com",
        password: "template_user",
        password_confirmation: "template_user"
      )
    end
    context "#doctor?" do
      before do
        @template_user.type = "Doctor"
      end

      it { expect(@template_user.doctor?).to be_truthy }
      it { expect(@template_user.patient?).to be_falsey }
    end

    context "#patient?" do
      before do
        @template_user.type = "Patient"
      end

      it { expect(@template_user.patient?).to be_truthy }
      it { expect(@template_user.doctor?).to be_falsey }
    end
  end

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
