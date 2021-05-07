Given /^that the user is at amazon.de$/ do
  @page = IndexPage.new
  @page.load
  expect(@page).to be_displayed
end

When /^search for \"(.*)\"$/ do |searched_product|
  # fill_in 'twotabsearchtextbox', with: searched_product
  @searched_product = searched_product
  @page.search_box.set searched_product
  @page.search_button.click
end

When /^find the most expensive \(non-sponsored\) article$/ do
  @page.sort_results_by_price_desc
  expect(@page).to have_search_results
end


When /^the user visits the article’s product page$/ do
  feats = Helpers.normalize_text(@searched_product).split(" ")
  sleep 1
  results = @page.search_results.select do |result|
    normalized_result_text = Helpers.normalize_text(result.text)
    feats.all?{ |f| normalized_result_text.include? f } && !normalized_result_text.include?("gesponsert")
  end

  results.first.product_page_link.click
  @product_page = ProductPage.new
  expect(@product_page).to be_displayed
  expect(@product_page).to be_all_there
end

Then /the (.*) should have \"(.*)\" option/ do |feature_name, value|
  norm_opt = Helpers.normalize_text(value)
  feature_text = Helpers.normalize_text(@product_page.product_features.send(feature_name).text)
  expect(feature_text).to include(norm_opt)
end


# And /^the color should have "Space Grau" option$/ do

# end

# Then /^the price saving should be at least 5%$/ do

# end
# And /^be deliverable by max 2 days from now$/ do

# end

# And /^saves the article to the Wishlist$/ do

# end
# Then /^it should be saved in the Wishlist$/ do

# end
