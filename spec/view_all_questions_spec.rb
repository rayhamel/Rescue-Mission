require 'rails_helper'

feature 'user views all questions' do
  # As a user
  # I want to view recently posted questions
  # So that I can help others

  # Acceptance Criteria

  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first
  scenario 'successfully view list of questions' do
    FactoryGirl.create(:question)
    visit questions_path

    expect(page).to have_content('2 things I need answered, pronto, which means right now!')
    expect(page).to have_selector('tr:last-child > td', text: '1 things I need answered, pronto, which means right now!')
  end
end
