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
Subject: Re: [PATCH v2 2/6] clk: tegra: add TEGRA30_CLK_NOR to init table
Date: Wed, 31 Aug 2016 07:17:00 +0000
Message-ID: <1472627819.31008.4.camel@toradex.com>
References: <1472569320.5703.23.camel@toradex.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

T24gV2VkLCAyMDE2LTA4LTI0IGF0IDE1OjM3ICswMjAwLCBNaXJ6YSBLcmFrIHdyb3RlOg0KPiAN
Cj4gRnJvbTogTWlyemEgS3JhayA8bWlyemEua3Jhay1SZTVKUUVlUXFlOEF2eHRpdU13eDN3QHB1
YmxpYy5nbWFuZS5vcmc+DQo+IA0KPiBBZGQgVEVHUkEzMF9DTEtfTk9SIHRvIGluaXQgdGFibGUg
YW5kIHNldCBkZWZhdWx0IHJhdGUgdG8gMTI3IE1Ieg0KPiB3aGljaA0KPiBpcyBtYXggcmF0ZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pcnphIEtyYWsgPG1pcnphLmtyYWstUmU1SlFFZVFxZThB
dnh0aXVNd3gzd0BwdWJsaWMuZw0KPiBtYW5lLm9yZz4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6
DQo+IC0gbm8gY2hhbmdlcw0KPiANCj4gwqBkcml2ZXJzL2Nsay90ZWdyYS9jbGstdGVncmEzMC5j
IHwgMSArDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvdGVncmEvY2xrLXRlZ3JhMzAuYyBiL2RyaXZlcnMvY2xrL3RlZ3Jh
L2Nsay0NCj4gdGVncmEzMC5jDQo+IGluZGV4IDhlMmRiNWUuLjY3ZjE2NzcgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvY2xrL3RlZ3JhL2Nsay10ZWdyYTMwLmMNCj4gKysrIGIvZHJpdmVycy9jbGsv
dGVncmEvY2xrLXRlZ3JhMzAuYw0KPiBAQCAtMTI1Miw2ICsxMjUyLDcgQEAgc3RhdGljIHN0cnVj
dCB0ZWdyYV9jbGtfaW5pdF90YWJsZSBpbml0X3RhYmxlW10NCj4gX19pbml0ZGF0YSA9IHsNCj4g
wqAJeyBURUdSQTMwX0NMS19TRE1NQzEsIFRFR1JBMzBfQ0xLX1BMTF9QLCA0ODAwMDAwMCwgMCB9
LA0KPiDCoAl7IFRFR1JBMzBfQ0xLX1NETU1DMiwgVEVHUkEzMF9DTEtfUExMX1AsIDQ4MDAwMDAw
LCAwIH0sDQo+IMKgCXsgVEVHUkEzMF9DTEtfU0RNTUMzLCBURUdSQTMwX0NMS19QTExfUCwgNDgw
MDAwMDAsIDAgfSwNCj4gKwl7IFRFR1JBMzBfQ0xLX05PUiwgVEVHUkEzMF9DTEtfUExMX1AsIDEy
NzAwMDAwMCwgMCB9LA0KDQpUaGUgVGVncmEgMyBJbnRlcmZhY2UgRGVzaWduIEd1aWRlIHN0YXRl
cyB0aGUgc2FtZSAxMzMgTUh6Lg0KDQo+IA0KPiDCoAl7IFRFR1JBMzBfQ0xLX1BMTF9NLCBURUdS
QTMwX0NMS19DTEtfTUFYLCAwLCAxIH0sDQo+IMKgCXsgVEVHUkEzMF9DTEtfUENMSywgVEVHUkEz
MF9DTEtfQ0xLX01BWCwgMCwgMSB9LA0KPiDCoAl7IFRFR1JBMzBfQ0xLX0NTSVRFLCBURUdSQTMw
X0NMS19DTEtfTUFYLCAwLCAxIH0sDQo+IC0tDQo+IDIuMS40
