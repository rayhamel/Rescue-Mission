require 'rails_helper'

feature 'user deletes a question' do
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions

  # Acceptance Criteria

  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted
  scenario 'user deletes a question from the edit page' do
    visit questions_path
    click_link('Edit')
    click_link('Destroy')

    expect(page).to have_no_content('pronto')
  end

  scenario 'user deletes a question from the details page' do
    visit questions_path
    click_link('Show')
    click_link('Destroy')

    expect(page).to have_no_content('pronto')
  end

  scenario 'deleting question also deletes all associated answers' do
    visit questions_path
    click_link('Show')
    fill_in 'Description', with: 'This is my answer and it is at least 50 characters long.'
    click_button 'Create Answer'
    click_link('Destroy')

    expect(page).to have_no_content('This is my answer and it is at least 50 characters long.')
  end
end
