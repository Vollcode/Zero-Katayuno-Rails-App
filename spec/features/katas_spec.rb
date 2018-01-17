require 'rails_helper'
require 'capybara'

describe 'Kata' do
  it 'can be read' do
    kata_title = 'La kata suprema'
    kata_description = 'Kata mejor que la doom'
    kata = Kata.new(title: kata_title, description: kata_description)
    kata.save

    visit root_path
    click_on(kata_title)

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end
end
