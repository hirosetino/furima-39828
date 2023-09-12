require 'rails_helper'

RSpec.describe HistoryOrder, type: :model do
  before do
    @history_order = FactoryBot.build(:history_order)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
        it '' do
        end
    end

    context '商品購入できない場合' do
    end
  end
end
