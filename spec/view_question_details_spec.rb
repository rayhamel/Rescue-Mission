require 'rails_helper'

feature "user views a question's details" do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question

  # Acceptance Criteria

  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description
  scenario 'successfully view a question' do
    visit questions_path
    click_link('Show')

    expect(page).to have_content('1 things I need answered, pronto, which means right now!')
    expect(page).to have_content(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed' \
      ' do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut ' \
      'enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ' \
      'ut aliquip ex ea commodo consequat.'
    )
  end
end
