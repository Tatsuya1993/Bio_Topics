require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Bio Topics"
  end
  
  test "ページタイトル付きでhome(root)ページを取得" do
    get "/"
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "ページタイトル付きでhelpページを取得" do
    get "/help"
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  
  test "ページタイトル付きでaboutページを取得" do
    get "/about"
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  test "ページタイトル付きでcontactページを取得" do
    get "/contact"
    assert_response :success
    assert_select "title","Contact | #{@base_title}"
  end
end
