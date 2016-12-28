TEMPLATE = subdirs

SUBDIRS += src
src.file = src/propertycross-qt-flux-atomic-src.pro

CONFIG(debug, debug|release) {
    SUBDIRS += tests
    tests.file = tests/propertycross-qt-flux-atomic-tests.pro
}
