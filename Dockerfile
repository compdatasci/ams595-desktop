# Builds a Docker image with Ubuntu 18.04, Octave, Python3 and Jupyter Notebook
# for "AMS 595: Fundamentals of Computing" at Stony Brook University
#
# Authors:
# Xiangmin Jiao <xmjiao@gmail.com>

FROM compdatasci/vscode-desktop:latest
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root
WORKDIR /tmp

# Install system packages and Octave
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        build-essential \
        linux-tools-virtual \
        gfortran \
        cmake \
        bison \
        flex \
        git \
        bash-completion \
        bsdtar \
        rsync \
        wget \
        imagemagick \
        \
        gnuplot-x11 \
        ghostscript \
        fig2dev \
        epstool \
        pstoedit \
        libopenblas-base \
        \
        octave \
        liboctave-dev \
        octave-info \
        octave-symbolic \
        octave-parallel \
        octave-struct \
        \
        python3-pip \
        python3-dev \
        pandoc \
        ttf-dejavu \
        git \
        \
        gdb \
        ddd \
        valgrind \
        electric-fence \
        kcachegrind \
        ccache \
        libnss3 \
        nano \
        emacs \
        vim \
        \
        liblapack-dev \
        libopenblas-dev \
        libomp-dev \
        openmpi-bin libopenmpi-dev \
        \
        meld \
        diffuse && \
    apt-get clean && \
    apt-get autoremove && \
    curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash && \
    pip3 install -U \
        numpy \
        scipy \
        sympy \
        pandas \
        numpydoc \
        matplotlib \
        autopep8 \
        flake8 \
        PyQt5 \
        ipython \
        jupyter \
        ipywidgets \
        pylint \
        pytest \
        spyder && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD image/home $DOCKER_HOME

# Install Jupyter Notebook extensions
RUN jupyter nbextension install --py --system \
         widgetsnbextension && \
    jupyter nbextension enable --py --system \
         widgetsnbextension && \
    pip3 install -U \
        jupyter_latex_envs==1.3.8.4 && \
    jupyter nbextension install --py --system \
        latex_envs && \
    jupyter nbextension enable --py --system \
        latex_envs && \
    jupyter nbextension install --system \
        https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip && \
    jupyter nbextension install --system \
        https://bitbucket.org/ipre/calico/downloads/calico-document-tools-1.0.zip && \
    jupyter nbextension install --system \
        https://bitbucket.org/ipre/calico/downloads/calico-cell-tools-1.0.zip && \
    jupyter nbextension enable --system \
        calico-spell-check && \
    pip3 install -U octave_kernel && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    \
    touch $DOCKER_HOME/.log/jupyter.log && \
    \
    echo 'export OMP_NUM_THREADS=$(nproc)' >> $DOCKER_HOME/.profile && \
    chown -R $DOCKER_USER:$DOCKER_GROUP $DOCKER_HOME

WORKDIR $DOCKER_HOME
