Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEA937C11B;
	Mon, 29 Jun 2026 07:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716608; cv=none; b=YALsCg4rAayVxTq2iIkqaJlbw3ra8SBK9zALOLe5sHJLr+xKedxKukccvyjAq722oYxoYbK7INsFJ+4hQyi5LGOacIOOCcA1gofJ4+lSJ1gwyv7J13+jP1YCcredTm2JKJCWUgwTAWX5Qp6CjcZPD7I/3mkzDIHgB+nE6tzeJLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716608; c=relaxed/simple;
	bh=f5qa8RAdToMYzzfcdF+jPx5im4QzdDpp231TTda8m9o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MzrN7hQ2xYUcQMLY1pNRzledBhHpDWtdpjb0e7KqRkIj4a+jaJEfGpeVB/kuXDLE16wsWUzumIFOlrVBKnNrpH9/ehRYFyxYMmYwnrjq8fhqstyTyvpHFTfqbdGt1mhVFwAbz4YJubuVwgI3ROapu12dOFXOAqokCxCc5IlIESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=vGTzHOJI; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="vGTzHOJI"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65T72WOl83489434, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782716552; bh=f5qa8RAdToMYzzfcdF+jPx5im4QzdDpp231TTda8m9o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vGTzHOJIFWA/mwRJcyAmSAO+OsjFR5EZKD1ArfiOQcQLsx33pAK2dcFJyqwLprxg3
	 gudxUm5MxQeJMPneTfZsILxHxjVipJNGwTx4xvGyZftUrpm1r/VPAl1z5UlcOKj/eg
	 x/lh+l9HXNpELT4ianuHERUsXtm5BgOonlii+G00Piz7PSe8Sil7rF8H8HAgFPIKGk
	 O4ublv9M2BixQwQlBLtushfsC0vjo9wWY6trUG6MduD4ejArRpQX1KXMe9ySAHSjBO
	 8xV9eFtG3edoIzkT+2qRSVMc5qDgh7QYyvCmXxRV9nDHSji8IYAvUQT/VyKY8Ad1Rb
	 ZeFnYCUakqHig==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65T72WOl83489434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 15:02:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 29 Jun 2026 15:02:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 29 Jun 2026 15:02:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Mon, 29 Jun 2026 15:02:33 +0800
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
Thread-Index: AQHdA8zC/zONM9TlNk2rSzncAW5GibZNJgWAgAHmVND//37xAIAGliyA
Date: Mon, 29 Jun 2026 07:02:32 +0000
Message-ID: <fef283cd7a3b45afae1f34ea9a06541e@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
		 <20260624112940.3475605-5-eleanor.lin@realtek.com>
	 <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
	 <f3b747e20110424c8a434cbd271edb87@realtek.com>
 <36c8a3db6038db4973b6cd80c554339f5b71d32c.camel@pengutronix.de>
In-Reply-To: <36c8a3db6038db4973b6cd80c554339f5b71d32c.camel@pengutronix.de>
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

SGkgUGhpbGlwcCwNCg0KPiANCj4gT24gRG8sIDIwMjYtMDYtMjUgYXQgMTA6MDUgKzAwMDAsIFl1
LUNodW4gTGluIFvmnpfnpZDlkJtdIHdyb3RlOg0KPiA+IEhpIFBoaWxpcHAsDQo+ID4NCj4gPiA+
IE9uIE1pLCAyMDI2LTA2LTI0IGF0IDE5OjI5ICswODAwLCBZdS1DaHVuIExpbiB3cm90ZToNCj4g
PiA+ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+ID4gPg0K
PiA+ID4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIElTTyAoSXNvbGF0aW9uKSBkb21haW4gcmVzZXQg
Y29udHJvbGxlciBvbiB0aGUNCj4gPiA+ID4gUmVhbHRlaw0KPiA+ID4gPiBSVEQxNjI1IFNvQy4N
Cj4gPiA+ID4NCj4gPiA+ID4gVGhlIHJlc2V0IGNvbnRyb2xsZXIgc2hhcmVzIHRoZSBzYW1lIHJl
Z2lzdGVyIHNwYWNlIHdpdGggdGhlIElTTw0KPiA+ID4gPiBjbG9jayBjb250cm9sbGVyLiBUbyBo
YW5kbGUgdGhpcyBzaGFyZWQgcmVnaXN0ZXIgc3BhY2UsIHRoZSByZXNldA0KPiA+ID4gPiBkcml2
ZXIgaXMgaW1wbGVtZW50ZWQgYXMgYW4gYXV4aWxpYXJ5IGRyaXZlci4gSXQgd2lsbCBiZQ0KPiA+
ID4gPiBpbnN0YW50aWF0ZWQgYW5kIHByb2JlZCB2aWEgdGhlIGF1eGlsaWFyeSBidXMgYnkgdGhl
IFJURDE2MjUtSVNPIGNsb2NrDQo+IGNvbnRyb2xsZXIgZHJpdmVyLg0KPiA+ID4gPg0KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+ID4g
PiA+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRl
ay5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBDaGFuZ2VzIGluIHY5Og0KPiA+ID4gPiAtIEV4
dHJhY3QgcmVzZXQtcmVsYXRlZCBjb2RlIGZyb20gdGhlIHByZXZpb3VzIGNsb2NrIGRyaXZlciBw
YXRjaA0KPiA+ID4gPiAoZm9ybWVybHkgcGF0Y2ggOSBpbiB2OCkuDQo+ID4gPiA+IC0tLQ0KPiA+
ID4gPiAgZHJpdmVycy9yZXNldC9yZWFsdGVrL01ha2VmaWxlICAgICAgICAgICAgfCAgMiArLQ0K
PiA+ID4gPiAgZHJpdmVycy9yZXNldC9yZWFsdGVrL3Jlc2V0LXJ0ZDE2MjUtaXNvLmMgfCA5OQ0K
PiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMDAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKSAgY3JlYXRlIG1vZGUNCj4gPiA+ID4g
MTAwNjQ0IGRyaXZlcnMvcmVzZXQvcmVhbHRlay9yZXNldC1ydGQxNjI1LWlzby5jDQo+ID4gPiA+
DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvTWFrZWZpbGUNCj4g
PiA+ID4gYi9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvTWFrZWZpbGUgaW5kZXggYzNmNjA1ZmZiMTFj
Li45MDA3YzlkNTY4M2INCj4gPiA+ID4gMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcmVz
ZXQvcmVhbHRlay9NYWtlZmlsZQ0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsv
TWFrZWZpbGUNCj4gPiA+ID4gQEAgLTEsMyArMSwzIEBADQo+ID4gPiA+ICAjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiA+ID4gIG9iai0kKENPTkZJR19SRVNFVF9S
VEtfQ09NTU9OKSArPSByZXNldC1ydGstY29tbW9uLm8NCj4gPiA+ID4gLW9iai0kKENPTkZJR19S
RVNFVF9SVEQxNjI1KSArPSByZXNldC1ydGQxNjI1LWNydC5vDQo+ID4gPiA+ICtvYmotJChDT05G
SUdfUkVTRVRfUlREMTYyNSkgKz0gcmVzZXQtcnRkMTYyNS1jcnQubw0KPiA+ID4gPiArcmVzZXQt
cnRkMTYyNS1pc28ubw0KPiA+ID4NCj4gPiA+IElzIHRoZXJlIGFueSBiZW5lZml0IHRvIHRoZXNl
IHR3byBiZWluZyBzZXBhcmF0ZSBtb2R1bGVzPw0KPiA+ID4gSSBzdWdnZXN0IHlvdSBtZXJnZSB0
aGVtIGludG8gb25lOiByZXNldC1ydGQxNjI1Lm8NCj4gPiA+DQo+ID4NCj4gPiBJZiBJIG1lcmdl
IHRoZW0gaW50byBhIHNpbmdsZSAncmVzZXQtcnRkMTYyNScgbW9kdWxlLCBib3RoIHRoZSAnY3J0
Jw0KPiA+IGFuZCAnaXNvJyBjbG9jayBkcml2ZXJzIHdvdWxkIHRyaWdnZXIgdGhlIHByb2JlIHBy
b2Nlc3MgZm9yIHRoZSBzYW1lDQo+ID4gcmVzZXQgZHJpdmVyIG5hbWUsIHdoaWNoIHdvdWxkIGxl
YWQgdG8gYSBkdXBsaWNhdGUgZHJpdmVyIHJlZ2lzdHJhdGlvbg0KPiA+IGVycm9yLg0KPiANCj4g
V2hhdCBkbyB5b3UgbWVhbiBieSBkdXBsaWNhdGUgZHJpdmVyIHJlZ2lzdHJhdGlvbiBlcnJvcj8N
Cj4gDQo+IFRoZXJlIHdvdWxkIG9ubHkgYmUgb25lIGF1eGlsaWFyeV9kcml2ZXIsIHdpdGggc3Vw
cG9ydCBmb3IgYWxsIHRocmVlDQo+IGF1eGlsaWFyeV9kZXZpY2VfaWQncy4NCj4gDQo+IA0KPiBy
ZWdhcmRzDQo+IFBoaWxpcHANCg0KQWgsIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIG5vdy4N
Cg0KUHJldmlvdXNseSwgSSBvbmx5IG1lcmdlZCB0aGVtIGluIHRoZSBNYWtlZmlsZSBidXQgbGVm
dCB0d28gc2VwYXJhdGUNCidtb2R1bGVfYXV4aWxpYXJ5X2RyaXZlcigpJyByZWdpc3RyYXRpb25z
IGluIHRoZSBDIGNvZGUsIHdoaWNoIGNhdXNlZCB0aGUNCmR1cGxpY2F0ZSByZWdpc3RyYXRpb24g
ZXJyb3IuDQoNCkZvbGxvd2luZyB5b3VyIHN1Z2dlc3Rpb24sIEkgd2lsbCByZWZhY3RvciB0aGUg
cmVzZXQgZHJpdmVycyBpbnRvIGEgc2luZ2xlDQonYXV4aWxpYXJ5X2RyaXZlcicgZW50cnkgd2l0
aCBhIHNpbmdsZSAnaWRfdGFibGUnIHRvDQpkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlIGNydCwg
aXNvLCBhbmQgaXNvX3MgcmVzZXQgdHlwZXMuDQoNCkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg0K
