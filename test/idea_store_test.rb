require_relative 'test_helper'
require 'idea_box/idea_store'

class IdeaStoreTest < Minitest::Test
  # I have no idea what I'm doing. D:
  def test_database
    idea1 = {"title" => "food", "description" => "as needed"}
    idea2 = {"title" => "activity", "description" => "more often than that"}
    ideas = [idea1, idea2]
    database = YAML::Store.new "test/data"
    IdeaStore.stub :database, database do
      database.transaction do
        database["ideas"]
      end
      assert IdeaStore.database.include?("food")
    end
  end
end
