# python3をベースにする
FROM python:3.6

RUN apt-get update && apt-get install -y \
    curl \
    git \
    tree \
    vim \
    graphviz

RUN pip install --upgrade pip

# 作業ディレクトリを指定
WORKDIR /home/ec2-user/repo/

COPY requirements.txt /home/ec2-user/repo/
RUN pip install -r  requirements.txt

WORKDIR /home/ec2-user/repo/
RUN jupyter serverextension enable --py jupyterlab

EXPOSE 8888
ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

CMD ["--notebook-dir=/home/ec2-user/repo/"]
