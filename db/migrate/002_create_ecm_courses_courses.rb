class CreateEcmCoursesCourses < ActiveRecord::Migration
  def change
    create_table :ecm_courses_courses do |t|
      t.string :name
      t.text :description
      t.string :locale
      
      # references
      t.integer :ecm_courses_course_dates_count
      t.references :ecm_courses_course_category
      
      # acts as list
      t.integer :position, :default => 0, :null => false
      
      # friendly id
      t.string :slug

      t.timestamps
    end
    add_index :ecm_courses_courses, :ecm_courses_course_category_id
  end
end
