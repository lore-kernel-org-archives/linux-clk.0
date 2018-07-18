Return-Path: <phil.edworthy@renesas.com>
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Russell King
	<linux@armlinux.org.uk>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Simon Horman <horms@verge.net.au>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: Add functions to get optional clocks
Date: Wed, 18 Jul 2018 13:56:26 +0000
Message-ID: 
 <OSBPR01MB1766E6AFE37986B2E2B5E35DF5530@OSBPR01MB1766.jpnprd01.prod.outlook.com>
References: <1531918658-32278-1-git-send-email-phil.edworthy@renesas.com>
 <20180718130228.GG17271@n2100.armlinux.org.uk>
 <CAMuHMdUjzVBXn-goAwbTBULfo=HrJEY6eBae4w7Z6qA-gScUUw@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdUjzVBXn-goAwbTBULfo=HrJEY6eBae4w7Z6qA-gScUUw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgUnVzc2VsbCwNCg0KT24gMTggSnVseSAyMDE4IDE0OjE5LCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+IE9uIFdlZCwgSnVsIDE4LCAyMDE4IGF0IDM6MDIgUE0gUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4ICB3cm90ZToNCj4gPiBPbiBXZWQsIEp1bCAxOCwgMjAxOCBhdCAwMTo1NzozOFBN
ICswMTAwLCBQaGlsIEVkd29ydGh5IHdyb3RlOg0KPiA+ID4gQmVoYXZlcyB0aGUgc2FtZSBhcyAo
ZGV2bV8pY2xrX2dldCBleGNlcHQgd2hlcmUgdGhlcmUgaXMgbm8gY2xvY2sNCj4gPiA+IHByb2R1
Y2VyLiBJbiB0aGlzIGNhc2UsIGluc3RlYWQgb2YgcmV0dXJuaW5nIC1FTk9FTlQsIHRoZSBmdW5j
dGlvbg0KPiA+ID4gcmV0dXJucyBOVUxMLiBUaGlzIG1ha2VzIGVycm9yIGNoZWNraW5nIHNpbXBs
ZXIgYW5kIGFsbG93cw0KPiA+ID4gY2xrX3ByZXBhcmVfZW5hYmxlLCBldGMgdG8gYmUgY2FsbGVk
IG9uIHRoZSByZXR1cm5lZCByZWZlcmVuY2UNCj4gPiA+IHdpdGhvdXQgYWRkaXRpb25hbCBjaGVj
a3MuDQo+ID4NCj4gPiBIb3cgZG9lcyB0aGlzIHdvcmsgd2l0aCBub24tRFQgc3lzdGVtcywgd2hl
cmUgbG9va2luZyBhIGNsb2NrIHVwIHdoaWNoDQo+ID4gaXNuJ3QgeWV0IHJlZ2lzdGVyZWQgd2l0
aCBjbGtkZXYgcmV0dXJucyAtRU5PRU5UID8NCj4gPg0KPiA+IChjbGtkZXYgZG9lc24ndCBrbm93
IHdoZW4gYWxsIGNsb2NrcyBhcmUgcmVnaXN0ZXJlZCB3aXRoIGl0LikNCj4gDQo+IEdvb2QgcXVl
c3Rpb24uDQo+IA0KPiBJIGd1ZXNzIGFsbCBkcml2ZXJzIHRyeWluZyB0byBoYW5kbGUgb3B0aW9u
YWwgY2xvY2tzIHRoaXMgd2F5IGFyZSBhbHJlYWR5IGJyb2tlbg0KPiBvbiBub24tRFQgc3lzdGVt
cyB3aGVyZSBjbG9ja3MgbWF5IGJlIHJlZ2lzdGVyZWQgbGF0ZS4uLg0KDQpTbyBob3cgZG8gbm9u
LURUIHN5c3RlbXMgdGhhdCBsb29rIGEgY2xvY2sgdXAgd2hpY2ggaXNuJ3QgeWV0DQpyZWdpc3Rl
cmVkIHdpdGggY2xrZGV2LCBkZXRlcm1pbmUgdGhhdCBhbiBvcHRpb25hbCBjbG9jayBpcyB0aGVy
ZQ0Kb3Igbm90Pw0KDQpUaGFua3MNClBoaWwNCg==
