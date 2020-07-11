require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "should get new" do
  #   get users_new_url
  #   assert_response :success
  # end

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 20) 
  end
  
  def show
    #@user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  

end
