#CloudCompute: GPU Marketplace 🚀

📌 Project Overview
CloudCompute is a full-stack web application that allows users to rent high-performance GPUs and providers to list their hardware. The platform bridges the gap between AI researchers needing compute and providers with idle hardware.

🛠️ Tech Stack
Backend: Python with Flask framework for routing and session management.

Frontend: HTML5, CSS3, and Bootstrap 5 for a responsive, dark-themed UI.

Database: MySQL for persistent storage of users, hardware, and rental transactions.

Templating: Jinja2 to dynamically render database content into the UI.

⚙️ Key Features
User Authentication: Secure login system that differentiates between "Users" and "Providers".

Live Marketplace: A dynamic grid that displays only "Available" hardware directly from the SQL database.

Hardware Management: A provider dashboard to add new GPU units with specific VRAM and pricing.

Rental Logic: Real-time database updates that change hardware status to 'Busy' upon rental.

📂 Project Structure
Plaintext
CloudCompute-1/
├── app.py              # Main Flask application logic
├── cloud_gpu_schema.sql # Database structure & seed data
├── templates/          # HTML UI files
│   ├── login.html
│   ├── marketplace.html
│   └── provider_dashboard.html
└── requirements.txt    # List of Python dependencies
