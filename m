Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <1958057.WDKm0nQKgW@jernej-laptop>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170519180330.7hpfkdqk3r2x3kn5@flea.home>
 <3FCDBC05-20A1-460C-A21B-8C3E9C776768@aosc.io>
 <1958057.WDKm0nQKgW@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 20 May 2017 09:37:53 +0800
Message-ID: <CAGb2v66aD=G+V75N-_nYo=dGqhxpKhadM84h9G-B34=dnDwCbg@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 07/11] drm: sun4i: add support for
 the TV encoder in H3 SoC
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

T24gU2F0LCBNYXkgMjAsIDIwMTcgYXQgMjoyMyBBTSwgSmVybmVqIMWga3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BzaW9sLm5ldD4gd3JvdGU6Cj4gSGksCj4KPiBEbmUgcGV0ZWssIDE5LiBtYWogMjAx
NyBvYiAyMDowODoxOCBDRVNUIGplIEljZW5vd3kgWmhlbmcgbmFwaXNhbChhKToKPj4g5LqOIDIw
MTflubQ15pyIMjDml6UgR01UKzA4OjAwIOS4iuWNiDI6MDM6MzAsIE1heGltZSBSaXBhcmQgPG1h
eGltZS5yaXBhcmRAZnJlZS0KPiBlbGVjdHJvbnMuY29tPiDlhpnliLA6Cj4+ID5PbiBUaHUsIE1h
eSAxOCwgMjAxNyBhdCAxMjo0Mzo1MEFNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiA+
PiBBbGx3aW5uZXIgSDMgZmVhdHVyZXMgYSBUViBlbmNvZGVyIHNpbWlsYXIgdG8gdGhlIG9uZSBp
biBlYXJsaWVyCj4+ID4KPj4gPlNvQ3MsCj4+ID4KPj4gPj4gYnV0IHdpdGggc29tZSBkaWZmZXJl
bnQgcG9pbnRzIGFib3V0IGNsb2NrczoKPj4gPj4gLSBJdCBoYXMgYSBtb2QgY2xvY2sgYW5kIGEg
YnVzIGNsb2NrLgo+PiA+PiAtIFRoZSBtb2QgY2xvY2sgbXVzdCBiZSBhdCBhIGZpeGVkIHJhdGUg
dG8gZ2VuZXJhdGUgc2lnbmFsLgo+PiA+Cj4+ID5XaHk/Cj4+Cj4+IEl0J3MgZXhwZXJpbWVudCBy
ZXN1bHQgYnkgSmVybmVqLgo+Pgo+PiBUaGUgY2xvY2sgcmF0ZXMgaW4gQlNQIGtlcm5lbCBpcyBh
bHNvIHNwZWNpYWxseSBkZXNpZ25lZAo+PiAoUExMX0RFIGF0IDQzMk1IeikgaW4gb3JkZXIgdG8g
YmUgYWJsZSB0byBmZWVkIHRoZSBUVkUuCj4KPiBNeSBleHBlcmltZW50cyBhbmQgc2VhcmNoIHRo
cm91Z2ggQlNQIGNvZGUgc2hvd2VkIHRoYXQgVFZFIHNlZW1zIHRvIGhhdmUKPiBhZGRpdGlvbmFs
IGZpeGVkIHByZWRpdmlkZXIgOC4gU28gaWYgeW91IHdhbnQgdG8gZ2VuZXJhdGUgMjcgTUh6IGNs
b2NrLCB1bml0Cj4gaGFzIHRvIGJlIGZlZWQgd2l0aCAyMTYgTUh6Lgo+Cj4gVFZFIGhhcyBvbmx5
IG9uZSBQTEwgc291cmNlIFBMTF9ERS4gQW5kIHNpbmNlIDIxNiBNSHogaXMgYSBiaXQgbG93IGZv
ciBERTIsCj4gQlNQIGRlZmF1bHRzIHRvIDQzMiBNSHogZm9yIFBMTF9ERSBhbmQgdXNlIGRpdmlk
ZXIgMiB0byBnZW5lcmF0ZSAyMTYgTUh6LiBUaGlzCj4gY2xvY2sgaXMgdGhlbiBkaXZpZGVkIGJ5
IDggaW50ZXJuYWx5IHRvIGdldCBmaW5hbCAyNyBNSHouCj4KPiBQbGVhc2Ugbm90ZSB0aGF0IEkg
ZG9uJ3QgaGF2ZSBhbnkgaGFyZCBldmlkZW5jZSB0byBzdXBwb3J0IHRoYXQsIG9ubHkKPiBleHBl
cmltZW50YWwgZGF0YS4gSG93ZXZlciwgb25seSB0aGF0IGV4cGxhbmF0aW9uIG1ha2Ugc2Vuc2Ug
dG8gbWUuCj4KPiBCVFcsIEJTUCBIMy9INSBUViBkcml2ZXIgc3VwcG9ydHMgb25seSBQQUwgYW5k
IE5UU0Mgd2hpY2ggYm90aCB1c2UgMjcgTUh6IGJhc2UKPiBjbG9jay4gRnVydGhlciBleHBlcmlt
ZW50cyBhcmUgbmVlZGVkIHRvIGNoZWNrIGlmIHRoZXJlIGlzIGFueSBwb3NzaWJpbGl0eSB0bwo+
IGhhdmUgb3RoZXIgcmVzb2x1dGlvbnMgYnkgbWFuaXB1bGF0aW5nIGNsb2NrcyBhbmQgZ2l2ZSBv
dGhlciBwcm9wZXIgc2V0dGluZ3MuCj4gSSBwbGFuIHRvIGRvIHRoYXQsIGJ1dCBub3QgaW4gdmVy
eSBuZWFyIGZ1dHVyZS4KCllvdSBvbmx5IGhhdmUgY29tcG9zaXRlIHZpZGVvIG91dHB1dCwgYW5k
IHRob3NlIGFyZSB0aGUgb25seSAyIHN0YW5kYXJkCnJlc29sdXRpb25zIHRoYXQgbWFrZSBhbnkg
c2Vuc2UuCgpDaGVuWXUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK
