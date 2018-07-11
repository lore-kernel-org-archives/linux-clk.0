Return-Path: <leonard.crestez@nxp.com>
From: Leonard Crestez <leonard.crestez@nxp.com>
To: "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cyndis@kapsi.fi" <cyndis@kapsi.fi>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: core: Potentially free connection id
Date: Wed, 11 Jul 2018 10:17:10 +0000
Message-ID: <4b809427e9b922ba41efafb20a97e0698e9cd3d0.camel@nxp.com>
References: <20180711082104.27955-1-mperttunen@nvidia.com>
In-Reply-To: <20180711082104.27955-1-mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

T24gV2VkLCAyMDE4LTA3LTExIGF0IDExOjIxICswMzAwLCBNaWtrbyBQZXJ0dHVuZW4gd3JvdGU6
DQo+IFBhdGNoICJjbGs6IGNvcmU6IENvcHkgY29ubmVjdGlvbiBpZCIgbWFkZSBpdCBzbyB0aGF0
IHRoZSBjb25uZWN0b3INCj4gaWQgKGNvbl9pZCkgaXMga3N0cmR1cF9jb25zdCdlZCB0byBjYXRl
ciB0byBkcml2ZXJzIHRoYXQgcGFzcyBub24tDQo+IGNvbnN0YW50IGNvbm5lY3Rpb24gaWRzLiBU
aGUgcGF0Y2ggYWRkZWQgdGhlIGNvcnJlc3BvbmRpbmcNCj4ga2ZyZWVfY29uc3QNCj4gdG8gX19j
bGtfZnJlZV9jbGssIGJ1dCBzdHJ1Y3QgY2xrJ3MgY2FuIGJlIGZyZWVkIGFsc28gdmlhIF9fY2xr
X3B1dC4NCj4gQWRkIHRoZSBrZnJlZV9jb25zdCBjYWxsIHRvIF9fY2xrX3B1dCBhbmQgYWRkIGNv
bW1lbnRzIHRvIGJvdGgNCj4gZnVuY3Rpb25zIHRvIHJlbWluZCB0aGF0IHRoZSBsb2dpYyBpbiB0
aGVtIHNob3VsZCBiZSBrZXB0IGluIHN5bmMuDQo+IA0KPiBGaXhlczogMjUzMTYwYThhZDA2ICgi
Y2xrOiBjb3JlOiBDb3B5IGNvbm5lY3Rpb24gaWQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNaWtrbyBQ
ZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4NCg0KWWVzLCBzb3JyeSBJIG1pc3NlZCB0
aGlzLg0KDQpSZXZpZXdlZC1ieTogTGVvbmFyZCBDcmVzdGV6IDxsZW9uYXJkLmNyZXN0ZXpAbnhw
LmNvbT4NCg0KTWF5YmUgYSBzdGF0aWMgX19jbGtfZnJlZV9tZW0gZnVuY3Rpb24gY291bGQgYmUg
Y3JlYXRlZCBpbnN0ZWFkIG9mDQpjb21tZW50cyBhc2tpbmcgdG8ga2VlcCB0aGluZ3MgaW4gc3lu
Yz8gQnV0IHRoZXJlIGFyZSBvbmx5IDIgbGluZXMgc28NCml0J3MgZmluZS4=
