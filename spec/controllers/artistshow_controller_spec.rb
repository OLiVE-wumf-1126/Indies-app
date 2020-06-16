require 'rails_helper'

RSpec.describe ArtistshowController, type: :controller do
  describe "#show" do
    before do
      @artist = create(:artist)
    end
    # 正常なレスポンスが返ってきているか？
    it "responds successfully" do
      get :show, params: {id: @artist.id}
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get :show, params: {id: @artist.id}
      expect(response).to have_http_status "200"
    end
  end
end
