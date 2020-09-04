require 'rails_helper'

describe 'user creates a new article' do
  describe 'they click the link from the articles index' do
    describe 'they fill in a title and body' do
      it 'creates a new article' do
        visit articles_path
        click_on 'Create a new article'

        expect(current_path).to eq(new_article_path)

        fill_in 'article[title]', with: 'New Article'
        fill_in 'article[body]', with: 'This is a new article.'
        click_on 'Create Article'

        expect(page).to have_content('New Article')
        expect(page).to have_content('This is a new article.')
        expect(page).to have_content('Article created.')
      end
    end
  end
end
