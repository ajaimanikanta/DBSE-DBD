# 🍽️ DineUp — Food & Beverage Mobile App for Diner Self-Service

**DineUp** is a self-service food and beverage ordering platform designed to connect **Customers, Restaurants, and Administrators** through a centralized cloud-based system.

Customers can browse restaurants, select a branch and table, view the digital menu, add dishes to a cart, place orders, and track their order status.

Restaurants can manage their restaurant information, branches, menu items, dish availability, images, and incoming orders.

Administrators can manage platform-level customer, restaurant, and order information.

---

## 🌐 Live Websites

### 👤 Customer Website

https://dineup-19ff8.web.app/customer/

### 🍴 Restaurant Website

https://dineup-19ff8.web.app/restaurant/

### 🛠️ Admin Website

https://dineup-19ff8.web.app/admin/

### ⚙️ Backend API

https://dineup-backend.onrender.com/api/health

---

## 📌 Project Information

| Details           | Information                                                                  |
| ----------------- | ---------------------------------------------------------------------------- |
| **Project Title** | Food and Beverage Mobile App for Diner Self-Service                          |
| **Team ID**       | 21                                                                           |
| **Section**       | 7                                                                            |
| **Course**        | Database Systems Engineering and Distributed Backend Development (25CS1302E) |
| **Campus**        | KLH Bachupally Campus                                                        |
| **Department**    | Computer Science and Engineering                                             |
| **Academic Year** | PBL 2026–27                                                                  |
| **Guide**         | Dr. Spandana                                                                 |

### Team Members

* **Ajai Manikanta** — 2520030320
* **Akshith** — 2520030041
* **Teja** — 2520030569

---

# 🎯 Abstract

Traditional restaurant ordering often depends on manual communication between customers and restaurant staff. This can result in waiting time, order-entry mistakes, and limited visibility of order progress.

**DineUp** provides a digital self-service ordering workflow where customers can browse restaurants, select branches and tables, view available dishes, add items to a cart, place orders, and track order status.

The platform also provides restaurant and administration interfaces for centralized management.

The system uses a **Node.js and Express.js REST backend**, **TiDB Cloud MySQL-compatible database**, and **Firebase Hosting** for the web interfaces.

---

# 🚨 Problem Statement

Traditional table ordering systems can involve:

* Waiting for restaurant staff
* Manual order taking
* Order-entry mistakes
* Physical menus
* Limited order-status visibility
* Difficulty managing multiple restaurant branches
* Separate or manual records for customers and orders

DineUp addresses these problems through a centralized digital ordering and management system.

---

# 🎯 Objectives

The main objectives of DineUp are:

1. Provide self-service ordering directly from the customer's table.
2. Allow customers to browse restaurants and digital menus.
3. Allow customers to select a branch and table.
4. Provide cart and order-management functionality.
5. Allow restaurants to manage branches and menu items.
6. Allow restaurants to update dish availability and images.
7. Allow restaurants to receive and manage customer orders.
8. Provide centralized administration.
9. Store customer, restaurant, menu, and order data in a relational database.
10. Provide communication between frontend applications and backend services through REST APIs.

---

# 🏗️ System Architecture

```text
                    ┌──────────────────────┐
                    │      CUSTOMER       │
                    │  Web / Android APK  │
                    └──────────┬───────────┘
                               │
                               │ REST API
                               ▼
┌──────────────────────┐   ┌──────────────────────┐
│     RESTAURANT       │──►│   NODE.JS + EXPRESS  │
│        WEB           │   │      BACKEND API     │
└──────────────────────┘   └──────────┬───────────┘
                                      │
┌──────────────────────┐              │
│        ADMIN         │──────────────┘
│        WEB           │
└──────────────────────┘
                                      │
                                      ▼
                         ┌──────────────────────┐
                         │     TiDB CLOUD       │
                         │  MySQL-Compatible DB │
                         └──────────────────────┘
```

### Deployment

```text
Firebase Hosting
      │
      ├── Customer Website
      ├── Restaurant Website
      └── Admin Website

              │
              ▼

Render
      │
      └── Node.js + Express Backend

              │
              ▼

TiDB Cloud
      │
      └── Relational Database
```

---

# 👤 Customer Module

The Customer interface provides:

* Customer authentication
* Restaurant browsing
* Restaurant branch selection
* Table selection
* Digital menu browsing
* Dish images
* Dish prices
* Availability information
* Add to cart
* Cart management
* Order placement
* Order status tracking
* Customer profile information
* Order history

### Customer Flow

```text
Login
  ↓
Browse Restaurants
  ↓
Select Restaurant
  ↓
Select Branch
  ↓
Select Table
  ↓
Browse Menu
  ↓
Add Dishes to Cart
  ↓
Review Cart
  ↓
Place Order
  ↓
Track Order Status
```

---

# 🍴 Restaurant Module

The Restaurant interface allows restaurants to manage their own information and orders.

### Features

* Restaurant profile management
* Restaurant image management
* Branch management
* Branch images
* Menu management
* Dish images
* Dish descriptions
* Dish prices
* Dish availability
* Incoming order management
* Order status updates
* Order deletion

### Restaurant Flow

```text
Restaurant Login
       ↓
Restaurant Dashboard
       ↓
Manage Profile / Branches
       ↓
Manage Menu Items
       ↓
Set Availability
       ↓
Receive Customer Orders
       ↓
Update Order Status
```

---

# 🛠️ Admin Module

The Admin interface provides centralized platform management.

### Features

* Manage restaurants
* Manage customers
* View customer information
* Manage customer accounts
* View orders
* Delete customer records
* Delete orders
* Manage restaurant information
* Monitor platform data

The Admin module is intended for platform-level management rather than individual restaurant operations.

---

# 🗄️ Database Design

DineUp uses **TiDB Cloud**, which provides a MySQL-compatible relational database.

### Main Entities

```text
CUSTOMERS
RESTAURANTS
BRANCHES
MENU_ITEMS
ORDERS
ORDER_ITEMS
```

### CUSTOMERS

```text
customer_id      PK
name
email
phone
photo_url
```

### RESTAURANTS

```text
restaurant_id    PK
name
email
phone
address
status
```

### BRANCHES

```text
branch_id        PK
restaurant_id    FK
branch_name
address
table_count
open_status
image_url
```

### MENU_ITEMS

```text
menu_item_id     PK
restaurant_id    FK
name
description
price
available
image_url
```

### ORDERS

```text
order_id         PK
customer_id      FK
restaurant_id    FK
branch_id        FK
table_number
total_amount
status
payment_method
payment_status
```

### ORDER_ITEMS

```text
order_item_id    PK
order_id         FK
menu_item_id     FK
quantity
price
```

---

# 🔗 Database Relationships

```text
CUSTOMERS
    │
    │ 1:N
    ▼
 ORDERS
    │
    │ 1:N
    ▼
ORDER_ITEMS
    ▲
    │ N:1
    │
MENU_ITEMS


RESTAURANTS
    │
    ├──── 1:N ────► BRANCHES
    │
    ├──── 1:N ────► MENU_ITEMS
    │
    └──── 1:N ────► ORDERS

BRANCHES
    │
    └──── 1:N ────► ORDERS
```

---

# ⚙️ Backend

The DineUp backend acts as the central communication layer between the Customer, Restaurant, and Admin interfaces.

### Backend Technologies

* Node.js
* Express.js
* REST APIs
* MySQL/TiDB-compatible SQL
* JWT authentication
* bcryptjs
* CORS
* Multer
* JSON
* Environment variables

### Backend Responsibilities

The backend handles:

* Authentication
* Authorization
* Customer management
* Restaurant management
* Branch management
* Menu management
* Image uploads
* Cart/order processing
* Order status updates
* Database operations
* API validation
* Communication between frontend and database

---

# 📡 REST API

The frontend communicates with the backend using HTTP REST APIs.

Common operations include:

```text
GET     → Retrieve data
POST    → Create data
PUT     → Update data
DELETE  → Delete data
```

Example workflow:

```text
Customer
   │
   │ POST Order
   ▼
Express REST API
   │
   │ Validate request
   ▼
Business Logic
   │
   ▼
TiDB Cloud
   │
   ▼
Order Created
   │
   ▼
Customer / Restaurant
```

---

# 🖼️ Image Management

Restaurants can upload:

* Restaurant images
* Branch images
* Dish images

The backend processes the uploaded images and stores the corresponding image URLs in the database.

The Customer interface then retrieves these image URLs and displays the restaurant, branch, and dish images.

```text
Restaurant Dashboard
        ↓
Image Upload
        ↓
Node.js / Express
        ↓
Backend Image Storage
        ↓
Image URL
        ↓
TiDB Cloud
        ↓
Customer Website
```

---

# 🔐 Authentication

DineUp uses authentication mechanisms for protecting user and management functionality.

The backend supports:

* Customer authentication
* Restaurant authentication
* Admin authentication
* JWT-based protected API access
* Password hashing using bcryptjs

JWT tokens are used to identify authenticated users when accessing protected APIs.

---

# 💰 Payment

For the current academic demonstration, the project uses **cash payment / payment recording** rather than requiring a live online payment gateway.

Online payment integration can be added later when required for production deployment.

---

# ☁️ Deployment

### Frontend

The frontend websites are deployed using:

**Firebase Hosting**

```text
Customer → Firebase Hosting
Restaurant → Firebase Hosting
Admin → Firebase Hosting
```

### Backend

The backend is deployed using:

**Render**

```text
Node.js
   ↓
Express.js
   ↓
Render
```

### Database

The database is hosted on:

**TiDB Cloud**

```text
Express Backend
      ↓
TiDB Cloud
      ↓
MySQL-Compatible Database
```

---

# 🧪 Testing

The following parts of the system were tested:

* Customer authentication
* Restaurant authentication
* Admin functionality
* Restaurant listing
* Branch management
* Menu management
* Dish availability
* Image uploading
* Cart functionality
* Order creation
* Order retrieval
* Order status updates
* Order deletion
* Customer management
* REST API communication
* Database operations

---

# 📊 Results

The implemented system provides a connected workflow between:

```text
Customer
   ↕
REST API
   ↕
Database
   ↕
Restaurant
   ↕
Admin
```

The project demonstrates:

* Digital restaurant browsing
* Self-service ordering
* Centralized restaurant management
* Menu and branch management
* Cloud database storage
* REST-based communication
* Image management
* Order tracking
* Cloud deployment

---

# 🚀 Future Scope

Future improvements include:

* 📱 Dedicated Customer Android APK/AAB
* 🔔 Push notifications
* ⚡ More advanced real-time order updates
* 📊 Restaurant analytics
* 📈 Admin reports
* ☁️ Dedicated cloud image storage
* 💳 Production online payment integration
* 🔐 Enhanced security
* 📱 Improved mobile UI
* 🤖 Personalized food recommendations
* 📋 Advanced restaurant reporting

---

# 🧰 Technologies Used

| Category          | Technology               |
| ----------------- | ------------------------ |
| Frontend          | HTML5                    |
| Styling           | CSS3                     |
| Client Logic      | JavaScript               |
| Backend           | Node.js                  |
| API Framework     | Express.js               |
| Database          | TiDB Cloud               |
| Database Protocol | MySQL                    |
| Authentication    | JWT                      |
| Password Security | bcryptjs                 |
| Image Upload      | Multer                   |
| Frontend Hosting  | Firebase Hosting         |
| Backend Hosting   | Render                   |
| Version Control   | Git                      |
| Repository        | GitHub                   |
| API Testing       | Postman                  |
| Diagram Design    | diagrams.net             |
| Development       | VS Code / Android Studio |

---

# 📁 Project Structure

```text
DineUp/
│
├── backend/
│   ├── server.js
│   ├── package.json
│   ├── .env
│   └── uploads/
│
└── web/
    │
    ├── customer/
    │   ├── index.html
    │   ├── style.css
    │   └── app.js
    │
    ├── restaurant/
    │   ├── index.html
    │   ├── login.html
    │   ├── management.html
    │   ├── management.js
    │   ├── app.js
    │   └── style.css
    │
    └── admin/
        ├── index.html
        ├── app.js
        └── style.css
```

---

# 🔗 Project Links

### 🌐 Customer Website

https://dineup-19ff8.web.app/customer/

### 🍴 Restaurant Website

https://dineup-19ff8.web.app/restaurant/

### 🛠️ Admin Website

https://dineup-19ff8.web.app/admin/

### ⚙️ Backend Health API

https://dineup-backend.onrender.com/api/health

### 💻 GitHub Repository

https://github.com/ajaimanikanta/DineUp-backend

---

# 👨‍💻 Team

### Ajai Manikanta

**ID:** 2520030320

### Akshith

**ID:** 2520030041

### Teja

**ID:** 2520030569

**Guide:** Dr. Spandana

**KLH Bachupally Campus — CSE**

**PBL 2026–27**

---

# 📄 License

This project was developed as an academic PBL project for educational and demonstration purposes.
