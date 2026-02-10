require 'rails_helper'

RSpec.describe "Kolosekaicom::Pages", type: :request do
  before do
    host! "kolosekai.com"
  end

  describe "GET / (home)" do
    it "returns http success" do
      get "/"

      expect(response).to have_http_status(:success)
    end

    it "renders the hero section" do
      get "/"

      expect(response.body).to include("We build AI-powered products.")
      expect(response.body).to include("lr-hero")
    end

    it "contains bento cards with service offerings" do
      get "/"

      expect(response.body).to include("Custom AI Agents")
      expect(response.body).to include("LLM Integration")
      expect(response.body).to include("Rapid Prototyping")
      expect(response.body).to include("Workflow Automation")
      expect(response.body).to include("Full-Stack Development")
    end

    it "contains pricing cards" do
      get "/"

      expect(response.body).to include("Discovery Sprint")
      expect(response.body).to include("Project-Based")
      expect(response.body).to include("Dedicated Team")
      expect(response.body).to include("Enterprise")
    end

    it "contains metric cards" do
      get "/"

      expect(response.body).to include("3x faster delivery")
      expect(response.body).to include("50+ AI projects shipped")
    end

    it "contains FAQ section" do
      get "/"

      expect(response.body).to include("What kind of AI projects do you build?")
      expect(response.body).to include("How do we get started?")
    end

    it "renders the layout with navigation and footer" do
      get "/"

      expect(response.body).to include("Kolosek AI - Native AI Agency")
      expect(response.body).to include("kolosekaicom.css")
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/about"

      expect(response).to have_http_status(:success)
    end

    it "renders the about hero" do
      get "/about"

      expect(response.body).to include("We are")
      expect(response.body).to include("Kolosek")
    end

    it "contains company stats" do
      get "/about"

      expect(response.body).to include("15+")
      expect(response.body).to include("Years of experience")
      expect(response.body).to include("200+")
      expect(response.body).to include("Projects shipped")
    end

    it "contains the company story timeline" do
      get "/about"

      expect(response.body).to include("2011")
      expect(response.body).to include("Founded as a Rails consultancy")
      expect(response.body).to include("2023")
      expect(response.body).to include("Pivoted to AI-native development")
    end

    it "contains team values" do
      get "/about"

      expect(response.body).to include("Deep AI Expertise")
      expect(response.body).to include("Full-Stack Builders")
      expect(response.body).to include("Direct Communication")
    end
  end

  describe "GET /featured" do
    it "returns http success" do
      get "/featured"

      expect(response).to have_http_status(:success)
    end

    it "renders the featured projects hero" do
      get "/featured"

      expect(response.body).to include("Featured")
      expect(response.body).to include("Projects")
    end

    it "contains own products" do
      get "/featured"

      expect(response.body).to include("LiteTracker")
      expect(response.body).to include("Ruby.ci")
    end

    it "contains client projects" do
      get "/featured"

      expect(response.body).to include("MoviePilot")
      expect(response.body).to include("Squire")
      expect(response.body).to include("Boardspan")
      expect(response.body).to include("WRAP")
      expect(response.body).to include("O.school")
      expect(response.body).to include("Simone LeBlanc")
    end
  end

  describe "GET /contact" do
    it "returns http success" do
      get "/contact"

      expect(response).to have_http_status(:success)
    end

    it "renders the contact hero" do
      get "/contact"

      expect(response.body).to include("intelligent together")
    end

    it "contains contact information" do
      get "/contact"

      expect(response.body).to include("Schedule a call")
      expect(response.body).to include("Email us")
      expect(response.body).to include("hello@kolosek.com")
    end

    it "contains the embedded contact form" do
      get "/contact"

      expect(response.body).to include("contact-form-uqybag")
    end
  end

  describe "GET /process" do
    it "returns http success" do
      get "/process"

      expect(response).to have_http_status(:success)
    end

    it "renders the process hero" do
      get "/process"

      expect(response.body).to include("Our")
      expect(response.body).to include("Process")
    end

    it "contains the five process steps" do
      get "/process"

      expect(response.body).to include("Discovery & AI Strategy")
      expect(response.body).to include("Design & Architecture")
      expect(response.body).to include("AI-Native Development")
      expect(response.body).to include("Deploy & Scale")
      expect(response.body).to include("Iterate & Optimize")
    end

    it "contains the differentiators section" do
      get "/process"

      expect(response.body).to include("AI at Every Step")
      expect(response.body).to include("Direct Communication")
      expect(response.body).to include("Full Transparency")
    end

    it "contains the tools section" do
      get "/process"

      expect(response.body).to include("Tools that power")
      expect(response.body).to include("Design")
      expect(response.body).to include("Development")
      expect(response.body).to include("Infrastructure")
    end
  end

  describe "GET /code-review" do
    it "returns http success" do
      get "/code-review"

      expect(response).to have_http_status(:success)
    end

    it "renders the code review hero" do
      get "/code-review"

      expect(response.body).to include("AI-Powered")
      expect(response.body).to include("Code Review")
    end

    it "contains the three-step process" do
      get "/code-review"

      expect(response.body).to include("Submit your code")
      expect(response.body).to include("We review it")
      expect(response.body).to include("Walk through together")
    end

    it "contains review categories" do
      get "/code-review"

      expect(response.body).to include("Code Quality")
      expect(response.body).to include("Maintainability")
      expect(response.body).to include("Architecture")
      expect(response.body).to include("Performance")
      expect(response.body).to include("Security")
      expect(response.body).to include("Test Coverage")
    end

    it "contains the why-free section" do
      get "/code-review"

      expect(response.body).to include("We believe great code")
      expect(response.body).to include("No strings attached")
    end
  end
end
