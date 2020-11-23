require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe '#create' do
    before do
      @machine = FactoryBot.build(:machine)
    end

    describe 'マシンを登録する' do
      context 'マシンを登録できる場合' do
        it 'マシン画像、マシン名、マシン説明があれば登録できる' do
          expect(@machine).to be_valid
        end
      end

      context 'マシンを登録できない場合' do
        it 'imageが空の場合商品を出品できない' do
          @machine.image = nil
          @machine.valid?
          expect(@machine.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空の場合商品を出品できない' do
          @machine.name = nil
          @machine.valid?
          expect(@machine.errors.full_messages).to include("Name can't be blank")
        end

        it 'detailが空の場合商品を出品できない' do
          @machine.detail = nil
          @machine.valid?
          expect(@machine.errors.full_messages).to include("Detail can't be blank")
        end
      end
    end
  end
end
