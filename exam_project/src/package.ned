package exam_project;

import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.ethernet.Eth100M;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import inet.nodes.inet.WirelessHost;
import inet.nodes.wireless.AccessPoint;
import inet.world.radio.ChannelControl;
import ned.DatarateChannel;

@license(LGPL);

network UniversityNetwork
{
    @display("bgb=662,419");
    types:
        channel InternetChannel extends DatarateChannel
        {
            delay = exponential(30ms);
            datarate = 100Mbps;
        }
        channel DFNChannel extends DatarateChannel
        {
            delay = 5ms;
            datarate = 100Mbps;
        }
        channel BackupChannel extends DatarateChannel
        {
            delay = 10ms;
            datarate = 12Mbps;
        }
    submodules:
        CCTV: StandardHost {
            @display("p=258,319");
        }
        CCTVMonitoring: StandardHost {
            @display("p=488,319");
        }
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=342,44");
        }
        main: Router {
            @display("p=488,227");
        }
        remote: Router {
            @display("p=258,227");
        }
        Internet: StandardHost {
            @display("p=578,116");
        }
        Professor: StandardHost {
            @display("p=432,116");
        }
        accessPoint: AccessPoint {
            @display("p=101,226");
        }
        FTPUploader: WirelessHost {
            @display("p=101,152");
        }
        channelControl: ChannelControl {
            @display("p=192,43");
        }
        Conference: WirelessHost {
            @display("p=192,152");
        }
        Students[2]: WirelessHost {
            @display("p=41,308");
        }
    connections:
        remote.pppg++ <--> BackupChannel <--> main.pppg++;
        main.pppg++ <--> Eth100M <--> CCTVMonitoring.pppg++;        
        remote.pppg++ <--> Eth100M <--> CCTV.pppg++;
        Internet.pppg++ <--> InternetChannel <--> main.pppg++;
        Professor.pppg++ <--> DFNChannel <--> main.pppg++;

        remote.ethg++ <--> Eth100M <--> accessPoint.ethg++;
}
