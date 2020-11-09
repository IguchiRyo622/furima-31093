require 'rails_helper'
RSpec.describe Review, type: :model do
  describe '購入者、出品者が取引レビュー' do
    before do
      @review = FactoryBot.build(:review)
    end

    context 'レビューができるとき' do
      it '必要な情報が存在するとき' do
        expect(@review).to be_valid
      end
    end
    context 'レビューができないとき' do
      it 'レビュー内容が空だとレビューできない' do
        @review.review = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Review can't be blank")
      end
      it 'user_idが空だとレビューできない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("User must exist")
      end
      it 'item_idが空だとレビューできない' do
        @review.item = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
