# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '書籍作成' do
    let(:book) { FactoryBot.build(:book) }

    context 'タイトルがあり、ユーザーが紐づいている' do
      it '作成できる' do
        expect(book).to be_valid
      end
    end

    context 'タイトルが無い' do
      it '作成できない' do
        book.title = nil
        book.valid?
        expect(book.errors.messages[:title]).to include 'タイトルを入力してください'
      end
    end

    context 'ユーザーが紐づいてない' do
      it '作成できない' do
        book.user = nil
        book.valid?
        expect(book.errors.messages[:user]).to include 'を入力してください'
      end
    end
  end
end
