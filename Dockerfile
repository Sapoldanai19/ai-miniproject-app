# 1. ใช้ Python ตัวที่เล็กและเสถียรที่สุด
FROM python:3.10-slim

# 2. ตั้งค่าโฟลเดอร์ทำงาน
WORKDIR /app

# 3. ติดตั้งแค่ตัวจัดการพื้นฐาน (ตัดตัวที่ทำให้ Error ออก)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 4. Copy และติดตั้ง Library
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy โค้ดทั้งหมดเข้าเครื่อง
COPY . .

# 6. รันแอป
EXPOSE 8501
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]