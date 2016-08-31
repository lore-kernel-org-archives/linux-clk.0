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
Subject: Re: [PATCH v2 5/6] ARM: tegra: Add Tegra20 GMI support
Date: Wed, 31 Aug 2016 07:18:47 +0000
Message-ID: <1472627926.31008.7.camel@toradex.com>
References: <1472569349.5703.25.camel@toradex.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

T24gV2VkLCAyMDE2LTA4LTI0IGF0IDE1OjM3ICswMjAwLCBNaXJ6YSBLcmFrIHdyb3RlOg0KPiAN
Cj4gRnJvbTogTWlyemEgS3JhayA8bWlyemEua3Jhay1SZTVKUUVlUXFlOEF2eHRpdU13eDN3QHB1
YmxpYy5nbWFuZS5vcmc+DQo+IA0KPiBBZGQgYSBkZXZpY2Ugbm9kZSBmb3IgdGhlIEdNSSBjb250
cm9sbGVyIGZvdW5kIG9uIFRlZ3JhMjAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaXJ6YSBLcmFr
IDxtaXJ6YS5rcmFrLVJlNUpRRWVRcWU4QXZ4dGl1TXd4M3dAcHVibGljLmcNCj4gbWFuZS5vcmc+
DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIGFkZGVkIGFkZHJlc3MtY2VsbHMsIHNpemUt
Y2VsbHMgYW5kIHJhbmdlcyBwcm9wZXJ0aWVzDQo+IA0KPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3Rl
Z3JhMjAuZHRzaSB8IDE0ICsrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy90ZWdyYTIw
LmR0c2kNCj4gYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTIwLmR0c2kNCj4gaW5kZXggMjIwN2Mw
OC4uMDNlYjAyOSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEyMC5kdHNp
DQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMjAuZHRzaQ0KPiBAQCAtMzc2LDYgKzM3
NiwyMCBAQA0KPiDCoAkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gwqAJfTsNCj4gDQo+ICsNCj4g
KwlnbWlANzAwMDkwMDAgew0KPiArCQljb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTIwLWdtaSI7
DQo+ICsJCXJlZyA9IDw3MDAwOTAwMCAweDEwMDA+Ow0KPiArCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsNCj4gKwkJI3NpemUtY2VsbHMgPSA8MT47DQo+ICsJCXJhbmdlcyA9IDwwIDB4NDgwMDAwMDAg
MHg3ZmZmZmZmPjsNCg0KT24gVDIwIGl0IGlzIGFjdHVhbGx5IHJhdGhlciAweGQwMDAwMDAwLg0K
DQo+IA0KPiArCQljbG9ja3MgPSA8JnRlZ3JhX2NhciBURUdSQTIwX0NMS19OT1I+Ow0KPiArCQlj
bG9jay1uYW1lcyA9ICJnbWkiOw0KPiArCQlyZXNldHMgPSA8ICZ0ZWdyYV9jYXIgNDI+Ow0KPiAr
CQlyZXNldC1uYW1lcyA9ICJnbWkiOw0KPiArCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiArCX07
DQo+ICsNCj4gwqAJcHdtOiBwd21ANzAwMGEwMDAgew0KPiDCoAkJY29tcGF0aWJsZSA9ICJudmlk
aWEsdGVncmEyMC1wd20iOw0KPiDCoAkJcmVnID0gPDB4NzAwMGEwMDAgMHgxMDA+Ow0KPiAtLQ0K
PiAyLjEuNA==
