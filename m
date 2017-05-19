Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Sat, 20 May 2017 02:08:18 +0800
In-Reply-To: <20170519180330.7hpfkdqk3r2x3kn5@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-8-icenowy@aosc.io>
 <20170519180330.7hpfkdqk3r2x3kn5@flea.home>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 07/11] drm: sun4i: add support for the TV encoder in
 H3 SoC
To: Maxime Ripard <maxime.ripard@free-electrons.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <3FCDBC05-20A1-460C-A21B-8C3E9C776768@aosc.io>
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Cgrkuo4gMjAxN+W5tDXmnIgyMOaXpSBHTVQrMDg6MDAg5LiK5Y2IMjowMzozMCwgTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+IOWGmeWIsDoKPk9uIFRodSwg
TWF5IDE4LCAyMDE3IGF0IDEyOjQzOjUwQU0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+
IEFsbHdpbm5lciBIMyBmZWF0dXJlcyBhIFRWIGVuY29kZXIgc2ltaWxhciB0byB0aGUgb25lIGlu
IGVhcmxpZXIKPlNvQ3MsCj4+IGJ1dCB3aXRoIHNvbWUgZGlmZmVyZW50IHBvaW50cyBhYm91dCBj
bG9ja3M6Cj4+IC0gSXQgaGFzIGEgbW9kIGNsb2NrIGFuZCBhIGJ1cyBjbG9jay4KPj4gLSBUaGUg
bW9kIGNsb2NrIG11c3QgYmUgYXQgYSBmaXhlZCByYXRlIHRvIGdlbmVyYXRlIHNpZ25hbC4KPgo+
V2h5PwoKSXQncyBleHBlcmltZW50IHJlc3VsdCBieSBKZXJuZWouCgpUaGUgY2xvY2sgcmF0ZXMg
aW4gQlNQIGtlcm5lbCBpcyBhbHNvIHNwZWNpYWxseSBkZXNpZ25lZAooUExMX0RFIGF0IDQzMk1I
eikgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBmZWVkIHRoZSBUVkUuCgo+Cj5NYXhpbWUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
