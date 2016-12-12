class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (ot logged in)
        can :manage, User, id: user.id
    end
end
