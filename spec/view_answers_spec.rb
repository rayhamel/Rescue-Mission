require 'rails_helper'

feature 'user views a questions answers' do
  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer

  # Acceptance Criteria

  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last
  scenario 'successfully view answers' do
    answer_one = FactoryGirl.create(:answer)
    FactoryGirl.create(:answer)

    visit question_path(answer_one.question_id)

    fill_in 'Description', with: 'This is my answer and it is at least 50 characters long.'
    click_button 'Create Answer'

    expect(page).to have_content('1 different people have tried this answer and it worked for everyone.')
    expect(page).to have_no_content('2 different people have tried this answer and it worked for everyone.')
    expect(page).to have_content('This is my answer and it is at least 50 characters long.')
    expect(page).to have_selector('p:nth-last-child(2)', text: 'This is my answer and it is at least 50 characters long.')
  end
end
