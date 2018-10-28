module GrantingEngineHelper
  def get_adjustment_grants_link(active)
    get_grants_link('Adjustment Grants', 'adjustment_grants', active)
  end

  def get_periodic_grants_link(active)
    get_grants_link('Periodic Grants', 'periodic_grants', active)
  end

  def get_bounty_grants_link(active)
    get_grants_link('Bounty Grants', 'bounties', active)
  end

  def get_grants_link(title, link, active)
    link_to title, link, :class => "btn btn-default #{active ? 'active' : ''}"
  end
end
