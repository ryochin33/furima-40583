require 'rails_helper'

RSpec.describe "Orders", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id, token: "tok_abcdefghijk00000000000000000")
    sign_in @user
  end

  describe "GET /index" do
    it "returns http success" do
      get item_orders_path(@item)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "購入に成功する場合" do
      it "有効な情報で購入でき、注文が保存され、ルートパスにリダイレクトされる" do
        expect {
          post item_orders_path(@item), params: { order_address: @order_address.attributes.merge(token: "tok_abcdefghijk00000000000000000") }
        }.to change(Order, :count).by(1).and change(Address, :count).by(1)
        expect(response).to redirect_to(root_path)
      end
    end

    context "購入に失敗する場合" do
      it "無効な情報では購入できず、注文が保存されず、エラーメッセージが表示される" do
        @order_address.postal_code = ''
        expect {
          post item_orders_path(@item), params: { order_address: @order_address.attributes }
        }.to change(Order, :count).by(0).and change(Address, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Postal code can't be blank")
      end
    end
  end
end
