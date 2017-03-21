# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../commonlib/rblib/config'

# Load intial mySociety config
if ENV["RAILS_ENV"] == "test"
  MySociety::Config.set_file(File.join(File.dirname(__FILE__), '..', 'config', 'test'), true)
else
  MySociety::Config.set_file(File.join(File.dirname(__FILE__), '..', 'config', 'general'), true)
end
MySociety::Config.load_default

# Configuration values with defaults

# TODO: Make this return different values depending on the current rails environment

module AlaveteliConfiguration
  if !const_defined?(:DEFAULTS)

    DEFAULTS = {
      :ADMIN_PASSWORD => '',
      :ADMIN_USERNAME => '',
      :ALLOW_BATCH_REQUESTS => false,
      :AUTHORITY_MUST_RESPOND => true,
      :AVAILABLE_LOCALES => '',
      :BLACKHOLE_PREFIX => 'do-not-reply-to-this-address',
      :BLOG_FEED => '',
      :BLOG_TIMEOUT => 60,
      :CACHE_FRAGMENTS => true,
      :CONTACT_EMAIL => 'contact@localhost',
      :CONTACT_NAME => 'Alaveteli',
      :COOKIE_STORE_SESSION_SECRET => 'this default is insecure as code is open source, please override for live sites in config/general; this will do for local development',
      :SECRET_KEY_BASE => 'this default is insecure as code is open source, please override for live sites in config/general; this will do for local development',
      :DEBUG_RECORD_MEMORY => false,
      :DEFAULT_LOCALE => '',
      :DISABLE_EMERGENCY_USER => false,
      :DOMAIN => 'localhost:3000',
      :DONATION_URL => '',
      :ENABLE_ANNOTATIONS => true,
      :ENABLE_ANTI_SPAM => false,
      :ENABLE_TWO_FACTOR_AUTH => false,
      :ENABLE_WIDGETS => false,
      :ENABLE_ALAVETELI_PRO => false,
      :EXCEPTION_NOTIFICATIONS_FROM => 'errors@localhost',
      :EXCEPTION_NOTIFICATIONS_TO => 'user-support@localhost',
      :FORCE_REGISTRATION_ON_NEW_REQUEST => false,
      :FORCE_SSL => true,
      :FORWARD_NONBOUNCE_RESPONSES_TO => 'user-support@localhost',
      :FORWARD_PRO_NONBOUNCE_RESPONSES_TO => 'pro-user-support@localhost',
      :FRONTPAGE_PUBLICBODY_EXAMPLES => '',
      :GA_CODE => '',
      :GAZE_URL => '',
      :GEOIP_DATABASE => '/usr/share/GeoIP/GeoIP.dat',
      :HTML_TO_PDF_COMMAND => '',
      :INCLUDE_DEFAULT_LOCALE_IN_URLS => true,
      :INCOMING_EMAIL_DOMAIN => 'localhost',
      :INCOMING_EMAIL_PREFIX => 'foi+',
      :INCOMING_EMAIL_SECRET => 'dummysecret',
      :INCOMING_EMAIL_SPAM_ACTION => false,
      :INCOMING_EMAIL_SPAM_HEADER => 'X-Spam-Score',
      :INCOMING_EMAIL_SPAM_THRESHOLD => false,
      :ISO_COUNTRY_CODE => 'GB',
      :MINIMUM_REQUESTS_FOR_STATISTICS => 100,
      :MAX_REQUESTS_PER_USER_PER_DAY => 6,
      :MTA_LOG_PATH => '/var/log/exim4/exim-mainlog-*',
      :MTA_LOG_TYPE => 'exim',
      :NEW_REQUEST_RECAPTCHA => false,
      :NEW_RESPONSE_REMINDER_AFTER_DAYS => [3, 10, 24],
      :OVERRIDE_ALL_PUBLIC_BODY_REQUEST_EMAILS => '',
      :PRODUCTION_MAILER_DELIVERY_METHOD => 'sendmail',
      :PUBLIC_BODY_STATISTICS_PAGE => false,
      :PUBLIC_BODY_LIST_FALLBACK_TO_DEFAULT_LOCALE => false,
      :PRO_CONTACT_EMAIL => 'pro-contact@localhost',
      :PRO_CONTACT_NAME => 'Alaveteli Professional',
      :PRO_SITE_NAME => 'Alaveteli Professional',
      :RAW_EMAILS_LOCATION => 'files/raw_emails',
      :READ_ONLY => '',
      :RECAPTCHA_PRIVATE_KEY => 'x',
      :RECAPTCHA_PUBLIC_KEY => 'x',
      :REPLY_LATE_AFTER_DAYS => 20,
      :REPLY_VERY_LATE_AFTER_DAYS => 40,
      :RESPONSIVE_STYLING => true,
      :RESTRICTED_COUNTRIES => '',
      :SITE_NAME => 'Alaveteli',
      :SKIP_ADMIN_AUTH => false,
      :SMTP_MAILER_ADDRESS => 'localhost',
      :SMTP_MAILER_PORT => 25,
      :SMTP_MAILER_DOMAIN => '',
      :SMTP_MAILER_USER_NAME =>  '',
      :SMTP_MAILER_PASSWORD => '',
      :SMTP_MAILER_AUTHENTICATION => 'plain',
      :SMTP_MAILER_ENABLE_STARTTLS_AUTO => true,
      :RESTRICT_NEW_RESPONSES_ON_OLD_REQUESTS_AFTER_MONTHS => 6,
      :SURVEY_URL => '',
      :SEND_SURVEY_MAILS => true,
      :THEME_BRANCH => false,
      :THEME_URL => "",
      :THEME_URLS => [],
      :TIME_ZONE => "UTC",
      :TRACK_SENDER_EMAIL => 'contact@localhost',
      :TRACK_SENDER_NAME => 'Alaveteli',
      :FACEBOOK_USERNAME => '',
      :TWITTER_USERNAME => '',
      :TWITTER_WIDGET_ID => false,
      :USE_DEFAULT_BROWSER_LANGUAGE => true,
      :USE_GHOSTSCRIPT_COMPRESSION => false,
      :USE_MAILCATCHER_IN_DEVELOPMENT => true,
      :UTILITY_SEARCH_PATH => ["/usr/bin", "/usr/local/bin"],
      :VARNISH_HOST => '',
      :WORKING_OR_CALENDAR_DAYS => 'working',
      :USE_BULLET_IN_DEVELOPMENT => false,
      :EXTERNAL_REVIEWERS => ''
    }
  end

  def self.method_missing(name)
    key = name.to_s.upcase
    if DEFAULTS.has_key?(key.to_sym)
      MySociety::Config.get(key, DEFAULTS[key.to_sym])
    else
      super
    end
  end
end
