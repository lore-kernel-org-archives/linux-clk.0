Return-Path: <Chris.Brandt@renesas.com>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman
	<horms+renesas@verge.net.au>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] clk: renesas: rz: Select EXTAL vs USB clock
Date: Tue, 30 Aug 2016 13:31:23 +0000
Message-ID: <SG2PR06MB1165D004A2047B081B5456938AE00@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160825190518.20764-1-chris.brandt@renesas.com>
 <20160830031358.19468-1-chris.brandt@renesas.com>
 <CAMuHMdUEK47vKF2qO-_p4i0xEqnWG9Vu2AH_1f=eQ_mz4mwDjA@mail.gmail.com>
In-Reply-To: <CAMuHMdUEK47vKF2qO-_p4i0xEqnWG9Vu2AH_1f=eQ_mz4mwDjA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIGdvb2QgcmV2aWV3IQ0KDQoNCk9uIEF1ZyAz
MCwgMjAxNiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBJZiB5b3Ugd291bGQgdXNlICJj
cGdfbW9kZSA9IChpb3JlYWQxNihwcHIwKSA+PiAyKSAmIDE7IiwgdGhlIHZhbHVlIG9mIGNwZ19t
b2RlIHdvdWxkDQo+IGJlIGluIHN5bmMgd2l0aCBUYWJsZSA2LjIuIFRoZW4geW91IGNhbiBhdm9p
ZCByZWx5aW5nIG9uIGFjdHVhbCBjbG9jayBuYW1lcyBpbiBEVCwgYW5kDQo+IGtlZXANCj4NCj4g
ICAgcGFyZW50X25hbWUgPSBvZl9jbGtfZ2V0X3BhcmVudF9uYW1lKG5wLCBjcGdfbW9kZSk7DQo+
DQo+IFRoZSBiaW5kaW5ncyBhbHJlYWR5IGRpY3RhdGUgdGhlIHBhcmVudCBjbG9ja3MgbXVzdCBt
YXRjaCBjbG9jayBtb2RlcyBpbiB0aGUgZGF0YXNoZWV0LA0KPiBpLmUuIFRhYmxlIDYuMi4NCg0K
Q29vbCB0cmljay4gSSBndWVzcyBJIGRvbid0IGdldCB1bmRlcnN0YW5kIGFsbCB0aGUgIkRUIE1h
Z2ljIiB5ZXQuDQpJJ2xsIHVwZGF0ZSB0aGUgcGF0Y2ggYW5kIHJlc2VuZC4NCg0KDQo+IEZvciBl
YXNpZXIgbWFpbnRlbmFuY2UsIEkgd291bGQgZmFjdG9yIG91dCByZWFkaW5nIHRoZSBtb2RlIHBp
bnMgaW4gYSBzZXBhcmF0ZSBmdW5jdGlvbi4NCj4gV2hlbiBhIHByb3BlciBHUElPIGRyaXZlciBp
cyBhZGRlZCwgdGhlIGZ1bmN0aW9uIGNhbiBiZSByZW1vdmVkLCBhbmQgaXRzIGNhbGxzaXRlIHVw
ZGF0ZWQuDQoNCk9LLiBJIHNlZSBzZXR1cC1yY2FyLWdlbjIuYyBoYWQgYSBzZXBhcmF0ZSByY2Fy
X2dlbjJfcmVhZF9tb2RlX3BpbnMoKSBmdW5jdGlvbi4NCkluc2lkZSBvZiBjbGstcnouYyBJJ2xs
IG1ha2UgYSByel9jcGdfcmVhZF9tb2RlX3BpbigpIGZ1bmN0aW9uLg0KDQpDaHJpcw0K
