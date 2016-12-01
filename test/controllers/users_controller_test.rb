require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    test "should get signup" do
        get :new
        assert_response :success
    end
    
    test "should get index" do
        get :index
        assert_response :success
    end

    test "should create " do
        post :create
        assert_response :success
    end
    
    test "should edit" do
        get :edit
        assert_response :success
    end
    
    test "should show" do
        get :show
        assert_response :success
    end
    
    test "should update" do
        patch 
        
    
    