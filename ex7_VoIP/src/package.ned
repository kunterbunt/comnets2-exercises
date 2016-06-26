package voip;

@license(LGPL);

import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.inet.StandardHost;
import ned.DatarateChannel;

network VoIPNetwork {
    @display("bgb=561,272");
    types:
        channel standardChannel extends DatarateChannel {
            delay = exponential(205ms);
            datarate = default(1Mbps);
        }
    submodules:
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=253,31");
        }
//        host1: StandardHost {
//            @display("p=108,96");
//        }
//        host2: StandardHost {
//            @display("p=431,96");
//        }        
//        host3: StandardHost {
//            @display("p=250,221");
//        }
		user[5]: StandardHost {
            @display("p=250,221");
        }
    connections:        
        user[0].pppg++ <--> standardChannel <--> user[1].pppg++;
        user[0].pppg++ <--> standardChannel <--> user[2].pppg++;
        user[0].pppg++ <--> standardChannel <--> user[3].pppg++;
        user[0].pppg++ <--> standardChannel <--> user[4].pppg++;
        
        user[1].pppg++ <--> standardChannel <--> user[0].pppg++;
        user[1].pppg++ <--> standardChannel <--> user[2].pppg++;
        user[1].pppg++ <--> standardChannel <--> user[3].pppg++;
        user[1].pppg++ <--> standardChannel <--> user[4].pppg++;
        
        user[2].pppg++ <--> standardChannel <--> user[0].pppg++;
        user[2].pppg++ <--> standardChannel <--> user[1].pppg++;
        user[2].pppg++ <--> standardChannel <--> user[3].pppg++;
        user[2].pppg++ <--> standardChannel <--> user[4].pppg++;
        
        user[3].pppg++ <--> standardChannel <--> user[0].pppg++;
        user[3].pppg++ <--> standardChannel <--> user[1].pppg++;
        user[3].pppg++ <--> standardChannel <--> user[2].pppg++;
        user[3].pppg++ <--> standardChannel <--> user[4].pppg++;
        
        user[4].pppg++ <--> standardChannel <--> user[0].pppg++;
        user[4].pppg++ <--> standardChannel <--> user[1].pppg++;
        user[4].pppg++ <--> standardChannel <--> user[2].pppg++;
        user[4].pppg++ <--> standardChannel <--> user[3].pppg++;
//        host1.pppg++ <--> standardChannel <--> host2.pppg++;
//        host2.pppg++ <--> standardChannel <--> host1.pppg++;
//        host1.pppg++ <--> standardChannel <--> host3.pppg++;
//        host3.pppg++ <--> standardChannel <--> host1.pppg++;
//        host3.pppg++ <--> standardChannel <--> host2.pppg++;
//        host2.pppg++ <--> standardChannel <--> host3.pppg++;
}
