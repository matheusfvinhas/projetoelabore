Institution.create!(name: 'Elabore', manager: 'Lesle Maciel')

User.create!(email: 'matheusfvinhas@gmail.com', password: '123456', kind: :admin,
             name: 'Matheus', telephone: '(12) 98169-7471', institution_id: 1)
User.create!(email: 'teacher@elabore.org', password: '123456', kind: :teacher,
             name: 'Glaucia', telephone: '(12) 98169-7471', institution_id: 1)
User.create!(email: 'student@elabore.org', password: '123456', kind: :student,
            name: 'Fabio', telephone: '(12) 98169-7471', institution_id: 1)

