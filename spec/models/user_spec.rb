require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfairs_name_kana、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが英数字混合で6文字以上で登録できる" do
        @user.password = "japan2020"
        @user.password_confirmation = "japan2020"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordがアルファベットのみは登録できない" do
      end
      it "passwordが数字のみは登録できない" do
      end
      it "passwordが５文字以下では登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "last_nameに全角（漢字・ひらがな・カタカナ）以外が含まれるとき登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "first_nameに全角（漢字・ひらがな・カタカナ）以外が含まれるとき登録できない" do
      end
      it "last_name_kanaが空だと登録できない" do
      end
      it "last_name_kanaに全角（カタカナ）以外が含まれるとき登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaに全角（カタカナ）以外が含まれるとき登録できない" do
      end
      it "birth_dayが空だと登録できない" do
      end
    end
  end
end
