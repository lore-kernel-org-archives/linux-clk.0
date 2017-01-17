Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
In-Reply-To: <20170117090456.fgw6lpqgurwwcczj@lukather>
References: <20170116180116.36729-2-icenowy@aosc.xyz>
 <20170116180116.36729-3-icenowy@aosc.xyz>
 <20170117090456.fgw6lpqgurwwcczj@lukather>
Subject: Re: [PATCH v2 2/4] clk: sunxi-ng: add support for V3s CCU
MIME-Version: 1.0
Message-Id: <5926181484672894@web12g.yandex.ru>
Date: Wed, 18 Jan 2017 01:08:14 +0800
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

CgoxNy4wMS4yMDE3LCAxNzowNSwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gSGksCj4KPiBPbiBUdWUsIEphbiAxNywgMjAxNyBhdCAwMjowMTox
NEFNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDCoFYzcyBoYXMgYSBzaW1pbGFyIGJ1
dCBjdXQtZG93biBDQ1UgdG8gSDMuCj4+Cj4+IMKgQWRkIHN1cHBvcnQgZm9yIGl0Lgo+Pgo+PiDC
oFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy54eXo+Cj4+IMKgLS0t
Cj4KPiBPdXRwdXQgZnJvbSBjaGVja3BhdGNoOgo+IHRvdGFsOiA1IGVycm9ycywgMiB3YXJuaW5n
cywgMyBjaGVja3MsIDg1NyBsaW5lcyBjaGVja2VkCgpJIHJlbWVtYmVyZWQgc29tZSBlcnJvcnMn
IGNvZGUgaXMgZGlyZWN0bHkgZGVyaXZlZCBmcm9tIGNjdS1zdW44aS1oMy5jLApzbyBJIGdlbmVy
YXRlZCBhIHBhdGNoIGZpbGUgZm9yICJjbGs6IHN1bnhpLW5nOiBBZGQgSDMgY2xvY2tzIiBhbmQg
cnVuCmNoZWNrcGF0Y2ggb24gaXQ6CnRvdGFsOiA0IGVycm9ycywgNSB3YXJuaW5ncywgMTE1OSBs
aW5lcyBjaGVja2VkCgpTaG91bGQgSSBzdGlsbCBnZXQgYWxsIGVycm9ycyBmaXhlZD8KCj4KPj4g
wqBJIHRoaW5rIEkgc2hvdWxkIG1ha2UgYSBjb21wYXJzaW9uIGJldHdlZW4gVjNzIGFuZCBIMyBD
Q1UgaGVyZToKPj4gwqAoSSB3b24ndCBtZW50aW9uIHRoZSBtaXNzaW5nL2FkZGVkIGNsb2NrcyBo
ZXJlLCBvbmx5IGxpc3QgY29uZmxpY3RpbmcgY2xvY2tzKQo+Cj4gVGhhdCBzaG91bGQgYmUgaW4g
eW91ciBjb21taXQgbG9nLgo+Cj4+IMKgLSAiYnVzLWVoY2kwIiBpcyBhdCBkaWZmZXJlbnQgYml0
IChUaGUgYml0IHRoYXQgaXMgImJ1cy1laGNpMCIgb24gVjNzIGlzCj4+IMKgwqDCoCJidXMtZWhj
aTIiIG9uIEgzKQo+PiDCoC0gVGhlIG11eCBvZiAiY2UiIGlzIGRpZmZlcmVudC4gKEFjY29yZGlu
ZyB0aGUgdmlldyBhdCBWM3MgZGF0YXNoZWV0IGJ5IHRoZQo+PiDCoMKgwqBhdXRob3Igb2Ygc3Vu
NGktc3MsIFYzcyBtYXkgaGF2ZSBzdW40aS1zcywgbm90IHN1bjhpLWNlKQo+PiDCoC0gVGhlIG11
eCBvZiAiZGUiIGlzIGRpZmZlcmVudC4gKFYzcyBkbyBub3QgaGF2ZSAicGxsLWRlIiwgYnV0IGl0
IGNhbiBtdXggImRlIgo+PiDCoMKgwqB0byAicGxsLXZpZGVvIikKPj4gwqAtIENsb2NrcyBhYm91
dCBDU0kgbGFyZ2VseSBkaWZmZXJzLiAoQXMgVjNzIGlzIGRlc2lnbmVkIGFzIGEgY2FtZXJhIFNv
QywgYW5kCj4+IMKgwqDCoGl0IGhhdmUgYW4gZXh0cmEgInBsbC1pc3AiKQo+Cj4gT0suCj4KPiBU
aGFua3MsCj4gTWF4aW1lCj4KPiAtLQo+IE1heGltZSBSaXBhcmQsIEZyZWUgRWxlY3Ryb25zCj4g
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHA6Ly9mcmVlLWVsZWN0
cm9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK
