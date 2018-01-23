require 'rails_helper'
require 'capybara'

describe 'Kata' do

  it 'can be read' do
    second_title = 'La kata peor'
    second_description = 'Kata peor que la doom'
    first_kata = create_kata
    first_kata.save
    second_kata = create_kata(title: second_title, description: second_description)
    second_kata.save

    visit root_path
    click_on(second_title)

    expect(page).to have_content(second_title)
    expect(page).to have_content(second_description)
  end
end

def create_kata(title: 'Kata title', description: 'Super Kata')
  kata = Kata.new(title: title, description: description)
  kata.save

  kata
end
