Return-Path: <peter.chen@nxp.com>
From: Peter Chen <peter.chen@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, Fabio Estevam
	<fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 2/3] ARM: imx: mach-imx6ul: add imx6ull support
Date: Tue, 1 Nov 2016 10:44:36 +0000
Message-ID: <HE1PR04MB1450456D09E01C3F308D25AB8BA10@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1477969343-19887-1-git-send-email-peter.chen@nxp.com>
 <1477969343-19887-3-git-send-email-peter.chen@nxp.com>
 <CAOMZO5AsF8s9Ff2NHQ+j2_xSBNEzGY6bGLK-kgvx-aST+K2PNQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AsF8s9Ff2NHQ+j2_xSBNEzGY6bGLK-kgvx-aST+K2PNQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

IA0KPg0KPk9uIFR1ZSwgTm92IDEsIDIwMTYgYXQgMTowMiBBTSwgUGV0ZXIgQ2hlbiA8cGV0ZXIu
Y2hlbkBueHAuY29tPiB3cm90ZToNCj4+IGlteDZ1bGwgaXMgZGVyaXZlZCBTb0MgZnJvbSBpbXg2
dWwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29t
Pg0KPj4gLS0tDQo+PiAgYXJjaC9hcm0vbWFjaC1pbXgvbWFjaC1pbXg2dWwuYyB8IDMgKystDQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWlteC9tYWNoLWlteDZ1bC5jDQo+PiBiL2FyY2gv
YXJtL21hY2gtaW14L21hY2gtaW14NnVsLmMgaW5kZXggNThhMmI4OC4uMGIyNDYzMCAxMDA2NDQN
Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtaW14L21hY2gtaW14NnVsLmMNCj4+ICsrKyBiL2FyY2gv
YXJtL21hY2gtaW14L21hY2gtaW14NnVsLmMNCj4+IEBAIC04OSwxMCArODksMTEgQEAgc3RhdGlj
IHZvaWQgX19pbml0IGlteDZ1bF9pbml0X2xhdGUodm9pZCkNCj4+DQo+PiAgc3RhdGljIGNvbnN0
IGNoYXIgKiBjb25zdCBpbXg2dWxfZHRfY29tcGF0W10gX19pbml0Y29uc3QgPSB7DQo+PiAgICAg
ICAgICJmc2wsaW14NnVsIiwNCj4+ICsgICAgICAgImZzbCxpbXg2dWxsIiwNCj4+ICAgICAgICAg
TlVMTCwNCj4+ICB9Ow0KPj4NCj4+IC1EVF9NQUNISU5FX1NUQVJUKElNWDZVTCwgIkZyZWVzY2Fs
ZSBpLk1YNiBVbHRyYWxpdGUgKERldmljZSBUcmVlKSIpDQo+PiArRFRfTUFDSElORV9TVEFSVChJ
TVg2VUwsICJGcmVlc2NhbGUgaS5NWDYgVWx0cmFMaXRlIChEZXZpY2UgVHJlZSkiKQ0KPg0KPklz
IHRoaXMgY2hhbmdlIHJlYWxseSBuZWVkZWQ/DQoNClRoaXMgY2hhbmdlIGRvZXMgbm90IGJlIHJl
bGF0ZWQgd2l0aCBpbXg2dWxsIHN1cHBvcnQsIGJ1dCBhbHNvIGEgbmVlZGVkIGNoYW5nZSBzaW5j
ZQ0KdGhlIGZvcm1hbCBuYW1lIGlzIGNhcGl0YWwgbGV0dGVyICJMIiwgaWYgeW91IGFyZSBjb25j
ZXJuZWQgd2l0aCB0aGF0LCBJIGNhbiBkZWxldGUgdGhpcw0KY2hhbmdlLg0KDQpQZXRlcg0K
