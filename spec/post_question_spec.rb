require 'rails_helper'

TITLE = 'My title is a great title and is over 40 characters'
DESCRIPTION = 'My description is the very best description in the world, that' \
  'is the reason why it is such a very awesome title, so many characters ' \
  'long, it goes on and on and on and on and on.'

feature 'user posts a question' do
  # As a user
  # I want to post a question
  # So that I can receive help from others

  # Acceptance Criteria

  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  scenario 'user successfully posts a question' do
    visit questions_path
    click_link 'New question'
    fill_in 'Title', with: TITLE
    fill_in 'Description', with: DESCRIPTION
    click_button 'Create Question'

    expect(page).to have_content(TITLE)
    expect(page).to have_content(DESCRIPTION)
  end

  scenario 'fail to create question because no title or description' do
    visit questions_path
    click_link 'New question'
    click_button 'Create Question'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content('Title is too short (minimum is 40 characters)')
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end
end
