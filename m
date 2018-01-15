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
	<devicetree@vger.kernel.org>,
        Andrea Merello <andrea.merello@gmail.com>
Subject: Re: [PATCH 02/14] mmc: mmci: Don't pretend all variants to have
 MCI_STARBITERR flag
Date: Mon, 15 Jan 2018 17:27:13 +0000
Message-ID: <5ffa4035-0cde-119e-b53e-1af6daab83cc@st.com>
References: <1515759368-16946-1-git-send-email-patrice.chotard@st.com>
 <1515759368-16946-3-git-send-email-patrice.chotard@st.com>
 <CAPDyKFpqENchQs7c1BSJnorTgidbwHFAHByHJU3t9TV6uHurxA@mail.gmail.com>
In-Reply-To: <CAPDyKFpqENchQs7c1BSJnorTgidbwHFAHByHJU3t9TV6uHurxA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgVWxmDQoNCk9uIDAxLzE1LzIwMTggMDE6MzIgUE0sIFVsZiBIYW5zc29uIHdyb3RlOg0KPiBP
biAxMiBKYW51YXJ5IDIwMTggYXQgMTM6MTUsICA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4gd3Jv
dGU6DQo+PiBGcm9tOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+DQo+
Pg0KPj4gVGhpcyBwYXRjaCBwcmVwYXJlcyBmb3Igc3VwcG9ydGluZyB0aGUgU1RNMzIgdmFyaWFu
dCB0aGF0DQo+PiBoYXMgbm8gc3VjaCBiaXQgaW4gdGhlIHN0YXR1cyByZWdpc3Rlci4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWEgTWVyZWxsbyA8YW5kcmVhLm1lcmVsbG9AZ21haWwuY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3Qu
Y29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5jIHwgMTYgKysrKysrKysr
KysrKystLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMgYi9kcml2
ZXJzL21tYy9ob3N0L21tY2kuYw0KPj4gaW5kZXggMzEyNWRjMC4uN2U1NmY4NSAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5jDQo+PiArKysgYi9kcml2ZXJzL21tYy9ob3N0
L21tY2kuYw0KPj4gQEAgLTgzLDYgKzgzLDggQEANCj4+ICAgICogQHFjb21fZG1sOiBlbmFibGVz
IHFjb20gc3BlY2lmaWMgZG1hIGdsdWUgZm9yIGRtYSB0cmFuc2ZlcnMuDQo+PiAgICAqIEByZXZl
cnNlZF9pcnFfaGFuZGxpbmc6IGhhbmRsZSBkYXRhIGlycSBiZWZvcmUgY21kIGlycS4NCj4+ICAg
ICogQG1tY2ltYXNrMTogdHJ1ZSBpZiB2YXJpYW50IGhhdmUgYSBNTUNJTUFTSzEgcmVnaXN0ZXIu
DQo+PiArICogQHN0YXJ0X2VycjogdHJ1ZSBpcyB0aGUgdmFyaWFudCBoYXMgU1RBUlRCSVRFUlIg
Yml0IGluc2lkZSBNTUNJU1RBVFVTDQo+PiArICogICAgICAgICAgICByZWdpc3Rlci4NCj4+ICAg
ICovDQo+PiAgIHN0cnVjdCB2YXJpYW50X2RhdGEgew0KPj4gICAgICAgICAgdW5zaWduZWQgaW50
ICAgICAgICAgICAgY2xrcmVnOw0KPj4gQEAgLTExMyw2ICsxMTUsNyBAQCBzdHJ1Y3QgdmFyaWFu
dF9kYXRhIHsNCj4+ICAgICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIHFjb21fZG1sOw0K
Pj4gICAgICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgcmV2ZXJzZWRfaXJxX2hhbmRsaW5n
Ow0KPj4gICAgICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgbW1jaW1hc2sxOw0KPj4gKyAg
ICAgICBib29sICAgICAgICAgICAgICAgICAgICBzdGFydF9lcnI7DQo+IA0KPiBUbyBiZSBjb25z
aXN0ZW50IHdpdGggaG93IHdlIGltcGxlbWVudCBzdXBwb3J0IGZvciBzaW1pbGFyIHZhcmlhbnQN
Cj4gdmFyaWF0aW9ucywgSSB3b3VsZCBwcmVmZXIgdG8gaGF2ZSB0aGlzIGJlaW5nIGEgdTMyLiBT
b21ldGhpbmcgYWxvbmcNCj4gdGhlIGxpbmVzIG9mIGhvdyB0aGUgImJ1c3lfZGV0ZWN0X2ZsYWci
IGlzIGJlaW5nIHVzZWQuDQoNCk9LIGkgd2lsbCB1cGRhdGUgdGhpcyBpbiB2Mg0KDQpUaGFua3MN
Cg0KUGF0cmljZQ0KDQo+IA0KPiBPdGhlcndpc2UgdGhpcyBsb29rcyBnb29kIHRvIG1lLg0KPiAN
Cj4gWy4uLl0NCj4gDQo+IEtpbmQgcmVnYXJkcw0KPiBVZmZlDQo+IA==
