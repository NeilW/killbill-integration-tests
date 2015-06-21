$LOAD_PATH.unshift File.expand_path('../../..', __FILE__)

require 'test_base'
require 'mini-smtp-server'

module KillBillIntegrationTests

  class TestWithWeaponsHire < Base

    def setup
      setup_base
      # Create account
      @account = create_account(@user, @options)
    end

    def teardown
      teardown_base
    end

    def test_simple

      bp = create_entitlement_base(@account.account_id, 'Pistol', 'MONTHLY', 'DEFAULT', @user, @options)
      check_entitlement(bp, 'Pistol', 'BASE', 'MONTHLY', 'DEFAULT', DEFAULT_KB_INIT_DATE, nil)
      wait_for_expected_clause(1, @account, @options, &@proc_account_invoices_nb)

    end

  end
end
