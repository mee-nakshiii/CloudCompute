# CloudCompute: GPU Marketplace 🚀

**Developed by:** 

## 📌 Project Overview
CloudCompute is a full-stack web application designed to bridge the gap between AI researchers needing compute and providers with idle hardware. Users can browse and rent high-performance GPUs, while providers can list their hardware for rent.

---

## 🛠️ Tech Stack
* **Backend:** Python with **Flask** (routing, session management, and server logic).
* **Frontend:** **HTML5**, **CSS3**, and **Bootstrap 5** for a responsive, dark-themed UI.
* **Database:** **MySQL** for persistent storage of users, hardware listings, and rental history.
* **Templating:** **Jinja2** to dynamically render database content into the web pages.

---

## ⚙️ Key Features
* **User Authentication:** A secure login system that differentiates between "Users" and "Providers".
* **Live Marketplace:** A dynamic grid that displays only "Available" hardware units directly from the SQL database.
* **Hardware Management:** A professional provider dashboard for adding new GPU units with specific VRAM and pricing.
* **Real-time Rental Logic:** Automatic database updates that change hardware status to 'Busy' immediately upon rental.

---

## 📂 Project Structure
```text
CloudCompute-1/
├── app.py                  # Main Flask application logic
├── cloud_gpu_schema.sql     # Database structure & seed data
├── requirements.txt         # List of Python dependencies
└── templates/              # HTML UI files
    ├── login.html
    ├── marketplace.html
    └── provider_dashboard.html
