class Spree::Admin::ActiveShippingSettingsController < Spree::Admin::BaseController

  def edit
    @preferences_UPS = [:ups_login, :ups_password, :ups_key, :shipper_number]
    @preferences_FedEx = [:fedex_login, :fedex_password, :fedex_account, :fedex_key]
    @preferences_USPS = [:usps_login]
    @preferences_CanadaPost = [:canada_post_login]
    @preferences_CanadaPostPws = [:canada_post_pws_userid, :canada_post_pws_password,
      :canada_post_pws_customer_number, :canada_post_pws_contract_number]
    @preferences_GeneralSettings = [:units, :unit_multiplier, :default_weight, :handling_fee, 
      :max_weight_per_package, :test_mode]

    @config = Spree::ActiveShipping::Config
  end

  def update
    config = Spree::ActiveShipping::Config

    params.each do |name, value|
      next unless config.has_preference? name
      config[name] = value
    end

    redirect_to edit_admin_active_shipping_settings_path
  end

end


