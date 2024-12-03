# Chọn image Python
FROM python:3.9-slim

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép yêu cầu vào container
COPY requirements.txt /app/

# Cài đặt các yêu cầu
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép mã nguồn ứng dụng vào container
COPY . /app/

# Mở cổng cho ứng dụng
EXPOSE 5000

# Lệnh để chạy ứng dụng
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
