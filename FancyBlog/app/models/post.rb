class Post < ActiveRecord::Base
  	acts_as_taggable
  	attr_accessible :title, :body, :tag_list, :comments

	has_many :comments
end
