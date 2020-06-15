require 'rails_helper'
RSpec.describe Followartist, type: :model do
  describe '#create' do
    it "followartistモデル項目全て存在すれば登録できる" do
      listener = create(:listener)
      artist = create(:artist)
      followartist = build(:followartist, listener_id: listener.id, artist_id: artist.id)
      followartist.valid?
      expect(followartist).to be_valid
    end

    it "artist_idがない場合は登録できない" do
      followartist = build(:followartist, artist_id: nil)
      followartist.valid?
      expect(followartist.errors[:artist_id]).to include("を入力してください")
    end

    it "listener_idがない場合は登録できない" do
      followartist = build(:followartist, listener_id: nil)
      followartist.valid?
      expect(followartist.errors[:listener_id]).to include("を入力してください")
    end

  end
end