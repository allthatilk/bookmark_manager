feature "List on the homepage" do
  let!(:link) { Link.create(url: 'https://wwww.makersacademy.com', title: 'Makers') }

  scenario "shows a list of links on the homepage" do
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content(link.title)
    end
  end
end
