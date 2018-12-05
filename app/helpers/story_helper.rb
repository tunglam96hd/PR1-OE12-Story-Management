module StoryHelper
  def author
    Author.pluck :name, :id
  end
end
