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

When('I read a news item mentioning a representative') do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click on the representative's name in the news item") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should be redirected to the representative's profile page") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see the representative's name") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see the representative's OCD ID") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see the representative's office") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see the representative's contact address") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see the representative's political party") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a representative's profile photo") do
  pending # Write code here that turns the phrase above into concrete actions
end
