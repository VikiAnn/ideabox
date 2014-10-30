require_relative 'test_helper'
require './app'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    IdeaBoxApp
  end

  def test_index_page_contains_correct_header
    response = get '/'
    assert response.ok?
    home_page = Nokogiri::HTML(response.body)
    assert_includes home_page.content, "IdeaBox"
  end

  def test_index_page_contains_existing_ideas
    response = get '/'
    home_page = Nokogiri::HTML(response.body)
    assert_includes home_page.content, "Existing Ideas"
  end

  def test_edit_page_loads
    # this is a shitty test; i'm using actual database data
    # which means it can reasonably be expected to change
    assert get('/1/edit').ok?
  end
end
