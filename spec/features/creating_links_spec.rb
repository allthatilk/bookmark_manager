feature "Adding URLs to the database" do
  scenario "user fills in form to add links" do
    visit '/links/new'
    fill_in 'title', with: 'YouTube'
    fill_in 'url', with: 'https://www.youtube.co.uk'
    fill_in 'tag', with: 'Vlogs'
    click_button 'submit'
    expect(page).to have_content 'YouTube'
  end
end
