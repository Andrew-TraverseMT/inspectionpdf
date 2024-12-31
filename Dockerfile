# Base image for ArcGIS Notebooks
FROM esridocker/arcgis-notebook:latest

# Switch to root to install additional Python packages
USER root

# Install required Python packages
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Reset to default user
USER 1000

# Start Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
