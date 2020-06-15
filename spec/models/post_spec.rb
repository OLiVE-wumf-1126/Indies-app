require 'rails_helper'
RSpec.describe Post, type: :model do
  describe '#create' do
    it "postモデル項目全て存在すれば登録できる" do
      post = build(:post)
      post.valid?
      expect(post).to be_valid
    end

    it "youtube_urlがない場合は登録できない" do
      post = build(:post, youtube_url: nil)
      post.valid?
      expect(post.errors[:youtube_url]).to include("を入力してください")
    end

    it "textがない場合は登録できない" do
      post = build(:post, text: nil)
      post.valid?
      expect(post.errors[:text]).to include("を入力してください")
    end

    it "titleがない場合は登録できないこと" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end
  end
end