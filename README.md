# ER Design – Food Delivery Management System

**Author:** Stroganov Pavlo

## 1. Overview

This repository contains the Entity–Relationship (ER) design for a Food Delivery Management System.

The goal of the system is to support basic food delivery workflows:
- customers register and log in,
- customers browse restaurants and their menus,
- customers create orders,
- restaurants receive and process orders,
- the platform stores payments and allows order tracking.

The design was created as part of an ER Design assignment.

## 2. High-level overview of functions and use cases

The system supports the following main use cases:

1. **Customer registration and login**  
   Users can create an account and authenticate themselves in the system.

2. **Restaurant and menu browsing**  
   Customers can view available restaurants and their menu items.

3. **Order creation**  
   Customers select menu items, specify a delivery address, and place an order.

4. **Order processing**  
   Restaurants receive incoming orders and update their statuses (NEW → COOKING → ON_DELIVERY → DELIVERED).

5. **Payment processing**  
   Each order has a corresponding payment. The system stores payment method and payment status.

6. **Order tracking**  
   Customers can view the status and total amount of their orders.

7. **Basic reporting**  
   The system maintains records of orders, order items, restaurants, and payments for administrative purposes.

## 3. ER design: entities and relationships

The following main entities are included in the ER model:

- **Customer** – stores data about registered users.
- **Restaurant** – stores data about restaurants on the platform.
- **MenuItem** – represents dishes offered by a restaurant.
- **Order** – represents an order placed by a customer.
- **OrderItem** – represents individual line items in an order.
- **Payment** – stores information about payments related to orders.

### 3.1 Customer

- `customer_id` (INT, PK) – unique customer identifier  
- `full_name` (VARCHAR(100)) – customer name  
- `email` (VARCHAR(100)) – email  
- `phone` (VARCHAR(20)) – phone number  
- `password_hash` (VARCHAR(255)) – hashed password  

**Relationship:** one Customer can place many Orders (1:M).

### 3.2 Restaurant

- `restaurant_id` (INT, PK) – unique restaurant identifier  
- `name` (VARCHAR(150)) – restaurant name  
- `address` (VARCHAR(255)) – address  
- `phone` (VARCHAR(20)) – contact phone  
- `is_active` (BOOLEAN) – restaurant availability  

**Relationships:**
- one Restaurant can have many MenuItems (1:M),
- one Restaurant can receive many Orders (1:M).

### 3.3 MenuItem

- `item_id` (INT, PK) – unique menu item identifier  
- `restaurant_id` (INT, FK) – restaurant providing the item  
- `name` (VARCHAR(150)) – item name  
- `description` (TEXT) – item description  
- `price` (DECIMAL(10,2)) – price  
- `is_available` (BOOLEAN) – indicates if the item is available  

**Relationships:**
- one Restaurant can offer many MenuItems (1:M),
- one MenuItem can appear in many OrderItems (1:M).

### 3.4 Order

- `order_id` (INT, PK) – unique order identifier  
- `customer_id` (INT, FK) – customer who placed the order  
- `restaurant_id` (INT, FK) – restaurant fulfilling the order  
- `order_datetime` (DATETIME) – date and time of the order  
- `delivery_address` (VARCHAR(255)) – delivery location  
- `status` (ENUM) – order status  
- `total_amount` (DECIMAL(10,2)) – total cost  

**Relationships:**
- one Order contains many OrderItems (1:M),
- one Order has one Payment (1:1).

### 3.5 OrderItem

- `order_id` (INT, PK, FK) – order identifier  
- `item_id` (INT, PK, FK) – menu item identifier  
- `quantity` (INT) – quantity ordered  
- `unit_price` (DECIMAL(10,2)) – price at the time of order  

**Relationships:**
- Order (1) → (M) OrderItem  
- MenuItem (1) → (M) OrderItem  

Composite primary key: (`order_id`, `item_id`).

### 3.6 Payment

- `payment_id` (INT, PK) – unique payment identifier  
- `order_id` (INT, FK, UNIQUE) – linked order  
- `payment_method` (ENUM) – payment method (CARD, CASH, ONLINE)  
- `payment_status` (ENUM) – payment status (PENDING, PAID, FAILED)  
- `payment_datetime` (DATETIME) – time of payment  

**Relationship:** each Order has exactly one Payment (1:1).

## 4. ER diagram

The ER diagram is stored in the `docs` folder as:

- `Food_delivery_management_system_Stroganov_Pavlo.png` – ER diagram image
- (optionally) `er-diagram.mmd` – Mermaid source

The diagram shows all designed entities, their attributes (with data types), and the relationships between them.

## 5. Assignment and self-evaluation

This work was completed as part of an ER Design assignment.

Self-evaluation:
- High-level overview of functions and use cases: **4/4**
- Description of entities, attributes, and relations: **8/8**
- ER diagram: **8/8**

**Total: 20/20.**
