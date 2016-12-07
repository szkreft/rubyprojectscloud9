class Category < ActiveRecord::Base
    #category has many article categories
    has_many :article_categories
    #category has many articles through article categories
    has_many :articles, through: :article_categories
    #validation on name and length
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    #validation on uniqueness of the name
    validates_uniqueness_of :name
    
end