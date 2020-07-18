require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe '#create' do
    it 'commentモデル項目全て存在すれば登録できる' do
      listener = create(:listener)
      post = create(:post)
      comment = build(:comment, listener_id: listener.id, post_id: post.id)
      comment.valid?
      expect(comment).to be_valid
    end

    it 'post_idがない場合は登録できない' do
      comment = build(:comment, post_id: nil)
      comment.valid?
      expect(comment.errors[:post_id]).to include('を入力してください')
    end

    it 'listener_idがない場合は登録できない' do
      comment = build(:comment, listener_id: nil)
      comment.valid?
      expect(comment.errors[:listener_id]).to include('を入力してください')
    end

    it 'commentがない場合は登録できない' do
      comment = build(:comment, comment: nil)
      comment.valid?
      expect(comment.errors[:comment]).to include('を入力してください')
    end
  end
end
