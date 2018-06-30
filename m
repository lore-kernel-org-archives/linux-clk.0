Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <3837144.KdEe8HRubn@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180625120304.7543-7-jernej.skrabec@siol.net>
 <CAGb2v65dNvqcWa7MUMesrEeDGfEmd0xPpKQmbqJ60_FHe=Y_JA@mail.gmail.com>
 <3837144.KdEe8HRubn@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 30 Jun 2018 09:09:57 +0800
Message-ID: <CAGb2v65xZe8VM+dOd1fchXgekpgzvj1s75zdjz-6Met4K-5nBg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v3 06/24] drm/sun4i: Fix releasing node when
 enumerating enpoints
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

T24gU2F0LCBKdW4gMzAsIDIwMTggYXQgMzoxNSBBTSwgSmVybmVqIMWga3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BzaW9sLm5ldD4gd3JvdGU6Cj4gRG5lIMSNZXRydGVrLCAyOC4ganVuaWogMjAxOCBv
YiAwMzo1MzozNiBDRVNUIGplIENoZW4tWXUgVHNhaSBuYXBpc2FsKGEpOgo+PiBPbiBNb24sIEp1
biAyNSwgMjAxOCBhdCA4OjAyIFBNLCBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lv
bC5uZXQ+Cj4gd3JvdGU6Cj4+ID4gc3VuNGlfZHJ2X2FkZF9lbmRwb2ludHMoKSBoYXMgYSBtZW1v
cnkgbGVhayBzaW5jZSBpdCB1c2VzIG9mX25vZGVfcHV0KCkKPj4gPiB3aGVuIHJlbW90ZSBpcyBl
cXVhbCB0byBOVUxMIGFuZCBkb2VzIG5vdGhpbmcgd2hlbiByZW1vdGUgaGFzIGEgdmFsaWQKPj4g
PiBwb2ludGVyLgo+PiA+Cj4+ID4gSW52ZXJ0IHRoZSBsb2dpYyB0byBmaXggbWVtb3J5IGxlYWsu
Cj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNA
c2lvbC5uZXQ+Cj4+Cj4+IEdpdmVuIHRoaXMgaXMgYSBmaXgsIGl0IHNob3VsZCBoYXZlIEZpeGVz
IGFuZCBzdGFibGUgdGFncy4KPgo+IEhvdyBzaG91bGQgYmUgdGhpcyBoYW5kbGVkIGdpdmVuIHRo
YXQgdGhlIHBhdGNoIGlzIGFscmVhZHkgbWVyZ2VkIGFuZCBjYW5ub3QKPiBiZSBkcm9wcGVkPwoK
V2UgY2FuJ3QuIFdlJ2xsIGhhdmUgdG8gbWFudWFsbHkgc3VibWl0IGl0IGZvciBzdGFibGUgb25j
ZSB0aGlzIGxhbmRzCmluIExpbnVzJyB0cmVlLgoKQ2hlbll1CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
