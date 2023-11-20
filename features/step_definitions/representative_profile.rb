# frozen_string_literal: true

Given('Kamala D. Harris exists') do
  Representative.create!(
    name:      'Kamala D. Harris',
    ocdid:     'ocd-division/country:us',
    title:     'Vice President of the United States',
    street:    '1600 Pennsylvania Avenue Northwest',
    city:      'Washington',
    state:     'DC',
    zip:       '20500',
    party:     'Democratic Party',
    photo_url: 'https://mayzamudio.github.io/acmccc/img/member/user.jpg'
  )
end

When("I visit Kamala D. Harris' profile page") do
  kamala_d_harris = Representative.find_by(name: 'Kamala D. Harris')
  visit representative_path(kamala_d_harris) if kamala_d_harris
end

Then("I should see Kamala D. Harris' name") do
  expect(page).to have_content('Kamala D. Harris')
end

Then("I should see Kamala D. Harris' OCD ID") do
  expect(page).to have_content('ocd-division/country:us')
end

Then("I should see Kamala D. Harris' office") do
  expect(page).to have_content('Vice President of the United States')
end

Then("I should see Kamala D. Harris' contact address") do
  expect(page).to have_content('1600 Pennsylvania Avenue Northwest')
end

Then("I should see Kamala D. Harris' political party") do
  expect(page).to have_content('Democratic Party')
end

Then("I should see Kamala D. Harris' profile photo") do
  image_selector = 'img[src*="user.jpg"]'
  expect(page).to have_css(image_selector)
end

Given('I visit the Representatives page') do
  visit '/representatives/'
end

When('I add a California address in the Search page') do
  fill_in 'address', with: '697 South Sunbeam Dr. San Francisco, CA 94110'
  click_button 'Search'
end

Given('Joseph R. Biden exists') do
  Representative.create!(
    name:  'Joseph R. Biden',
    ocdid: 'ocd-division/country:us',
    title: 'President of the United States'
  )
end

When("I click on Joseph R. Biden's Profile link in the search results") do
  click_link('Profile', match: :first) if page.has_link?('Profile')
end

Then("I should see Joseph R. Biden's name") do
  expect(page).to have_content('Joseph R. Biden')
end

Then("I should see Joseph R. Biden's OCD ID") do
  expect(page).to have_content('ocd-division/country:us')
end

Then("I should see Joseph R. Biden's office") do
  expect(page).to have_content('President of the United States')
end

Then("I should see Joseph R. Biden's contact address") do
  expect(page).to have_content('1600 Pennsylvania Avenue Northwest')
end

Then("I should see Joseph R. Biden's political party") do
  expect(page).to have_content('Democratic Party')
end

Then("I should see Joseph R. Biden's profile photo") do
  image_selector = 'img[src*="user.jpg"]'
  expect(page).to have_css(image_selector)
end

Given('a representative named {string} exists with a news item') do |name|
  @representative = Representative.create!(
    name:      name,
    ocdid:     'ocd-division/country:us',
    title:     'Position Title',
    street:    '123 Main St',
    city:      'Anytown',
    state:     'State',
    zip:       '12345',
    party:     'Political Party',
    photo_url: 'https://example.com/photo.jpg'
  )
  NewsItem.create!(
    title:             'News Title',
    link:              'https://example.com/news-item',
    description:       "Article description with #{name}",
    representative_id: @representative.id
  )
end

When('I read a news item mentioning {string}') do |name|
  representative = Representative.find_by(name: name)
  visit representative_news_items_path(representative)

  first_info_button = find('tbody tr:first-child .btn-info')
  first_info_button.click
end

When("I click on the representative's name in the news item") do
  click_link @representative.name
end

# Then Step: Check redirection to the representative's profile page
Then("I should be redirected to the representative's profile page") do
  expect(page).to have_current_path(representative_path(@representative))
end

# Then Steps: Verify representative's information is displayed correctly
Then("I should see the representative's name") do
  expect(page).to have_content(@representative.name)
end

Then("I should see the representative's OCD ID") do
  expect(page).to have_content(@representative.ocdid)
end

Then("I should see the representative's office") do
  expect(page).to have_content(@representative.title)
end

Then("I should see the representative's contact address") do
  expect(page).to have_content(@representative.street)
  full_address = [@representative.city, @representative.state, @representative.zip].join(', ')
  expect(page).to have_content(full_address)
end

Then("I should see the representative's political party") do
  expect(page).to have_content(@representative.party)
end

Then("I should see a representative's profile photo") do
  expect(page).to have_css("img[src*='#{@representative.photo_url}']")
end
