Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE5D1DA57;
	Thu, 25 Jun 2026 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381834; cv=none; b=h2Q7A7GjPbV2xeJlh5i5VCWNN1TiA2S8yliLcEFbbBAnKDe59v90cGJtxbESXZxwIzu9mUAZXncethOLqcOTKjeH5TrhyHRMUcOg/lRnO0gaLxsMCrmfdNm3UmOZ1uNX6tFYctSOO9kKFP/dB7C91C9xl0FN3ywmwIXutQ/wu5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381834; c=relaxed/simple;
	bh=th+KaCo5ptZs+RHqEyaI/+5bXjVpk6+bxJ8u0JZdqBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oy78JaZJD3gfPVCVRU8adjOtfap2mQ6K21JmfxM509LxjeyQP6S2ibsqIrOr9/CUIlGL9DFRJ/3HzXdqq3xgRH/tMvRLeB92CUa/H/V8xe9+OILGv8jAKWd2JLQakwQKOmKICHPplK1lYmildSYUTP9gmf+aGkP2sfQl6YRr98I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=HwmTYMnv; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="HwmTYMnv"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65PA2wbY6717867, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782381778; bh=th+KaCo5ptZs+RHqEyaI/+5bXjVpk6+bxJ8u0JZdqBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=HwmTYMnvarTqM6BA40WtvLsClcGtoQ7m0Ktlw24ZOX/0YcNkBAh9ZMqU6x3WjCECa
	 qBns3fBiKSxgyzdxPGUO2Ms2r2YibnPd7BP/PIh1jHr9LIfUR0OE5veq3n0GFSFtEL
	 9PFfeUHkAkZ66tSHImhE/VTGZNzru72NUfp09X3MuLvQFRHFsfA3pN9MvzLXaZGp/d
	 zgnD3fr/t7obxCa8GyqMMcSmla7c38EZMClxT2OA1mrIzNuwg3c2yGQELB0/MYxphX
	 5CldvLN6LE2hrILEhrqxoiznlWBYq7+lJfTGqfuUrzhQHvFo4ec7LEuguPjru5W3Fi
	 vhhlBLNWIF1AQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65PA2wbY6717867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jun 2026 18:02:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 25 Jun 2026 18:02:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 25 Jun 2026 18:02:59 +0800
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
Subject: RE: [PATCH v9 02/12] reset: Add Realtek basic reset support
Thread-Topic: [PATCH v9 02/12] reset: Add Realtek basic reset support
Thread-Index: AQHdA8zBAZKfhVb73U+IfwNcnX+KFLZNJaIAgAHmRkA=
Date: Thu, 25 Jun 2026 10:02:59 +0000
Message-ID: <e447f0d347b343129064317fcf220ee7@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
	 <20260624112940.3475605-3-eleanor.lin@realtek.com>
 <eb03894ae2765a426457238157e474087ea0aaa6.camel@pengutronix.de>
In-Reply-To: <eb03894ae2765a426457238157e474087ea0aaa6.camel@pengutronix.de>
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
biBMaW4gd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGlu
QHJlYWx0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICtzdGF0aWMgaW50IHJ0a19yZXNldF9kZWFzc2Vy
dChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGlkeCkgew0KPiA+ICsgICAgIHN0cnVjdCBydGtf
cmVzZXRfZGF0YSAqZGF0YSA9IHRvX3J0a19yZXNldF9jb250cm9sbGVyKHJjZGV2KTsNCj4gPiAr
ICAgICBjb25zdCBzdHJ1Y3QgcnRrX3Jlc2V0X2Rlc2MgKmRlc2M7DQo+ID4gKyAgICAgdTMyIG1h
c2ssIHZhbDsNCj4gPiArDQo+ID4gKyAgICAgZGVzYyA9IHJ0a19yZXNldF9nZXRfZGVzYyhkYXRh
LCBpZHgpOw0KPiA+ICsgICAgIG1hc2sgPSBkZXNjLT53cml0ZV9lbiA/ICgweDNVIDw8IGRlc2Mt
PmJpdCkgOiBCSVQoZGVzYy0+Yml0KTsNCj4gPiArICAgICB2YWwgPSBtYXNrOw0KPiA+ICsNCj4g
PiArICAgICByZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGVzYy0+b2Zz
LCBtYXNrLCB2YWwpOw0KPiANCj4gWW91IGNhbiB1c2UgcmVnbWFwX3NldF9iaXRzKCkgaGVyZS4N
Cj4gDQoNCkFjay4NCg0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJ0a19yZXNldF9z
dGF0dXMoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaWR4KSB7DQo+ID4gKyAgICAgc3RydWN0IHJ0
a19yZXNldF9kYXRhICpkYXRhID0gdG9fcnRrX3Jlc2V0X2NvbnRyb2xsZXIocmNkZXYpOw0KPiA+
ICsgICAgIGNvbnN0IHN0cnVjdCBydGtfcmVzZXRfZGVzYyAqZGVzYzsNCj4gPiArICAgICB1MzIg
dmFsOw0KPiANCj4gICAgICAgICB1bnNpZ25lZCBpbnQgdmFsOw0KPiANCg0KQWNrLg0KDQo+ID4g
KyAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgZGVzYyA9IHJ0a19yZXNldF9nZXRfZGVz
YyhkYXRhLCBpZHgpOw0KPiA+ICsgICAgIHJldCA9IHJlZ21hcF9yZWFkKGRhdGEtPnJlZ21hcCwg
ZGVzYy0+b2ZzLCAmdmFsKTsNCj4gPiArICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuICEoKHZhbCA+PiBkZXNjLT5iaXQp
ICYgMSk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzZXRfY29udHJvbF9v
cHMgcnRrX3Jlc2V0X29wcyA9IHsNCj4gPiArICAgICAuYXNzZXJ0ICAgPSBydGtfcmVzZXRfYXNz
ZXJ0LA0KPiA+ICsgICAgIC5kZWFzc2VydCA9IHJ0a19yZXNldF9kZWFzc2VydCwNCj4gPiArICAg
ICAuc3RhdHVzICAgPSBydGtfcmVzZXRfc3RhdHVzLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyog
VGhlIGNhbGxlciBtdXN0IGluaXRpYWxpemUgZGF0YS0+ZGVzY3MsIGRhdGEtPnJjZGV2Lm5yX3Jl
c2V0cyBhbmQNCj4gPiArICogZGF0YS0+cmNkZXYub3duZXIgYmVmb3JlIGNhbGxpbmcgcnRrX3Jl
c2V0X2NvbnRyb2xsZXJfYWRkKCkuDQo+ID4gKyAqLw0KPiA+ICtpbnQgcnRrX3Jlc2V0X2NvbnRy
b2xsZXJfYWRkKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcnRrX3Jlc2V0X2RhdGEgKmRhdGEpIHsNCj4gPiArICAgICBkYXRhLT5yZWdt
YXAgICAgICAgICAgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7DQo+ID4gKyAgICAgZGF0YS0+cmNk
ZXYub3BzICAgICAgID0gJnJ0a19yZXNldF9vcHM7DQo+ID4gKyAgICAgZGF0YS0+cmNkZXYuZGV2
ICAgICAgID0gZGV2Ow0KPiA+ICsgICAgIGRhdGEtPnJjZGV2Lm9mX25vZGUgICA9IGRldi0+cGFy
ZW50LT5vZl9ub2RlOw0KPiANCj4gVGhpcyBzcGxpdCByY2RldiBpbml0aWFsaXphdGlvbiBpcyBt
b3JlIGhhc3NsZSB0aGFuIGl0IGlzIHdvcnRoLg0KPiBQbGVhc2UganVzdCBleHBvcnQgcnRrX3Jl
c2V0X29wcyBhbmQgZHVwbGljYXRlIHRoZSByZWdtYXAvb3BzL2Rldi9vZl9ub2RlDQo+IGFzc2ln
bm1lbnQgaW4gdGhlIHByb2JlIGZ1bmN0aW9ucy4NCj4gDQo+IEFsdGVybmF0aXZlbHksIGNvbnNv
bGlkYXRlIHRoZSBwcm9iZSBmdW5jdGlvbiBhbmQgZXhwb3J0IGl0IGZyb20gaGVyZS4NCj4gDQoN
ClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLiBJIHdpbGwgZ28gd2l0aCB5b3VyIGZpcnN0IGFw
cHJvYWNoIGluIHYxMC4NCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0KDQo+IHJlZ2FyZHMNCj4g
UGhpbGlwcA0K
