class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.column :name, :string
      t.column :week, :integer
      t.column :course_id, :integer
      t.timestamps
    end
    create_table :chapters do |t|
      t.column :name, :string
      t.column :day, :string
      t.column :handson, :boolean
      t.column :content, :string
      t.column :lesson_id, :integer
      t.timestamps
    end

  end
end
