# propertycross-qt-flux-atomic
A Qt implementation of Property Cross leveraging Facebook's Flux and Brad Frost's Atomic Design concepts

## Setup
Requires [qpm](http://qpm.io) and an internet connection.  
Checkout the repo, then move to `src` folder and run `qpm install`.

## Build
Requires Qt 5.7.X.  
Use the provided qmake. Assets are provided for iOS and Android.

## Application design

### Logic
#### Navigation
Based on a [Declarative State Machine](http://doc.qt.io/qt-5.7/qmlstatemachine.html).  
The state machine offers a comprehensive overview of navigation between pages.  
It also makes implementing deep linking fairly straightforward.

#### Content
Loosely based on Facebook's [Flux](https://facebook.github.io/flux/).  
The vanilla implementation does not offer a queue for Stores to act upon Actions.
If such functionality is ever required, the vanilla implementation can be very quickly susbstituted with the [QuickFlux](https://github.com/benlau/quickflux) qpm package.  
Currently the role of Controller-views is upon Pages.

### User interface
Organization of components is loosely based on Brad Frost's [Atomic Design](http://atomicdesign.bradfrost.com/).  
For example, page Templates can be inspected with `qmlscene` as the actual data is only bound in Pages.
