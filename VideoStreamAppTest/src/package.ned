package videostreamapptest;

import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.ethernet.Eth1G;
import inet.nodes.inet.StandardHost;


@license(LGPL);

network Network
{
    @display("bgb=945,562");
    submodules:
        host1: StandardHost {
            @display("p=252,232");
        }
        host2: StandardHost {
            @display("p=683,232");
        }
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=473,50");
        }
    connections:
        host1.pppg++ <--> Eth1G <--> host2.pppg++;
}
