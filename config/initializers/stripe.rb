if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ' pk_test_VbEw4XXQBWJUtr89GMi87emv',
    :secret_key => 'sk_test_TfvrmOcKmM08foY7Gq1WMGjI'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]