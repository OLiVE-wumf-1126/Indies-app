require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    it "正常なレスポンスか" do
      get :index
      expect(response).to be_success
    end

    it "200レスポンスが返ってくるか" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    before do
      @post = create(:post)
    end

    it "正常なレスポンスか" do
      get :show, params: {id: @post.id}
      expect(response).to be_success
    end

    it "200レスポンスが返ってくるか" do
      get :show, params: {id: @post.id}
      expect(response).to have_http_status "200"
    end
  end

  describe "#new" do
    context "as a guest user" do
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
      # ログイン画面にリダイレクトされているか？
      it "redirects the page to /" do
        get :new
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#create" do
    context "as a guest user" do
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
      # ログイン画面にリダイレクトされているか？
      it "redirects the page to /" do
        post :create
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#edit" do
    context "as a guest user" do
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
      # top画面にリダイレクトされているか？
      it "redirects the page to /" do
        get :edit, params: {id: @post.id}
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#update" do
    context "as a guest user" do
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
      # top画面にリダイレクトされているか？
      it "redirects the page to /" do
        patch :update, params: {id: @post.id}
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#destroy" do
    context "as a user not to login" do
      # 各example(it〜end)の前に「@post」を作成
      before do
        @post = create(:post)
      end
    
      # 302レスポンスを返すこと
      it "returns a 302 response" do
        # DELETEを@postに対して送信する
        delete :destroy, params: { id: @post.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end

      # top画面にリダイレクトすること 
      it "redirects to the sign-in page" do
        # DELETEを@postに対して送信する
        delete :destroy, params: { id: @post.id }
        # サインインページに遷移することを確認
        expect(response).to redirect_to "/"
      end
    end
  end
end