require 'rails_helper'

RSpec.describe "Registrations", type: :request do
    describe "POST /users" do
        context "with valid sign up credentials" do
            it "returns success" do
                post "/users", params: {user: {email: "adam@adam.com", password: "thisisapassword"}}

                expect(response.status).to eq(200)
                expect(response.body).to eq("{\"message\":\"Signed up.\"}")
            end
        end

        context "with invalid sign up credentials" do
            it "returns failure" do
                post "/users", params: {bad: "data"}

                expect(response.status).to eq(200)
                expect(response.body).to eq("{\"message\":\"Sign up failure. Email can't be blank and Password can't be blank\"}")
            end
        end
    end
end