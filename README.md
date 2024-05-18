# ToDoMasterSH
ToDoMasterSH is an efficient to-do list manager built as a shell script. Easily create, update, delete, and show task details. List tasks by day, search by title, and mark tasks as done are some of the script's features. Perfect for developers and system admins who prefer working in the terminal directly. 

<div align="center">
  
![generate a logo for the app logo of a ToDoMasterSH which is a todolist manager project i made (3)_prev_ui](https://github.com/NotEmcee/ToDoMasterSH/assets/161209088/b0e7e5da-cf96-401b-b10b-f62f78d3d030)

</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## 🚀 Features 🚀 <br/>
✅ **Create a Task**  <br/>
📝 **Update a Task**  <br/>
❌ **Delete a Task**  <br/>
📄 **Show information about a Task** <br/>
📅 **List tasks of a given day** <br/>
🔍 **Search for a task by title** <br/>
✔️ **Mark a Task as Done** <br/>


## Usage


```bash
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
 # Show this help output        
./todo.sh help
 # Show the help example output            
./todo.sh help ex              
```

## 💻 Installation :

Before you can execute the script you need to install Figlet :
```bach
sudo apt-get install figlet
```

<p align="right">[<a href="#readme-top">back to top</a>]</p>


