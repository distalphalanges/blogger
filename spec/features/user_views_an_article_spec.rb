require 'rails_helper'

describe 'user can view an article' do
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

  describe 'they fill in a comment form' do
      it 'displays the comment on the article' do
        article = Article.create!(title: 'Article 1', body: 'Lorem ipsum and so on and so forth.')

        visit article_path(article)

        fill_in 'comment[author_name]', with: 'Bob'
        fill_in 'comment[body]', with: 'So many thoughts on this article.'
        click_on 'Submit'

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content('Post a Comment')
        expect(page).to have_content('Bob')
        expect(page).to have_content('So many thoughts on this article.')
      end
  end
end
