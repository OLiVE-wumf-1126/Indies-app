module LoginMacros
  def artistlogin(user)
    visit new_artist_session_path
    fill_in 'artist[email]', with: user.email
    fill_in 'artist[password]', with: user.password
    click_on 'ログイン'
    expect(page).to have_content '投稿'
  end

  def logout
    find('a', text: 'メニュー').click
    click_on 'ログアウト'
    expect(page).to have_content 'ログイン'
  end

  def listenerlogin(user)
    visit new_listener_session_path
    fill_in 'listener[email]', with: user.email
    fill_in 'listener[password]', with: user.password
    click_on 'ログイン'
    expect(page).to have_content 'フォローアーティスト一覧'
  end
end
