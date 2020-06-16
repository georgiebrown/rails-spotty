class AddQuestionToStories < ActiveRecord::Migration[6.0]
  def change
    add_reference :stories, :question, foreign_key: true
  end
end
