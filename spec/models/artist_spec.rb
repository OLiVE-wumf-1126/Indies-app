require 'rails_helper'
RSpec.describe Artist, type: :model do
  describe '#create' do
    it 'artistモデル項目全て存在すれば登録できる' do
      artist = build(:artist)
      artist.valid?
      expect(artist).to be_valid
    end

    it 'artistnameがない場合は登録できないこと' do
      artist = build(:artist, artistname: nil)
      artist.valid?
      expect(artist.errors[:artistname]).to include('を入力してください')
    end

    it 'emailがない場合は登録できないこと' do
      artist = build(:artist, email: nil)
      artist.valid?
      expect(artist.errors[:email]).to include('を入力してください')
    end

    it '重複したemailが存在する場合登録できないこと' do
      artist = create(:artist)
      another_artist = build(:artist, email: artist.email)
      another_artist.valid?
      expect(another_artist.errors[:email]).to include('はすでに存在します')
    end

    it 'passwordが無いと登録できないこと' do
      artist = build(:artist, password: nil)
      artist.valid?
      expect(artist.errors[:password]).to include('を入力してください')
    end

    it 'passwordが７文字以下の時は登録できないこと' do
      artist = build(:artist, password: 'hoge36')
      artist.valid?
      expect(artist.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it 'passwordが英字と英数字を含まない時は登録できないこと' do
      artist = build(:artist, password: 'aaaaaaa')
      artist.valid?
      expect(artist.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it 'passwordが英字と英数字を含まない時は登録できないこと' do
      artist = build(:artist, password: '1111111')
      artist.valid?
      expect(artist.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end
  end
end
