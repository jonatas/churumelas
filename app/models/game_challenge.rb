class GameChallenge < ActiveRecord::Base
  belongs_to :game
  belongs_to :challenge
  attr_accessible :pass_level_at, :start_typing_at, :started_at, :submit_first_time_at, :user_answer
  def pass_with! answer 
    if not challenge.submit_first_time_at 
      self.submit_first_time_at = Time.now
    end
    can_pass = self.challenge.valid_answer? answer
    if can_pass
      self.pass_level_at = Time.now
    end
    self.save if changed?
    return can_pass
  end
end
