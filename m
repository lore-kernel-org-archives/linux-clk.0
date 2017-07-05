Return-Path: <gabriel.fernandez@st.com>
From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        "daniel.thompson@linaro.org"
	<daniel.thompson@linaro.org>,
        "andrea.merello@gmail.com"
	<andrea.merello@gmail.com>,
        "radoslaw.pietrzyk@gmail.com"
	<radoslaw.pietrzyk@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        Ludovic BARRE <ludovic.barre@st.com>,
        "Olivier
 BIDEAU" <olivier.bideau@st.com>,
        Amelie DELAUNAY <amelie.delaunay@st.com>,
        "gabriel.fernandez.st@gmail.com" <gabriel.fernandez.st@gmail.com>
Subject: Re: [RESEND PATCH v4] clk: stm32h7: Add stm32h743 clock driver
Date: Wed, 5 Jul 2017 09:27:14 +0000
Message-ID: <67be49fc-ca1b-338c-913e-a0cd19c55697@st.com>
References: <1496818794-14771-1-git-send-email-gabriel.fernandez@st.com>
 <20170621220703.GI4493@codeaurora.org>
 <110cf67f-e1d6-1f99-953c-6b9639bb4910@st.com>
 <20170628155956.GA5316@codeaurora.org>
 <7c0c3861-cf61-a9e2-cd5d-2ae30b8f32fa@st.com>
 <20170630002008.GD22780@codeaurora.org>
 <d325071a-5da5-4ff1-89b9-fc1bbe10e223@st.com>
 <20170630185403.GN22780@codeaurora.org>
In-Reply-To: <20170630185403.GN22780@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

DQoNCk9uIDA2LzMwLzIwMTcgMDg6NTQgUE0sIFN0ZXBoZW4gQm95ZCB3cm90ZToNCj4gT24gMDYv
MzAsIEdhYnJpZWwgRkVSTkFOREVaIHdyb3RlOg0KPj4NCj4+IE9uIDA2LzMwLzIwMTcgMDI6MjAg
QU0sIFN0ZXBoZW4gQm95ZCB3cm90ZToNCj4+PiBPbiAwNi8yOSwgR2FicmllbCBGRVJOQU5ERVog
d3JvdGU6DQo+Pj4+IE9uIDA2LzI4LzIwMTcgMDU6NTkgUE0sIFN0ZXBoZW4gQm95ZCB3cm90ZToN
Cj4+Pj4+IE9uIDA2LzI3LCBHYWJyaWVsIEZFUk5BTkRFWiB3cm90ZToNCj4+Pj4+PiBPbiAwNi8y
Mi8yMDE3IDEyOjA3IEFNLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+Pj4+Pj4+IHJlYWRsX3BvbGxf
dGltZW91dD8NCj4+Pj4+Pj4NCj4+Pj4+PiBpZiBpIHVzZSByZWFkbF9wb2xsX3RpbWVvdXQgKHdp
Y2ggdXNlICdrdGltZV9nZXQoKScpIGl0IGNhbiBiZQ0KPj4+Pj4+IG9wZXJhdGlvbmFsIG9ubHkg
YWZ0ZXIgdGhlIHNlbGVjdGlvbiBvZiBjbG9ja3NvdXJjZSA/IChkZXZpY2VfaW5pdGNhbGwpLg0K
Pj4+Pj4+IEFuZCB0aGVuIGlmIGEgZHJpdmVyIHR1cm4gb24gYSBjbG9jayBiZWZvcmUsIGl0IGNv
dWxkIGJsb2NrZWQgdGhlIGxpbnV4DQo+Pj4+Pj4gY29uc29sZSA/DQo+Pj4+Pj4NCj4+Pj4+IE9r
LiBJIHdvbmRlciBpZiB3ZSBjb3VsZCBhZGQgc29tZSBzb3J0IG9mIHN0YXJ0aW5nIGNoZWNrIHRv
DQo+Pj4+PiByZWFkbF9wb2xsX3RpbWVvdXQoKSB0aGF0IHRlc3RzIHN5c3RlbV9zdGF0ZSBmb3Ig
Ym9vdGluZyB2cy4NCj4+Pj4+IHNjaGVkdWxpbmc/IFRoYXQgc2hvdWxkIGJlIHN1ZmZpY2llbnQg
dG8gaGFuZGxlIHRoaXMgY2FzZT8NCj4+Pj4+DQo+Pj4+IE9vcHMgaSB0aGluayBpIHVuZGVyc3Rv
b2QgbXkgcHJvYmxlbS4uLg0KPj4+PiBpIHVzZWQgcmVhZGxfcG9sbF90aW1lb3V0IGluIGF0b21p
YyBjb250ZXh0Lg0KPj4+PiBJIGhhdmUgdG8gbW92ZSBteSBjb2RlIGluIHRoZSAucHJlcGFyZSBv
cHMuDQo+Pj4+DQo+Pj4+IElmIHlvdSBhcmUgb2sgd2l0aCB0aGF0IGkgd2lsbCBzZW5kIGEgdjUN
Cj4+Pj4NCj4+PiBUaGVyZSdzIHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoKSBmb3IgdGhvc2Ug
bW9kZXMuDQo+Pj4NCj4+IHllcyBpdCdzIGV4YWN0bHkgdGhlIHRlc3QgaSBtYWRlICh1c2UgJ3Jl
YWRsX3BvbGxfdGltZW91dCgpX2F0b21pYycgaW4NCj4+IC5lbmFibGUgb3BzKSBidXQgaSdtIGJs
b2NrZWQuDQo+Pg0KPj4gaWYgaSBkbyB0aGUgc2FtZSBpbiAucHJlcGFyZSBvcHMgd2l0aCAncmVh
ZGxfcG9sbF90aW1lb3V0KCknIGl0J3Mgb2suDQo+IEknbSBzdGlsbCBjb25mdXNlZC4gcmVhZGxf
cG9sbF90aW1lb3V0X2F0b21pYygpIHVzZXMga3RpbWVfZ2V0KCksDQo+IGFuZCBzbyBkb2VzIHJl
YWRsX3BvbGxfdGltZW91dCgpLCBzbyBob3cgZG9lcyBtb3ZpbmcgdG8gdGhlDQo+IHByZXBhcmUg
b3AgZml4IHRoZSBwcm9ibGVtPyBXaGF0J3MgdGhlIGFjdHVhbCBwcm9ibGVtPw0KPg0KWWVzIGJv
dGggdXNlIGt0aW1lX2dldCgpLg0KDQpUaGUgaXNzdWUgY29uY2VybnMgaW50ZXJuYWwvZXh0ZXJu
YWwgb3NjaWxsYXRvciBjbG9ja3MgKHRpbWUgDQpzdGFiaWxpemF0aW9uIGNvdWxkIGJlIGxvbmcp
IGFuZA0KaWYgYSBkcml2ZXIgd2FudHMgdG8gZW5hYmxlIG9uZSB0aGVzZSBjbG9ja3MgYmVmb3Jl
IGRldmljZV9pbml0Y2FsbCgpLg0KDQpCeSBkZWZhdWx0IHRoZSBjbG9ja3NvdXJjZSBpcyB0aGUg
amlmZmllcyB1bnRpbCB0aGUgZW5kIG9mIHRoZSBib290IA0KKGZzX2luaXRjYWxsKQ0KVGhlbiBh
ZnRlciwgdGhlIGJlc3QgY2xvY2tzb3VyY2UgaXMgc2VsZWN0ZWQgKGFybV9zeXN0ZW1fdGltZXIg
b3Igc3RtMzIgDQp0aW1lciwgZXRjLi4uKQ0KVGhlcmUgaXMgbm8gcHJvYmxlbSBhZnRlciBiZWNh
dXNlIHRoZSBjb3VudGVyIGlzIGEgaGFyZHdhcmUgcmVnaXN0ZXIuDQoNCkJ1dCB0aGUgamlmZmll
cyBjb3VudGVyIGlzIGluY3JlbWVudGVkIGJ5IGludGVycnVwdGlvbiBhbmQgZW5hYmxlIG9wDQpk
b2VzIG5vdCBhbGxvdyB0byBiZSBpbnRlcnJ1cHRlZC4gKHdlIGNhbiB3aXRoIHByZXBhcmUgb3Ap
Lg0KDQoNCg0KDQoNCg==
