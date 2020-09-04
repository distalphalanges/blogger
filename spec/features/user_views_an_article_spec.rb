require 'rails_helper'

describe 'user can view one article' do
  describe 'they click the link from the articles index' do
    it 'displays an article' do
      article = Article.create!(title: 'Article 1', body: 'Lorem ipsum and so on and so forth.')
      comment_1 = article.comments.create(author_name: 'Bob', body: 'This article sucks!')
      comment_2 = article.comments.create(author_name: 'Joe', body: 'This article rules!')

      visit articles_path
      click_on 'Article 1'

      expect(page).to have_current_path(article_path(article))
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
