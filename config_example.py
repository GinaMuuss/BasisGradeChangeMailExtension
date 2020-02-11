class Config:
    user = "user"
    pwd = "pass"
    gradeTables = [{"gradeTableNum":0, "filename":"infoGrades.json", "userFriendlyName": "Informatik"},{"gradeTableNum":1, "filename":"physicsGrades.json", "userFriendlyName": "Physik"}, {"gradeTableNum":2, "filename":"cyberGrades.json", "userFriendlyName": "Cyber Security"}]
    mail = {"from": "parser@example.com", "fromPwd": "password", "to": "to@example.com"}
    smtpServer = "mail.example.com"
    smtpServerPort = 465
