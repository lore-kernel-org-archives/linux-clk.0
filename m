Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170224002028.miupa6dzefgxbfse@lukather>
References: <20170222231738.HXRSmi86@smtp1o.mail.yandex.net>
 <20170224002028.miupa6dzefgxbfse@lukather>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Feb 2017 23:50:14 +0800
Message-ID: <CAGb2v66AZK+g3xX4cXd8Q6Ob_+SxpYsxHBEfC9Ec2QsdN4eA9A@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 4/9] clk: sunxi-ng: support R40 SoC
To: Icenowy Zheng <icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

SGkgSWNlbm93eSwKCk9uIEZyaSwgRmViIDI0LCAyMDE3IGF0IDg6MjAgQU0sIE1heGltZSBSaXBh
cmQKPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPiB3cm90ZToKPiBPbiBXZWQsIEZl
YiAyMiwgMjAxNyBhdCAwMTo1NDo1OFBNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+Pgo+
PiAyMDE35bm0MuaciDIy5pelIDA3OjAz5LqOIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRA
ZnJlZS1lbGVjdHJvbnMuY29tPuWGmemBk++8mgo+PiA+Cj4+ID4gSGksCj4+ID4KPj4gPiBPbiBT
YXQsIEZlYiAxOCwgMjAxNyBhdCAwMTozNzoxN0FNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3Rl
Ogo+PiA+ID4gQWxsd2lubmVyIFI0MCBTb0MgaGF2ZSBhIGNsb2NrIGNvbnRyb2xsZXIgbW9kdWxl
IGluIHRoZSBzdHlsZSBvZiB0aGUKPj4gPiA+IFNvQ3MgYmV5b25kIHN1bjZpLCBob3dldmVyLCBp
dCdzIG1vcmUgcmljaCBhbmQgY29tcGxleC4KPj4gPiA+Cj4+ID4gPiBBZGQgc3VwcG9ydCBmb3Ig
aXQuCj4+ID4gPgo+PiA+ID4gQXMgdGhlIHVzZXIgbWFudWFsIGlzIHN0aWxsIG5vdCBhdmFpbGFi
bGUsIHRoaXMgZHJpdmVyIGlzIG1hZGUgd2l0aAo+PiA+ID4ga25vd2xlZGdlIGZyb20gY2xrLXN1
bjhpdzExLmMgaW4gdGhlIEJTUCBrZXJuZWwgc291cmNlLgo+PiA+Cj4+ID4gTWlzc2luZyBTb0Iu
Cj4+ID4KPj4gPiBXaHkgYXJlIHNvbWUgcGF0Y2hlcyB0YWdnZWQgYXMgUkZDIGFuZCBzb21lIGRv
bid0Pwo+Pgo+PiBUaGVyZSdzIHN0aWxsIG5vIG9wZW4gVXNlciBNYW51YWwgZm9yIFI0MCwgc28g
SSB0YWdnZWQgQ0NVLXJlbGF0ZWQKPj4gZHJpdmVycyBSRkMuCj4+Cj4+IFBpbmN0cmwgZHJpdmVy
IGNhbiBiZSB3cml0dGVuIHdpdGggdGhlIGRhdGFzaGVldCBkcmFmdCwgd2hpY2ggaXMKPj4gYXZh
aWxhYmxlIG5vdy4KPj4KPj4gRm9yIFVTQiB3ZSBoYXZlIG5ldmVyIHVzZXIgbWFudWFsIHNvIGV2
ZXJ5dGhpbmcgaXMgZWR1Y2F0ZWQgZ3Vlc3MgLS0KPj4gc28gaXQncyBub3QgUkZDLgo+Cj4gSXQn
cyBzdGlsbCBraW5kIG9mIHdlaXJkIHRvIG1peCBhbmQgbWF0Y2ggcGF0Y2hlcyB3aXRoIGFuZCB3
aXRob3V0IFJGQwo+IHRhZ3MuCgpBbGx3aW5uZXIganVzdCByZWxlYXNlZCB0aGUgZG9jcyB0b2Rh
eS4gU2VlCgogICAgaHR0cHM6Ly9naXRodWIuY29tL3RpbmFsaW51eC9kb2NzL3RyZWUvcjQwLXYx
LnkKCkNvdWxkIHlvdSBjaGVjayB5b3VyIHBhdGNoZXMgYWdhaW5zdCBpdCwgYW5kIG1heWJlIHdl
IGRvbid0IG5lZWQgdGhlClJGQyB0YWdzIGFueW1vcmU/CgpDaGVuWXUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
