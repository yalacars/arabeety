json.extract! car, :id, :model, :year, :mileage, :condition, :damages, :created_at, :updated_at
json.url car_url(car, format: :json)
