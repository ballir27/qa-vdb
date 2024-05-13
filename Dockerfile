# Start from the existing image
FROM vsc-mlops-zoomcamp-da609a4d8023f67c6a9b2ebd7fa7e5bbb2f4d4b9a61b8e5fab7b80d88ce74c9a-uid:latest

# Activate the base Anaconda environment
SHELL ["/bin/bash", "-c"]
RUN echo "source activate base" > ~/.bashrc

# Install additional packages from conda-forge
RUN conda install nltk

RUN pip install chromadb && \
    pip install ipywidgets


RUN conda install -y -c conda-forge nltk gensim scipy && \
    conda install -y -c huggingface -c conda-forge datasets huggingface_hub


RUN pip install transformers==4.36.0
# Set up a working directory
WORKDIR /app

# Copy the contents of the current directory into the container at /app
COPY . /app

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the application
CMD ["python", "app.py"]