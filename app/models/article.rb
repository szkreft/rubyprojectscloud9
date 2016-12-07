class Article < ActiveRecord::Base
    #article belongs to user
    belongs_to :user
    #article has many article categories
    has_many :article_categories
    #article has many categories through article categories
    has_many :categories, through: :article_categories
    #validation on title, length and presence
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    #validation on description, length and presence
    validates :description, presence: true, length: {minimum: 10, maximum: 250}
    #validation on user id, presence
    validates :user_id, presence: true
end
