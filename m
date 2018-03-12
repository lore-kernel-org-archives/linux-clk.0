Return-Path: <gabriel.fernandez@st.com>
From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Alexandre TORGUE
	<alexandre.torgue@st.com>,
        Lee Jones <lee.jones@linaro.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "gabriel.fernandez.st@gmail.com"
	<gabriel.fernandez.st@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "Olivier BIDEAU" <olivier.bideau@st.com>
Subject: Re: [PATCH v2 00/12] Introduce STM32MP1 clock driver
Date: Mon, 12 Mar 2018 08:34:11 +0000
Message-ID: <13f327c2-5777-8425-9611-b9ef96f9d185@st.com>
References: <1520528045-18330-1-git-send-email-gabriel.fernandez@st.com>
 <1520808064.5otv3fo1pe.astroid@resonance.none>
In-Reply-To: <1520808064.5otv3fo1pe.astroid@resonance.none>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

TWFueSBUaGFua3MgTWlrZSAhDQoNCkJlc3QgUmVnYXJkcw0KDQpHYWJyaWVsLg0KDQoNCk9uIDAz
LzExLzIwMTggMTE6NDIgUE0sIE1pY2hhZWwgVHVycXVldHRlIHdyb3RlOg0KPiBFeGNlcnB0cyBm
cm9tIGdhYnJpZWwuZmVybmFuZGV6QHN0LmNvbSdzIG1lc3NhZ2Ugb2YgTWFyY2ggOCwgMjAxOCA4
OjUzIA0KPiBhbToNCj4+IEZyb206IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRl
ekBzdC5jb20+DQo+Pg0KPj4gdjI6DQo+PiDCoCAtIERvbid0IHVzZSBNRkQsIHVzZSBleGlzdGlu
ZyBiaW5kaW5nIG9mIFNUTTMyIFJDQy4NCj4+IMKgIC0gUmV3b3JrIFBlcmlwaGVyYWwgYW5kIEtl
cm5lbCBjbG9ja3MNCj4+IMKgIC0gY29zbWV0aWMgY2hhbmdlcw0KPj4NCj4+IFRoaXMgcGF0Y2gt
c2V0IGludHJvZHVjZXMgY2xvY2sgZHJpdmVyIGZvciBTVE0zMk1QMTU3IGJhc2VkIG9uIEFybSAN
Cj4+IENvcnRleC1BNy4NCj4+IFRoZSBkcml2ZXIgcGF0Y2ggaXMgc3BsaXQgaW4gc2V2ZXJhbCBw
YXRjaGVzIChieSBraW5kIG9mIGNsb2NrKSB0byANCj4+IGZhY2lsaXRhdGUNCj4+IGNvZGUgcmV2
aWV3aW5nLg0KPg0KPiBBcHBsaWVkIHRvIGNsay1zdG0zMm1wMSB0b3dhcmRzIHY0LjE3Lg0KPg0K
PiBSZWdhcmRzLA0KPiBNaWtlDQo+DQo+Pg0KPj4gR2FicmllbCBGZXJuYW5kZXogKDEyKToNCj4+
IMKgIGR0LWJpbmRpbmdzOiBEb2N1bWVudCBTVE0zMk1QMSBSZXNldCBDbG9jayBDb250cm9sbGVy
IChSQ0MpIGJpbmRpbmdzDQo+PiDCoCBjbGs6IHN0bTMybXAxOiBJbnRyb2R1Y2UgU1RNMzJNUDEg
Y2xvY2sgZHJpdmVyDQo+PiDCoCBjbGs6IHN0bTMybXAxOiBhZGQgTVAxIGdhdGUgZm9yIGhzZS9o
c2kvY3NpIG9zY2lsbGF0b3JzDQo+PiDCoCBjbGs6IHN0bTMybXAxOiBhZGQgU291cmNlIENsb2Nr
cyBmb3IgUExMcw0KPj4gwqAgY2xrOiBzdG0zMm1wMTogYWRkIFBMTCBjbG9ja3MNCj4+IMKgIGNs
azogc3RtMzJtcDE6IGFkZCBQb3N0LWRpdmlkZXJzIGZvciBQTEwNCj4+IMKgIGNsazogc3RtMzJt
cDE6IGFkZCBTdWIgU3lzdGVtIGNsb2Nrcw0KPj4gwqAgY2xrOiBzdG0zMm1wMTogYWRkIEtlcm5l
bCB0aW1lcnMNCj4+IMKgIGNsazogc3RtMzJtcDE6IGFkZCBQZXJpcGhlcmFsICYgS2VybmVsIENs
b2Nrcw0KPj4gwqAgY2xrOiBzdG0zMm1wMTogYWRkIFJUQyBjbG9jaw0KPj4gwqAgY2xrOiBzdG0z
Mm1wMTogYWRkIE1DTyBjbG9ja3MNCj4+IMKgIGNsazogc3RtMzJtcDE6IGFkZCBEZWJ1ZyBjbG9j
a3MNCj4+DQo+PiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAxLXJj
Yy50eHTCoCB8wqDCoCA2MCArDQo+PiDCoGRyaXZlcnMvY2xrL0tjb25maWfCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKg
IDYgKw0KPj4gwqBkcml2ZXJzL2Nsay9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEgKw0KPj4gwqBkcml2
ZXJzL2Nsay9jbGstc3RtMzJtcDEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDIxMTcgDQo+PiArKysrKysrKysrKysrKysrKysrKw0KPj4gwqBpbmNs
dWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N0bTMybXAxLWNsa3MuaMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMjU0ICsrKw0KPj4gwqA1IGZpbGVzIGNoYW5nZWQsIDI0MzggaW5zZXJ0aW9ucygrKQ0KPj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svc3Qsc3RtMzJtcDEtcmNjLnR4dA0KPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9jbGsvY2xrLXN0bTMybXAxLmMNCj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svc3RtMzJtcDEtY2xrcy5oDQo+Pg0KPj4gLS0gDQo+PiAxLjkuMQ0K
Pj4NCj4+DQo=
