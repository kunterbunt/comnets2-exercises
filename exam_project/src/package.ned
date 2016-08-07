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
        }
        channel BackupChannel extends DatarateChannel
        {
            delay = 10ms;
            datarate = 12Mbps;
        }
    submodules:
        remote: Router {
            @display("p=258,194");
        }
        main: Router {
            @display("p=488,194");
        }
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=308,31");
        }
        CCTV: StandardHost {
            @display("p=258,319");
        }
        accessPoint: AccessPoint {
            @display("p=96,193");
        }
        CCTVMonitoring: StandardHost {
            @display("p=488,319");
        }
        Internet: StandardHost {
            @display("p=568,80");
        }
        Professor: StandardHost {
            @display("p=421,80");
        }
        Conference: WirelessHost {
            @display("p=38,111");
        }
        FTPUploader: WirelessHost {
            @display("p=135,129");
        }
        Students[2]: WirelessHost {
            @display("p=38,283");
        }
        channelControl: ChannelControl {
            @display("p=118,44");
        }
    connections:
        remote.ethg++ <--> Eth100M <--> CCTV.ethg++;
        remote.ethg++ <--> Eth100M <--> accessPoint.ethg++;
        remote.pppg++ <--> BackupChannel <--> main.pppg++;
        main.ethg++ <--> Eth100M <--> CCTVMonitoring.ethg++;
        main.ethg++ <--> InternetChannel <--> Internet.ethg++;
        main.pppg++ <--> DFNChannel <--> Professor.pppg++;
}
