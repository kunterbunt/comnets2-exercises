package ex7;

@license(LGPL);



import inet.examples.adhoc.hostautoconf.Host;
import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import inet.nodes.internetcloud.InternetCloud;
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
            datarate = default(40kbps);
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
        internetCloud: InternetCloud {
            @display("p=229,60");
        }
    connections:
        for i=0..4 {
            backendRouter[i].pppg++ <--> backendGateaway <--> internetCloud.pppg++;
        }
        for i=0..4, for j=0..4 {
            backendRouter[i].pppg++ <--> routerBackend <--> endRouter[j+i*5].pppg++;
        }
        for i=0..24, for j=0..4 {
            endRouter[i].pppg++ <--> clientRouter <--> user[j+i*25].pppg++;
        }

}

