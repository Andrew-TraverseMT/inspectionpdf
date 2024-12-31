# Use a public base image with Python
FROM python:3.9-slim

# Install system dependencies for the ArcGIS Python API
RUN apt-get update && apt-get install -y \
    gdal-bin \
    libgdal-dev \
    libcurl4-openssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install ArcGIS Python API and other dependencies
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Set up a working directory
WORKDIR /home/jovyan

# Copy the notebook into the container
COPY Lone_Star_Inspections_Solar_Panel_Rows.ipynb .

# Default command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
