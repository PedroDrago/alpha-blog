require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  test "get new article form and create article" do
    user1 = User.create(username: 'testarino',
                        email: 'testarino@email.com',
                        password: 'password')
    sign_in_as(user1)
    get new_article_path
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: 'test title',
                                               description: 'test description',
                                               user_id: user1.id}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "test title", response.body
    assert_match "test description",response.body
    
  end
end
