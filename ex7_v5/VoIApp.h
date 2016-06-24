#ifndef VOIAPP_H_
#define VOIAPP_H_

#include <UDPBasicApp.h>

class VoIApp: public inet::UDPBasicApp {
public:
    VoIApp();
    virtual ~VoIApp();
};

#endif /* VOIAPP_H_ */
