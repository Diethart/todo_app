require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET index' do
    let(:item) { create(:item) }

    before do
      get :index
    end

    it 'renders template' do
      expect(response).to render_template :index
    end

    it 'assigns @items' do
      expect(assigns(:items)).to eq([item])
    end
  end

  describe 'GET new' do
    before do
      get :new
    end

    it 'renders template' do
      expect(response).to render_template :new
    end

    it 'assings @item' do
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe 'GET show' do
    let(:item) { create(:item) }

    before do
      get :show, params: { id: item.id }
    end

    it 'renders template' do
      expect(response).to render_template :show
    end

    it 'assigns @item' do
      expect(assigns(:item)).to eq(item)
    end
  end

  describe 'GET edit' do
    let(:item) { FactoryBot.create(:item) }

    before do
      get :edit, params: { id: item.id }
    end

    it 'renders template' do
      expect(response).to render_template :edit
    end

    it 'assigns @item' do
      expect(assigns(:item)).to eq(item)
    end
  end

  describe 'PUT update' do
    context 'valid update' do
      let(:item) { create(:item) }

      before do
        put :update, params: { id: item.id, item: { task: 'Some new task' } }
      end

      it 'assigns @item' do
        expect(assigns(:item)).to eq(item)
      end

      it 'update existing item' do
        item.reload

        expect(item.task).to eq('Some new task')
      end

      it 'redirect to item page' do
        expect(response).to redirect_to(item_path(item))
      end
    end

    context 'invalid data' do
      let(:item) { create(:item) }

      it 'render edit template' do
        put :update, params: { id: item.id, item: { task: '' } }

        expect(response).to redirect_to edit_item_path(item)
      end
    end
  end

  describe 'DELETE destroy' do
    let(:item) { create(:item) }
    let(:second_item) { create(:item) }

    before do
      delete :destroy, params: { id: item.id }
    end

    it 'assigns @item' do
      expect(assigns(:item)).to eq(item)
    end

    it 'destroys item' do
      expect(Item.all).to eq([second_item])
    end

    it 'redirects to index' do
      expect(response).to redirect_to(items_path)
    end
  end

  describe 'POST create' do
    it 'create an item' do
      item_attr = { task: 'some task' }

      post :create, params: { item: item_attr }

      expect(Item.last.task).to eq(item_attr[:task])
    end

    it 'redirect to new item page and fails to create an item' do
      post :create, params: { item: { task: '' }}

      expect(response).to redirect_to(new_item_path)
    end
  end
end
