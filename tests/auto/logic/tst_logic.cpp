#include <QtTest>

// add necessary includes here

class Logic : public QObject
{
    Q_OBJECT

public:
    Logic();
    ~Logic();

private slots:
    void test_case1();

};

Logic::Logic()
{

}

Logic::~Logic()
{

}

void Logic::test_case1()
{

}

QTEST_APPLESS_MAIN(Logic)

#include "tst_logic.moc"
