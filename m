Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37415 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750845AbdAaHSU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2017 02:18:20 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKM01CFYUWYKR30@mailout3.samsung.com> for
 linux-clk@vger.kernel.org; Tue, 31 Jan 2017 16:17:22 +0900 (KST)
MIME-version: 1.0
Subject: RE: [PATCH V2 07/12] PM / OPP: Update OPP users to put reference
Reply-to: myungjoo.ham@samsung.com
From: MyungJoo Ham <myungjoo.ham@samsung.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Alexandre Courbot <gnurou@gmail.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Javi Merino <javi.merino@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc: "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>
Message-id: <20170131071721epcms1p6a4da8e0add4547573d40bbbb55d37b74@epcms1p6>
Date: Tue, 31 Jan 2017 07:17:21 +0000
Content-type: multipart/related;
 boundary="----=_Part_867698_1046758289.1485847041328"
References: <cover.1485146406.git.viresh.kumar@linaro.org>
 <CGME20170123044228epcas3p35fdbe94a890062e9d66e33a3b5e4d571@epcas3p3.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

------=_Part_867698_1046758289.1485847041328
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"

PiBUaGlzIHBhdGNoIHVwZGF0ZXMgZGV2X3BtX29wcF9maW5kX2ZyZXFfKigpIHJvdXRpbmVzIHRv
IGdldCBhIHJlZmVyZW5jZQ0KPiB0byB0aGUgT1BQcyByZXR1cm5lZCBieSB0aGVtLg0KPiANCj4g
QWxzbyB1cGRhdGVzIHRoZSB1c2VycyBvZiBkZXZfcG1fb3BwX2ZpbmRfZnJlcV8qKCkgcm91dGlu
ZXMgdG8gY2FsbA0KPiBkZXZfcG1fb3BwX3B1dCgpIGFmdGVyIHRoZXkgYXJlIGRvbmUgdXNpbmcg
dGhlIE9QUHMuDQo+IA0KPiBBcyBpdCBpcyBndWFyYW50ZWVkIHRoZSB0aGF0IE9QUHMgd291bGRu
J3QgZ2V0IGZyZWVkIHdoaWxlIGJlaW5nIHVzZWQsDQo+IHRoZSBSQ1UgcmVhZCBzaWRlIGxvY2tp
bmcgcHJlc2VudCB3aXRoIHRoZSB1c2VycyBpc24ndCByZXF1aXJlZCBhbnltb3JlLg0KPiBEcm9w
IGl0IGFzIHdlbGwuDQo+IA0KPiBUaGlzIHBhdGNoIGFsc28gdXBkYXRlcyBhbGwgdXNlcnMgb2Yg
ZGV2ZnJlcV9yZWNvbW1lbmRlZF9vcHAoKSB3aGljaCB3YXMNCj4gcmV0dXJuaW5nIGFuIE9QUCBy
ZWNlaXZlZCBmcm9tIHRoZSBPUFAgY29yZS4NCj4gDQo+IE5vdGUgdGhhdCBzb21lIG9mIHRoZSBP
UFAgY29yZSByb3V0aW5lcyBoYXZlIGdhaW5lZA0KPiByY3VfcmVhZF97bG9ja3x1bmxvY2t9KCkg
Y2FsbHMsIGFzIHRob3NlIHN0aWxsIHVzZSBSQ1Ugc3BlY2lmaWMgQVBJcw0KPiB3aXRoaW4gdGhl
bS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFy
by5vcmc+DQo+IFJldmlld2VkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNv
bT4gW0RldmZyZXFdDQoNClRoaXMgcGF0Y2ggZ2V0cyBhIGxvdCBvZiBmYWlscyBkdXJpbmcgYXBw
bGljYXRpb24uDQoNCkZvciBkZXZmcmVxLXNpZGUsIEkndmUgZ290Og0KZXJyb3I6IGRyaXZlcnMv
ZGV2ZnJlcS9kZXZmcmVxLmM6IHBhdGNoIGRvZXMgbm90IGFwcGx5DQplcnJvcjogcGF0Y2ggZmFp
bGVkOiBkcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jOjEwMw0KZXJyb3I6IGRyaXZlcnMvZGV2
ZnJlcS9leHlub3MtYnVzLmM6IHBhdGNoIGRvZXMgbm90IGFwcGx5DQplcnJvcjogcGF0Y2ggZmFp
bGVkOiBkcml2ZXJzL2RldmZyZXEvZ292ZXJub3JfcGFzc2l2ZS5jOjU5DQplcnJvcjogZHJpdmVy
cy9kZXZmcmVxL2dvdmVybm9yX3Bhc3NpdmUuYzogcGF0Y2ggZG9lcyBub3QgYXBwbHkNCmVycm9y
OiBwYXRjaCBmYWlsZWQ6IGRyaXZlcnMvZGV2ZnJlcS9yazMzOTlfZG1jLmM6OTENCmVycm9yOiBk
cml2ZXJzL2RldmZyZXEvcmszMzk5X2RtYy5jOiBwYXRjaCBkb2VzIG5vdCBhcHBseQ0KZXJyb3I6
IHBhdGNoIGZhaWxlZDogZHJpdmVycy9kZXZmcmVxL3RlZ3JhLWRldmZyZXEuYzo0ODcNCmVycm9y
OiBkcml2ZXJzL2RldmZyZXEvdGVncmEtZGV2ZnJlcS5jOiBwYXRjaCBkb2VzIG5vdCBhcHBseQ0K
DQpXaXRoIHRoZSBjb25kaXRpb24gdGhhdCB5b3UgYXJlIGdvaW5nIHRvIHByb3Blcmx5IHJlYmFz
ZSB0aGUgcGF0Y2gsDQp5b3UgbWF5IGFkZCAiUmV2aWV3ZWQtYnkiIGZyb20gbWUuDQoodGhlIGNv
ZGUgaXRzZWxmIGxvb2tzIGZpbmUuKQ0KDQpDaGVlcnMsDQpNeXVuZ0pvbw0KDQo+IC0tLQ0KPiAg
YXJjaC9hcm0vbWFjaC1vbWFwMi9wbS5jICAgICAgICAgICAgIHwgICA1ICstDQo+ICBkcml2ZXJz
L2Jhc2UvcG93ZXIvb3BwL2NvcmUuYyAgICAgICAgfCAxMTQgKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvYmFzZS9wb3dlci9vcHAvY3B1LmMgICAgICAgICB8
ICAyMiArKy0tLS0tDQo+ICBkcml2ZXJzL2Nsay90ZWdyYS9jbGstZGZsbC5jICAgICAgICAgfCAg
MTcgKystLS0tDQo+ICBkcml2ZXJzL2NwdWZyZXEvZXh5bm9zNTQ0MC1jcHVmcmVxLmMgfCAgIDUg
Ky0NCj4gIGRyaXZlcnMvY3B1ZnJlcS9pbXg2cS1jcHVmcmVxLmMgICAgICB8ICAxMCArLS0NCj4g
IGRyaXZlcnMvY3B1ZnJlcS9tdDgxNzMtY3B1ZnJlcS5jICAgICB8ICAgOCArLS0NCj4gIGRyaXZl
cnMvY3B1ZnJlcS9vbWFwLWNwdWZyZXEuYyAgICAgICB8ICAgNCArLQ0KPiAgZHJpdmVycy9kZXZm
cmVxL2RldmZyZXEuYyAgICAgICAgICAgIHwgIDE0ICsrLS0tDQo+ICBkcml2ZXJzL2RldmZyZXEv
ZXh5bm9zLWJ1cy5jICAgICAgICAgfCAgMTQgKystLS0NCj4gIGRyaXZlcnMvZGV2ZnJlcS9nb3Zl
cm5vcl9wYXNzaXZlLmMgICB8ICAgNCArLQ0KPiAgZHJpdmVycy9kZXZmcmVxL3JrMzM5OV9kbWMu
YyAgICAgICAgIHwgIDE2ICsrLS0tDQo+ICBkcml2ZXJzL2RldmZyZXEvdGVncmEtZGV2ZnJlcS5j
ICAgICAgfCAgIDQgKy0NCj4gIGRyaXZlcnMvdGhlcm1hbC9jcHVfY29vbGluZy5jICAgICAgICB8
ICAxMSArLS0tDQo+ICBkcml2ZXJzL3RoZXJtYWwvZGV2ZnJlcV9jb29saW5nLmMgICAgfCAgMTUg
KystLS0NCj4gIDE1IGZpbGVzIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspLCAxNTMgZGVsZXRp
b25zKC0pDQo+IA0K
------=_Part_867698_1046758289.1485847041328--
