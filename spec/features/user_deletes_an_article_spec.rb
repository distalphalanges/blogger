require 'rails_helper'

describe 'user deletes an article' do
  describe 'they click the link from the show page' do
    it 'displays all articles without the deleted entry' do
      article_1 = Article.create!(title: 'Article 1', body: 'This is article 1.')
      article_2 = Article.create!(title: 'Article 2', body: 'This is article 2.')
      visit article_path(article_1)

      click_link 'Delete Article'

      expect(current_path).to eq(articles_path)
      expect(page).to_not have_content('Article 1')
      expect(page).to have_content('Article 2')
      expect(page).to have_content('Article deleted.')
    end
  end
end
