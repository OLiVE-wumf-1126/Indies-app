require 'rails_helper'

RSpec.describe "リスナー新規登録", type: :feature do
  before do
    @listener = build(:listener)
  end
  it "新規登録" do
    visit new_listener_registration_path
    fill_in "listener[nickname]", with: @listener.nickname
    fill_in "listener[email]", with: @listener.email
    fill_in "listener[password]", with: @listener.password
    fill_in "listener[password_confirmation]", with: @listener.password
    expect { click_on "登録完了" }.to change(Listener, :count).by(1)
  end
end