if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
if (u3 = User.find_by_email('admin')).nil?
  u3 = User.create!(password: 'admin', password_confirmation: 'admin',
    email: 'admin')
  u3.activate!
end
r1, r2, r3 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)
ru3 = RoleUser.create(role: r1, user: u3)
