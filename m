Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Sat, 20 May 2017 01:49:58 +0800
In-Reply-To: <20170519174729.q5qk2vqlibzx3zrv@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-3-icenowy@aosc.io>
 <20170519174729.q5qk2vqlibzx3zrv@flea.home>
MIME-Version: 1.0
Subject: Re: [linux-sunxi] Re: [RFC PATCH 02/11] drm: sun4i: add support for
 H3 mixers
To: maxime.ripard@free-electrons.com,
 Maxime Ripard <maxime.ripard@free-electrons.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <695DFDD0-1925-433C-AB88-B90EE461C203@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Cgrkuo4gMjAxN+W5tDXmnIgyMOaXpSBHTVQrMDg6MDAg5LiK5Y2IMTo0NzoyOSwgTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+IOWGmeWIsDoKPk9uIFRodSwg
TWF5IDE4LCAyMDE3IGF0IDEyOjQzOjQ1QU0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+
IEZyb206IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy54eXo+Cj4+IAo+PiBBbGx3aW5uZXIg
SDMgU29DIGhhcyB0d28gbWl4ZXJzLCBvbmUgaGFzIDEgVkkgY2hhbm5lbCBhbmQgMyBVSQo+Y2hh
bm5lbHMsCj4+IGFuZCB0aGUgb3RoZXIgaGFzIDEgVkkgYW5kIDEgVUkuCj4+IAo+PiBBZGQgc3Vw
cG9ydCBmb3IgdGhlc2UgdHdvIHZhcmlhbnRzLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSWNlbm93
eSBaaGVuZyA8aWNlbm93eUBhb3NjLnh5ej4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuOGlfbWl4ZXIuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuOGlfbWl4ZXIuYwo+Yi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfbWl4ZXIu
Ywo+PiBpbmRleCBjYjE5M2M1ZjE2ODYuLmQ2NThhM2E4MTU5YSAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX21peGVyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjhpX21peGVyLmMKPj4gQEAgLTM5MCwxMSArMzkwLDI5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3VuOGlfbWl4ZXJfY2ZnCj5zdW44aV92M3NfbWl4ZXJfY2ZnID0gewo+PiAgCS51
aV9udW0gPSAxLAo+PiAgfTsKPj4gIAo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzdW44aV9taXhl
cl9jZmcgc3VuOGlfaDNfbWl4ZXIwX2NmZyA9IHsKPj4gKwkudmlfbnVtID0gMSwKPj4gKwkudWlf
bnVtID0gMywKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VuOGlfbWl4ZXJf
Y2ZnIHN1bjhpX2gzX21peGVyMV9jZmcgPSB7Cj4+ICsJLnZpX251bSA9IDEsCj4+ICsJLnVpX251
bSA9IDEsCj4+ICt9Owo+PiArCj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBz
dW44aV9taXhlcl9vZl90YWJsZVtdID0gewo+PiAgCXsKPj4gIAkJLmNvbXBhdGlibGUgPSAiYWxs
d2lubmVyLHN1bjhpLXYzcy1kZTItbWl4ZXIiLAo+PiAgCQkuZGF0YSA9ICZzdW44aV92M3NfbWl4
ZXJfY2ZnLAo+PiAgCX0sCj4+ICsJewo+PiArCQkuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3Vu
OGktaDMtZGUyLW1peGVyMCIsCj4+ICsJCS5kYXRhID0gJnN1bjhpX2gzX21peGVyMF9jZmcKPj4g
Kwl9LAo+PiArCXsKPj4gKwkJLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLWgzLWRlMi1t
aXhlcjEiLAo+PiArCQkuZGF0YSA9ICZzdW44aV9oM19taXhlcjFfY2ZnCj4+ICsJfSwKPgo+U28g
dGhlIG9ubHkgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28gaXMgdGhlIG51bWJlciBvZiB1aSBw
bGFuZXM/CgpOb3Qgb25seS4sIGJ1dCBjdXJyZW50bHkgd2Ugb25seSBpbXBsZW1lbnRlZCB0aGlz
LgoKTW9yZSBmdW5jdGlvbnMgZGlmZmVyLCBidXQgd2Ugc3RpbGwgZG9uJ3Qgc3VwcG9ydCB0aGVt
Li4uCgo+Cj5XaHkgbm90IGNyZWF0ZSBhIHByb3BlcnR5IHRvIGdpdmUgdGhlIG51bWJlciB0aGVu
LCBpbnN0ZWFkIG9mIGEKPmNvbXBhdGlibGU/Cj4KPk1heGltZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
