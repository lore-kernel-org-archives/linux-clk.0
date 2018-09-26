Return-Path: <Chris.Brandt@renesas.com>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk
	<linux-clk@vger.kernel.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, Simon Horman
	<horms+renesas@verge.net.au>
Subject: RE: [PATCH v2 3/3] clk: renesas: r7s9210: Move table update to
 separate function
Date: Wed, 26 Sep 2018 12:34:16 +0000
Message-ID: 
 <TYXPR01MB1568A4A2196EEFB785E4505C8A150@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20180924164937.36536-1-chris.brandt@renesas.com>
 <20180924164937.36536-4-chris.brandt@renesas.com>
 <CAMuHMdXRWRvxNb12GPDi-agEFhLg3_Cnukm6LwapFdaT8Fpddg@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdXRWRvxNb12GPDi-agEFhLg3_Cnukm6LwapFdaT8Fpddg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFdlZG5lc2RheSwgU2VwdGVtYmVyIDI2LCAyMDE4LCBHZWVydCBVeXR0
ZXJob2V2ZW4gd3JvdGU6DQo+ID4gKy8qIFRoZSBjbG9jayBkaXZpZGVycyBpbiB0aGUgdGFibGUg
dmFyeSBiYXNlZCBvbiBEVCBhbmQgcmVnaXN0ZXINCj4gc2V0dGluZ3MgKi8NCj4gPiArc3RhdGlj
IHZvaWQgcjdzOTIxMF91cGRhdGVfY2xrX3RhYmxlKHN0cnVjdCBjbGsgKmV4dGFsX2Nsaywgdm9p
ZA0KPiBfX2lvbWVtICpiYXNlKQ0KPiANCj4gQ2FuIGJlIF9faW5pdC4NCj4gDQo+IFJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiBpLmUu
IHdpbGwgcXVldWUgaW4gY2xrLXJlbmVzYXMtZm9yLXY0LjIwLCB3aXRoIHRoZSBhYm92ZSBmaXhl
ZC4NCg0KT0ssIHRoYW5rIHlvdSENCg0KQ2hyaXMNCg0K
