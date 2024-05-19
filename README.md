# ToDoMasterSH 
ToDoMasterSH is an efficient to-do list manager built as a shell script. Easily create, update, delete, and show task details. List tasks by day, search by title, and mark tasks as done are some of the script's features. Perfect for developers and system admins who prefer working in the terminal directly. 

<div align="center">

[![Outlook](https://img.shields.io/badge/Microsoft_Outlook-0078D4?style=for-the-badge&logo=microsoft-outlook&logoColor=white)](mailto:fadi.bahtat@uir.ac.ma) 
[![Outlook](https://img.shields.io/badge/Microsoft_Outlook-0078D4?style=for-the-badge&logo=microsoft-outlook&logoColor=white)](mailto:saad.benmoussa@uir.ac.ma) 
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

</div>

<div align="center">
  
  ![generate a logo for the app logo of a ToDoMasterSH which is a todolist manager project i made (3)_prev_ui](https://github.com/NotEmcee/ToDoMasterSH/assets/161209088/c91da679-8f7f-4e4b-b250-13669b69d452)


</div>

<details>
  <summary><h2> Table of Contents </h2></summary>
  <ul>
    <li><a href="#about-the-project">ℹ About The Project</a></li>
    <li><a href="#features">🚀 Features</a></li>
    <li><a href="#prerequisites">📋 Prerequisites</a></li>
    <li><a href="#installation">💻 Installation</a></li>
    <li><a href="#usage">📖 Usage</a></li>
  </ul>
</details>




<h2 id="about-the-project"> ℹ About The Project </h2>

ToDoMasterSH is designed for those who love working in the terminal. It's a lightweight and efficient to-do list manager that helps you keep track of your tasks with ease.



<h2 id="features"> 🚀 Features </h2>

✅ **Create a Task**  <br/>
📝 **Update a Task**  <br/>
❌ **Delete a Task**  <br/>
📄 **Show information about a Task** <br/>
📅 **List tasks of a given day** <br/>
🔍 **Search for a task by title** <br/>
✔️ **Mark a Task as Done** <br/><br/>

<div align="right">
  
  [🔼 **Back to top**](#ToDoMasterSH)
  
  </div>

  <h2 id="prerequisites"> 📋 Prerequisites </h2>

Before you can execute the script, you need to have the following installed:
- `bash`
- `figlet` (Install using the command below)

<h2 id="installation"> 💻 Installation </h2>

Before you can execute the script you need to install Figlet :
```bach
sudo apt-get install figlet
```

<div align="right">
  
  [🔼 **Back to top**](#ToDoMasterSH)
  
  </div>


<h2 id="usage"> 📖 Usage </h2>


```bash
 # Show this help output        
./todo.sh help
 # Show the help example output            
./todo.sh help ex  
# It gives a list of todo tasks
./todo.sh
 # Create a new task
./todo.sh create
# Create a n number of new tasks               
./todo.sh create n
# It gives the list of Tasks That can be updated             
./todo.sh update
# Update the information given in the ID numbered n                 
./todo.sh update n
# Update the information given in the ID n and in a given type m(1-3)          
./todo.sh update n m
# It gives the list of Tasks That can be deleted          
./todo.sh delete
# delete the task that in the ID numbered n               
./todo.sh delete n
# delete the information given in the ID n and in a given type m            
./todo.sh delete n m
# It gives a list of all the todo tasks            
./todo.sh list
# It gives a task with the id n from the list of todo tasks               
./todo.sh list n
# It gives a task with the given date n             
./todo.sh list date n
# It gives a task with the given day n       
./todo.sh list day n
 # It gives a list of all done todo tasks
./todo.sh list done
# It gives a list of all not done todo tasks
./todo.sh list notdone
 # It gives a list of the not done listes          
./todo.sh done
 # Mark a task as done by its ID                 
./todo.sh done n
 # It gives the tasks with the given title n             
./todo.sh search n
            
```



<div align="right">
  
  [🔼 **Back to top**](#ToDoMasterSH)
  
  </div>


