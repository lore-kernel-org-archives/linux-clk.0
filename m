Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
In-Reply-To: <20170117090549.uqwsiwmclzhx7456@lukather>
References: <20170116180116.36729-2-icenowy@aosc.xyz>
 <20170117090549.uqwsiwmclzhx7456@lukather>
Subject: Re: [PATCH v2 1/4] arm: sunxi: add support for V3s SoC
MIME-Version: 1.0
Message-Id: <3856551484671977@web20j.yandex.ru>
Date: Wed, 18 Jan 2017 00:52:57 +0800
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Zepan <715805855@qq.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

CgoxNy4wMS4yMDE3LCAxNzowNiwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gT24gVHVlLCBKYW4gMTcsIDIwMTcgYXQgMDI6MDE6MTNBTSArMDgw
MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4gwqBBbGx3aW5uZXIgVjNzIGlzIGEgbG93LWVuZCBz
aW5nbGUtY29yZSBDb3J0ZXgtQTcgU29DLCB3aXRoIDY0TUIKPj4gwqBpbnRlZ3JhdGVkIERSQU0s
IGFuZCBzZXZlcmFsIHBlcmlwaGVyYWxzLgo+Pgo+PiDCoFNpZ25lZC1vZmYtYnk6IEljZW5vd3kg
WmhlbmcgPGljZW5vd3lAYW9zYy54eXo+Cj4+IMKgLS0tCj4+IMKgQ2hhbmdlcyBpbiB2MjoKPj4g
wqAtIFVzZWQgbGludXgtc3VueGkub3JnIHdpa2kgaG9zdGVkIGFkZHJlc3Mgb2YgVjNzIGRhdGFz
aGVldC4KPj4KPj4gwqBOb3RlOiB0aGUgVjNzIGRhdGFzaGVldCBjb250YWlucyBpdHMgdXNlciBt
YW51YWwuCj4KPiBUaGF0IHdvdWxkIGJlIGdyZWF0IHRvIHVzZSBVc2VyIE1hbnVhbCBpbiB0aGUg
ZmlsZW5hbWUgcmF0aGVyIHRoYW4KPiBkYXRhc2hlZXQgdGhlbi4gVGhlIGRhdGFzaGVldCBpcyBz
b21ldGhpbmcgZGlmZmVyZW50LgoKQWxsd2lubmVyIG5hbWVkIGl0IGRhdGFzaGVldC4KCkZvciBw
cmV2aW91cyBTb0NzLCBkYXRhc2hlZXQgd2lsbCBjb250YWluIGluZm8gYWJvdXQgcGlucywgYW5k
IHVzZXIgbWFudWFsCmFib3V0IHJlZ2lzdGVycy4KCkJ1dCBmb3IgSDMgYW5kIFYzcywgZGF0YXNo
ZWV0IG5vdyBjb250YWlucyBib3RoIHBpbnMnIGluZm8gYW5kIHJlZ2lzdGVycycgaW5mby4KCj4K
PiBNYXhpbWUKPgo+IC0tCj4gTWF4aW1lIFJpcGFyZCwgRnJlZSBFbGVjdHJvbnMKPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNv
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
