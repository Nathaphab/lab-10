# Lab10 - Flutter API Data Management (CRUD)

โปรเจกต์นี้เป็นส่วนหนึ่งของรายวิชา **การพัฒนาแอปพลิเคชันด้วย Flutter**  
มีวัตถุประสงค์เพื่อเรียนรู้การใช้งาน **Web API** สำหรับจัดการข้อมูล โดยใช้ **FakeStoreAPI** และจัดการสถานะด้วย **Provider**

---

# เทคโนโลยีที่ใช้

- Flutter
- Dart
- Provider (State Management)
- HTTP Package
- FakeStoreAPI

API ที่ใช้

https://fakestoreapi.com

---

# การทำงานของระบบ

ระบบแบ่งการทำงานออกเป็น 2 ส่วนหลัก

1. ผู้ใช้ทั่วไป (User)
2. ผู้ดูแลระบบ (Admin)

โดยกำหนดให้ **username = johnd เป็น Admin**

---

# 1. หน้า Login

หน้าสำหรับเข้าสู่ระบบ โดยตรวจสอบ **username และ password จาก API**

การทำงาน

- โหลดข้อมูล user จาก API
- ตรวจสอบ username และ password
- หากถูกต้องจะเข้าสู่ระบบ

เงื่อนไข

- หาก login ด้วย **johnd** จะเข้าสู่หน้า **User Management**
- หาก login ด้วย user อื่น จะเข้าสู่หน้า **Product List**

<img width="477" height="978" alt="image" src="https://github.com/user-attachments/assets/8fec65ff-19b9-47eb-babb-716b55bb3dfa" />


---

# 2. หน้า Product List

หน้าสำหรับแสดงรายการสินค้า โดยดึงข้อมูลจาก API

ข้อมูลที่แสดง

- รูปสินค้า
- ชื่อสินค้า
- ราคา

ผู้ใช้สามารถ

- กดดูรายละเอียดสินค้า
- เพิ่มสินค้าลงตะกร้า
- ไปหน้าตะกร้าสินค้า
- Logout

<img width="477" height="978" alt="image" src="https://github.com/user-attachments/assets/11f56e2d-afc8-4ef0-954a-b2e4e6ad2bf8" />


---

# 3. หน้า Product Detail

หน้าสำหรับแสดงรายละเอียดของสินค้า

ข้อมูลที่แสดง

- รูปสินค้า
- ชื่อสินค้า
- ราคา
- รายละเอียดสินค้า

ผู้ใช้สามารถ

- เพิ่มสินค้าลงตะกร้า

<img width="477" height="978" alt="image" src="https://github.com/user-attachments/assets/e58b0801-f01a-4893-ad39-d3be0b9a9b2f" />


---

# 4. ระบบตะกร้าสินค้า (Cart)

หน้าตะกร้าสินค้าใช้สำหรับจัดการสินค้าที่ผู้ใช้เลือก

สามารถ

- เพิ่มจำนวนสินค้า
- ลดจำนวนสินค้า
- ลบสินค้า
- แสดงราคารวมของสินค้า
- 
<img width="477" height="978" alt="image" src="https://github.com/user-attachments/assets/00afe026-c8ef-4985-88a1-2b336eaf8463" />


---

# 5. หน้า User Management (Admin เท่านั้น)

หน้านี้สามารถเข้าได้เฉพาะ **Admin (johnd)**

สามารถจัดการข้อมูลผู้ใช้ได้ เช่น

- เพิ่มผู้ใช้
- แก้ไขข้อมูลผู้ใช้
- ลบผู้ใช้

<img width="477" height="978" alt="image" src="https://github.com/user-attachments/assets/e2241261-e2e6-4fe4-abb9-61c4f57ff5f4" />


---
# การทำงานของ API
## ดึงข้อมูลผู้ใช้
GET /users
## เพิ่มผู้ใช้
POST /users
## แก้ไขผู้ใช้
PUT /users/{id}
## ลบผู้ใช้
DELETE /users/{id}


---

# การจัดการ State

โปรเจกต์นี้ใช้ **Provider** สำหรับจัดการ State

Provider ที่ใช้

- UserProvider
- ProductProvider
- CartProvider

หน้าที่

UserProvider
จัดการข้อมูลผู้ใช้และระบบ Login

ProductProvider
จัดการข้อมูลสินค้า

CartProvider
จัดการตะกร้าสินค้า

---

# สรุป

โปรเจกต์นี้แสดงการทำงานของ Flutter ร่วมกับ Web API โดยมีฟีเจอร์หลักดังนี้

- Login ด้วยข้อมูลจาก API
- แสดงรายการสินค้า
- ดูรายละเอียดสินค้า
- เพิ่มสินค้าในตะกร้า
- คำนวณราคารวม
- ระบบ Admin จัดการผู้ใช้

ทำให้เข้าใจการทำงานของ

- REST API
- State Management
- CRUD Operations
- Navigation ใน Flutter

---

# ผู้พัฒนา

Kittaphon Laemthai
สาขาวิศวกรรมซอฟต์แวร์
