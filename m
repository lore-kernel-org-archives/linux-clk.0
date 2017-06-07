Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 07 Jun 2017 18:00:52 +0800
In-Reply-To: <20170607094343.qqiwnu2mhmoi6jn7@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-5-icenowy@aosc.io> <3642057.oKT9kIlu8M@jernej-laptop>
 <493AC6F2-3CB3-48F5-9568-A34AA927238F@aosc.io>
 <20170607094343.qqiwnu2mhmoi6jn7@flea.lan>
MIME-Version: 1.0
Subject: Re: [PATCH v2 04/11] drm: sun4i: add support for H3's TCON0/1
To: Maxime Ripard <maxime.ripard@free-electrons.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <78252AF1-51FB-4B09-80C2-2597990680CE@aosc.io>
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

Cgrkuo4gMjAxN+W5tDbmnIg35pelIEdNVCswODowMCDkuIvljYg1OjQzOjQzLCBNYXhpbWUgUmlw
YXJkIDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4g5YaZ5YiwOgo+T24gTW9uLCBK
dW4gMDUsIDIwMTcgYXQgMDM6MDM6NDdBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4g
PllvdSBzaG91bGQgYWxzbyBleHBhbmQgZnVuY3Rpb24gc3VuNGlfZHJ2X25vZGVfaXNfdGNvbigp
IGF0Cj5zdW40aV9kcnYuYwo+PiA+d2l0aCAKPj4gPm5ldyBlbnRyaWVzLCBidXQgSSdtIG5vdCBz
dXJlIGlmIHRoaXMgZml0cyBpbiB0aGlzIHBhdGNoLgo+PiAKPj4gSW5zdGVhZCBJIHRoaW5rIGl0
IHNob3VsZCBiZSByZW5hbWVkIHRvIHNvbWV0aGluZyBsaWtlCj4+ICJzdW40aV9kcnZfbm9kZV9p
c190Y29uX3dpdGhfY2gwIi4KPgo+SSdtIG5vdCBzdXJlLCBvciBhdCBsZWFzdCwgaXQgc2hvdWxk
bid0IG1ha2UgYW55IGRpZmZlcmVuY2UsIHNpbmNlCj5UQ09OIHdpdGhvdXQgYSBjaGFubmVsIDAg
d2lsbCBub3QgaGF2ZSBhbiBlbmRwb2ludCAwLCBzbyB0aGlzIHdpbGwgYmUKPmRlYWx0IHdpdGgg
YWxyZWFkeS4KCkJ1dCB0aGF0IHdpbGwgcHJldmVudCBuZXcgY29kZXJzIGZyb20gYWRkIENIMS1s
ZXNzIFRDT04KY29tcGF0aWJsZXMgdG8gdGhpcyBmdW5jdGlvbi4KCj4KPk1heGltZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
