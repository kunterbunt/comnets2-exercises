#include <omnetpp.h>
#include <UDPBasicApp.h>

class VideoStreamApp: public UDPBasicApp {
public:

protected:
    typedef UDPBasicApp super;

    void initialize(int stage) override {
        super::initialize(stage);
        this->durationSum = 0;
        this->avgDuration = 0;
        this->numTooLatePackets = 0;
        this->acceptableDelay = par("acceptableDelay").doubleValue();;
        this->errorRate = 0;
    }

    void sendPacket() override {
        char msgName[32];
        // Put current time into message name.
        simtime_t now = simTime();
        sprintf(msgName, "UDPBasicAppData-%f", now.dbl());
        cPacket *payload = new cPacket(msgName);
        payload->setByteLength(par("messageLength").longValue());

        IPvXAddress destAddr = chooseDestAddr();

        emit(sentPkSignal, payload);
        socket.sendTo(payload, destAddr, destPort);
        numSent++;
    }

    void processPacket(cPacket *pk) override {
        numReceived++;
        emit(rcvdPkSignal, pk);

        // Get exact duration of packet transmission.
        char substring[16];
        strncpy(substring, pk->getFullName() + 16, 16);
        simtime_t timePkWasSent = SimTime(atof(substring));
        simtime_t now = simTime();
        simtime_t duration = now - timePkWasSent;
        // Was it too late?
        this->durationSum += duration.dbl();
        this->avgDuration = this->durationSum / this->numReceived;
        delete pk;
        if (duration.dbl() > acceptableDelay) {
            this->numTooLatePackets++;
            EV << "numTooLatePackets=" << numTooLatePackets << " numRecieved=" << this->numReceived << " errorRate=" << errorRate << endl;
            EV << "Dropping packet that was too late; had a duration of " << duration << ". #dropped=" << numTooLatePackets << endl;
        } else {
            EV << "Received packet: sent@" << timePkWasSent.dbl() << " recvd@" << now.dbl() << " -> duration=" << duration << " avgDur=" << this->avgDuration << endl;
        }
    }

    void finish() override {
        this->errorRate = ((double) numTooLatePackets) / ((double) this->numReceived);
        recordScalar("#droppedBecauseLate", numTooLatePackets);
        recordScalar("avgDuration", avgDuration);
        recordScalar("error rate", errorRate);
        super::finish();
    }

    double durationSum;
    double avgDuration;
    double acceptableDelay;
    double errorRate;
    int numTooLatePackets;
};

Define_Module(VideoStreamApp);
