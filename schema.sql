CREATE TABLE CUSTOMER (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(15) UNIQUE,
    email VARCHAR2(50)
);

CREATE TABLE RESTAURANT (
    restaurant_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    location VARCHAR2(100)
);

CREATE TABLE FOOD (
    food_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    price NUMBER CHECK (price > 0),
    restaurant_id NUMBER,
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id)
);

CREATE TABLE ORDERS (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE DEFAULT SYSDATE,
    total_amount NUMBER,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

CREATE TABLE ORDER_DETAILS (
    order_detail_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    food_id NUMBER,
    quantity NUMBER,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (food_id) REFERENCES FOOD(food_id)
);

CREATE TABLE PAYMENT (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    amount NUMBER,
    method VARCHAR2(20),
    status VARCHAR2(20),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
);