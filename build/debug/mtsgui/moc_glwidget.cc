/****************************************************************************
** Meta object code from reading C++ file 'glwidget.h'
**
** Created: Sat Jan 12 11:29:35 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "glwidget.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'glwidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_GLWidget[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      22,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: signature, parameters, type, tag, flags
      10,    9,    9,    9, 0x05,
      27,    9,    9,    9, 0x05,
      43,    9,    9,    9, 0x05,
      57,   50,    9,    9, 0x05,
      89,   80,    9,    9, 0x05,
     136,  114,    9,    9, 0x05,
     162,    9,    9,    9, 0x05,

 // slots: signature, parameters, type, tag, flags
     181,    9,    9,    9, 0x0a,
     196,    9,    9,    9, 0x0a,
     218,  211,    9,    9, 0x0a,
     257,  237,    9,    9, 0x0a,
     292,  285,    9,    9, 0x0a,
     325,  285,    9,    9, 0x0a,
     375,  366,    9,    9, 0x0a,
     405,  394,    9,    9, 0x0a,
     432,  426,    9,    9, 0x0a,
     454,  426,    9,    9, 0x0a,
     477,  426,    9,    9, 0x0a,
     501,  426,    9,    9, 0x0a,
     536,  527,    9,    9, 0x0a,
     560,  555,    9,    9, 0x0a,
     581,    9,    9,    9, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_GLWidget[] = {
    "GLWidget\0\0beginRendering()\0stopRendering()\0"
    "quit()\0status\0statusMessage(QString)\0"
    "fileName\0loadFileRequest(QString)\0"
    "type,x,y,width,height\0crop(int,int,int,int,int)\0"
    "selectionChanged()\0timerImpulse()\0"
    "onUpdateView()\0length\0setPathLength(int)\0"
    "shadowMapResolution\0setShadowMapResolution(int)\0"
    "method\0setPreviewMethod(EPreviewMethod)\0"
    "setToneMappingMethod(EToneMappingMethod)\0"
    "clamping\0setClamping(Float)\0srgb,gamma\0"
    "setGamma(bool,Float)\0value\0"
    "setReinhardKey(Float)\0setReinhardBurn(Float)\0"
    "setDiffuseSources(bool)\0"
    "setDiffuseReceivers(bool)\0exposure\0"
    "setExposure(Float)\0what\0onException(QString)\0"
    "onScroll()\0"
};

void GLWidget::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        GLWidget *_t = static_cast<GLWidget *>(_o);
        switch (_id) {
        case 0: _t->beginRendering(); break;
        case 1: _t->stopRendering(); break;
        case 2: _t->quit(); break;
        case 3: _t->statusMessage((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: _t->loadFileRequest((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->crop((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5]))); break;
        case 6: _t->selectionChanged(); break;
        case 7: _t->timerImpulse(); break;
        case 8: _t->onUpdateView(); break;
        case 9: _t->setPathLength((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 10: _t->setShadowMapResolution((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 11: _t->setPreviewMethod((*reinterpret_cast< EPreviewMethod(*)>(_a[1]))); break;
        case 12: _t->setToneMappingMethod((*reinterpret_cast< EToneMappingMethod(*)>(_a[1]))); break;
        case 13: _t->setClamping((*reinterpret_cast< Float(*)>(_a[1]))); break;
        case 14: _t->setGamma((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< Float(*)>(_a[2]))); break;
        case 15: _t->setReinhardKey((*reinterpret_cast< Float(*)>(_a[1]))); break;
        case 16: _t->setReinhardBurn((*reinterpret_cast< Float(*)>(_a[1]))); break;
        case 17: _t->setDiffuseSources((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 18: _t->setDiffuseReceivers((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 19: _t->setExposure((*reinterpret_cast< Float(*)>(_a[1]))); break;
        case 20: _t->onException((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 21: _t->onScroll(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData GLWidget::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GLWidget::staticMetaObject = {
    { &QGLWidget::staticMetaObject, qt_meta_stringdata_GLWidget,
      qt_meta_data_GLWidget, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GLWidget::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GLWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GLWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GLWidget))
        return static_cast<void*>(const_cast< GLWidget*>(this));
    return QGLWidget::qt_metacast(_clname);
}

int GLWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGLWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 22)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 22;
    }
    return _id;
}

// SIGNAL 0
void GLWidget::beginRendering()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void GLWidget::stopRendering()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void GLWidget::quit()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void GLWidget::statusMessage(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void GLWidget::loadFileRequest(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void GLWidget::crop(int _t1, int _t2, int _t3, int _t4, int _t5)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)), const_cast<void*>(reinterpret_cast<const void*>(&_t3)), const_cast<void*>(reinterpret_cast<const void*>(&_t4)), const_cast<void*>(reinterpret_cast<const void*>(&_t5)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void GLWidget::selectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, 0);
}
QT_END_MOC_NAMESPACE
