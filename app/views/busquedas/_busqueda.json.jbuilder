json.extract! busqueda, :id, :tipo, :categoria, :texto, :email, :created_at, :updated_at
json.url busqueda_url(busqueda, format: :json)
