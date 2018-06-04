Return-Path: <anson.huang@nxp.com>
From: Anson Huang <anson.huang@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk
	<linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/4] clk: imx6q: remove clks_init_on array
Date: Mon, 4 Jun 2018 01:11:29 +0000
Message-ID: 
 <AM3PR04MB1315DA5AC8F4F2AC5425A47BF5670@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1527994847-2363-1-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5CmgBsaaegVV9OjdyXv5_O0V9iTS2qYbtuH26qkG2_zrA@mail.gmail.com>
 <2D554312-36F2-4781-899C-8D9F5BD20B46@nxp.com>
 <CAOMZO5ANz-B-s93+R_xnF0LOux1zTY3E8Ky4KvrZ8EX1ZKmpAQ@mail.gmail.com>
In-Reply-To: 
 <CAOMZO5ANz-B-s93+R_xnF0LOux1zTY3E8Ky4KvrZ8EX1ZKmpAQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGksIEZhYmlvDQoNCkFuc29uIEh1YW5nDQpCZXN0IFJlZ2FyZHMhDQoNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIFttYWlsdG86ZmVzdGV2YW1A
Z21haWwuY29tXQ0KPiBTZW50OiBTdW5kYXksIEp1bmUgMywgMjAxOCA4OjU0IFBNDQo+IFRvOiBB
bnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gQ2M6IFNoYXduIEd1byA8c2hhd25n
dW9Aa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlcg0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsg
RmFiaW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPjsgTWljaGFlbA0KPiBUdXJxdWV0
dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPjsgU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwu
b3JnPjsNCj4gZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IG1vZGVyYXRlZCBsaXN0
OkFSTS9GUkVFU0NBTEUgSU1YIC8gTVhDDQo+IEFSTSBBUkNISVRFQ1RVUkUgPGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWNsaw0KPiA8bGludXgtY2xrQHZnZXIu
a2VybmVsLm9yZz47IGxpbnV4LWtlcm5lbCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIGNsazogaW14NnE6IHJlbW92ZSBjbGtzX2luaXRf
b24gYXJyYXkNCj4gDQo+IEhpIEFuc29uLA0KPiANCj4gT24gU3VuLCBKdW4gMywgMjAxOCBhdCA5
OjQ4IEFNLCBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+IA0K
PiA+IEFzIEkgZXhwbGFpbiBpbiBwcmV2aW91cyBtYWlsLCBidXN5IGRpdmlkZXIgY2xrIHR5cGUg
YWxyZWFkeSBpbmNsdWRlIHRoZSBmbGFnDQo+IHdoZW4gcmVnaXN0ZXJlZC4NCj4gDQo+IE9rLCB0
aGVuIHBsZWFzZSBhZGQgdGhpcyBpbmZvcm1hdGlvbiBpbiB0aGUgY29tbWl0IGxvZyB0byBtYWtl
IHRoZSByZXZpZXcNCj4gcHJvY2VzcyBlYXNpZXIuDQogDQpUaGFua3MgZm9yIHRoZSBjb21tZW50
cywgSSBpbXByb3ZlZCB0aGUgY29tbWl0IGxvZyBpbiBWMiBwYXRjaCBzZXQuDQoNCkFuc29uLg0K
DQo=
