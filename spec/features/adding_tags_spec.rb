feature "Adding tags to search saved URLS" do
  scenario "user can add a tag to their saved URL during input" do
    visit '/links/new'
    fill_in 'title', with: 'Wikipedia'
    fill_in 'url', with: 'https://www.wikipedia.org'
    fill_in 'tag', with: 'Encyclopedia'
    click_button 'submit'
    expect(page).to have_content 'Wikipedia'
  end
end
