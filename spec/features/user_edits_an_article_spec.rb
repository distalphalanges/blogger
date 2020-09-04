require 'rails_helper'

describe 'user edits an article' do
  describe 'they edit the article' do
    it 'updates the title and body' do
      article = Article.create!(title: 'Article 1', body: 'Lorem ipsum and so on and so forth.')

      visit article_path(article)
      click_on 'Edit Article'

      expect(current_path).to eq(edit_article_path(article))

      fill_in 'article[title]', with: 'Edited Article'
      fill_in 'article[body]', with: 'This article has been edited.'
      click_on 'Update Article'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content('Edited Article')
      expect(page).to have_content('This article has been edited.')
      expect(page).to have_content('Article updated.')
    end
  end
end
