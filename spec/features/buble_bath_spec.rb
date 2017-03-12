feature "Searches with tags" do
  before(:each) do
    Link.create(title: 'Makers', url: 'https://www.makersacademy.com', tags: [Tag.first_or_create(name: 'Learn')])
    Link.create(title: 'YouTube', url: 'https://www.youtube.com', tags: [Tag.first_or_create(name: 'Watch')])
    Link.create(title: 'Buble_bath', url: 'https://www.bublebubbles.com', tags: [Tag.first_or_create(name: 'bubbles')])
  end



  scenario "only shows the links tagged 'bubbles'" do
    visit '/tags/search?name=bubbles'
    within 'ul#links' do
      expect(page).not_to have_content("Learn")
      expect(page).not_to have_content("Watch")
      expect(page).to have_content("Buble")
    end
  end
end
