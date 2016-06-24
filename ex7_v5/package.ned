package ex7_v5;

@license(LGPL);

import inet.examples.adhoc.hostautoconf.Host;
import inet.networklayer.configurator.ipv4.FlatNetworkConfigurator;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import ned.DatarateChannel;

network Ex7Network
{
    @display("bgb=398,307");
    types:
        channel backendGateaway extends DatarateChannel
        {
            delay = default(10ms);
            datarate = default(10Mbps);
        }
        channel routerBackend extends DatarateChannel
        {
            delay = default(15ms);
            datarate = default(2Mbps);
        }
        channel clientRouter extends DatarateChannel
        {
            delay = default(40ms);
            volatile double datarate1 @unit(Mbps);
            datarate = default(datarate1);
        }
        channel internetLink extends DatarateChannel
        {
            delay = default(0ms);
            datarate = default(100Mbps);
        }
        
    submodules:
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=77,29");
        }
        backendRouter[5]: Router {
            @display("p=120,149");
        }
        endRouter[25]: Router {
            @display("p=302,159");
        }

        user[625]: StandardHost {
            @display("p=126,259");
        }
        internetRouter: Router {
            @display("p=229,60");
        }
        httpServer: StandardHost {
            @display("p=341,43");
        }
    connections:
        httpServer.pppg++ <--> internetLink <--> internetRouter.pppg++;
        for i=0..4 {
            backendRouter[i].pppg++ <--> backendGateaway <--> internetRouter.pppg++;
        }
        for i=0..4, for j=0..4 {
            backendRouter[i].pppg++ <--> routerBackend <--> endRouter[j+i*5].pppg++;
        }
        for i=0..24, for j=0..4 {
            endRouter[i].pppg++ <--> clientRouter <--> user[j+i*25].pppg++;
        }

}
