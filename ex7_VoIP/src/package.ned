package voip;

@license(LGPL);

import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.inet.StandardHost;
import ned.DatarateChannel;

network VoIPNetwork
{
    @display("bgb=561,272");
    types:
        channel standardChannel extends DatarateChannel
        {
            delay = exponential(210ms);
            datarate = default(1Mbps);
        }
    submodules:
        host1: StandardHost {
            @display("p=108,96");
        }
        host2: StandardHost {
            @display("p=431,96");
        }
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=253,31");
        }
        host3: StandardHost {
            @display("p=250,221");
        }
    connections:
        host1.pppg++ <--> standardChannel <--> host2.pppg++;
        host1.pppg++ <--> standardChannel <--> host3.pppg++;
        host3.pppg++ <--> standardChannel <--> host2.pppg++;
}
