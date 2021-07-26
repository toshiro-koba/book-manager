require 'rails_helper'

describe '書籍管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:book_a) { FactoryBot.create(:book, title: '最初の書籍', user: user_a) }

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  shared_examples_for 'ユーザーAが作成した書籍が表示される' do
    it { expect(page).to have_content '最初の書籍' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成した書籍が表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成した書籍が表示されない' do
        expect(page).to have_no_content '最初の書籍'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit book_path(book_a)
      end

      it_behaves_like 'ユーザーAが作成した書籍が表示される'
    end
  end

  describe '新規作成機能' do
    let(:login_user) { user_a }

    before do
      visit new_book_path
      fill_in 'タイトル', with: book_name
      click_button '登録する'
    end

    context '新規作成画面でタイトルを入力した時' do
      let(:book_name) { '新規作成のテストを書く' }

      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: '新規作成のテストを書く'
      end
    end

    context '新規作成画面でタイトルを入力しなかった時' do
      let(:book_name) { '' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content 'タイトルを入力してください'
        end
      end
    end
  end

end
