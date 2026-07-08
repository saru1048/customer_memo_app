require 'rails_helper'

RSpec.describe Consultation, type: :model do
  describe "validation" do
    it "正常なデータなら有効であること" do
      consultation = build(:consultation)
      expect(consultation).to be_valid
    end
    it "必須項目が空なら無効であること" do
      required_attributes = [
        :summary,
        :status,
        :consulted_at,
        :consultation_type
      ]

      required_attributes.each do |attribute|
        consultation = build(:consultation, attribute => nil)

        expect(consultation).not_to be_valid, "#{attribute} が nil なら無効であること"
      end
    end
  end

  describe "consultation_type" do
    it "enumの定義が想定通りであること" do
      expect(Consultation.consultation_types).to eq(
        {
          "mnp" => 0,
          "new_contract" => 1,
          "device_change" => 2,
          "contract_info_change" => 3,
          "other" => 4
        }
      )
    end

    it "定義済みの値を設定できること" do
      Consultation.consultation_types.keys.each do |selected_type|
        consultation = build(:consultation, consultation_type: selected_type)

        expect(consultation).to be_valid, "#{selected_type} が valid になること"
      end
    end

    it "未定義の値は無効であること" do
      consultation = build(:consultation, consultation_type: :unknown)

      expect(consultation).not_to be_valid
    end
  end

  describe "status" do
    it "enumの定義が想定通りであること" do
      expect(Consultation.statuses).to eq(
        {
          "pending" => 0,
          "in_progress" => 1,
          "completed" => 2,
          "not_required" => 3
        }
      )
    end

    it "定義済みの値を設定できること" do
      Consultation.statuses.keys.each do |selected_status|
        consultation = build(:consultation, status: selected_status)

        expect(consultation).to be_valid, "#{selected_status} が有効であること"
      end
    end
  end

  describe "associations" do
    it "顧客を削除すると紐づく接客記録も削除されること" do
      customer = create(:customer)
      create(:consultation, customer: customer)

      expect { customer.destroy }.to change(Consultation, :count).by(-1)
    end
    it "顧客がない場合は無効であること" do
      consultation = build(:consultation, customer: nil)

      expect(consultation).not_to be_valid
    end

    it "担当ユーザーがない場合は無効であること" do
      consultation = build(:consultation, user: nil)

      expect(consultation).not_to be_valid
    end
  end
end
