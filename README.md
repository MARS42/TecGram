# TecGram 📷
This is a social media app like instagram for students of ITC
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
