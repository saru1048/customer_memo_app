class ChangeConsultationTypeNullOnConsultations < ActiveRecord::Migration[8.1]
  def change
    change_column_null :consultations, :consultation_type, false
  end
end
