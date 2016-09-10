require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "homepage layout links" do
    get root_path
    assert_template 'homes/index'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", "http://guides.ruby-china.org/"
    assert_select "a[href=?]", "http://www.runoob.com/js/js-tutorial.html"
  end
end
