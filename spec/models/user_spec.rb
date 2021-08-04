# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー作成' do
    let(:user) { FactoryBot.build(:user) }

    context '名前とemailとパスワードがある' do
      it '作成できる' do
        expect(user).to be_valid
      end
    end

    context '名前が無い' do
      it '作成できない' do
        user.name = nil
        user.valid?
        expect(user.errors.messages[:name]).to include '名前を入力してください'
      end
    end

    context 'emailが無い' do
      it '作成できない' do
        user.email = nil
        user.valid?
        expect(user.errors.messages[:email]).to include 'メールアドレスを入力してください'
      end
    end

    context 'パスワードが無い' do
      it '作成できない' do
        user.password = nil
        user.valid?
        expect(user.errors.messages[:password]).to include 'パスワードを入力してください'
      end
    end
  end
end
