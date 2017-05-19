Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Sat, 20 May 2017 02:06:57 +0800
In-Reply-To: <20170519180215.7lc7duueu74pt4kz@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-2-icenowy@aosc.io>
 <20170519180215.7lc7duueu74pt4kz@flea.home>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 01/11] dt-bindings: update the binding for Allwinner
 H3 TVE support
To: linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <ED64A56C-4FD3-4878-B67E-1501F20C7B8D@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Cgrkuo4gMjAxN+W5tDXmnIgyMOaXpSBHTVQrMDg6MDAg5LiK5Y2IMjowMjoxNSwgTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+IOWGmeWIsDoKPk9uIFRodSwg
TWF5IDE4LCAyMDE3IGF0IDEyOjQzOjQ0QU0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+
IC1PbiBTb0NzIG90aGVyIHRoYW4gdGhlIEEzMyBhbmQgVjNzLCB0aGVyZSBpcyBvbmUgbW9yZSBj
bG9jawo+cmVxdWlyZWQ6Cj4+ICtGb3IgdGhlIGZvbGxvd2luZyBjb21wYXRpYmxlczoKPj4gKyAg
ICogYWxsd2lubmVyLHN1bjVpLWExMy10Y29uCj4+ICsgICAqIGFsbHdpbm5lcixzdW42aS1hMzEt
dGNvbgo+PiArICAgKiBhbGx3aW5uZXIsc3VuNmktYTMxcy10Y29uCj4+ICsgICAqIGFsbHdpbm5l
cixzdW44aS1hMzMtdGNvbgo+PiArICAgKiBhbGx3aW5uZXIsc3VuOGktdjNzLXRjb24KPj4gK3Ro
ZXJlIGlzIG9uZSBtb3JlIGNsb2NrIGFuZCBvbmUgbW9yZSBwcm9wZXJ0eSByZXF1aXJlZDoKPj4g
KyAtIGNsb2NrczoKPj4gKyAgIC0gJ3Rjb24tY2gwJzogVGhlIGNsb2NrIGRyaXZpbmcgdGhlIFRD
T04gY2hhbm5lbCAwCj4+ICsgLSBjbG9jay1vdXRwdXQtbmFtZXM6IE5hbWUgb2YgdGhlIHBpeGVs
IGNsb2NrIGNyZWF0ZWQKPj4gKwo+PiArRm9yIHRoZSBmb2xsb3dpbmcgY29tcGF0aWJsZXM6Cj4+
ICsgICAqIGFsbHdpbm5lcixzdW41aS1hMTMtdGNvbgo+PiArICAgKiBhbGx3aW5uZXIsc3VuNmkt
YTMxLXRjb24KPj4gKyAgICogYWxsd2lubmVyLHN1bjZpLWEzMXMtdGNvbgo+PiArICAgKiBhbGx3
aW5uZXIsc3VuOGktaDMtdGNvbjAKPj4gK3RoZXJlIGlzIG9uZSBtb3JlIGNsb2NrIHJlcXVpcmVk
Ogo+PiAgICAgLSAndGNvbi1jaDEnOiBUaGUgY2xvY2sgZHJpdmluZyB0aGUgVENPTiBjaGFubmVs
IDEKPgo+UHV0dGluZyBJRCdzIGluIHRoZSBjb21wYXRpYmxlIG5hbWUgaXMgdXN1YWxseSBhIGJh
ZCBpZGVhLiBXaGF0IGlzIHRoZQo+ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28/IE9ubHkgdGhh
dCB0aGUgc2Vjb25kIG9uZSBkb2Vzbid0IGhhdmUgYQo+Y2xvY2s/CgpZZXMuCgo+Cj5UaGF0IHNl
ZW1zIGhpZ2hseSB1bmxpa2VseS4gSG93IGRvZXMgaXQgZ2VuZXJhdGUgdGhlIHBpeGVsIGNsb2Nr
Cj5mcmVxdWVuY3k/CgpZZXMgaXQgc2VlbXMgaW1wb3NzaWJsZSwgYnV0IGl0J3MgYWxzbyB0aGUg
ZmFjdC4KClRoZXJlJ3Mgb25seSBvbmUgQ0xLX1RDT04gaW4gSDMvNSwgd2hpY2ggaXMgZm9yIFRD
T04wLgoKSXQncyBwb3NzaWJsZSB0aGF0IGxjZC1jaDEgY2xrIGlzIENMS19UVkUsIGJ1dCBpdCdz
IHN0aWxsIGEgd2VpcmQgc2l0dWF0aW9uIC0tCkFsdGhvdWdoIHdlIGhhdmUgYSBsY2QtY2gxIGNs
b2NrLCB3ZSBjYW5ub3QgdG91Y2ggaXQsIG90aGVyd2lzZQp0aGUgVFZFIHdpbGwgcmVmdXNlIHRv
IHdvcmsgKHRoZSBUVkUgY2FuIG9ubHkgd29yayB1bmRlciAyMTZNSHopLgoKPgo+TWF4aW1lCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsCg==
