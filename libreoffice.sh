LIBREOFFICE_ROOT_DIR="/home/$USER/repos"

if ! [ -d $LIBREOFFICE_ROOT_DIR ] > /dev/null; then
    mkdir -p $LIBREOFFICE_ROOT_DIR
fi

# install libreoffice build dependencies
sudo pacman -S --needed 'base-devel' 'git' 'ccache' 'ant' 'apr' 'beanshell' 'bluez-libs' 'clucene' \
                        'coin-or-mp' 'cppunit' 'curl' 'dbus-glib' \
                        'desktop-file-utils' 'doxygen' 'flex' 'gcc-libs' \
                        'gdb' 'glm' 'gobject-introspection' 'gperf' 'gpgme' \
                        'graphite' 'gst-plugins-base-libs' 'gtk3' \
                        'harfbuzz-icu' 'hicolor-icon-theme' 'hunspell' \
                        'hyphen' 'icu' 'java-environment' 'junit' \
                        'lcms2' 'libabw' 'libatomic_ops' 'libcdr' 'libcmis' \
                        'libe-book' 'libepoxy' 'libepubgen' 'libetonyek' \
                        'libexttextcat' 'libfreehand' 'libgl' 'libjpeg' \
                        'liblangtag' 'libmspub' 'libmwaw' 'libmythes' \
                        'libnumbertext' 'libodfgen' 'liborcus' 'libpagemaker' \
                        'libqxp' 'libstaroffice' 'libtommath' 'libvisio' \
                        'libwpd' 'libwpg' 'libwps' 'libxinerama' 'libxrandr' \
                        'libxslt' 'libzmf' 'lpsolve' 'mariadb-libs' \
                        'mdds' 'nasm' 'neon' 'nspr' 'nss' 'pango' \
                        'plasma-framework5' 'poppler' 'postgresql-libs' \
                        'python' 'qt5-base' 'redland' 'sane' 'serf' 'sh' \
                        'shared-mime-info' 'ttf-liberation' 'unixodbc' \
                        'unzip' 'xmlsec' 'zip' 'gtk4' 'qt6-base' 'zxing-cpp' \
                        'abseil-cpp' 'clang' 'llvm' 'llvm-libs'


# clone the project
git clone https://gerrit.libreoffice.org/core $LIBREOFFICE_ROOT_DIR/libreoffice
cd $LIBREOFFICE_ROOT_DIR/libreoffice

# setup autogen.input and ccache
echo "--enable-dbgutil
--without-java
--without-help
--without-doxygen
--enable-kf5
--enable-kf6
--enable-compiler-plugins
--with-system-libxml=no 
CC=clang
CXX=clang++
" > /home/printfdebugging/repos/libreoffice/autogen.input

ccache --max-size 100G

# build the project
./autogen.sh && make

# lsp sugar
make vim-ide-integration
make vscode-ide-integration
