Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC9126C17;
	Thu, 25 Jun 2026 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381932; cv=none; b=JH1V8sf9KmStLRBpxYX/EXeanunkuzGN1hR7aR2nAo5KAG7zQwiNDHUxMxcI91dxVOPrbkIhCFh5YFOz9fs236qcHb9IBD55DerkZAl3N/2TkOO3maPJYtCdaa40yY3ENAyr5pGZ3sS9qlJ9TtjXCQ8V2L/2e9pUkN0TDuFLiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381932; c=relaxed/simple;
	bh=ugxfiulw+EAp1DFH2y/1hWh2xw6aK0sIEzwG6s+wSgI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BinztKgED/DP1a1ntdSHOVX6xajguyC4RtYZ/iI78A3u+CYEWvTpnS34mBtbdZ39y0rWOThmDtP/SUYkWzxKbp8Qhx9JoHGrVOiKnR6krKoN92/Rl9CHUYlhWb8rzjTwBXeeYLhMDOSSrmhARmuT2AouZqAkFReBqI6yGyhd1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ZEAp4XH+; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ZEAp4XH+"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65PA56fU4718355, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782381906; bh=ugxfiulw+EAp1DFH2y/1hWh2xw6aK0sIEzwG6s+wSgI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ZEAp4XH+Ig00DX/SaHL26IILIdmxbfs1GSVz39CXhmQXTHM/hoo/NdWwsElQug1cN
	 3BU0oBj59TI7/UzCWQ/u+K4obp1cvOncxKdvWNMkkcV3pow+4uFOBL9ZMmgfEBjbjE
	 rav0TjzBKIenRnJ+INSz468PWyYaA2HNj6pj6RyQPPXHOq6hL/aFyK2X3vqN5Alw6f
	 69cR1pBu0bjhUhdSaac3NQZ5Jy43Gi3cI1jfrsme0e6sO4IVDEPYwUbME7c9j+e/j/
	 nldp1677BuQ0JcbZbNAgIpVVzsExNl+OVyEnYSF9PzvK/z/SkTHfZ3gD/Lzhq3NzQ9
	 i4y57fzNaVP7w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65PA56fU4718355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jun 2026 18:05:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 25 Jun 2026 18:05:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 25 Jun 2026 18:05:04 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney@redhat.com" <bmasney@redhat.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset controller
 driver
Thread-Topic: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset
 controller driver
Thread-Index: AQHdA8zC/zONM9TlNk2rSzncAW5GibZNJgWAgAHmVNA=
Date: Thu, 25 Jun 2026 10:05:04 +0000
Message-ID: <f3b747e20110424c8a434cbd271edb87@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
	 <20260624112940.3475605-5-eleanor.lin@realtek.com>
 <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
In-Reply-To: <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgUGhpbGlwcCwNCg0KPiBPbiBNaSwgMjAyNi0wNi0yNCBhdCAxOToyOSArMDgwMCwgWXUtQ2h1
biBMaW4gd3JvdGU6DQo+ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29t
Pg0KPiA+DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBJU08gKElzb2xhdGlvbikgZG9tYWluIHJl
c2V0IGNvbnRyb2xsZXIgb24gdGhlDQo+ID4gUmVhbHRlaw0KPiA+IFJURDE2MjUgU29DLg0KPiA+
DQo+ID4gVGhlIHJlc2V0IGNvbnRyb2xsZXIgc2hhcmVzIHRoZSBzYW1lIHJlZ2lzdGVyIHNwYWNl
IHdpdGggdGhlIElTTyBjbG9jaw0KPiA+IGNvbnRyb2xsZXIuIFRvIGhhbmRsZSB0aGlzIHNoYXJl
ZCByZWdpc3RlciBzcGFjZSwgdGhlIHJlc2V0IGRyaXZlciBpcw0KPiA+IGltcGxlbWVudGVkIGFz
IGFuIGF1eGlsaWFyeSBkcml2ZXIuIEl0IHdpbGwgYmUgaW5zdGFudGlhdGVkIGFuZCBwcm9iZWQN
Cj4gPiB2aWEgdGhlIGF1eGlsaWFyeSBidXMgYnkgdGhlIFJURDE2MjUtSVNPIGNsb2NrIGNvbnRy
b2xsZXIgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWXUgTGVlIDxjeWxl
ZTEyQHJlYWx0ZWsuY29tPg0KPiA+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFu
b3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVh
bm9yLmxpbkByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHY5Og0KPiA+IC0g
RXh0cmFjdCByZXNldC1yZWxhdGVkIGNvZGUgZnJvbSB0aGUgcHJldmlvdXMgY2xvY2sgZHJpdmVy
IHBhdGNoDQo+ID4gKGZvcm1lcmx5IHBhdGNoIDkgaW4gdjgpLg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL3Jlc2V0L3JlYWx0ZWsvTWFrZWZpbGUgICAgICAgICAgICB8ICAyICstDQo+ID4gIGRyaXZl
cnMvcmVzZXQvcmVhbHRlay9yZXNldC1ydGQxNjI1LWlzby5jIHwgOTkNCj4gPiArKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL3Jlc2V0L3JlYWx0
ZWsvcmVzZXQtcnRkMTYyNS1pc28uYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVz
ZXQvcmVhbHRlay9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9yZXNldC9yZWFsdGVrL01ha2VmaWxl
IGluZGV4IGMzZjYwNWZmYjExYy4uOTAwN2M5ZDU2ODNiDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9yZXNldC9yZWFsdGVrL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9y
ZWFsdGVrL01ha2VmaWxlDQo+ID4gQEAgLTEsMyArMSwzIEBADQo+ID4gICMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICBvYmotJChDT05GSUdfUkVTRVRfUlRLX0NP
TU1PTikgKz0gcmVzZXQtcnRrLWNvbW1vbi5vDQo+ID4gLW9iai0kKENPTkZJR19SRVNFVF9SVEQx
NjI1KSArPSByZXNldC1ydGQxNjI1LWNydC5vDQo+ID4gK29iai0kKENPTkZJR19SRVNFVF9SVEQx
NjI1KSArPSByZXNldC1ydGQxNjI1LWNydC5vDQo+ID4gK3Jlc2V0LXJ0ZDE2MjUtaXNvLm8NCj4g
DQo+IElzIHRoZXJlIGFueSBiZW5lZml0IHRvIHRoZXNlIHR3byBiZWluZyBzZXBhcmF0ZSBtb2R1
bGVzPw0KPiBJIHN1Z2dlc3QgeW91IG1lcmdlIHRoZW0gaW50byBvbmU6IHJlc2V0LXJ0ZDE2MjUu
bw0KPiANCg0KSWYgSSBtZXJnZSB0aGVtIGludG8gYSBzaW5nbGUgJ3Jlc2V0LXJ0ZDE2MjUnIG1v
ZHVsZSwNCmJvdGggdGhlICdjcnQnIGFuZCAnaXNvJyBjbG9jayBkcml2ZXJzIHdvdWxkIHRyaWdn
ZXIgdGhlIHByb2JlDQpwcm9jZXNzIGZvciB0aGUgc2FtZSByZXNldCBkcml2ZXIgbmFtZSwgd2hp
Y2ggd291bGQgbGVhZCB0byBhDQpkdXBsaWNhdGUgZHJpdmVyIHJlZ2lzdHJhdGlvbiBlcnJvci4N
Cg0KVGhlcmVmb3JlLCBJIHdvdWxkIHByZWZlciB0byBrZWVwIHRoZW0gc2VwYXJhdGUuDQoNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9yZWFsdGVrL3Jlc2V0LXJ0ZDE2MjUtaXNvLmMN
Cj4gPiBiL2RyaXZlcnMvcmVzZXQvcmVhbHRlay9yZXNldC1ydGQxNjI1LWlzby5jDQo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc4ZWFhYmI0MDhmMA0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvcmVzZXQt
cnRkMTYyNS1pc28uYw0KPiA+IEBAIC0wLDAgKzEsOTkgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjYgUmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnBvcmF0aW9uICAqLw0KPiA+ICsNCj4gPiAr
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3JlYWx0ZWsscnRkMTYyNS5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvYXV4aWxpYXJ5X2J1cy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNl
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9lcnJuby5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
b2YuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArI2luY2x1ZGUgInJlc2V0
LXJ0ay1jb21tb24uaCINCj4gPiArDQo+ID4gKyNkZWZpbmUgUlREMTYyNV9JU09fUlNUTl9NQVgg
MjkNCj4gPiArI2RlZmluZSBSVEQxNjI1X0lTT19TX1JTVE5fTUFYICAgICAgIDUNCj4gDQo+IFRo
ZXNlIGFyZSBub3QgbmVjZXNzYXJ5LCBqdXN0IHVzZSBBUlJBWV9TSVpFKCkgZm9yIG5yX3Jlc2V0
cy4NCj4gDQoNCkFjay4NCg0KPiA+ICsNCg0KWy4uLl0NCg0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCBydGQxNjI1X2lzb19yZXNldF9wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYWRldiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgYXV4aWxp
YXJ5X2RldmljZV9pZCAqaWQpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmYWRldi0+ZGV2Ow0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKnBhcmVudCA9IGRldi0+cGFy
ZW50Ow0KPiA+ICsgICAgIHN0cnVjdCBydGtfcmVzZXRfZGF0YSAqZGF0YTsNCj4gPiArDQo+ID4g
KyAgICAgZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZGF0YSksIEdGUF9LRVJORUwp
Ow0KPiA+ICsgICAgIGlmICghZGF0YSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Ow0KPiA+ICsNCj4gPiArICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUocGFyZW50LT5v
Zl9ub2RlLA0KPiAicmVhbHRlayxydGQxNjI1LWlzby1zLWNsayIpKSB7DQo+ID4gKyAgICAgICAg
ICAgICBkYXRhLT5kZXNjcyAgICAgICAgICAgPSBydGQxNjI1X2lzb19zX3Jlc2V0X2Rlc2NzOw0K
PiA+ICsgICAgICAgICAgICAgZGF0YS0+cmNkZXYubnJfcmVzZXRzID0gUlREMTYyNV9JU09fU19S
U1ROX01BWDsNCj4gPiArICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgZGF0YS0+ZGVz
Y3MgICAgICAgICAgID0gcnRkMTYyNV9pc29fcmVzZXRfZGVzY3M7DQo+ID4gKyAgICAgICAgICAg
ICBkYXRhLT5yY2Rldi5ucl9yZXNldHMgPSBSVEQxNjI1X0lTT19SU1ROX01BWDsNCj4gPiArICAg
ICB9DQo+IA0KPiBObyBuZWVkIHRvIHBhcnNlIE9GIGNvbXBhdGlibGUgYWdhaW4uIFN0b3JlIHRo
ZXNlIGluIGEgc3RydWN0LCBwb2ludA0KPiBhdXhpbGlhcnlfZGV2aWNlX2lkOjpkcml2ZXJfZGF0
YSB0byBpdCwgYW5kIHVzZSB0aGF0IGhlcmUuDQo+IA0KPiByZWdhcmRzDQo+IFBoaWxpcHANCg0K
QWdyZWVkLCBJIHdpbGwgZG8gaXQgaW4gdjEwLiBUaGFua3MuDQoNCkJlc3QgUmVnYXJkcywNCll1
LUNodW4NCg==
