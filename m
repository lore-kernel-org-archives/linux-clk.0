Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 07 Jun 2017 22:21:02 +0800
In-Reply-To: <20170607141957.akonr7hmuwpt7hlt@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-5-icenowy@aosc.io> <3642057.oKT9kIlu8M@jernej-laptop>
 <493AC6F2-3CB3-48F5-9568-A34AA927238F@aosc.io>
 <20170607094343.qqiwnu2mhmoi6jn7@flea.lan>
 <52F9F9C7-9A9C-435D-A0AF-FDD4317DAD69@aosc.io>
 <20170607141957.akonr7hmuwpt7hlt@flea.lan>
MIME-Version: 1.0
Subject: Re: [PATCH v2 04/11] drm: sun4i: add support for H3's TCON0/1
To: Maxime Ripard <maxime.ripard@free-electrons.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <4CD8A3BB-965C-4C74-884C-ACE8AAF9989B@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Cgrkuo4gMjAxN+W5tDbmnIg35pelIEdNVCswODowMCDkuIvljYgxMDoxOTo1NywgTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+IOWGmeWIsDoKPk9uIFdlZCwg
SnVuIDA3LCAyMDE3IGF0IDA1OjQ0OjU2UE0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+
IOS6jiAyMDE35bm0NuaciDfml6UgR01UKzA4OjAwIOS4i+WNiDU6NDM6NDMsIE1heGltZSBSaXBh
cmQKPjxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4g5YaZ5YiwOgo+PiA+T24gTW9u
LCBKdW4gMDUsIDIwMTcgYXQgMDM6MDM6NDdBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToK
Pj4gPj4gPllvdSBzaG91bGQgYWxzbyBleHBhbmQgZnVuY3Rpb24gc3VuNGlfZHJ2X25vZGVfaXNf
dGNvbigpIGF0Cj4+ID5zdW40aV9kcnYuYwo+PiA+PiA+d2l0aCAKPj4gPj4gPm5ldyBlbnRyaWVz
LCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoaXMgZml0cyBpbiB0aGlzIHBhdGNoLgo+PiA+PiAKPj4g
Pj4gSW5zdGVhZCBJIHRoaW5rIGl0IHNob3VsZCBiZSByZW5hbWVkIHRvIHNvbWV0aGluZyBsaWtl
Cj4+ID4+ICJzdW40aV9kcnZfbm9kZV9pc190Y29uX3dpdGhfY2gwIi4KPj4gPgo+PiA+SSdtIG5v
dCBzdXJlLCBvciBhdCBsZWFzdCwgaXQgc2hvdWxkbid0IG1ha2UgYW55IGRpZmZlcmVuY2UsIHNp
bmNlCj4+ID5UQ09OIHdpdGhvdXQgYSBjaGFubmVsIDAgd2lsbCBub3QgaGF2ZSBhbiBlbmRwb2lu
dCAwLCBzbyB0aGlzIHdpbGwKPmJlCj4+ID5kZWFsdCB3aXRoIGFscmVhZHkuCj4+IAo+PiBCdXQg
dGhhdCB3aWxsIHByZXZlbnQgbmV3IGNvZGVycyBmcm9tIGFkZCBDSDEtbGVzcyBUQ09OCj4+IGNv
bXBhdGlibGVzIHRvIHRoaXMgZnVuY3Rpb24uCj4KPldoeT8gV2UgYWxyZWFkeSBoYXZlIHN1Y2gg
VENPTnMgKGxpa2UgdGhlIEEzMydzLCBvciBWM1MnKSBpbiB0aGF0Cj5mdW5jdGlvbi4KClNvcnJ5
LCBDSDAtbGVzcy4KCj4KPk1heGltZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
