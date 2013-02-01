class Post < ActiveRecord::Base
	attr_accessible :content, :name, :title, :tags_attributes

	validates :name,  :presence => true
	validates :title, :presence => true, :length => { :minimum => 5 }

	has_many :comments, :dependent => :destroy	
	has_many :tags

	accepts_nested_attributes_for :tags, :allow_destroy => :true,
		:reject_if => proc {|attrs| attrs.all? { |k, v| v.blank? } }

  	scope :recent, limit(2).order('posts.created_at DESC')
  	scope :uncommented, where(:comments_count => 0).limit(10)
  end
