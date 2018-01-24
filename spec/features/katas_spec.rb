require 'rails_helper'
require 'capybara'

describe 'Kata' do

  it 'can be read' do
      kata_title = 'Second title'
      kata_description = 'Second description'
      create_kata
      create_kata(title: kata_title, description: kata_description)

      visit root_path
      click_on(kata_title)

      expect(page).to have_content(kata_title)
      expect(page).to have_content(kata_description)
    end

    it 'can be created' do
      kata_title = 'Kata title'
      kata_description = 'Kata description'

      visit root_path
      click_on('New Kata')
      fill_in(:title, with: kata_title)
      fill_in(:description, with: kata_description)
      click_on('Save')

      expect(page).to have_content(kata_title)
      expect(page).to have_content(kata_description)
  end

  it 'can be updated' do
    kata_title2 = 'Kata title2'
    kata_description2 = 'Kata description2'

    create_kata
    visit root_path

    click_on('Edit')
    fill_in(:kata_title, with: kata_title2)
    fill_in(:kata_description, with: kata_description2)
    click_on('Save')
    visit root_path

    expect(page).to have_content(kata_title2)
  end

  it 'can be deleted' do
    kata_title2 = 'Kata title2'
    kata_description2 = 'Kata description2'

    create_kata(title: kata_title2, description: kata_description2)
    visit root_path

    click_on('Delete')

    visit root_path
    expect(page).not_to have_content(kata_title2)
  end
end

def create_kata(title: 'Kata title', description: 'Super Kata')
  kata = Kata.new(title: title, description: description)
  kata.save

  kata
end
