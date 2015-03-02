require 'rails_helper'

feature "managing companies" do
  scenario "user can view, add, edit, and destroy companies" do
    visit root_path

    click_on "New Company"

    fill_in "Name", with: "Running Man Corp"

    click_on "Create Company"

    click_on "Running Man Corp"

    expect(page).to have_content "Running Man Corp"

    click_on "Edit"

    fill_in "Name", with: "Running Woman Corp"

    click_on "Update"

    expect(page).to have_content "Company has been successfully updated"

    click_on "Running Woman Corp"

    click_on "Delete"

    expect(page).to have_content "Company has been successfully deleted"
    expect(page).to_not have_content "Running Woman Corp"

  end
end
