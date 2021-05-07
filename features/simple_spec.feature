Feature: Default product specifications
  Background:
    Given that the user is at amazon.de
    And search for "iPad Air 10.9 256 Wi-Fi cellular"
    And find the most expensive (non-sponsored) article

  @javascript
  Scenario: Article’s product page should display preselected options
    When the user visits the article’s product page
    Then the storage should have "256 GB" option
    And the model should have "WiFi + Cellular" option
    And the color should have "Space Grau" option

# Scenario: Article’s product page should display additional information
#   When the user visits the article’s product page
#   Then the price saving should be at least 5%
#   And be deliverable by max 2 days from now

# Scenario: Adding article to the Wishlist (“Auf die Liste”)
#   When the user visits the article’s product page
#   And saves the article to the Wishlist
#   Then it should be saved in the Wishlist