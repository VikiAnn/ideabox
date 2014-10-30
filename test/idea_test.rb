require_relative 'test_helper'
require 'idea_box/idea'

class IdeaTest < Minitest::Test
  def test_it_has_a_title
    data = {"title" => "food", "description" => "as often as needed"}
    idea = Idea.new(data)
    assert_equal "food", idea.title
  end

  def test_it_has_a_description
    data = {"title" => "food", "description" => "as often as needed"}
      idea = Idea.new(data)
    assert_equal "as often as needed", idea.description
  end

  def test_it_has_a_rank
    data = {"title" => "food", "description" => "as often as needed"}
    idea = Idea.new(data)
    assert_equal 0, idea.rank
  end

  def test_rank_goes_up_when_it_is_liked
    data = {"title" => "food", "description" => "as often as needed"}
    idea = Idea.new(data)
    idea.like!
    assert_equal 1, idea.rank
  end

  def test_rank_goes_down_when_it_is_unliked
    data = {"title" => "food", "description" => "as often as needed"}
    idea = Idea.new(data)
    idea.like!
    idea.like!
    idea.unlike!
    assert_equal 1, idea.rank
  end
end
