# 心聚點 HeartSpace

**社群服務網站**  
由 3 人團隊開發，使用 **ASP.NET MVC 5**、**ASP.NET Core MVC** 和 **MySQL**。  
網站提供使用者發布貼文、發起或報名活動，並支援關鍵字搜尋。  
另設有後台管理系統，供管理員管理使用者、貼文及活動。

---

## 🚀 **專案功能**

### 使用者功能：
- 發布、編輯、關閉**貼文**，並可於貼文下留言。
- 發起、編輯、關閉**活動**，並可報名活動及管理出席狀態。
- 支援關鍵字搜尋貼文與活動，快速找到所需內容。

### 管理員功能：
- 管理使用者帳號，包括啟用、停用及編輯帳號資訊。
- 管理所有貼文與活動，支援關閉貼文及留言。

---

## 🛠️ **技術細節**
- **後端技術**：ASP.NET MVC 5、ASP.NET Core MVC
- **前端技術**：HTML、CSS (Bootstrap 5)、jQuery、AJAX
- **資料庫**：MySQL
- **系統架構**：三層式架構、介面、依賴注入
- **ORM 工具**：Dapper、Entity Framework
- **版本控制**：Git

---


## 🖼️ **畫面截圖**

### 使用者介面：
- **首頁**
<img src="https://private-user-images.githubusercontent.com/191953724/409538709-2c263e0b-db6b-4f62-8a13-e14d4a87a9f0.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mzg2NzA4MzMsIm5iZiI6MTczODY3MDUzMywicGF0aCI6Ii8xOTE5NTM3MjQvNDA5NTM4NzA5LTJjMjYzZTBiLWRiNmItNGY2Mi04YTEzLWUxNGQ0YTg3YTlmMC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwMjA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDIwNFQxMjAyMTNaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02Njg5Nzk5NDJjMzBjNWJlZDZmMzY1ODg4ZTQyNzdhYTk0Mzc3YThkZTQxYzljODIxZjAyNjFlMGY1YmQ1ZjdiJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.t6m8xp1bMjR3CLthTXMPdLcv4mgdI4SS5S4oRe_oZVk" alt="描述文字" width="500">


- **搜尋**：HTML、CSS (Bootstrap 5)、jQuery、AJAX
- **貼文**：MySQL
- **活動**：三層式架構、介面、依賴注入
- **ORM 工具**：Dapper、Entity Framework
- **版本控制**：Git

- 
### 後台管理系統：

---


## 📦 **專案安裝與執行**

1. **克隆專案**：
   ```bash
   git clone https://github.com/您的帳戶名/HeartSpace.git
   cd HeartSpace
2. **初始化資料庫**：
   - 將 `db/init-database.sql` 檔案匯入資料庫以建立資料表和預設資料。
   - 使用 MySQL Workbench 或其他資料庫工具執行 SQL 檔案。
3. **設定資料庫連線資訊**：  
   - 編輯專案中的 Web.config 或 appsettings.json 文件，填寫資料庫連線資訊
4. **啟動專案**：  
   - 使用 Visual Studio 開啟專案的 .sln 文件。  
   - 執行專案並啟動伺服器。  
5. **瀏覽網站**：  
   - 前台：http://localhost:44344
   - 後台：http://localhost:7075  
   - 圖庫：http://localhost:44378

