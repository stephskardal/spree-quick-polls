module Spree::QuickPolls::BaseControllerExtends
  def self.included(controller)
    controller.append_before_filter :define_poll
    controller.append_before_filter :record_vote
  end

  def define_poll
    # TODO: Change to sort_by created_date later
    @poll = current_user.roles.collect { |r| r.polls }.flatten.sort_by { |p| p.id }.first if current_user && current_user.roles
    @user_poll_option = UserPollOption.new
    if current_user && @poll
      @current_user_vote = current_user.get_user_vote(@poll.id)
    end
  end

  def record_vote
    if params[:user_poll_option]
      @user_poll_option = UserPollOption.new({ :user_id => current_user.id, :ip_address => request.remote_ip, :voted_at => Time.now })
      @user_poll_option.update_attributes(params[:user_poll_option])
      @user_poll_option.save
    end
  end
end