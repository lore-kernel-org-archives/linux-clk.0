Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Rask Ingemann Lambertsen <rask@formelder.dk>
In-Reply-To: <20170226085553.b6o6mv7ibe5op4dg@localhost>
References: <20170226011956.53581-1-icenowy@aosc.xyz>
 <20170226011956.53581-7-icenowy@aosc.xyz>
 <20170226085553.b6o6mv7ibe5op4dg@localhost>
Subject: Re: [PATCH v5 6/7] arm64: dts: allwinner: add Allwinner H5 .dtsi
MIME-Version: 1.0
Message-Id: <3514551488120894@web6m.yandex.ru>
Date: Sun, 26 Feb 2017 22:54:54 +0800
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

CgoyNi4wMi4yMDE3LCAxNjo1NiwgIlJhc2sgSW5nZW1hbm4gTGFtYmVydHNlbiIgPHJhc2tAZm9y
bWVsZGVyLmRrPjoKPiBPbiBTdW4sIEZlYiAyNiwgMjAxNyBhdCAwOToxOTo1NUFNICswODAwLCBJ
Y2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDCoEZyb206IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5
d2FyYUBhcm0uY29tPgo+Pgo+PiDCoFRoZSBBbGx3aW5uZXIgSDUgU29DIGlzIHBpbi1jb21wYXRp
YmxlIHRvIHRoZSBIMyBTb0MsIGJ1dCB1c2VzCj4+IMKgQ29ydGV4LUE1MyBjb3JlcyBpbnN0ZWFk
Lgo+PiDCoEJhc2VkIG9uIHRoZSBub3cgc2hhcmVkIGJhc2UgLmR0c2kgZGVzY3JpYmluZyB0aGUg
Y29tbW9uIHBlcmlwaGVyYWxzCj4+IMKgZGVzY3JpYmUgdGhlIEg1IHNwZWNpZmljIG5vZGVzIG9u
IHRvcCBvZiB0aGF0Lgo+PiDCoFRoYXQgc3ltbGlua3MgaW4gdGhlIHN1bnhpLWgzLWg1LmR0c2kg
ZnJvbSB0aGUgYXJjaC9hcm0gdHJlZS4KPj4KPj4gwqBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5
d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KPj4gwqBbSWNlbm93eTogYWRkIEg1IHBpbmN0
cmwgY29tcGF0aWJsZSwgYW5kIGNoYW5nZXMgZm9yIG15IGgzLWg1IGR0c2kKPj4gwqDCoHJlZmFj
dG9yLCBjb21taXQgbWVzc2FnZSBjaGFuZ2UgdG8gbWV0IG5ldyBhcm02NCBuYW1pbmcgc2NoZW1l
LAo+Cj4gcy9jaGFuZ2UgdG8gbWV0L2NoYW5nZSB0byBtZWV0LyBvciBzL2NoYW5nZSB0byBtZXQv
Y2hhbmdlZCB0byBtZWV0LyA/Cj4KPj4gwqBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbGx3aW5uZXIvc3VueGktaDMtaDUuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lu
bmVyL3N1bnhpLWgzLWg1LmR0c2kKPj4gwqBuZXcgZmlsZSBtb2RlIDEyMDAwMAo+PiDCoGluZGV4
IDAwMDAwMDAwMDAwMC4uMDM2ZjAxZGMyYjliCj4+IMKgLS0tIC9kZXYvbnVsbAo+PiDCoCsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWgzLWg1LmR0c2kKPj4gwqBAQCAt
MCwwICsxIEBACj4+IMKgKy4uLy4uLy4uLy4uL2FybS9ib290L2R0cy9zdW54aS1oMy1oNS5kdHNp
Cj4+IMKgXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCj4KPiBCdXQgaXQncyBtaXNzaW5nIG1v
cmUgdGhhbiBqdXN0IGEgbmV3bGluZSwgaXNuJ3QgaXQ/IFNob3VsZG4ndCBpdCByZWFkCj4KPiAj
aW5jbHVkZSA8Li4vLi4vLi4vLi4vYXJtL2Jvb3QvZHRzL3N1bnhpLWgzLWg1LmR0c2k+CgpPaCB5
b3UgbWF5IGRvIG5vdCBrbm93IHdoYXQgYSBzeW1saW5rIHNlZW1zIGxpa2UgaW4gZ2l0IGZvcm1h
dC1wYXRjaC4KClRoaXMgaXMgYSBzeW1saW5rLgoKSXQncyBtb2RlIGlzIG5vdCAxMDA2NDQsIGJ1
dCAxMjAwMDAKCj4KPiA/Cj4KPiAtLQo+IFJhc2sgSW5nZW1hbm4gTGFtYmVydHNlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
