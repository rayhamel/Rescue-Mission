require 'rails_helper'

feature 'user answers a question' do
  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem

  # Acceptance Criteria

  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  scenario 'user unsuccessfully answers question because no answer' do
    visit questions_path
    click_link('Show')
    click_button 'Create Answer'

    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('Description is too short (minimum is 50 characters)')
  end

  FactoryGirl.create(:question)

  scenario 'user successfully answers a question' do
    visit questions_path
    click_link('Show')
    fill_in 'Description', with: 'This is my answer and it is at least 50 characters long.'
    click_button 'Create Answer'

    expect(page).to have_content('This is my answer and it is at least 50 characters long.')
  end
end
