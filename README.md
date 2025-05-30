

1.	What is PostgreSQL?

## 
PostgreSQL একটি রিলেশনালবেসড ডাটাবেজ সিস্টেম যেখানে টেবিলের মাধ্যমে রিলেশন বানানো হয় । এটি RDBMS এর অন্তর্ভুক্ত । এটি ব্যবহার এবং পরিবর্তন সম্পূর্ণ ফ্রি। এটির দ্বারা একাধিক ব্যাবহারকারী একসাথে কাজ করতে পারে। এতে pgAdmin এবং আরও অনেক কিছু যোগ করা যায়। এটি ক্রস-প্ল্যাটফর্ম – Windows, Linux, macOS-এ কাজ করে। 
PostgreSQL সাধারণত অনেক কাজে ব্যবহৃত হয় । যেমনঃ
 (১) ওয়েব অ্যাপ্লিকেশন (যেমনঃ Node.js প্রজেক্টে) ।
 (২) মোবাইল অ্যাপ ব্যাকএন্ড ।
 (৩) বড় সিস্টেমে তথ্য সংরক্ষণ ।
 (৪) সরকারি, ব্যাংকিং ভিত্তিক সফটওয়্যার সলিউশনে

 Code example:
  SELECT * FROM employee;


2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
## 
Primary Key : একটি টেবিলের প্রতিটি সারি (row) কে অনন্যভাবে চিহ্নিত করার জন্য ব্যবহৃত এক বা একাধিক কলামকে Primary Key বলা হয়। Primary Key কলামে প্রতিটি সারির জন্য মান অবশ্যই ভিন্ন হতে হবে। কোনো দুটি সারির Primary Key মান একই হতে পারবে না। একটি টেবিলে শুধুমাত্র একটি Primary Key থাকতে পারে। এটি অনেকগুলো কি এর সমনয়ে গঠিত হতে পারে।  এটি NULL হতে পারবে না।
Foreign Key : Foreign Key হইল অন্য টেবিলের Primary Key । Foreign Key একটি টেবিলের ডেটাকে অন্য টেবিলের ডেটার সাথে লিঙ্ক করতে সাহায্য করে । Foreign Key কলামের মান NULL হতে পারে । একটি টেবিলে একাধিক Foreign Key থাকতে পারে ।

3. Explain the GROUP BY clause and its role in aggregation operations
## 
GROUP BY ডেটা সারিগুলোকে নির্দিষ্ট ক্যাটাগরিতে ভাগ করে এবং তারপর প্রতিটি ক্যাটাগরির জন্য সমষ্টিগত ফলাফল দেখায়। এটি SELECT স্টেটমেন্টে ব্যবহৃত হয় যখন ডেটাবেসের টেবিলের ডেটাকে এক বা একাধিক কলামের উপর ভিত্তি করে গ্রুপ করার দরকার পড়ে। GROUP BY ক্লজের মূল ভূমিকা হলো Aggregation Function এর কাজ। PostgreSQL-এর ফাংশনগুলো (যেমন COUNT, SUM, AVG, MIN, MAX ইত্যাদি) ডেটার একটি সেট-এর উপর কাজ করে একটি মান ফেরত দেয়। যেমন ঃ
SELECT category,SUM(price) AS total_price_per_category,
    COUNT(product_id) AS number_of_product FROM products
GROUP BY category;

4. What is the purpose of a database schema in PostgreSQL?
## 
PostgreSQL-এ স্কিমা হলো একটি ডেটাবেসের মধ্যে ডেটাবেস Object (যেমন টেবিল, ফাংশন) গুছিয়ে রাখার জন্য একটি নামযুক্ত কন্টেইনার, যা একাধিক ইউজারকে একই ডেটাবেসের মধ্যে নিজস্ব Object সেট তৈরি করতে সাহায্য করে। এটি ডেটাবেসকে নিরাপত্তা জনিত ব্যবস্থা নিশ্চিত করে এবং বড় ডেটাবেসে কাজ করা সহজ করে তোলে।

5. What is the difference between the VARCHAR and CHAR data types?
## 
PostgreSQL-এ VARCHAR ডেটা টাইপটি ভেরিয়েবল-length ক্যারেক্টার string সংরক্ষণের জন্য ব্যবহৃত হয় । এর প্রধান সুবিধা হলো মেমরি সল্পতা অর্থ কম জায়গা ব্যভার করে; একটি VARCHAR কলামে যখন ডেটা সংরক্ষণ করা হয়, তখন এটি কেবল প্রকৃত ডেটার জন্য প্রয়োজনীয় স্থান নেয় এবং ডেটার দৈর্ঘ্য ট্র্যাক করার জন্য সামান্য অতিরিক্ত বাইট ব্যবহার করে। যেমন, যদি একটি VARCHAR(100) কলামে "Hello" নামক একটি ৫ অক্ষরের স্ট্রিং সংরক্ষণ করা হয়, তবে এটি কেবল ৫টি অক্ষরের জন্যই স্থান ব্যবহার করবে, কোনো অতিরিক্ত জায়গা নিবে না, যার ফলে অপ্রয়োজনীয় মেমরি ব্যবহার এড়ানো যায়। এই বৈশিষ্ট্য এটিকে নাম, ঠিকানা, মন্তব্য বা ইমেইলের মতো ডেটা সংরক্ষণের জন্য ব্যবহার করা হয়, যেখানে string এর দৈর্ঘ্য ভিন্ন হতে পারে।

অন্যদিকে, CHAR ডেটা টাইপটি ফিক্সড-length ক্যারেক্টার string সংরক্ষণের জন্য ডিজাইন করা হয়েছে। CHAR ব্যবহার করলে ডেটার প্রকৃত দৈর্ঘ্য যাই হোক না কেন ফিক্সড-length ধারণ করে । এর অর্থ হলো, যদি একটি CHAR(10) কলামে "Hi" নামক একটি ২ অক্ষরের স্ট্রিং সংরক্ষণ করেন, তাহলে PostgreSQL স্বয়ংক্রিয়ভাবে ডেটার শেষে ৮টি অতিরিক্ত স্পেস (trailing spaces) যুক্ত করে string কে ১০ অক্ষরের দৈর্ঘ্যে নিয়ে যাবে। এই কারণে, CHAR কলামগুলি VARCHAR এর তুলনায় বেশি মেমরি ব্যবহার করতে পারে । এটি সাধারণত এমন ডেটার জন্য উপযুক্ত যেখানে দৈর্ঘ্য সর্বদা সুনির্দিষ্ট থাকে, যেমন দেশের ২ অক্ষরের কোড।