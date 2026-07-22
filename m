Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16A413221;
	Wed, 22 Jul 2026 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705751; cv=none; b=HXwmPoS8/UsU9lHHW7LH707k2toVSI60rEmFPAWv09+SdcA9zp9luo9KQzy+SQC6USZyUZ5xn+WBDifqCFpK5z2M9MA4ohagCGdyTMN6IS67mAwEMLMyYOXi5EY41Ew5S1PFWNTrKGO9WEcoEP0KaCCPznBDoDIAaazCFFvc3jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705751; c=relaxed/simple;
	bh=CsO8ipof80Sfgt/x1IVb9h+EHVZOEBiAg5aJSVjycZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rR2BcSCkA5EWgnxjPqHkuSYlCZynn0STpGJiiJu7CJWONh17oN3+cC99q90EM51+4+shLWF6IEhbBSwq7MGcdp3ehKEoX1Xir4/FJF7uIWjHmSssqAoQwS5kLerU6bhHXRkLBJd/eontcBtmmgiV3BEudylXqkympm0uOUDl8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Kh1+bxb1; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Kh1+bxb1"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66M7YdEW23797704, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784705679; bh=CsO8ipof80Sfgt/x1IVb9h+EHVZOEBiAg5aJSVjycZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Kh1+bxb1/5PJwCrOGPgqtCBJZPFltAC+DPE9lHTn61xBrnyAs9fj9YJ29p0qDVhwY
	 p+Shvo4z/usHVUy+tkXpU607XATI1kzNn1Z3kknMq54ltYMqrjlkDdt41g7MGRao1x
	 PVTYNt1kXlRraXIEhzZ0Sstw9P3lSWVLEF2QZWtN6UjpqW80dM10HbrXvm78UCn3SK
	 edDiCyFPic1sHUU1o+pJQaR03uq8aeL8Q6FoS32bHhZAORtsYegCp3cwIsA4LpeuM2
	 orzJ9jGSioqvg9IzLVg4mrOfDXSNvFWzuyGr9vANGrfmrdM7Dq38KJ76CTSYJ0WibM
	 mPyCt5tc6f2lA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66M7YdEW23797704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jul 2026 15:34:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 22 Jul 2026 15:34:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 22 Jul 2026 15:34:38 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?big5?B?RWRnYXIgTGVlIFun9anTv9ld?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, =?big5?B?SnlhbiBDaG91IFupUKrppndd?=
	<jyanchou@realtek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v10 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Topic: [PATCH v10 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Index: AQHdEuAsI89D8FRCKUWTKm1gKjcY/rZ4KEgAgAEKgkA=
Date: Wed, 22 Jul 2026 07:34:38 +0000
Message-ID: <9080dd0534184fbd9c546d2e81f4984a@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-9-eleanor.lin@realtek.com>
 <amADBr_DnBeGh2jg@redhat.com>
In-Reply-To: <amADBr_DnBeGh2jg@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgQnJpYW4sDQoNCj4gT24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgMTE6NTY6MjdQTSArMDgwMCwg
WXUtQ2h1biBMaW4gd3JvdGU6DQo+ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0
ZWsuY29tPg0KPiA+DQo+ID4gQWRkIGNsa19wbGxfbW1jX29wcyBmb3IgZW5hYmxlL2Rpc2FibGUs
IHByZXBhcmUsIHJhdGUgY29udHJvbCwgYW5kDQo+ID4gc3RhdHVzIG9wZXJhdGlvbnMgb24gTU1D
IFBMTCBjbG9ja3MuDQo+ID4NCj4gPiBBbHNvIGFkZCBjbGtfcGxsX21tY19waGFzZV9vcHMgdG8g
c3VwcG9ydCBwaGFzZSBnZXQvc2V0IG9wZXJhdGlvbnMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBKeWFuIENob3UgPGp5YW5jaG91QHJlYWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEp5
YW4gQ2hvdSA8anlhbmNob3VAcmVhbHRlay5jb20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBZdS1D
aHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWXUt
Q2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMg
aW4gdjEwOg0KPiA+IC0gTm9uZS4NCj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA4ICsNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9LY29uZmlnICAg
ICAgIHwgICAzICsNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9NYWtlZmlsZSAgICAgIHwgICAy
ICsNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9jbGstcGxsLW1tYy5jIHwgNDMwDQo+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1w
bGwuaCAgICAgfCAgMTMgKw0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQ1NiBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1wbGwtbW1j
LmMNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTIGluZGV4
DQo+ID4gMWZmZmIxZmM1ZGUxLi4wYzhiOThlY2M0YTUgMTAwNjQ0DQo+ID4gLS0tIGEvTUFJTlRB
SU5FUlMNCj4gPiArKysgYi9NQUlOVEFJTkVSUw0KPiA+IEBAIC0yMjc0Nyw2ICsyMjc0NywxNCBA
QCBGOiAgIGRyaXZlcnMvcmVzZXQvcmVhbHRlay8qDQo+ID4gIEY6ICAgaW5jbHVkZS9kdC1iaW5k
aW5ncy9jbG9jay9yZWFsdGVrKg0KPiA+ICBGOiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQv
cmVhbHRlayoNCj4gPg0KPiA+ICtSRUFMVEVLIFNPQyBQTEwgQ0xPQ0sgRk9SIE1NQyBTVVBQT1JU
DQo+ID4gK006ICAgQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+ICtNOiAg
IEp5YW4gQ2hvdSA8anlhbmNob3VAcmVhbHRlay5jb20+DQo+ID4gK006ICAgWXUtQ2h1biBMaW4g
PGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+ICtMOiAgIGxpbnV4LWNsa0B2Z2VyLmtlcm5l
bC5vcmcNCj4gPiArUzogICBTdXBwb3J0ZWQNCj4gPiArRjogICBkcml2ZXJzL2Nsay9yZWFsdGVr
L2Nsay1wbGwtbW1jLmMNCj4gDQo+IDIgb2YgdGhlIDMgbmFtZXMgbGlzdGVkIGhlcmUgYXJlIHVu
ZGVyIHRoZSBuZXcgcmVhbHRlayBlbnRyeSBhZGRlZCBieSB0aGlzDQo+IHNlcmllcy4gSSdtIG5v
dCBzdXJlIGhvdyBjb21tb24gdGhpcyBpcyBidXQgaXQgc2VlbXMgb3Zlcmx5IGdyYW51bGFyLg0K
PiANCj4gQnJpYW4NCg0KSSBoYXZlIGNoZWNrZWQgd2l0aCBKeWFuIENob3UsIGFuZCB3ZSBhZ3Jl
ZSB0aGF0IHRoaXMgZW50cnkgaXMgdG9vIGdyYW51bGFyLg0KDQpXZSB3aWxsIHJlbW92ZSB0aGUg
J1JFQUxURUsgU09DIFBMTCBDTE9DSyBGT1IgTU1DIFNVUFBPUlQnIGVudHJ5IGFuZCBvbmx5IGtl
ZXANCnRoZSBicm9hZGVyIG9uZS4NCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0K
