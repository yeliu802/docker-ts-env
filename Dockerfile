FROM tensorflow/tensorflow:latest

RUN apt-get update
RUN pip install --upgrade pip
RUN pip install jupyterLab
#RUN apt-get install -y \
#        zip \
#        vim \
#        nano \
#        git \

# Install wget
#RUN apt-get install -y wget

#RUN jupyter notebook --generate-config
RUN mkdir /notebook
WORKDIR /notebook

CMD ["jupyter-lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

