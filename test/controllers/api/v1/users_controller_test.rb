require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test "index_success: should show users" do
    get api_v1_users_path, as: :json
    assert_response 200
  end
  test "show_success: should show user" do
    get api_v1_user_path(@user), as: :json
    json_response = JSON.parse(self.response.body)
    # 验证状态码
    assert_response 200
    # 验证返回数据
    assert_equal @user.email, json_response['data']['email']
  end
  test "create_success: should create user" do
    assert_difference('User.count', 1) do
      post api_v1_user_path, params: {user:{email: 'test@test.com', password: '123456'}}, as: :json
    end
    assert_response 201
  end
end
