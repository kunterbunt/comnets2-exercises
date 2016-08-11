package exam_project;

import inet.applications.udpapp.UDPBasicApp;

simple VideoStreamApp extends UDPBasicApp {
    parameters:
        double acceptableDelay @unit(s) = default(0.2s);
        
    @class(VideoStreamApp);    
}