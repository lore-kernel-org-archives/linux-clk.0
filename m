Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
In-Reply-To: <20170112174122.iqzrcyytfefqspwq@lukather>
References: <20170112203149.VhtuR9dM@smtp3j.mail.yandex.net>
 <20170112174122.iqzrcyytfefqspwq@lukather>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
MIME-Version: 1.0
Message-Id: <895011484282207@web8g.yandex.ru>
Date: Fri, 13 Jan 2017 12:36:47 +0800
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "	linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "	linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Chen-Yu Tsai <wens@csie.org>,
 "	linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "	linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

CgoxMy4wMS4yMDE3LCAwMTo0MSwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gT24gRnJpLCBKYW4gMTMsIDIwMTcgYXQgMDE6MzE6NDFBTSArMDgw
MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4gwqAyMDE35bm0MeaciDEz5pelIDAxOjE55LqOIE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPuWGmemBk++8mgo+
PiDCoD4KPj4gwqA+IE9uIFRodSwgSmFuIDEyLCAyMDE3IGF0IDAzOjQ0OjUzQU0gKzA4MDAsIElj
ZW5vd3kgWmhlbmcgd3JvdGU6Cj4+IMKgPiA+Cj4+IMKgPiA+Cj4+IMKgPiA+IDEyLjAxLjIwMTcs
IDAzOjQwLCAiSWNlbm93eSBaaGVuZyIgPGljZW5vd3lAYW9zYy54eXo+Ogo+PiDCoD4gPiA+IDEx
LjAxLjIwMTcsIDAyOjEwLCAiTWF4aW1lIFJpcGFyZCIgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVj
dHJvbnMuY29tPjoKPj4gwqA+ID4gPj4gwqBPbiBUdWUsIEphbiAwMywgMjAxNyBhdCAxMToxNjoy
NlBNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDCoD4gPiA+Pj4gwqDCoFYzcyBoYXMg
YSBzaW1pbGFyIGJ1dCBjdXQtZG93biBDQ1UgdG8gSDMuCj4+IMKgPiA+ID4+Pgo+PiDCoD4gPiA+
Pj4gwqDCoEFkZCBzdXBwb3J0IGZvciBpdC4KPj4gwqA+ID4gPj4+Cj4+IMKgPiA+ID4+PiDCoMKg
U2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLnh5ej4KPj4gwqA+ID4g
Pj4KPj4gwqA+ID4gPj4gwqBJdCBsb29rcyBsaWtlIHRoZXJlJ3Mgbm90aGluZyBkaWZmZXJlbnQg
YnV0IHRoZSBjbG9ja3MgdGhhdCB5b3UKPj4gwqA+ID4gPj4gwqByZWdpc3RlciB3aXRoIHRoZSBI
MywgcGxlYXNlIGp1c3QgdXNlIHRoZSBIMyBkcml2ZXIuCj4+IMKgPiA+ID4KPj4gwqA+ID4gPiBO
b3BlLgo+PiDCoD4gPiA+Cj4+IMKgPiA+ID4gSXQgaGFzIGEgZGlmZmVyZW50IFBMTCAoUExMX0lT
UCkgYXQgZGlmZmVyZW50IGFkZHJlc3MsIGFuZCBzb21lCj4+IMKgPiA+ID4gZGlmZmVyZW50IG11
eGVzLgo+PiDCoD4gPgo+PiDCoD4gPiBGb3Jnb3QgdG8gbWVudGlvbiB0aGUgbWlzc2luZyBvZiBQ
TExfREUgYW5kIHJlbGF0ZWQgbWlzc2VzLgo+PiDCoD4KPj4gwqA+IFRob3NlIGFyZSBub3QgY29u
ZmxpY3RpbmcsIGl0J3MganVzdCBhIHNsaWdodGx5IGRpZmZlcmVudCBzZXQgb2YKPj4gwqA+IGNs
b2Nrcy4KPj4KPj4gwqBJZiBzYXlpbmcgc28sIHdlIGNhbiBoYXZlIG9ubHkgb25lIGNjdSBkcml2
ZXIsIGFuZCBtYWtlIGV2ZXJ5IGNjdQo+PiDCoHJlZ2lzdGVyIGRpZmZlcmVudCBzZXQgOy0pCj4+
Cj4+IMKgVjNzIGl0c2VsZiBpcyBhIHRvdGFsbHkgZGlmZmVyZW50IFNvQyB3aXRoIEgzLgo+Pgo+
PiDCoFRoZSByZWxhdGlvbnNoaXAgb2YgVjNzIGFuZCBIMyBjYW4gYmUgZmFydGhlciB0aGFuIHRo
ZSByZWxhdGlvbnNoaXAKPj4gwqBvZiBBMzMgYW5kIEgz8J+Ygwo+Cj4gQTMzIGFuZCBIMyBhcmUg
YW4gZW50aXJlbHkgZGlmZmVyZW50IHN0b3J5LiBUaGUgSDMgYW5kIEEzMyBoYXZlCj4gY29uZmxp
Y3RpbmcgY2xvY2tzIChpZSBzYW1lIGNsb2NrcyB3aXRoIGRpZmZlcmVudCBwYXJhbWV0ZXJzKS4g
VGhpcyBpcwo+IG5vdCB5b3VyIGNhc2UuCgpJIHRoaW5rIFYzcyBhbmQgSDMgaGFzIGFsc28gY29u
ZmxpY3RpbmcgY2xvY2tzLCBlLmcuIENMS19ERS4KClRoZSBtdXggb2YgQ0xLX0RFIGluIFYzcyBp
cyBQTExfUEVSSVBIeDIgYW5kIFBMTF9WSURFTywgYnV0IG9uIEgzCml0J3MgUExMX1BFUklQSHgy
IGFuZCBQTExfREUgKFYzcyBsYWNrcyBQTExfREUpLgoKKFdoYXQgSSBzYXkgdGhhdCB0aGVyZSdz
IGEgUExMIG1pc3NpbmcgbWVhbnMgdGhhdCB0aGVyZSB3aWxsIGFsc28gYmUgbXV4CmNoYW5nZXMu
Li4gSSB0aGluayB5b3UgY2FuIHVuZGVyc3RhbmQgdGhpcy4uLiBzb3JyeS4pCgo+Cj4gTWF4aW1l
Cj4KPiAtLQo+IE1heGltZSBSaXBhcmQsIEZyZWUgRWxlY3Ryb25zCj4gRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHA6Ly9mcmVlLWVsZWN0cm9ucy5jb20KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
