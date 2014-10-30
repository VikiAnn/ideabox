class Tag
  attr_reader :contents, :idea_id

  def initialize(contents, idea_id)
    @contents = contents
    @idea_id = idea_id
    save
  end

  def save
    database.transaction do |db|
      db["tags"] ||= []
      db["tags"] << {"contents" => contents, "idea_id" => idea_id}
    end
  end

  def database
    return @database if @database
    @database ||= YAML::Store.new "db/tags"
    @database.transaction do
      @database["tags"] ||= []
    end
    @database
  end
end
