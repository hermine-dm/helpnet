class CreateArticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :article_comments do |t|
        t.belongs_to :user, index: true
    	t.belongs_to :article, index: true
    	t.text :content
        t.timestamps
    end
  end
end
