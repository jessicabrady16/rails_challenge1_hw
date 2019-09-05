require 'challenge_balance'

class Challenge1Controller < ApplicationController

  def index
    challenge_result = ChallengeBalance.balanced?('()')
    render plain: "is balanced  #{challenge_result}"
  end
end
