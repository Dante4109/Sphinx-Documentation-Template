# Sphinx Documentation Template
Sphinx developer documentation template. Use this to create user/developer documentation for new projects. 
Documentation is hosted as a static site using the python recommended read the docs theme. 

### Dependencies needed for setup. 

- python >= 3.12
- virtutalenv >= 20.x.x
- MAKE for windows or OS equivalent.

### Getting started 

1. Create a new respository using this repository as a starting template.
2. Create a new project folder on your local device. 
3. Create a new local git respository. Run the command `git init` in the root of the project folder. 
4. Link this repo in your terminal. Run the command `git remote add "origin" git@github.com:<User>/<UserRepo>.git`
5. Create a python virtual environment. Run the command `mkvirutalenv <your_env_name>`
6. Install python dependencies. Run the command `pip install -r requirements.txt`
7. Create a new first time build of the static documentation site. Run the command `make build` or `.\make build` if you are using powershell. 
8. Run the dev server using the make file command `make server` or `.\make server` if you are using powershell.
9. A local host url should appear. Click and make sure the site loads in the broweser correctly. If successful you should see the following. 

### MAKE Commands:

**help**:

- Displays all available commands available in the make file. 

build:

- Generates a new build folder containing a development copy of the sphinx documentation static site. This is needed for the live server to work. 

clean:

- Removes the build folder from the local project folder. Useful before running the build command when updating the site. 

publish:

- Removes the build folder from the local project folder.
- Generates a new build folder with the local project files. 
- Generates a docs folder with a producton ready copy of the static site. 

  _note: The docs folder where you want to point your hosting platform of choice. _

server:
 - Run the python live server via localhost. While the server is running, changes made to the source code can be seen instantly by refreshing the page. 
   
