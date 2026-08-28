Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888423C1F57;
	Fri, 28 Aug 2026 06:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899203; cv=none; b=fzWrSDYsuxiAtgFh80GCGQf1b2eTBZ4MkRMzwRHjMhdxCGVqWvHSp6korymiZNA1Q3v1oHNt98dZYQlV7zSuKvCco33i0IA32hGxL3mmpmBitMq46gW6Osf/i/Mp3HpuU/LJa+XLkuo3CP63ZWSWOIIINLPFk8s/sgfw/tP4XQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899203; c=relaxed/simple;
	bh=mYM0QuKOcduK6Gp9GXzDfG45WKu2zz5egHZM03P8ZFs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ULh92XcxlHAlfxmYHom35AQpRSE4otxDPWhzHOg3N5zTGuP7dEpl/OxUpEC3YqmXzym8cSSotv7jIYt0yckmECMRTC0HD3i8OAU7gMykoaW1eNICI3YSq5t4MlkX/Fxa/gW/l/2xezgR/tSycfN4DUnDkyY/uQxBakNZY4Xt2h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=LOK4CB3L; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="LOK4CB3L"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67S6d58y92240244, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1787899145; bh=mYM0QuKOcduK6Gp9GXzDfG45WKu2zz5egHZM03P8ZFs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=LOK4CB3Loll4qGfbnHB/SDi40UIabunI8l49uHSTf4Kzba86ewZtTUGuqMCbaHwwZ
	 D2D4/fEgdzUX6eeNTovkhOHsIbMU5I60BwqOZjghLgks61fKweB5MOU7kfOEx0AwUW
	 Ivg+wJvoyAEhaKemqpCsTymuwZUbU17ZVy3uW347ZQER4xdlz6RueWhjDVHXmGGe1f
	 6EqFDn03LL20iCh8a7IEt/y78rPiyUoGR86LPqagXGj4Vv5j/pPt6h5oFs6Jg2MC+E
	 BLGmCqWu04fJCnsWnxfIiqKG1mdmRS6rvn112HegicRYJ38IBfvI7xyASqxV0zO8Ri
	 T5cmdcBu+aPZw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67S6d58y92240244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Aug 2026 14:39:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 28 Aug 2026 14:39:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Fri, 28 Aug 2026 14:39:05 +0800
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
Subject: RE: [PATCH v13 04/11] clk: realtek: Introduce common probe() and
 remove()
Thread-Topic: [PATCH v13 04/11] clk: realtek: Introduce common probe() and
 remove()
Thread-Index: AQHdKf98tGU4ULZZCkawWMV9VkFKTbas76AAgAYrYeA=
Date: Fri, 28 Aug 2026 06:39:05 +0000
Message-ID: <9642b853a9c24ba6b11c81e95341bfbd@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-5-eleanor.lin@realtek.com>
 <aoxv9PJd6r_8DaNA@redhat.com>
In-Reply-To: <aoxv9PJd6r_8DaNA@redhat.com>
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

SGkgQnJpYW4sDQoNCj4gSGkgWXUtQ2h1biwNCj4gDQouLi4NCg0KPiA+ICtpbnQgcnRrX2Nsa19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBjb25zdCBzdHJ1Y3QNCj4gPiArcnRr
X2Nsa19kZXNjICpkZXNjKSB7DQo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsNCj4gPiArICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ID4gKyAgICAgc3RydWN0
IGNsa19odyAqaHc7DQo+ID4gKyAgICAgaW50IGksIHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmVn
bWFwID0gZGV2aWNlX25vZGVfdG9fcmVnbWFwKGRldi0+b2Zfbm9kZSk7DQo+IA0KPiBMb29raW5n
IGF0IHRoZSBTYXNoaWtvIGNvbW1lbnRzIGZvciB0aGlzIHNlcmllcy4gZGV2aWNlX25vZGVfdG9f
cmVnbWFwKCkgaGFzDQo+IHRoaXMgbm90ZSBpbiBkcml2ZXJzL21mZC9zeXNjb24uYzoNCj4gDQo+
IC8qKg0KPiAgKiBkZXZpY2Vfbm9kZV90b19yZWdtYXAoKSAtIEdldCBvciBjcmVhdGUgYSByZWdt
YXAgZm9yIHNwZWNpZmllZCBkZXZpY2UNCj4gbm9kZQ0KPiAgKiBAbnA6IERldmljZSB0cmVlIG5v
ZGUNCj4gICoNCj4gICogR2V0IGEgcmVnbWFwIGZvciB0aGUgc3BlY2lmaWVkIGRldmljZSBub2Rl
LiBJZiB0aGVyZSdzIG5vdCBhbiBleGlzdGluZw0KPiAgKiByZWdtYXAsIHRoZW4gb25lIGlzIGlu
c3RhbnRpYXRlZC4gVGhpcyBmdW5jdGlvbiBzaG91bGQgbm90IGJlIHVzZWQgaWYgdGhlDQo+ICAq
IGRldmljZSBub2RlIGhhcyBhIGN1c3RvbSByZWdtYXAgZHJpdmVyIG9yIGhhcyByZXNvdXJjZXMg
KGNsb2NrcywgcmVzZXRzKSB0bw0KPiAgKiBiZSBtYW5hZ2VkLiBVc2Ugc3lzY29uX25vZGVfdG9f
cmVnbWFwKCkgaW5zdGVhZCBmb3IgdGhvc2UgY2FzZXMuDQo+ICAqDQo+ICAqIFJldHVybjogcmVn
bWFwIHB0ciBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuDQo+ICAq
Lw0KPiANCj4gU2hvdWxkIHRoaXMgYmUgbW92ZWQgdG8gc3lzY29uX25vZGVfdG9fcmVnbWFwKCk/
DQo+IA0KDQpZb3UgYXJlIHJpZ2h0IHRoYXQgdXNpbmcgZGV2aWNlX25vZGVfdG9fcmVnbWFwKCkg
aXMgaW5hcHByb3ByaWF0ZSBoZXJlLg0KSG93ZXZlciwgdGhlc2UgY2xvY2sgZG9tYWlucyBoYXZl
IHRoZWlyIG93biBkZWRpY2F0ZWQgcmVnaXN0ZXJzIGFuZCBhcmUgbm90DQpzaGFyZWQgd2l0aCBh
bnkgb3RoZXIgZHJpdmVycy4NCg0KSSB3aWxsIGRyb3AgZGV2aWNlX25vZGVfdG9fcmVnbWFwKCkg
YW5kIGluaXRpYWxpemUgdGhlIHJlZ21hcCB2aWENCmRldm1fcmVnbWFwX2luaXRfbW1pbygpIGlu
c3RlYWQuIFNpbmNlIHRoZXkgYWxsIHNoYXJlIHRoZSBleGFjdCBzYW1lIHJlZ2lzdGVyDQpmb3Jt
YXQsIEkgd2lsbCBkZWZpbmUgYSBzaGFyZWQgcmVnbWFwX2NvbmZpZyBpbiBjbGstcnRrLWNvbW1v
bi5jLg0KDQo+ID4gKyAgICAgaWYgKElTX0VSUihyZWdtYXApKQ0KPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJlZ21hcCksICJmYWlsZWQgdG8NCj4g
PiArIGdldCByZWdtYXBcbiIpOw0KPiA+ICsNCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgZGVz
Yy0+bnVtX2Nsa3M7IGkrKykNCj4gPiArICAgICAgICAgICAgIGRlc2MtPmNsa3NbaV0tPnJlZ21h
cCA9IHJlZ21hcDsNCj4gPiArDQo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IGRlc2MtPmNsa19k
YXRhLT5udW07IGkrKykgew0KPiA+ICsgICAgICAgICAgICAgaHcgPSBkZXNjLT5jbGtfZGF0YS0+
aHdzW2ldOw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFodykNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgY29udGludWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgcmV0ID0gZGV2bV9jbGtf
aHdfcmVnaXN0ZXIoZGV2LCBodyk7DQo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxl
ZCB0byByZWdpc3Rlcg0KPiBodyBvZiBjbGslZFxuIiwgaSk7DQo+ID4gKyAgICAgfQ0KPiA+ICsN
Cj4gPiArICAgICByZXQgPSBkZXZtX29mX2Nsa19hZGRfaHdfcHJvdmlkZXIoZGV2LCBvZl9jbGtf
aHdfb25lY2VsbF9nZXQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRlc2MtPmNsa19kYXRhKTsNCj4gPiArICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gYWRkIGNsb2NrDQo+
ID4gKyBwcm92aWRlclxuIik7DQo+ID4gKw0KPiA+ICsgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRh
KHBkZXYsICh2b2lkICopZGVzYyk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiBydGtfcmVzZXRf
Y29udHJvbGxlcl9yZWdpc3RlcihkZXYsIGRlc2MtPmF1eF9uYW1lLA0KPiA+ICtyZWdtYXApOyB9
IEVYUE9SVF9TWU1CT0xfTlNfR1BMKHJ0a19jbGtfcHJvYmUsICJDTEtfUkVBTFRFSyIpOw0KPiA+
ICsNCj4gPiArdm9pZCBydGtfY2xrX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KSB7DQo+ID4gKyAgICAgY29uc3Qgc3RydWN0IHJ0a19jbGtfZGVzYyAqZGVzYyA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+ICsNCj4gPiArICAgICBpZiAoIWRlc2MpDQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsgICAgIGZvciAoaW50IGkgPSAwOyBpIDwg
ZGVzYy0+bnVtX2Nsa3M7IGkrKykNCj4gPiArICAgICAgICAgICAgIGRlc2MtPmNsa3NbaV0tPnJl
Z21hcCA9IE5VTEw7DQo+IA0KPiBMb29raW5nIGF0IHRoZSBTYXNoaWtvIGNvbW1lbnRzLCBpcyB0
aGlzIHJlbW92ZSBjYWxsYmFjayByZWFsbHkgbmVlZGVkPw0KPiANCg0KV2lsbCBkcm9wLg0KDQpC
ZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4gQnJpYW4NCg==
