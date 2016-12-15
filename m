Return-Path: <Chris.Brandt@renesas.com>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman
	<horms+renesas@verge.net.au>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: mstp: Support 8-bit registers for r7s72100
Date: Thu, 15 Dec 2016 14:09:12 +0000
Message-ID: <SG2PR06MB116557C6AE9D0913F47F33F48A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20161215021134.14902-1-chris.brandt@renesas.com>
 <87bmwdoreh.wl%kuninori.morimoto.gx@renesas.com>
 <SG2PR06MB116595E38DF9C7E4CE0083CD8A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdX1Uvna+zi+N=TEYMqFUt1CRfTjjbLsTg_H2C4GJnLenA@mail.gmail.com>
In-Reply-To: <CAMuHMdX1Uvna+zi+N=TEYMqFUt1CRfTjjbLsTg_H2C4GJnLenA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgR2VlcnQgYW5kIE1vcmltb3RvLXNhbiwNCg0KT24gRGVjZW1iZXIgMTUsIDIwMTYsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gT3IgeW91IGNhbiBhZGQgYW4gb2ZfZGV2aWNlX2lzX2Nv
bXBhdGlibGUobnAsICJyZW5lc2FzLHI3czcyMTAwLW1zdHAtDQo+IGNsb2NrcyIpIGNoZWNrIHRv
IGNwZ19tc3RwX2Nsb2Nrc19pbml0KCksIGtlZXBpbmcgdGhlIHNpbmdsZQ0KPiBDTEtfT0ZfREVD
TEFSRSgpLg0KPiANCj4gSSB0aGluayB0aGF0IHdvdWxkIGFsc28gcGVyZm9ybXMgc2xpZ2h0bHkg
YmV0dGVyLCBhcyBvbmx5IG5vZGVzIGNvbXBhdGlibGUNCj4gd2l0aCAicmVuZXNhcyxjcGctbXN0
cC1jbG9ja3MiIHdvdWxkIGJlIHN1YmplY3QgdG8gdGhlIGFkZGl0aW9uYWwgY2hlY2suDQo+IA0K
DQpJIHRoaW5rIG5vdyBJIGFtIGxlYW5pbmcgbW9yZSB0b3dhcmRzIHRoYXQgaWRlYToNCg0KICog
dXNlIG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAicmVuZXNhcyxyN3M3MjEwMC1tc3RwLWNs
b2NrcyIpDQogKiBhZGQgcmVnX3dpZHRoXzhiaXQgdG8gZ3JvdXAgKG5vdCBnbG9iYWwpDQoNCg0K
VGhlIHJlYXNvbiBpcyB0aGF0IEkgSE9QRSB0aGF0IHRoaXMgb25lIFNPQyB3aWxsIGJlIHRoZSBv
bmx5IFJlbmVzYXMgZGV2aWNlIHRoYXQgd2lsbCBldmVyDQpoYXZlIDgtYml0IE1TVFAgcmVnaXN0
ZXJzLiBBbGwgdGhlIG90aGVyIE1QVSBkZXZpY2VzIHNlZW0gdG8gaGF2ZSAzMi1iaXQuDQoNClRo
ZXJlZm9yZSwgYWRkaW5nIGEgc2ltcGxlIDEtbGluZSBvZl9kZXZpY2VfaXNfY29tcGF0aWJsZSBm
b3IgdGhpcyBvbmUgY2FzZSBzZWVtcyB0aGUgYmVzdC4NCg0KVGhhbmsgeW91IGZvciB0aGUgc3Vn
Z2VzdGlvbnMuDQoNCkNocmlzDQoNCg==
