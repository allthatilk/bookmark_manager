feature "List on the homepage" do
  scenario "shows a list of links on the homepage" do
    Link.create(url: 'https://wwww.makersacademy.com', title: 'Makers')
    Tag.create(name: 'Bootcamp')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Makers')
    end
  end
end
