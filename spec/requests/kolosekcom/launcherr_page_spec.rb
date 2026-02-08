require 'rails_helper'

RSpec.describe "Kolosekcom::LauncherrPage", type: :request do
  before do
    host! "kolosek.com"
  end

  describe "GET /launcherr" do
    it "returns http success" do
      get "/launcherr"

      expect(response).to have_http_status(:success)
    end

    it "renders the launcherr layout with favicon" do
      get "/launcherr"

      expect(response.body).to include('favicon')
      expect(response.body).to include('Kolosek - Native AI Agency')
    end

    it "contains hero section with stagger animation classes" do
      get "/launcherr"

      expect(response.body).to include('lr-hero')
      expect(response.body).to include('lr-fade-in')
      expect(response.body).to include('We build AI-powered products.')
      expect(response.body).to include('lr-hero-collage')
    end

    it "contains staggered card reveal classes on sections" do
      get "/launcherr"

      expect(response.body).to include('lr-stagger')
      expect(response.body).to include('lr-stagger-item')
    end

    it "contains bento cards with hover lift classes" do
      get "/launcherr"

      expect(response.body).to include('lr-bento')
      expect(response.body).to include('lr-bento-card lr-stagger-item')
      expect(response.body).to include('Custom AI Agents')
      expect(response.body).to include('LLM Integration')
      expect(response.body).to include('Rapid Prototyping')
      expect(response.body).to include('Workflow Automation')
      expect(response.body).to include('Full-Stack Development')
    end

    it "contains pricing cards with stagger items" do
      get "/launcherr"

      expect(response.body).to include('lr-pricing-card lr-stagger-item')
      expect(response.body).to include('lr-pricing-card lr-pricing-card-featured lr-stagger-item')
      expect(response.body).to include('Discovery Sprint')
      expect(response.body).to include('Project-Based')
      expect(response.body).to include('Dedicated Team')
      expect(response.body).to include('Enterprise')
    end

    it "contains metric cards with stagger items" do
      get "/launcherr"

      expect(response.body).to include('lr-metric-card lr-stagger-item')
      expect(response.body).to include('3x faster delivery')
      expect(response.body).to include('50+ AI projects shipped')
    end

    it "contains blog section with image zoom" do
      get "/launcherr"

      expect(response.body).to include('lr-blog-card')
      expect(response.body).to include('lr-blog-small')
      expect(response.body).to include('Building Production-Ready AI Agents')
    end

    it "contains FAQ accordion section" do
      get "/launcherr"

      expect(response.body).to include('lr-faq-list lr-stagger')
      expect(response.body).to include('lr-faq-item lr-stagger-item')
      expect(response.body).to include('What kind of AI projects do you build?')
      expect(response.body).to include('What technologies and AI models do you work with?')
      expect(response.body).to include('How long does a typical project take?')
      expect(response.body).to include('Will we own the code and IP?')
      expect(response.body).to include('How do we get started?')
    end

    it "contains correct navigation links to Kolosek pages" do
      get "/launcherr"

      expect(response.body).to include('href="/about"')
      expect(response.body).to include('href="/featured"')
      expect(response.body).to include('href="/blog"')
      expect(response.body).to include('href="/contact"')
      expect(response.body).to include('href="https://poslovi.kolosek.com"')
    end

    it "contains responsive meta tag and stylesheet" do
      get "/launcherr"

      expect(response.body).to include('width=device-width, initial-scale=1')
      expect(response.body).to include('launcherr.css')
    end

    it "contains IntersectionObserver for scroll animations" do
      get "/launcherr"

      expect(response.body).to include('IntersectionObserver')
      expect(response.body).to include("lr-fade-in")
      expect(response.body).to include("lr-stagger")
      expect(response.body).to include("lr-visible")
    end

    it "contains collage with hover scale effect" do
      get "/launcherr"

      expect(response.body).to include('lr-collage-item lr-collage-1')
      expect(response.body).to include('lr-collage-item lr-collage-7')
    end
  end
end
