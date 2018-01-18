Return-Path: <patrice.chotard@st.com>
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Russell King <linux@armlinux.org.uk>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>,
        linux-clk
	<linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 03/15] mmc: mmci: Don't pretend all variants to have
 OPENDRAIN bit
Date: Thu, 18 Jan 2018 13:24:52 +0000
Message-ID: <1fc0817f-2495-6996-4777-abc8c30c20d2@st.com>
References: <1516105859-3525-1-git-send-email-patrice.chotard@st.com>
 <1516105859-3525-4-git-send-email-patrice.chotard@st.com>
 <CAPDyKFrhBfGq0RBBdFLex+88XqrLB-Bm3rc2Q_UZCw8XB520ug@mail.gmail.com>
In-Reply-To: <CAPDyKFrhBfGq0RBBdFLex+88XqrLB-Bm3rc2Q_UZCw8XB520ug@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgVWxmDQoNCk9uIDAxLzE3LzIwMTggMTA6MzMgQU0sIFVsZiBIYW5zc29uIHdyb3RlOg0KPiBb
Li4uXQ0KPiANCj4+ICAgLyogQnVzeSBkZXRlY3Rpb24gZm9yIHRoZSBTVCBNaWNybyB2YXJpYW50
ICovDQo+PiBAQCAtMTQ1NSwxNiArMTQ2NSwxMyBAQCBzdGF0aWMgdm9pZCBtbWNpX3NldF9pb3Mo
c3RydWN0IG1tY19ob3N0ICptbWMsIHN0cnVjdCBtbWNfaW9zICppb3MpDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB+TUNJX1NUX0RBVEEyRElSRU4pOw0KPj4gICAgICAgICAg
fQ0KPj4NCj4+IC0gICAgICAgaWYgKGlvcy0+YnVzX21vZGUgPT0gTU1DX0JVU01PREVfT1BFTkRS
QUlOKSB7DQo+PiAtICAgICAgICAgICAgICAgaWYgKGhvc3QtPmh3X2Rlc2lnbmVyICE9IEFNQkFf
VkVORE9SX1NUKQ0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHdyIHw9IE1DSV9ST0Q7DQo+
PiAtICAgICAgICAgICAgICAgZWxzZSB7DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAvKg0K
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICogVGhlIFNUIE1pY3JvIHZhcmlhbnQgdXNlIHRo
ZSBST0QgYml0IGZvciBzb21ldGhpbmcNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAqIGVs
c2UgYW5kIG9ubHkgaGFzIE9EIChPcGVuIERyYWluKS4NCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAqLw0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHdyIHw9IE1DSV9PRDsNCj4+IC0g
ICAgICAgICAgICAgICB9DQo+PiArICAgICAgIGlmIChpb3MtPmJ1c19tb2RlID09IE1NQ19CVVNN
T0RFX09QRU5EUkFJTiAmJg0KPj4gKyAgICAgICAgICAgaG9zdC0+dmFyaWFudC0+b3BlbmRyYWlu
KSB7DQo+IA0KPiBBIGZldyBuaXRwaWNrcyAoYmVjYXVzZSBJIGFueXdheSBoYWQgc29tZSBjb21t
ZW50IG9uIHBhdGNoNCk6DQo+IA0KPiBUaGUgYWJvdmUgY2FuIGJlIHdyaXR0ZW4gb24gb25lIGxp
bmUgYW5kIHRoZSBicmFja2V0cyBpc24ndCBuZWVkZWQuDQo+IA0KPiBSZXBsYWNlIGhvc3QtPnZh
cmlhbnQtPm9wZW5kcmFpbiB3aXRoIHZhcmlhbnQtPm9wZW5kcmFpbi4gVGhlIHNhbWUNCj4gYXBw
bGllcyB0byB0aGUgYmVsb3cgY2hhbmdlLg0KDQpBaCB5ZXMsIGkgd2lsbCBmaXggaXQNCg0KPiAN
Cj4+ICsgICAgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAgICAgICAgICAqIFRoZSBTVCBNaWNy
byB2YXJpYW50IHVzZSB0aGUgUk9EIGJpdCBmb3INCj4+ICsgICAgICAgICAgICAgICAgKiBzb21l
dGhpbmcgZWxzZSBhbmQgb25seSBoYXMgT0QgKE9wZW4gRHJhaW4pLg0KPj4gKyAgICAgICAgICAg
ICAgICAqLw0KPiANCj4gSSB0aGluayB3ZSBjYW4gcmVtb3ZlIHRoaXMgY29tbWVudCwgYXMgdGhp
cyBpbmZvcm1hdGlvbiBiZWNvbWVzDQo+IGltcGxpY2l0IHdoZW4gd2Ugc3RhcnQgdXNpbmcgdGhl
IHZhcmlhbnQgZGF0YS4NCg0KT2sNCg0KVGhhbmtzDQoNClBhdHJpY2UNCg0KPiANCj4+ICsgICAg
ICAgICAgICAgICBwd3IgfD0gaG9zdC0+dmFyaWFudC0+b3BlbmRyYWluOw0KPj4gICAgICAgICAg
fQ0KPj4NCj4+ICAgICAgICAgIC8qDQo+PiAtLQ0KPj4gMS45LjENCj4+DQo+IA0KPiBLaW5kIHJl
Z2FyZHMNCj4gVWZmZQ0KPiA=
