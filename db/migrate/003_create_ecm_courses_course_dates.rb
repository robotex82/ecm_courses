class CreateEcmCoursesCourseDates < ActiveRecord::Migration
  def change
    create_table :ecm_courses_course_dates do |t|
      t.timestamp :start_at
      t.timestamp :end_at
      t.text :description
      
      # references
      t.integer :ecm_courses_course_id
      
#      # friendly id
#      t.string :slug

      t.timestamps
    end
  end
end
