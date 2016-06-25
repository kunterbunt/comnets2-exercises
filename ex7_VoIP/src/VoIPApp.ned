package voip;

import inet.applications.udpapp.UDPBasicApp;

simple VoIPApp extends UDPBasicApp {
    parameters:
        double acceptableDelay @unit(s) = default(0.2s);
        
    @class(VoIPApp);    
}