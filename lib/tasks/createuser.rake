desc "creates a user"
task :create_user, [:email, :password] => :environment do |t, args|
  if args.email.nil? || args.password.nil?
    puts <<-MSG
         Usage:
               rake create_user some@email.com mypassword

         MSG
  else
    user = User.create(email: args.email, password: args.password)
    puts "user #{user.email} created successfully."
  end

end