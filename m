Return-Path: <ping.bai@nxp.com>
From: Jacky Bai <ping.bai@nxp.com>
To: Stephen Boyd <sboyd@kernel.org>, Stefan Agner <stefan@agner.ch>
CC: Shawn Guo <shawnguo@kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] clk: imx6ull: use OSC clock during AXI rate change
Date: Wed, 9 May 2018 01:26:38 +0000
Message-ID: 
 <HE1PR04MB3113135433766196E708685887990@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <20180418124908.3079-1-stefan@agner.ch>
 <20180502073807.GE3443@dragon> <56a409cf76a3eaa713cb4f0bbe1e39b6@agner.ch>
 <HE1PR04MB311395765D3DC03D5960DBA3879A0@HE1PR04MB3113.eurprd04.prod.outlook.com>
 <4188ee25bd5179b57d09e4624dcfbfbb@agner.ch>
 <152580354289.138124.13657232356773397650@swboyd.mtv.corp.google.com>
In-Reply-To: 
 <152580354289.138124.13657232356773397650@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IGlteDZ1bGw6IHVzZSBPU0MgY2xvY2sgZHVyaW5n
IEFYSSByYXRlIGNoYW5nZQ0KPiANCj4gUXVvdGluZyBTdGVmYW4gQWduZXIgKDIwMTgtMDUtMDgg
MDY6MjA6MDMpDQo+ID4gT24gMDguMDUuMjAxOCAwOTozMiwgSmFja3kgQmFpIHdyb3RlOg0KPiA+
ID4NCj4gPiA+IEkgaGF2ZSB0cmllZCB0d28gNlVMTCBib2FyZCwgSSBkb24ndCBtZWV0IHN1Y2gg
aXNzdWUuIFN5c3RlbSBjYW4NCj4gPiA+IGJvb3QgdXAgc3VjY2Vzc2Z1bGx5IHdpdGggY29tbWl0
IDZmOTU3NWU1NTYzMiBpbmNsdWRlZC4NCj4gPiA+IEFueXdheSwgdGhlIGNoYW5nZSBpbiB0aGlz
IHBhdGNoIGlzIG9rIGZvciBtZS4gaXQgaXMgbm8gaGFybSB0byB0aGUNCj4gPiA+IEJVUyBjbG9j
ayBjaGFuZ2UgZmxvdy4NCj4gPg0KPiA+IEhtLCB0aGF0IGlzIGludGVyZXN0aW5nLCBtYXliZSBp
dCBpcyBiZWNhdXNlIHdlIHVzZSBhIGRpZmZlcmVudCBTS1U/DQo+ID4gT3IgbWF5YmUgYm9vdGxv
YWRlcj8NCj4gPg0KPiA+IEkgdGVzdGVkIGhlcmUgd2l0aCBhIDgwMCBNSHogY2xvY2tlZCB2YXJp
YW50IG9uIGEgQ29saWJyaSBpTVg2VUxMDQo+ID4gdXNpbmcgVS1Cb290IDIwMTYuMTEuDQo+ID4N
Cj4gDQo+IEknbGwgdGhyb3cgdGhpcyBpbnRvIGZpeGVzIHRvZGF5IGJlY2F1c2UgaXQgZml4ZXMg
c29tZXRoaW5nIHRvIGJlIHVzZWZ1bC4gSXQncyBzdGlsbA0KPiBpbnRlcmVzdGluZyB0byBzZWUg
d2hhdCdzIGRpZmZlcmVudCBiZXR3ZWVuIHRoZSB0d28gc2V0dXBzIHRob3VnaC4NCg0KVGhhbmtz
LiANCg0KSSB3aWxsIGZpbmQgc29tZSA4MDBNSHogcGFydHMgYW5kIGhhdmUgYSB0cnkgd2l0aCBk
aWZmZXJlbnQgYm9vdGxvYWRlciBsYXRlci4NCldpbGwgbGV0IHlvdSBrbm93LCB3aGVuIEkgaGF2
ZSBzb21lIHJlc3VsdHMuDQoNCkphY2t5DQo=
