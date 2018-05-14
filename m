Return-Path: <gabriel.fernandez@st.com>
From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org"
	<sboyd@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: Re: clk: stm32mp1: Fix a memory leak in
 'clk_stm32_register_gate_ops()'
Date: Mon, 14 May 2018 08:50:48 +0000
Message-ID: <3d149e1f-3290-8b6f-9b5b-1a1133461ed0@st.com>
References: <20180513111704.31842-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180513111704.31842-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgQ2hyaXN0b3BoZSwNCg0KTWFueSB0aGFua3MgIQ0KDQpBY2tlZC1ieTogR2FicmllbCBGZXJu
YW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QHN0LmNvbT4NCg0KDQpPbiAwNS8xMy8yMDE4IDAxOjE3
IFBNLCBDaHJpc3RvcGhlIEphaWxsZXQgd3JvdGU6DQo+IFdlIGFsbG9jYXRlIHNvbWUgbWVtb3J5
IHdoaWNoIGlzIG5laXRoZXIgdXNlZCwgbm9yIHJlZmVyZW5jZWQgYnkgYW55dGhpbmcuDQo+IFNv
IGF4ZSBpdC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3Rv
cGhlLmphaWxsZXRAd2FuYWRvby5mcj4NCj4gLS0tDQo+IFRoaXMgcGF0Y2ggYXMgbm90IGJlZW4g
Y29tcGlsZS10ZXN0ZWQsIEkgZG9uJ3QgaGF2ZSB0aGUgY29ycmVzcG9uZGluZyBhcmNoDQo+IGFu
ZCBoYXZlIG5vdCB0YWtlbiB0aW1lIHRvIGNyb3NzLWNvbXBpbGUgaXQuDQo+IC0tLQ0KPiAgIGRy
aXZlcnMvY2xrL2Nsay1zdG0zMm1wMS5jIHwgOSArLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDggZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsay9jbGstc3RtMzJtcDEuYyBiL2RyaXZlcnMvY2xrL2Nsay1zdG0zMm1wMS5jDQo+IGlu
ZGV4IGVkZDNjZjQ1MTQwMS4uZGZiOWNiNWJkMGM0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Ns
ay9jbGstc3RtMzJtcDEuYw0KPiArKysgYi9kcml2ZXJzL2Nsay9jbGstc3RtMzJtcDEuYw0KPiBA
QCAtNTc5LDE0ICs1NzksOSBAQCBjbGtfc3RtMzJfcmVnaXN0ZXJfZ2F0ZV9vcHMoc3RydWN0IGRl
dmljZSAqZGV2LA0KPiAgIAkJCSAgICBzcGlubG9ja190ICpsb2NrKQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHsgTlVMTCB9Ow0KPiAtCXN0cnVjdCBjbGtfZ2F0ZSAq
Z2F0ZTsNCj4gICAJc3RydWN0IGNsa19odyAqaHc7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+IC0J
Z2F0ZSA9IGt6YWxsb2Moc2l6ZW9mKCpnYXRlKSwgR0ZQX0tFUk5FTCk7DQo+IC0JaWYgKCFnYXRl
KQ0KPiAtCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gLQ0KPiAgIAlpbml0Lm5hbWUgPSBu
YW1lOw0KPiAgIAlpbml0LnBhcmVudF9uYW1lcyA9ICZwYXJlbnRfbmFtZTsNCj4gICAJaW5pdC5u
dW1fcGFyZW50cyA9IDE7DQo+IEBAIC02MDQsMTAgKzU5OSw4IEBAIGNsa19zdG0zMl9yZWdpc3Rl
cl9nYXRlX29wcyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgCWh3LT5pbml0ID0gJmluaXQ7DQo+
ICAgDQo+ICAgCXJldCA9IGNsa19od19yZWdpc3RlcihkZXYsIGh3KTsNCj4gLQlpZiAocmV0KSB7
DQo+IC0JCWtmcmVlKGdhdGUpOw0KPiArCWlmIChyZXQpDQo+ICAgCQlodyA9IEVSUl9QVFIocmV0
KTsNCj4gLQl9DQo+ICAgDQo+ICAgCXJldHVybiBodzsNCj4gICB9DQo=
