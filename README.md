<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)


# 📖 Recipes App <a name="about-project"></a>

**Recipes** is a Ruby on Rails website that allows user's authentication and authorization, also the user can add foods
recipes based on these foods, the recipes can be public or private, also edit and delete foods and recipes. Also if
a recipe has more ingredients that there are in the foods pantry, the user can create a shopping list with the 
neccessary foods to buy.
## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **The user should log in with a real email**
- **The food pantry will have severals inventories**


<p align="right">(<a href="#readme-top">back to top</a>)</p>




## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:


Install Git, Node, Ruby, Rails, PostgreSQL, if you have Linux or Mac, you can follow this [tutorial](https://www.theodinproject.com/guides/installations)

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:danifromecuador/recipes.git
  cd recipes
```


### Usage

To run the project, execute the following commands, press enter after each line:
Maybe you'll need to change the DB name and password to your own. (config/database.yml)

```sh
    bundle install
    rails db:drop
    rails db:create
    rails db:migrate
    rails s
```


After that, open a webpage in your favorite web browser at [http://localhost:3000](http://localhost:3000)

### Test

To test this project just enter this command:

```sh
  rspec
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Authors <a name="authors"></a>

👤 **Dani Morillo**

- GitHub: [danielfromecuador](https://github.com/danielfromecuador)
- LinkedIn: [danifromecuador](https://www.linkedin.com/in/danifromecuador)

 👤 **Alexandre Medina**

- GitHub: [gersonhiggins](https://github.com/gersonhiggins)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>


- - **Create pagination or infinite scroll if the lists are too long**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/danifromecuador/recipes/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

If you like this project give me an star on [my GitHub repo](https://github.com/danifromecuador/recipes)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank to [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) for teaching me about Ruby

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
