require 'rails_helper'

RSpec.describe PlatformsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns all platforms" do
      ps3 = create(:platform)
      get :index
      expect(assigns(:platforms)).to eq([ ps3 ])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      platform = create(:platform, slug: "ps3")
      get :show, params: { slug: "ps3" }
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested platform" do
      platform = create(:platform, slug: "ps3")
      get :show, params: { slug: "ps3" }
      expect(assigns(:platform)).to eq(platform)
    end

    it "assigns platform exploits" do
      platform = create(:platform, slug: "ps3")
      exploit = create(:exploit, platform: platform)
      get :show, params: { slug: "ps3" }
      expect(assigns(:exploits)).to eq([ exploit ])
    end

    it "raises error for non-existent slug" do
      expect {
        get :show, params: { slug: "nonexistent" }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns new platform" do
      get :new
      expect(assigns(:platform)).to be_a_new(Platform)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new platform" do
        expect {
          post :create, params: { platform: attributes_for(:platform) }
        }.to change(Platform, :count).by(1)
      end

      it "redirects to the created platform" do
        post :create, params: { platform: attributes_for(:platform) }
        expect(response).to redirect_to(platform_path(slug: Platform.last.slug))
      end
    end

    context "with invalid params" do
      it "does not create a platform" do
        expect {
          post :create, params: { platform: { name: "" } }
        }.not_to change(Platform, :count)
      end

      it "renders new template" do
        post :create, params: { platform: { name: "" } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      platform = create(:platform)
      get :edit, params: { slug: platform.slug }
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested platform" do
      platform = create(:platform)
      get :edit, params: { slug: platform.slug }
      expect(assigns(:platform)).to eq(platform)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates the platform" do
        platform = create(:platform, name: "PS3")
        patch :update, params: { slug: platform.slug, platform: { name: "PlayStation 3" } }
        platform.reload
        expect(platform.name).to eq("PlayStation 3")
      end

      it "redirects to the platform" do
        platform = create(:platform, slug: "ps3")
        patch :update, params: { slug: platform.slug, platform: { name: "PlayStation 3" } }
        expect(response).to redirect_to(platform_path(slug: "ps3"))
      end
    end

    context "with invalid params" do
      it "does not update the platform" do
        platform = create(:platform, name: "PS3")
        patch :update, params: { slug: platform.slug, platform: { name: "" } }
        platform.reload
        expect(platform.name).to eq("PS3")
      end

      it "renders edit template" do
        platform = create(:platform)
        patch :update, params: { slug: platform.slug, platform: { name: "" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the platform" do
      platform = create(:platform)
      expect {
        delete :destroy, params: { slug: platform.slug }
      }.to change(Platform, :count).by(-1)
    end

    it "redirects to platforms index" do
      platform = create(:platform)
      delete :destroy, params: { slug: platform.slug }
      expect(response).to redirect_to(platforms_path)
    end
  end
end
