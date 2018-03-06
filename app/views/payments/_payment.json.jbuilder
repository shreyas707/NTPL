json.extract! payment, :id, :amount, :sauda_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
