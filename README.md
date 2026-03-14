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
<img width="443" height="1011" alt="Image" src="https://github.com/user-attachments/assets/30ad1c52-04f2-434c-986b-42d644dc56dd" />
หน้าสำหรับเข้าสู่ระบบ โดยตรวจสอบ **username และ password จาก API**

การทำงาน

- โหลดข้อมูล user จาก API
- ตรวจสอบ username และ password
- หากถูกต้องจะเข้าสู่ระบบ

เงื่อนไข

- หาก login ด้วย **johnd** จะเข้าสู่หน้า **User Management**
- หาก login ด้วย user อื่น จะเข้าสู่หน้า **Product List**




---

# 2. หน้า Product List
<img width="440" height="1018" alt="Image" src="https://github.com/user-attachments/assets/316038d6-436d-422a-9404-0762b6e05083" />
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




---

# 4. ระบบตะกร้าสินค้า (Cart)
<img width="442" height="1013" alt="Image" src="https://github.com/user-attachments/assets/b3eea4d0-b668-4f33-897f-20a0b2314ba2" />
หน้าตะกร้าสินค้าใช้สำหรับจัดการสินค้าที่ผู้ใช้เลือก

สามารถ

- เพิ่มจำนวนสินค้า
- ลดจำนวนสินค้า
- ลบสินค้า
- แสดงราคารวมของสินค้า
- 



---

# 5. หน้า User Management (Admin เท่านั้น)

หน้านี้สามารถเข้าได้เฉพาะ **Admin (johnd)**

สามารถจัดการข้อมูลผู้ใช้ได้ เช่น

- เพิ่มผู้ใช้
- แก้ไขข้อมูลผู้ใช้
- ลบผู้ใช้




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

Nathaphab Saila
สาขาวิศวกรรมซอฟต์แวร์
