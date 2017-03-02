Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
In-Reply-To: <20170302140859.aqvwtgzxkdi2lqbc@lukather>
References: <20170301152220.MEgmqtKw@smtp2p.mail.yandex.net>
 <20170302140859.aqvwtgzxkdi2lqbc@lukather>
Subject: Re: [linux-sunxi] Re: [PATCH 2/3] clk: sunxi-ng: add support for PRCM
 CCUs
MIME-Version: 1.0
Message-Id: <3232491488467598@web22o.yandex.ru>
Date: Thu, 02 Mar 2017 23:13:18 +0800
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

CgowMi4wMy4yMDE3LCAyMjowOSwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gT24gV2VkLCBNYXIgMDEsIDIwMTcgYXQgMDg6MTc6MzlQTSArMDgw
MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4gwqA+IEknbSBhIGJpdCB3b3JyaWVkIGJ5IHRoYXQg
dG8gYmUgaG9uZXN0LiBZb3UgY2xhaW0gdG8gc3VwcG9ydCB0aGUgQTMxLAo+PiDCoD4geWV0IGp1
Z2RnaW5nIGJ5IHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoYXQgY29kZSB5b3UgbmV2ZXIgYWN0dWFs
bHkKPj4gwqA+IHRlc3RlZCBpdCBvbiB0aGF0IFNvQy4KPj4KPj4gwqBJIG9ubHkgY2xhaW0gdG8g
cmVzZXJ2ZSBwb3NzaWJpbGl0eSB0byBleHRlbmQgdGhlIGRyaXZlciB0byBzdXBwb3J0Cj4+IMKg
QTMxLCBidXQgSSBkaWRuJ3QgY2xhaW0gaXQgY3VycmVudGx5IHN1cHBvcnQgQTMxLgo+Cj4gV2Vs
bCwgeW91IGRpZCBjYWxsIGl0IHN1bjZpLgo+Cj4gUGxlYXNlIHJlbmFtZSBpdCwgYW5kIHdlIHdp
bGwgY29uc29saWRhdGUgaW4gZHVlIHRpbWUuCgpUaGVuIHJlbmFtZSBpdCBiYWNrIHdoZW4gaXQg
cmVhbGx5IGdhaW5zIHN1cHBvcnQgZm9yIEEzMT8KCj4KPiBNYXhpbWUKPgo+IC0tCj4gTWF4aW1l
IFJpcGFyZCwgRnJlZSBFbGVjdHJvbnMKPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
