# jupyter lab      : 2.1.3
FROM jupyter/scipy-notebook:54462805efcb

RUN jupyter labextension install \
  @lckr/jupyterlab_variableinspector \
  @krassowski/jupyterlab-lsp \
  @axlair/jupyterlab_vim

# pd.read_html
RUN pip install lxml html5lib beautifulsoup4

# code completion
RUN pip install jupyter-lsp python-language-server[all]

RUN jupyter lab build
