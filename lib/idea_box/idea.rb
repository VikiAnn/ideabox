class Idea
  include Comparable
  attr_reader :title, :description, :rank, :id

  def initialize(attributes = {})
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
    @id = attributes["id"]
    @tag = tag_unless_nil(attributes["tag"])
  end

  def tag_unless_nil(tag = nil)
    if tag
      Tag.new(tag, id)
    else
      nil
    end
  end

  def to_h
    {"id" => id, "title" => title, "description" => description, "rank" => rank}
  end

  def like!
    @rank += 1
  end

  def unlike!
    @rank -= 1
  end

  def <=>(other)
    other.rank <=> rank
  end
end
