# Halo 👋 , Ini web service saya!

Saya membuat web service ini dengan menggunakan Node.js dan databasenya menggunakan MySQL

### Tools:

<p>
VS Code
HeidisSQL
xampp
postman

<strong>Cara instalasi</strong></br>
 - 🔭 npm install </br>

<strong>Untuk menjalankan web service</strong></br>
 - 🔭 node server.js </br>

 <strong>Endpoint untuk register</strong></br>
 curl --location --request POST 'localhost:8080/api/auth/signup' \
--header 'Content-Type: application/json' \
--data-raw '{
    "username":"adhi2",
    "email":"adhi2@adhi.com",
    "password":"123456789",
    "roles":["chief","admin"]
}'
</br>

<strong>Response</strong></br>
{
    "username":"adhi2",
    "email":"adhi2@adhi.com",
    "password":"123456789",
    "roles":["chief","admin"]
}

<strong>Endpointnya untuk login</strong>
curl --location --request POST 'localhost:8080/api/auth/signin' \
--header 'Content-Type: application/json' \
--data-raw '{
"username":"adhi",
"password":"123456789"
}'

<strong>Response</strong>
{
"id": 4,
"username": "adhi",
"email": "adhi@adhi.com",
"roles": [
"ROLE_USER",
"ROLE_CHIEF"
],
"accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjQ3MjM5NzM5LCJleHAiOjE2NDczMjYxMzl9.Azz7jojEkmG2u_eo-13g5ykvWwEqupvU1DGSo_kZbtE"
}

<strong>Endpoint untu logout</strong>
curl --location --request PUT 'localhost:8080/api/auth/logout' \
--header 'x-access-token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjQ3MjQyMTM5LCJleHAiOjE2NDczMjg1Mzl9.JGtSPZclFdFWsDLupw3opid4gd5pSLGTuP3uZ5tDz'

<strong>Response</strong>
{
"message": "You have been Logged Out"
}

<strong>Endpoint aksi penambahan saldo</strong> </br>

curl --location --request POST 'localhost:8080/api/test/setbalance' \
--header 'x-access-token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjQ3MjU0MzM2LCJleHAiOjE2NDczNDA3MzZ9.hOht3QXAKol7H-Mke76Z0l7lBIId6TM9XtObphN5kME' \
--header 'Content-Type: application/json' \
--data-raw '{
    "balance": 50000,
    "activity": "Deposit",
    "type": "debit",
    "ip": "127.0.0.1",
    "location": "magelang",
    "author": "adhi"
}'

</br>

<strong>Response</strong>
{
    "message": "User balance inserted successfully!"
}

