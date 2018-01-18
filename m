Return-Path: <philippe.cornu@st.com>
From: Philippe CORNU <philippe.cornu@st.com>
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
        Rob Herring
	<robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "gabriel.fernandez.st@gmail.com"
	<gabriel.fernandez.st@gmail.com>
Subject: Re: [PATCH 1/2] clk: stm32: END_PRIMARY_CLK should be declare after
 CLK_SYSCLK
Date: Thu, 18 Jan 2018 16:37:15 +0000
Message-ID: <1dd9d895-016f-f74b-ec9d-8e02959a561d@st.com>
References: <1516286980-8603-1-git-send-email-gabriel.fernandez@st.com>
 <1516286980-8603-2-git-send-email-gabriel.fernandez@st.com>
In-Reply-To: <1516286980-8603-2-git-send-email-gabriel.fernandez@st.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgR2FicmllbCwNCg0KVGVzdGVkIHN1Y2Nlc3NmdWxseSBvbiBmNDY5IGRpc2NvIGJvYXJkLg0K
DQpUZXN0ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+DQoNCk1h
bnkgdGhhbmtzLA0KUGhpbGlwcGUgOi0pDQoNCk9uIDAxLzE4LzIwMTggMDM6NDkgUE0sIGdhYnJp
ZWwuZmVybmFuZGV6QHN0LmNvbSB3cm90ZToNCj4gRnJvbTogR2FicmllbCBGZXJuYW5kZXogPGdh
YnJpZWwuZmVybmFuZGV6QHN0LmNvbT4NCj4gDQo+IFVwZGF0ZSBvZiBFTkRfUFJJTUFSWV9DTEsg
d2FzIG1pc3NlZCwgaXQgc2hvdWxkIGJlIGFmdGVyIENMS19TWVNDTEsNCj4gaHNpIGFuZCBzeXNj
bGsgYXJlIG92ZXJ3cml0dGVuIGJ5IGdwaW9hIGFuZCBncGlvYi4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBzdC5jb20+DQo+IC0tLQ0K
PiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3RtMzJmeC1jbG9jay5oIHwgNiArKystLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3RtMzJmeC1jbG9jay5o
IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdG0zMmZ4LWNsb2NrLmgNCj4gaW5kZXggNDli
YjNjMi4uNGQ1MjNiMCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9z
dG0zMmZ4LWNsb2NrLmgNCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdG0zMmZ4
LWNsb2NrLmgNCj4gQEAgLTMzLDExICszMywxMSBAQA0KPiAgICNkZWZpbmUgQ0xLX1NBSTIJCTEx
DQo+ICAgI2RlZmluZSBDTEtfSTJTUV9QRElWCQkxMg0KPiAgICNkZWZpbmUgQ0xLX1NBSVFfUERJ
VgkJMTMNCj4gLQ0KPiAtI2RlZmluZSBFTkRfUFJJTUFSWV9DTEsJCTE0DQo+IC0NCj4gICAjZGVm
aW5lIENMS19IU0kJCQkxNA0KPiAgICNkZWZpbmUgQ0xLX1NZU0NMSwkJMTUNCj4gKw0KPiArI2Rl
ZmluZSBFTkRfUFJJTUFSWV9DTEsJCTE2DQo+ICsNCj4gICAjZGVmaW5lIENMS19IRE1JX0NFQwkJ
MTYNCj4gICAjZGVmaW5lIENMS19TUERJRgkJMTcNCj4gICAjZGVmaW5lIENMS19VU0FSVDEJCTE4
DQo+IA==
