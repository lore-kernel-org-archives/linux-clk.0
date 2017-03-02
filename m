Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>
In-Reply-To: <20170302140931.tq3vpncln6giyjpr@lukather>
References: <20170301152236.MUXmRgOe@smtp1m.mail.yandex.net>
 <20170302140931.tq3vpncln6giyjpr@lukather>
Subject: Re: [linux-sunxi] Re: [PATCH 2/3] clk: sunxi-ng: add support for PRCM
 CCUs
MIME-Version: 1.0
Message-Id: <2899221488467633@web38j.yandex.ru>
Date: Thu, 02 Mar 2017 23:13:53 +0800
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

CgowMi4wMy4yMDE3LCAyMjowOSwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gT24gV2VkLCBNYXIgMDEsIDIwMTcgYXQgMDg6MjI6MTNQTSArMDgw
MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4gwqA+IEknbSBhIGJpdCB3b3JyaWVkIGJ5IHRoYXQg
dG8gYmUgaG9uZXN0LiBZb3UgY2xhaW0gdG8gc3VwcG9ydCB0aGUgQTMxLAo+PiDCoD4geWV0IGp1
Z2RnaW5nIGJ5IHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoYXQgY29kZSB5b3UgbmV2ZXIgYWN0dWFs
bHkKPj4gwqA+IHRlc3RlZCBpdCBvbiB0aGF0IFNvQy4KPj4gwqA+Cj4+IMKgPiBXaGF0IG1ha2Vz
IHlvdSBzYXkgdGhhdCB0aGUgUFJDTSBjbG9ja3MgYXJlIHRoZSBzYW1lIGZvciB0aGUgSDMgYW5k
Cj4+IMKgPiBBNjQ/IFdlIGhhdmUgdG8gYmUgc3VyZSwgb3RoZXJ3aXNlIHdlIG1pZ2h0IG5vdCBi
ZSBhYmxlIHRvIGdldCB0aGUgRFQKPj4gwqA+IGJpbmRpbmcgcmlnaHQgZnJvbSB0aGUgdmVyeSBi
ZWdpbm5pbmcsIGFuZCB3ZSBtaWdodCBub3QgYmUgYWJsZSB0byBmaXgKPj4gwqA+IGl0IGxhdGVy
Lgo+Pgo+PiDCoEluIGZhY3QsIGlmIHdlIHdvcnJ5IGFib3V0IHRoaXMsIHdlIHNob3VsZG4ndCBt
YWtlIHItY2N1LCBhcwo+PiDCoGRlZGljYXRlZCBjbG9ja3MgYXJlIG1vcmUgZWFzeSB0byBmaXgu
Cj4+Cj4+IMKgRm9yIG5ld2VyIFNvQ3MnIFBSQ00sIHdlIG5ldmVyIGhhdmUgZW5vdWdoIGRvY3Vt
ZW50cywgYW5kIEFsbHdpbm5lcgo+PiDCoGhhdmUgc2FpZCB0aGF0IHRoZXkgY2Fubm90IHByb3Zp
ZGUgaXQuIChJIGFza2VkIHRoZW0gZm9yIHRoaXMuKQo+Pgo+PiDCoFRoZSBiZXN0IHNvbHV0aW9u
IGlzIHRvIGltcGxlbWVudCBtYXR1cmUgZW5vdWdoIGRlZGljYXRlZCBjbG9ja3MKPj4gwqBiZWZv
cmUgd2UgY29udmVydCB0byBjY3UuCj4KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5IGRlZGljYXRlZCBj
bG9ja3M/CgpUaGUgbGVnYWN5IGZvcm0gb2YgY2xvY2tzLgoKPgo+IE1heGltZQo+Cj4gLS0KPiBN
YXhpbWUgUmlwYXJkLCBGcmVlIEVsZWN0cm9ucwo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcKPiBodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tCj4KPiAtLQo+IFlvdSByZWNl
aXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2ds
ZSBHcm91cHMgImxpbnV4LXN1bnhpIiBncm91cC4KPiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMg
Z3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRv
IGxpbnV4LXN1bnhpK3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20uCj4gRm9yIG1vcmUgb3B0
aW9ucywgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL29wdG91dC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
