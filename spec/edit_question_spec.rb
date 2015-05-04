require 'rails_helper'

TITLE = 'My title is a great title and is over 40 characters'
DESCRIPTION = 'My description is the very best description in the world, that' \
  'is the reason why it is such a very awesome title, so many characters ' \
  'long, it goes on and on and on and on and on.'

feature 'user edits a question' do
  # As a user
  # I want to edit a question
  # So that I can correct any mistakes or add updates

  # Acceptance Criteria

  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page
  scenario 'user successfully edits a question' do
    visit questions_path
    click_link('Edit')
    fill_in 'Title', with: TITLE
    fill_in 'Description', with: DESCRIPTION
    click_button 'Update Question'

    expect(page).to have_content(TITLE)
    expect(page).to have_content(DESCRIPTION)
  end

  scenario 'user unsuccessfully edits question because no title or description' do
    visit questions_path
    click_link('Edit')
    fill_in 'Title', with: ''
    fill_in 'Description', with: ''
    click_button 'Update Question'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content('Title is too short (minimum is 40 characters)')
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end
end
