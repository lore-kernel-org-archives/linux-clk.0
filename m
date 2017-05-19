Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: linux-sunxi@googlegroups.com, icenowy@aosc.io
Subject: Re: [linux-sunxi] Re: [RFC PATCH 07/11] drm: sun4i: add support for
 the TV encoder in H3 SoC
Date: Fri, 19 May 2017 20:23:32 +0200
Message-ID: <1958057.WDKm0nQKgW@jernej-laptop>
In-Reply-To: <3FCDBC05-20A1-460C-A21B-8C3E9C776768@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170519180330.7hpfkdqk3r2x3kn5@flea.home>
 <3FCDBC05-20A1-460C-A21B-8C3E9C776768@aosc.io>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

SGksCgpEbmUgcGV0ZWssIDE5LiBtYWogMjAxNyBvYiAyMDowODoxOCBDRVNUIGplIEljZW5vd3kg
WmhlbmcgbmFwaXNhbChhKToKPiDkuo4gMjAxN+W5tDXmnIgyMOaXpSBHTVQrMDg6MDAg5LiK5Y2I
MjowMzozMCwgTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLQplbGVjdHJvbnMuY29t
PiDlhpnliLA6Cj4gPk9uIFRodSwgTWF5IDE4LCAyMDE3IGF0IDEyOjQzOjUwQU0gKzA4MDAsIElj
ZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPj4gQWxsd2lubmVyIEgzIGZlYXR1cmVzIGEgVFYgZW5jb2Rl
ciBzaW1pbGFyIHRvIHRoZSBvbmUgaW4gZWFybGllcgo+ID4KPiA+U29DcywKPiA+Cj4gPj4gYnV0
IHdpdGggc29tZSBkaWZmZXJlbnQgcG9pbnRzIGFib3V0IGNsb2NrczoKPiA+PiAtIEl0IGhhcyBh
IG1vZCBjbG9jayBhbmQgYSBidXMgY2xvY2suCj4gPj4gLSBUaGUgbW9kIGNsb2NrIG11c3QgYmUg
YXQgYSBmaXhlZCByYXRlIHRvIGdlbmVyYXRlIHNpZ25hbC4KPiA+Cj4gPldoeT8KPiAKPiBJdCdz
IGV4cGVyaW1lbnQgcmVzdWx0IGJ5IEplcm5lai4KPiAKPiBUaGUgY2xvY2sgcmF0ZXMgaW4gQlNQ
IGtlcm5lbCBpcyBhbHNvIHNwZWNpYWxseSBkZXNpZ25lZAo+IChQTExfREUgYXQgNDMyTUh6KSBp
biBvcmRlciB0byBiZSBhYmxlIHRvIGZlZWQgdGhlIFRWRS4KCk15IGV4cGVyaW1lbnRzIGFuZCBz
ZWFyY2ggdGhyb3VnaCBCU1AgY29kZSBzaG93ZWQgdGhhdCBUVkUgc2VlbXMgdG8gaGF2ZSAKYWRk
aXRpb25hbCBmaXhlZCBwcmVkaXZpZGVyIDguIFNvIGlmIHlvdSB3YW50IHRvIGdlbmVyYXRlIDI3
IE1IeiBjbG9jaywgdW5pdCAKaGFzIHRvIGJlIGZlZWQgd2l0aCAyMTYgTUh6LiAKClRWRSBoYXMg
b25seSBvbmUgUExMIHNvdXJjZSBQTExfREUuIEFuZCBzaW5jZSAyMTYgTUh6IGlzIGEgYml0IGxv
dyBmb3IgREUyLCAKQlNQIGRlZmF1bHRzIHRvIDQzMiBNSHogZm9yIFBMTF9ERSBhbmQgdXNlIGRp
dmlkZXIgMiB0byBnZW5lcmF0ZSAyMTYgTUh6LiBUaGlzIApjbG9jayBpcyB0aGVuIGRpdmlkZWQg
YnkgOCBpbnRlcm5hbHkgdG8gZ2V0IGZpbmFsIDI3IE1Iei4KClBsZWFzZSBub3RlIHRoYXQgSSBk
b24ndCBoYXZlIGFueSBoYXJkIGV2aWRlbmNlIHRvIHN1cHBvcnQgdGhhdCwgb25seSAKZXhwZXJp
bWVudGFsIGRhdGEuIEhvd2V2ZXIsIG9ubHkgdGhhdCBleHBsYW5hdGlvbiBtYWtlIHNlbnNlIHRv
IG1lLgoKQlRXLCBCU1AgSDMvSDUgVFYgZHJpdmVyIHN1cHBvcnRzIG9ubHkgUEFMIGFuZCBOVFND
IHdoaWNoIGJvdGggdXNlIDI3IE1IeiBiYXNlIApjbG9jay4gRnVydGhlciBleHBlcmltZW50cyBh
cmUgbmVlZGVkIHRvIGNoZWNrIGlmIHRoZXJlIGlzIGFueSBwb3NzaWJpbGl0eSB0byAKaGF2ZSBv
dGhlciByZXNvbHV0aW9ucyBieSBtYW5pcHVsYXRpbmcgY2xvY2tzIGFuZCBnaXZlIG90aGVyIHBy
b3BlciBzZXR0aW5ncy4gCkkgcGxhbiB0byBkbyB0aGF0LCBidXQgbm90IGluIHZlcnkgbmVhciBm
dXR1cmUuCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
