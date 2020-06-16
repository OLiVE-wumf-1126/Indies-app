require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    # 正常なレスポンスが返ってきているか？
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    before do
      @post = create(:post)
    end
    # 正常なレスポンスが返ってきているか？
    it "responds successfully" do
      get :show, params: {id: @post.id}
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get :show, params: {id: @post.id}
      expect(response).to have_http_status "200"
    end
  end

  describe "#new" do
    context "artist未ログインの場合" do
      # 正常なレスポンスが返ってきていないか？
      it "does not respond successfully" do
        get :new
        expect(response).to_not be_success
      end
      # 302レスポンスが返ってきているか？
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
      # root画面にリダイレクトされているか？
      it "redirects the page to /" do
        get :new
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#create" do
    context "artist未ログインの場合" do
      # 正常なレスポンスが返ってきていないか？
      it "does not respond successfully" do
        post :create
        expect(response).to_not be_success
      end
      # 302レスポンスが返ってきているか？
      it "returns a 302 response" do
        post :create
        expect(response).to have_http_status "302"
      end
      # root画面にリダイレクトされているか？
      it "redirects the page to /" do
        post :create
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#edit" do
    context "artist未ログインの場合" do
      before do
        @post = create(:post)
      end
      # 正常なレスポンスが返ってきていないか？
      it "does not respond successfully" do
        get :edit, params: {id: @post.id}
        expect(response).to_not be_success
      end
      # 302レスポンスが返ってきているか？
      it "returns a 302 response" do
        get :edit, params: {id: @post.id}
        expect(response).to have_http_status "302"
      end
      # root画面にリダイレクトされているか？
      it "redirects the page to /" do
        get :edit, params: {id: @post.id}
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#update" do
    context "artist未ログインの場合" do
      before do
        @post = create(:post)
      end
      # 正常なレスポンスが返ってきていないか？
      it "does not respond successfully" do
        patch :update, params: {id: @post.id}
        expect(response).to_not be_success
      end
      # 302レスポンスが返ってきているか？
      it "returns a 302 response" do
        patch :update, params: {id: @post.id}
        expect(response).to have_http_status "302"
      end
      # root画面にリダイレクトされているか？
      it "redirects the page to /" do
        patch :update, params: {id: @post.id}
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#destroy" do
    context "artist未ログインの場合" do
      before do
        @post = create(:post)
      end
    
      # 302レスポンスを返すこと
      it "returns a 302 response" do
        delete :destroy, params: { id: @post.id }
        expect(response).to have_http_status "302"
      end

      # root画面にリダイレクトすること 
      it "redirects to the sign-in page" do
        delete :destroy, params: { id: @post.id }
        expect(response).to redirect_to "/"
      end
    end
  end
end