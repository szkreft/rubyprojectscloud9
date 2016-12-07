class ArticleCategory < ActiveRecord::Base
    #article category belongs to article
    belongs_to :article
    #article category belnogs to category also
    belongs_to :category
end