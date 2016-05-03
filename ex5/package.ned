package ex5;

@license(LGPL);

import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.inet.StandardHost;

network Ex5Network
{
    @display("bgb=324,210");
    types:
        channel Channel extends ned.DatarateChannel {
            datarate = 1Mbps;
            delay = 200ms;
            ber = 1e-7;
        }
    submodules:
        server: StandardHost {
            @display("p=272,100");
        }
        client: StandardHost {
            @display("p=59,100");
        }
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=165,38");
        }
    connections:
        server.pppg++ <--> Channel <--> client.pppg++;
}
