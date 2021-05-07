class IndexPage < SitePrism::Page
  set_url "https://www.amazon.de/"
  set_url_matcher(/amazon.de\/?/)

  element :search_box, 'input#twotabsearchtextbox'
  element :search_button, '#nav-search-submit-button'
  element :sort_price_desc_option, :xpath, '//a[contains(@data-value, "price-desc-rank")]'
  sections :search_results, SearchResultSection, "div.s-result-item"

  def sort_results_by_price_desc
    execute_script("document.getElementsByClassName('a-native-dropdown')[0].click()")
    sort_price_desc_option.click()
  end
end