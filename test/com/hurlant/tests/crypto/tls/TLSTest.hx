/**
 * TLSTest
 * 
 * A test class for TLS. Not a finished product.
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.tls;

//import com.hurlant.crypto.tls.MyCert;
//import com.hurlant.crypto.tls.MyKey;

class TLSTest extends BaseTestCase {
    /*
    public var myDebugData:String;

    //[Embed(source="/src/host.cert",mimeType="application/octet-stream")]
    public var myCert:Class<Dynamic>;
    //[Embed(source="/src/host.key",mimeType="application/octet-stream")]
    public var myKey:Class<Dynamic>;

    public function new(host:String = null, port:Int = 0, type:Int = 0) {
        //loopback();
        if (host != null) {
            if (type == 0) { // SSL 3.0
                connectLoginYahooCom();
            } else {
                connectLocalTLS(host, port);
            }
        }
        else {
            testSocket();
        }
    }

    public function connectLoginYahooCom():Void {
        trace("Connecting test socket");
        var s = new Socket("esx.bluebearllc.net", 903);

        var clientConfig = new TLSConfig(
        TLSEngine.CLIENT,
        null,
        null,
        null,
        null,
        null,
        SSLSecurityParameters.PROTOCOL_VERSION
        );

        var client:TLSEngine = new TLSEngine(clientConfig, s, s);
        // hook some events.
        s.addEventListener(ProgressEvent.SOCKET_DATA, client.dataAvailable);
        client.addEventListener(ProgressEvent.SOCKET_DATA, function(e:Dynamic):Void {s.flush();
        });
        client.start();
    }

    public function connectLocalTLS(host:String, port:Int):Void {
        var s:Socket = new Socket(host, port);

        var clientConfig:TLSConfig = new TLSConfig(TLSEngine.CLIENT);

        var client:TLSEngine = new TLSEngine(clientConfig, s, s);
        // hook some events.
        s.addEventListener(ProgressEvent.SOCKET_DATA, client.dataAvailable);
        client.addEventListener(ProgressEvent.SOCKET_DATA, function(e:Dynamic):Void {s.flush();
        });

        client.start();
    }

    public function connectLocalSSL(host:String, port:Int):Void {
        var s:Socket = new Socket(host, port);

        var clientConfig = new TLSConfig(TLSEngine.CLIENT, null, null, null, null, null, SSLSecurityParameters.PROTOCOL_VERSION);
        var client = new TLSEngine(clientConfig, s, s);
        // hook some events.
        s.addEventListener(ProgressEvent.SOCKET_DATA, client.dataAvailable);
        client.addEventListener(ProgressEvent.SOCKET_DATA, function(e:Dynamic):Void {s.flush();
        });

        client.start();
    }

    public function loopback():Void {

        var server_write:ByteArray = new ByteArray();
        var client_write:ByteArray = new ByteArray();
        var server_write_cursor:Int = 0;
        var client_write_cursor:Int = 0;

        var clientConfig:TLSConfig = new TLSConfig(TLSEngine.CLIENT, null, null, null, null, null, SSLSecurityParameters.PROTOCOL_VERSION);
        var serverConfig:TLSConfig = new TLSConfig(TLSEngine.SERVER, null, null, null, null, null, SSLSecurityParameters.PROTOCOL_VERSION);


        var cert:ByteArray = Type.createInstance(myCert, []);
        var key:ByteArray = Type.createInstance(myKey, []);
        serverConfig.setPEMCertificate(cert.readUTFBytes(cert.length), key.readUTFBytes(key.length));
        // tmp, for debugging. currently useless
        cert.position = 0;
        key.position = 0;
        clientConfig.setPEMCertificate(cert.readUTFBytes(cert.length), key.readUTFBytes(key.length));
        // put the server cert in the client's trusted store, to keep things happy.
        clientConfig.CAStore = new X509CertificateCollection();
        cert.position = 0;
        var x509:X509Certificate = new X509Certificate(PEM.readCertIntoArray(cert.readUTFBytes(cert.length)));
        clientConfig.CAStore.addCertificate(x509);


        var server:TLSEngine = new TLSEngine(serverConfig, client_write, server_write);
        var client:TLSEngine = new TLSEngine(clientConfig, server_write, client_write);

        server.addEventListener(ProgressEvent.SOCKET_DATA, function(e:Dynamic = null):Void {
            trace("server wrote something!");
            trace(Hex.fromArray(server_write));
            var l:Int = server_write.position;
            server_write.position = server_write_cursor;
            client.dataAvailable(e);
            server_write.position = l;
            server_write_cursor = l;
        });
        client.addEventListener(ProgressEvent.SOCKET_DATA, function(e:Dynamic = null):Void {
            trace("client wrote something!");
            trace(Hex.fromArray(client_write));
            var l:Int = client_write.position;
            client_write.position = client_write_cursor;
            server.dataAvailable(e);
            client_write.position = l;
            client_write_cursor = l;
        });

        server.start();
        client.start();
    }

    public function testSocket():Void {
        var hosts = [
            "bugs.adobe.com", // apache
            "login.yahoo.com", // apache, bigger response
            "login.live.com", // IIS-6, chain of 3 certs
            "banking.wellsfargo.com", // custom, sends its CA cert along for the ride.
            "www.bankofamerica.com" // sun-one, chain of 3 certs
        ];
        var i:Int = 0;
        (function next() : Void{
        testHost(hosts[i++], next);
        })();
    }

    private function testHost(host:String, next:Function):Void {
        if (host == null) return;
        var t1:Int = Math.round(haxe.Timer.stamp() * 1000);

        var t = new TLSSocket();
        t.connect(host, 4433);
        t.writeUTFBytes("GET / HTTP/1.0\nHost: " + host + "\n\n");
        t.addEventListener(Event.CLOSE, function(e:Dynamic):Void {
            var s:String = t.readUTFBytes(t.bytesAvailable);
            trace("Response from " + host + ": " + s.length + " characters");
            var bytes:ByteArray = new ByteArray();
            t.readBytes(bytes, 0, t.bytesAvailable);
            trace(Hex.fromArray(bytes));
            trace("Time used = " + (Math.round(haxe.Timer.stamp() * 1000) - t1) + "ms");
            next();
        });
    }
    */
}
