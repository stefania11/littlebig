require 'test_helper'

class PromptTest < ActiveSupport::TestCase
  test "prompt knows its responders" do
    bob = User.create(email: "bob@example.com", password: "password", username: "BobbyBob")
    responder = User.create(email: "responder@example.com", password: "password", username: "responder")
    non_responder = User.create(email: "non_responder@example.com", password: "password", username: "non_responder")
    prompt = Prompt.create(body: "I'm a prompt", user: bob)
    prompt.responses.create(user: responder, body: "I'm a response")
    prompt.reload

    assert prompt.responders.include?(responder), prompt.responders.to_a
    refute prompt.responders.include?(non_responder), prompt.responders.to_a
    refute prompt.responders.include?(bob), prompt.responders.to_a
  end
end
