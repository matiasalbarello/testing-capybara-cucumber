class ProductPage < SitePrism::Page
  set_url "https://www.amazon.de/"
  set_url_matcher(/amazon.de\//)

  section :product_features, "#twisterContainer" do
    element :storage, "#variation_size_name"
    element :model, "#variation_style_name"
    element :color, "#variation_color_name"
  end
end