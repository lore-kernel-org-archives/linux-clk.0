Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
In-Reply-To: <20170110180926.ilqtygttpfgbetvu@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-2-icenowy@aosc.xyz>
 <20170110180926.ilqtygttpfgbetvu@lukather>
Subject: Re: [PATCH 1/5] arm: sunxi: add support for V3s SoC
MIME-Version: 1.0
Message-Id: <2706391484163632@web1g.yandex.ru>
Date: Thu, 12 Jan 2017 03:40:32 +0800
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

CgoxMS4wMS4yMDE3LCAwMjowOSwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gT24gVHVlLCBKYW4gMDMsIDIwMTcgYXQgMTE6MTY6MjVQTSArMDgw
MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4gwqBBbGx3aW5uZXIgVjNzIGlzIGEgbG93LWVuZCBz
aW5nbGUtY29yZSBDb3J0ZXgtQTcgU29DLCB3aXRoIDY0TUIKPj4gwqBpbnRlZ3JhdGVkIERSQU0s
IGFuZCBzZXZlcmFsIHBlcmlwaGVyYWxzLgo+Pgo+PiDCoFNpZ25lZC1vZmYtYnk6IEljZW5vd3kg
WmhlbmcgPGljZW5vd3lAYW9zYy54eXo+Cj4+IMKgLS0tCj4+IMKgwqBEb2N1bWVudGF0aW9uL2Fy
bS9zdW54aS9SRUFETUUgfCA0ICsrKysKPj4gwqDCoGFyY2gvYXJtL21hY2gtc3VueGkvc3VueGku
YyB8IDEgKwo+PiDCoMKgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4KPj4gwqBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcm0vc3VueGkvUkVBRE1FIGIvRG9jdW1lbnRhdGlv
bi9hcm0vc3VueGkvUkVBRE1FCj4+IMKgaW5kZXggY2QwMjQzMzAyYmMxLi45MWVjOGYyMDU1YmUg
MTAwNjQ0Cj4+IMKgLS0tIGEvRG9jdW1lbnRhdGlvbi9hcm0vc3VueGkvUkVBRE1FCj4+IMKgKysr
IGIvRG9jdW1lbnRhdGlvbi9hcm0vc3VueGkvUkVBRE1FCj4+IMKgQEAgLTY3LDYgKzY3LDEwIEBA
IFN1blhpIGZhbWlseQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCsgRGF0YXNoZWV0Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGh0dHA6Ly9kbC5saW51eC1zdW54aS5vcmcvSDMvQWxsd2lubmVy
X0gzX0RhdGFzaGVldF9WMS4wLnBkZgo+Pgo+PiDCoCsgLSBBbGx3aW5uZXIgVjNzIChzdW44aSkK
Pj4gwqArICsgRGF0YXNoZWV0Cj4+IMKgKyBodHRwczovL3d3dy5nb3ByYXduLmNvbS9mb3J1bS9h
bGx3aW5uZXItY2Ftcy83ODMtYWxsd2lubmVyLXYzcy1zb2MtZGF0YXNoZWV0Cj4+IMKgKwo+Cj4g
UGxlYXNlIGRvbid0IHB1dCByYW5kb20gbGlua3MgaW4gdGhlcmUsIGJ1dCBhdCBsZWFzdCBzb21l
dGhpbmcgdGhhdCB3ZQo+IGtub3cgd2lsbCBiZSB0aGVyZSBpbiBhIGNvdXBsZSBvZiB3ZWVrcy9t
b250aGVzL3llYXJzCgpJcyBodHRwOi8vbGludXgtc3VueGkub3JnL0ZpbGU6QWxsd2lubmVyX1Yz
c19EYXRhc2hlZXRfVjEuMC5wZGYgYWNjZXB0YWJsZT8KCj4KPiBUaGFua3MsCj4gTWF4aW1lCj4K
PiAtLQo+IE1heGltZSBSaXBhcmQsIEZyZWUgRWxlY3Ryb25zCj4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHA6Ly9mcmVlLWVsZWN0cm9ucy5jb20KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
