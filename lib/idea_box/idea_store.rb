require 'yaml/store'

class IdeaStore
  def self.database
    return @database if @database

    @database ||= YAML::Store.new "db/ideabox"
    @database.transaction do
      @database['ideas'] ||= []
    end
    @database
  end

  def self.all
    raw_ideas.map do |data|
      Idea.new(data)
    end
  end

  def self.raw_ideas
    database.transaction do |db|
      db['ideas'] || []
    end
  end

  def self.create(attributes)
    attributes = attributes.merge("id" => next_id)
    database.transaction do
      database['ideas'] << attributes
    end
  end

  def self.find(id)
    raw_idea = find_raw_idea(id)
    Idea.new(raw_idea.merge("id" => id))
  end

  def self.find_raw_idea(id)
    database.transaction do
      database['ideas'].find { |idea| idea['id'] == id }
    end
  end

  def self.delete(id)
    database.transaction do
      database['ideas'].delete_if { |idea| idea['id'] == id }
    end
  end

  def self.update(id, data)
    database.transaction do
      idea = database['ideas'].find { |idea| idea['id'] == id }
      idea.merge!(data)
    end
  end

  def self.next_id
    if IdeaStore.all.empty?
      1
    else
      IdeaStore.all.last.id + 1
    end
  end
end
