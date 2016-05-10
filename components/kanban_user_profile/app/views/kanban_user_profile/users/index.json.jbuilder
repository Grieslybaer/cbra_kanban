json.data @users do |user|
    json.name user.full_name
    json.email user.email
end