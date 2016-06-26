package voip;

@license(LGPL);

import inet.examples.adhoc.hostautoconf.Host;
import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import ned.DatarateChannel;

network VoIPNetwork
{
    @display("bgb=661,380");
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
            @display("p=139,92");
        }
        backendRouter[5]: Router {
            @display("p=238,206");
        }
        endRouter[25]: Router {
            @display("p=420,216");
        }

        user[625]: StandardHost {
            @display("p=244,316");
        }
        internetRouter: Router {
            @display("p=347,117");
        }
        httpServer: StandardHost {
            @display("p=459,100");
        }
    connections:
        httpServer.pppg++ <--> internetLink <--> internetRouter.pppg++;
        for i=0..4 {
            backendRouter[i].pppg++ <--> backendGateaway <--> internetRouter.pppg++;
        }
        for i=0..4, for j=0..4 {
            backendRouter[i].pppg++ <--> routerBackend <--> endRouter[j+i*5].pppg++;
        }
        for i=0..24, for j=0..24 {
            endRouter[i].pppg++ <--> clientRouter <--> user[j+i*25].pppg++;
            user[j+i*25].pppg++ <--> clientRouter <--> endRouter[i].pppg++;
        }

}
