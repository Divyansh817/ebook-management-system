# 📚 Ebook Management System (Java Servlet + JSP)

## 🚀 Overview

The **Ebook Management System** is a Java-based web application that allows users to browse, purchase, and manage books online. It follows a classic **MVC architecture using Servlets, JSP, and DAO pattern**, making it a strong beginner-to-intermediate level backend project.

This project simulates a basic e-commerce platform for books with features like cart management, order handling, and admin controls.

---

## 🛠️ Tech Stack

* **Backend:** Java (Servlets, JDBC)
* **Frontend:** JSP, HTML, CSS, Bootstrap
* **Database:** MySQL
* **Build Tool:** Maven
* **Server:** Apache Tomcat

---

## 📂 Project Structure

```
Ebook-App/
│── src/main/java/com/
│   ├── admin/servlet/       # Admin operations (add, edit, delete books)
│   ├── user/servlet/        # User actions (cart, order, etc.)
│   ├── DAO/                 # Data Access Layer
│   ├── DB/                  # Database connection
│   ├── entity/              # Model classes
│
│── src/main/webapp/
│   ├── *.jsp                # UI pages
│   ├── WEB-INF/web.xml      # Configuration
│
│── pom.xml                  # Maven dependencies
```

---

## ✨ Features

* 👤 User Registration & Login
* 📚 Browse Books (New & Old)
* 🛒 Add to Cart & Manage Cart
* 📦 Place Orders
* 🛠️ Admin Panel:

  * Add Books
  * Edit Books
  * Delete Books
* 💾 DAO-based database interaction

---

## ⚠️ Known Issues

* Some modules may **crash due to missing validations or null checks**
* UI is basic and not fully responsive
* No authentication security (password hashing not implemented)
* Error handling is minimal
* Database scripts are not fully automated

---

## 🧑‍💻 How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/ebook-management-system.git
   ```

2. Import into IDE:

   * IntelliJ / Eclipse → Import as **Maven Project**

3. Setup MySQL Database:

   * Create a database (e.g., `ebook_app`)
   * Update DB credentials in:

     ```
     com.DB.DBConnect.java
     ```

4. Configure Tomcat Server

5. Run the project on:

   ```
   http://localhost:8080/Ebook-App
   ```

---

## 📌 Future Improvements

* Add Spring Boot (replace Servlets)
* Implement REST APIs
* Add proper authentication (JWT / hashing)
* Improve UI (React or modern frontend)
* Add payment gateway integration

---

## 📜 License

This project is licensed under the **MIT License**.

---

## 🙌 Acknowledgment

This project was built as a learning project to understand:

* Java Web Development
* MVC Architecture
* DAO Design Pattern
