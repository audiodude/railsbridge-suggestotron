class Topic < ActiveRecord::Base
  has_many :votes, dependent: :destroy

  def upvote
    self.votes.create
  end

  def downvote
    first_vote = self.votes.first
    first_vote.delete if first_vote
  end
end
