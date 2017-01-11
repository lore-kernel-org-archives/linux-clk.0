Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
In-Reply-To: <2705031484163593@web1g.yandex.ru>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-3-icenowy@aosc.xyz>
 <20170110181006.yrd6moy2mctzoc4c@lukather> <2705031484163593@web1g.yandex.ru>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
MIME-Version: 1.0
Message-Id: <2714901484163893@web1g.yandex.ru>
Date: Thu, 12 Jan 2017 03:44:53 +0800
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Chen-Yu Tsai <wens@csie.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

CgoxMi4wMS4yMDE3LCAwMzo0MCwgIkljZW5vd3kgWmhlbmciIDxpY2Vub3d5QGFvc2MueHl6PjoK
PiAxMS4wMS4yMDE3LCAwMjoxMCwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4+IMKgT24gVHVlLCBKYW4gMDMsIDIwMTcgYXQgMTE6MTY6MjZQTSAr
MDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IMKgwqBWM3MgaGFzIGEgc2ltaWxhciBidXQg
Y3V0LWRvd24gQ0NVIHRvIEgzLgo+Pj4KPj4+IMKgwqBBZGQgc3VwcG9ydCBmb3IgaXQuCj4+Pgo+
Pj4gwqDCoFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy54eXo+Cj4+
Cj4+IMKgSXQgbG9va3MgbGlrZSB0aGVyZSdzIG5vdGhpbmcgZGlmZmVyZW50IGJ1dCB0aGUgY2xv
Y2tzIHRoYXQgeW91Cj4+IMKgcmVnaXN0ZXIgd2l0aCB0aGUgSDMsIHBsZWFzZSBqdXN0IHVzZSB0
aGUgSDMgZHJpdmVyLgo+Cj4gTm9wZS4KPgo+IEl0IGhhcyBhIGRpZmZlcmVudCBQTEwgKFBMTF9J
U1ApIGF0IGRpZmZlcmVudCBhZGRyZXNzLCBhbmQgc29tZQo+IGRpZmZlcmVudCBtdXhlcy4KCkZv
cmdvdCB0byBtZW50aW9uIHRoZSBtaXNzaW5nIG9mIFBMTF9ERSBhbmQgcmVsYXRlZCBtaXNzZXMu
Cgo+Cj4+IMKgVGhhbmtzIQo+PiDCoE1heGltZQo+Pgo+PiDCoC0tCj4+IMKgTWF4aW1lIFJpcGFy
ZCwgRnJlZSBFbGVjdHJvbnMKPj4gwqBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCj4+IMKgaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
