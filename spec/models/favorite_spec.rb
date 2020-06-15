require 'rails_helper'
RSpec.describe Favorite, type: :model do
  describe '#create' do
    it "favoriteモデル項目全て存在すれば登録できる" do
      listener = create(:listener)
      post = create(:post)
      favorite= build(:favorite, listener_id: listener.id, post_id: post.id)
      favorite.valid?
      expect(favorite).to be_valid
    end

    it "post_idがない場合は登録できない" do
      favorite = build(:favorite, post_id: nil)
      favorite.valid?
      expect(favorite.errors[:post_id]).to include("を入力してください")
    end

    it "listener_idがない場合は登録できない" do
      favorite = build(:favorite, listener_id: nil)
      favorite.valid?
      expect(favorite.errors[:listener_id]).to include("を入力してください")
    end

  end
end