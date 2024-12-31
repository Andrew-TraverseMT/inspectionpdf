# Use a public base image with Python
FROM python:3.9-slim

# Install system-level dependencies, including krb5-config
RUN apt-get update && apt-get install -y \
    krb5-user \
    libkrb5-dev \
    gdal-bin \
    libgdal-dev \
    libcurl4-openssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file
COPY requirements.txt /tmp/

# Install Python dependencies
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Set up a working directory
WORKDIR /home/jovyan

# Copy the notebook into the container
COPY Lone_Star_Inspections_Solar_Panel_Rows.ipynb .

# Default command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
