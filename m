Return-Path: <marcel.ziswiler@toradex.com>
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mirza.krak@gmail.com"
	<mirza.krak@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "pdeschrijver@nvidia.com"
	<pdeschrijver@nvidia.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: [Fwd: Re: [PATCH v2 1/6] clk: tegra: add TEGRA20_CLK_NOR to init
 table]
Date: Wed, 31 Aug 2016 07:15:45 +0000
Message-ID: <1472627744.31008.2.camel@toradex.com>
References: <1472569308.5703.22.camel@toradex.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

T24gV2VkLCAyMDE2LTA4LTI0IGF0IDE1OjM3ICswMjAwLCBNaXJ6YSBLcmFrIHdyb3RlOg0KPiAN
Cj4gRnJvbTogTWlyemEgS3JhayA8bWlyemEua3Jhay1SZTVKUUVlUXFlOEF2eHRpdU13eDN3QHB1
YmxpYy5nbWFuZS5vcmc+DQo+IA0KPiBBZGQgVEVHUkEyMF9DTEtfTk9SIHRvIGluaXQgdGFiZWwg
YW5kIHNldCBkZWZhdWx0IHJhdGUgdG8gOTIgTUh6DQo+IHdoaWNoDQo+IGlzIG1heCByYXRlLg0K
DQp0YWJsZQ0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaXJ6YSBLcmFrIDxtaXJ6YS5rcmFrLVJl
NUpRRWVRcWU4QXZ4dGl1TXd4M3dAcHVibGljLmcNCj4gbWFuZS5vcmc+DQo+IC0tLQ0KPiBDaGFu
Z2VzIGluIHYyOg0KPiAtIG5vIGNoYW5nZXMNCj4gDQo+IMKgZHJpdmVycy9jbGsvdGVncmEvY2xr
LXRlZ3JhMjAuYyB8IDEgKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3RlZ3JhL2Nsay10ZWdyYTIwLmMgYi9kcml2ZXJz
L2Nsay90ZWdyYS9jbGstDQo+IHRlZ3JhMjAuYw0KPiBpbmRleCA4MzdlNWNiLi4xM2QzYjVhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay90ZWdyYS9jbGstdGVncmEyMC5jDQo+ICsrKyBiL2Ry
aXZlcnMvY2xrL3RlZ3JhL2Nsay10ZWdyYTIwLmMNCj4gQEAgLTEwNDcsNiArMTA0Nyw3IEBAIHN0
YXRpYyBzdHJ1Y3QgdGVncmFfY2xrX2luaXRfdGFibGUgaW5pdF90YWJsZVtdDQo+IF9faW5pdGRh
dGEgPSB7DQo+IMKgCXsgVEVHUkEyMF9DTEtfU0RNTUMzLCBURUdSQTIwX0NMS19QTExfUCwgNDgw
MDAwMDAsIDAgfSwNCj4gwqAJeyBURUdSQTIwX0NMS19TRE1NQzQsIFRFR1JBMjBfQ0xLX1BMTF9Q
LCA0ODAwMDAwMCwgMCB9LA0KPiDCoAl7IFRFR1JBMjBfQ0xLX1NQSSwgVEVHUkEyMF9DTEtfUExM
X1AsIDIwMDAwMDAwLCAwIH0sDQo+ICsJeyBURUdSQTIwX0NMS19OT1IsIFRFR1JBMjBfQ0xLX1BM
TF9QLCA5MjAwMDAwMCwgMCB9LA0KDQpJJ20ganVzdCBjdXJpb3VzIHdoZXJlIHRoYXQgOTIgTUh6
IGNhbWUgZnJvbS4gQWNjb3JkaW5nIHRvIHRoZSBUZWdyYSAyDQpJbnRlcmZhY2UgRGVzaWduIEd1
aWRlIHVwIHRvIDEzMyBNSHogc2hvdWxkIGFjdHVhbGx5IGJlIHBvc3NpYmxlLg0KDQo+IA0KPiDC
oAl7IFRFR1JBMjBfQ0xLX1NCQzEsIFRFR1JBMjBfQ0xLX1BMTF9QLCAxMDAwMDAwMDAsIDAgfSwN
Cj4gwqAJeyBURUdSQTIwX0NMS19TQkMyLCBURUdSQTIwX0NMS19QTExfUCwgMTAwMDAwMDAwLCAw
IH0sDQo+IMKgCXsgVEVHUkEyMF9DTEtfU0JDMywgVEVHUkEyMF9DTEtfUExMX1AsIDEwMDAwMDAw
MCwgMCB9LA0KPiAtLQ0KPiAyLjEuNA==
