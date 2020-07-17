require 'rails_helper'
RSpec.describe Listener, type: :model do
  describe '#create' do
    it 'listenerモデル項目全て存在すれば登録できる' do
      listener = build(:listener)
      listener.valid?
      expect(listener).to be_valid
    end

    it 'nicknameがない場合は登録できないこと' do
      listener = build(:listener, nickname: nil)
      listener.valid?
      expect(listener.errors[:nickname]).to include('を入力してください')
    end

    it 'emailがない場合は登録できないこと' do
      listener = build(:listener, email: nil)
      listener.valid?
      expect(listener.errors[:email]).to include('を入力してください')
    end

    it '重複したemailが存在する場合登録できないこと' do
      listener = create(:listener)
      another_listener = build(:listener, email: listener.email)
      another_listener.valid?
      expect(another_listener.errors[:email]).to include('はすでに存在します')
    end

    it 'passwordが無いと登録できないこと' do
      listener = build(:listener, password: nil)
      listener.valid?
      expect(listener.errors[:password]).to include('を入力してください')
    end

    it 'passwordが７文字以下の時は登録できないこと' do
      listener = build(:listener, password: 'hoge36')
      listener.valid?
      expect(listener.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it 'passwordが英字と英数字を含まない時は登録できないこと' do
      listener = build(:listener, password: 'aaaaaaa')
      listener.valid?
      expect(listener.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end

    it 'passwordが英字と英数字を含まない時は登録できないこと' do
      listener = build(:listener, password: '1111111')
      listener.valid?
      expect(listener.errors[:password]).to_not match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}\z/i)
    end
  end
end
