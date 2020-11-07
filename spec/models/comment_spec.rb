require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe '商品へのコメントを投稿' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメントができるとき' do
      it '必要な情報が存在するとき' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントができないとき' do
      it 'コメント内容が空だとコメントできない' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end
      it 'user_idが空だとコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'item_idが空だとコメントできない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end