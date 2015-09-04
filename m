Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bl2on0144.outbound.protection.outlook.com ([65.55.169.144]:6894
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1760525AbbIDUKc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 4 Sep 2015 16:10:32 -0400
From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
To: Li Leo <LeoLi@freescale.com>
CC: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>,
	"bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"olof@lixom.net" <olof@lixom.net>
Subject: RE: [PATCH v2 01/10] arm64: Use generic Layerscape SoC family naming
 & rename LS2085A to LS2080A
Date: Fri, 4 Sep 2015 20:10:30 +0000
Message-ID: <BY1PR0301MB13036EDCAC8E826853A71CB282570@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441349872-4560-2-git-send-email-bhupesh.sharma@freescale.com>
 <CADRPPNQbTPrJ47SKsA=EaPi7xo8+0hQqEpt3wDPKMbL1vTOr9A@mail.gmail.com>
In-Reply-To: <CADRPPNQbTPrJ47SKsA=EaPi7xo8+0hQqEpt3wDPKMbL1vTOr9A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

PiBGcm9tOiBwa3UubGVvQGdtYWlsLmNvbSBbbWFpbHRvOnBrdS5sZW9AZ21haWwuY29tXQ0KPiBT
ZW50OiBGcmlkYXksIFNlcHRlbWJlciAwNCwgMjAxNSAxMDowMSBQTQ0KPiBPbiBGcmksIFNlcCA0
LCAyMDE1IGF0IDE6NTcgQU0sIEJodXBlc2ggU2hhcm1hDQo+IDxiaHVwZXNoLnNoYXJtYUBmcmVl
c2NhbGUuY29tPiB3cm90ZToNCj4gPiBGcmVlc2NhbGUgd2lsbCBiZSBhIGNodXJuaW5nIG91dCBh
IGhvc3Qgb2YgQVJNdjggYmFzZWQgU29DcyB3aGljaCB3aWxsDQo+ID4gYmUgYmFzZWQgb24gYSBz
aW1pbGFyIG92ZXJhbGwgU29DIGFyY2hpdGVjdHVyZS4gU28sIHRoaXMgcGF0Y2gNCj4gPiBjb252
ZXJ0cyB0aGUgZXhpc3RpbmcgaW5mcmFzdHJ1Y3R1cmUgaW4gdGhlIGFybTY0L2R0cywgYXJtNjQv
S2NvbmZpZw0KPiA+IGFuZCBhcm02NC9jb25maWdzIHRvIHVzZSB0aGUgZ2VuZXJpYyBjb252ZW50
aW9uIEFSQ0hfTEFZRVJTQ0FQRSBpbg0KPiA+IHBsYWNlIG9mIHRoZSBtb3JlIHNwZWNpZmljIEZT
TF9MUzIwODVBLCB0byBzYXZlIGNvZGUgZHVwbGljYXRpb24NCj4gPiBsYXRlci1vbi4NCj4gPg0K
PiA+IEFsc28gRnJlZXNjYWxlIGlzIHJlbmFtaW5nIExTMjA4NUEgdG8gTFMyMDgwQS4NCj4gPg0K
PiA+IFRoaXMgcGF0Y2ggYWRkcmVzc2VzIHRoZSBhYm92ZSB0d28gcG9pbnRzLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmh1cGVzaCBTaGFybWEgPGJodXBlc2guc2hhcm1hQGZyZWVzY2FsZS5j
b20+DQo+ID4gLS0tDQo+IHtzbmlwfQ0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2ZzbC1sczIwODVhLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMyMDgwYS5kdHNpDQo+ID4gQEAgLTEsNyArMSw3IEBADQo+ID4gIC8qDQo+
ID4gLSAqIERldmljZSBUcmVlIEluY2x1ZGUgZmlsZSBmb3IgRnJlZXNjYWxlIExheWVyc2NhcGUt
MjA4NUEgZmFtaWx5IFNvQy4NCj4gPiArICogRGV2aWNlIFRyZWUgSW5jbHVkZSBmaWxlIGZvciBG
cmVlc2NhbGUgTGF5ZXJzY2FwZS0yMDgwQSBmYW1pbHkgU29DLg0KPiA+ICAgKg0KPiA+IC0gKiBD
b3B5cmlnaHQgKEMpIDIwMTQsIEZyZWVzY2FsZSBTZW1pY29uZHVjdG9yDQo+ID4gKyAqIENvcHly
aWdodCAoQykgMjAxNC0xNSwgRnJlZXNjYWxlIFNlbWljb25kdWN0b3INCj4gDQo+IE5vcm1hbGx5
IHdlIHNwZWxsIG91dCB0aGUgd2hvbGUgMjAxNS4gIFRoZSBwcmVmZXJyZWQgY29weXJpZ2h0IHRl
bXBsYXRlDQo+IGlzOg0KPiANCj4gQ29weXJpZ2h0IDIwMTQtMjAxNSBGcmVlc2NhbGUgU2VtaWNv
bmR1Y3RvciwgSW5jLg0KPiANCg0KT2suDQoNClJlZ2FyZHMsDQpCaHVwZXNoDQo=
