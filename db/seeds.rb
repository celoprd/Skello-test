require_relative 'database.rb'

DB.each do |post|
  Post.create(post)
end

COMMENTS.each_with_index do |comments, index|
  comments.each do |comment|
    n_comment = Comment.new(description: comment)
    n_comment.post = Post.find(index + 1)
    n_comment.save
  end
end
