# TecGram 📷
This is a social media app like instagram for students of ITC
# Table of contents
- [Backend 🖥️](https://github.com/dlowTux/TecGram/tree/backend#backend-%EF%B8%8F)
- [Install](https://github.com/dlowTux/TecGram/tree/backend#install)
  - [Docker (Linux) 🐳](https://github.com/dlowTux/TecGram/tree/backend#docker-linux-)
  - [Development Setup 🐧](https://github.com/dlowTux/TecGram/tree/backend#development-setup-)
    - [Dependencies](https://github.com/dlowTux/TecGram/tree/backend#dependencies)
    - [Local setup 🏘️](https://github.com/dlowTux/TecGram/tree/backend#local-setup-%EF%B8%8F)
    - [Run the server 🏃](https://github.com/dlowTux/TecGram/tree/backend#run-the-server-)
- [How to use it?](https://github.com/dlowTux/TecGram/tree/backend#how-to-use-it)
  - [Sign In ☕](https://github.com/dlowTux/TecGram/tree/backend#sign-in-)
  - [Data required](https://github.com/dlowTux/TecGram/tree/backend#data-required)
    - [Type users](https://github.com/dlowTux/TecGram/tree/backend#type-users)
      - [Student 👧](https://github.com/dlowTux/TecGram/tree/backend#student-)
        - [Careers](https://github.com/dlowTux/TecGram/tree/backend#careers)
      - [Teacher 🧔](https://github.com/dlowTux/TecGram/tree/backend#teacher-)
        - [Deparment](https://github.com/dlowTux/TecGram/tree/backend#deparment)
      - [Office 🏢](https://github.com/dlowTux/TecGram/tree/backend#office-)
  
- [Sign In 📬](https://github.com/dlowTux/TecGram/tree/backend#sign-in--1)
  

  
# Backend 🖥️
This is the backend for the app follow the instructions for set up the aplication or check how to use it?
# Install
You can set up the application using docker (recommended) or manual
## Docker (Linux) 🐳
```
```
## Development Setup 🐧
### Dependencies
```
pip install pyrebase flask
```
### Local setup 🏘️
Add these in your .bashrc , remenber to change the value of variables
```
export apiKey=""
export authDomain=""
export databaseURL=""
export projectId=""
export storageBucket=""
export messagingSenderId=""
export appId=""
export measurementId=""

```
### Run the server 🏃
```
python3 api/app.py
```
# How to use it?
## Sign In ☕
To Sign In you have to make a POST request  http://127.0.0.1:5000/signin only emails with domain cuautla.tecnm.mx are allowed
## Data required
You have to set and email and password for all kind of user
### Type users
There are 3 types of user student, teacher and office which each have data that is required, rol is required for all of them
#### Student 👧
You have to set a name and last name , semester and career is optional
```
{
"email":"example@cuautla.tecnm.mx",
	"password":"pasword",
	"data":{
		"rol":"student",
		"career":"ISC",
		"semester":"number",
		"name":"name",
		"lastname":"lastname"
	}
}
```
#### Careers

| Key                  | Name                                              |
| -------------------- | ---------------------------------                   |
| ISC                  | Ingenieria en Sisemas computacionales               |
| IGE            | Ingenieria en Gestion Empresarial              |
| II            |Ingenieria Industrial            |
| IE               | Ingenieria Electronica               |
| IM               | Ingenieria Mecatronica               |
| CP              | Contador publico           |
| MA              | Maestria Administrativa            |  

#### Teacher 🧔
You have to set a name, last name , deparment
```
{
"email":"example@cuautla.tecnm.mx",
	"password":"pasword",
	"data":{
		"rol":"teacher",
		"deparment":"Sistemas",
		"name":"name",
		"lastname":"lastname"
	}
}

```
#### Deparment
| Key                  | 
| -------------------- | 
| Systemas            | 
| Gestion            |
| Contador               | 
| Mecatronica         |
| Industrial              | 
| Electronica              |
| Basicas              |
#### Office 🏢
```
{
"email":"example@cuautla.tecnm.mx",
	"password":"pasword",
	"data":{
		"rol":"office",
		"deparment":"ISC",
		"name":"name",
		"lastname":"lastname"
	}
}
```
### Return
The server will return a message with a description, your token id will be send as soon as you log in
## Sign In 📬
To login you have to make a POST request  http://127.0.0.1:5000/login with an email and password
```
{
"email":"example@cuautla.tecnm.mx",
"password":"pasword"
}
```
### Return
The server will return your acces token and user data
```
{
"response": {
		"displayName": "",
		"email": "example@cuautla.tecnm.mx",
		"expiresIn": "3600",
		"idToken": "",
		"kind": "",
		"localId": "",
		"refreshToken": "",
		"registered": true
	}
}
```
## Search user by name 🔍
To search an user you have to make a request GET  http://127.0.0.1:5000/searchuser 
## IMPORTANT ⚠️
You must sent your idToken with the name user , if your idToken is expired, you have to refresh it 
```
{
"idToken":"",
"nameuser":""
}
```
#### Result 
It will return a list of users
```
{
"response":[
	{"localId":"","carrer":"","lastname":"","name":"","rol":"","semester":"","career":""},
	{"localId":"","carrer":"","lastname":"","name":"","rol":"","semester":"","career":""}
   ]
}
```
