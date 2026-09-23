Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222271B142D;
	Wed, 23 Sep 2026 05:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142078; cv=none; b=g5vuRSg7tZ9Pl6/lQu32ltCz/ivvzeddvebTpDDbqmtcEBaqxM/2GYxOHuMMwnPpXkkCPcC+w4fr2mXEkpJdsATMVLXrfnnYddKiN+I8N1HYtd7vuJMOxzVsyvYa0wVtDXQ7EbZXU8oBkpHAZ7pJkydr2i4ZmzwNwoolYSdQSXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142078; c=relaxed/simple;
	bh=+1hpAwNtoNKysOFDE2f6oSv5eOeq0sx75s86B/yVVJc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jp5rO+RcHaCynJkQlFYQzEnpH4a85mNiK7kZW5/SNCbapzRux7lhqohkcqxo6HMz/QSsbDeAzhSQxSMF1PDKpMzi5MDN6PLbvixvM6Ha5hcx0xvSxaBpqOUpcYN0SVq/A/EnXd7/fOUnnA7pUl0Q26r3haygu5UN6fuNiTJ+v6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=sTcZC7Sx; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="sTcZC7Sx"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68N5e1gX5094968, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790142002; bh=+1hpAwNtoNKysOFDE2f6oSv5eOeq0sx75s86B/yVVJc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=sTcZC7SxbaTz/5pTZnigj6chBjuV8043vxVDIsoXpJTsNVe1FVS5lAs9aH2MdxLmW
	 0q0S7N2eATEudgAfcF9GT9bCdsyXv8MZueYKJUDRT9WraSVFY+nVtt23ASTkrzr33L
	 gbOB/3OLBbZBp4VbTZV6PNGoXhf+FovSjgMHvDmmuMPyr+6YppKw58tH3oA8EyQZs1
	 vkjV1aC3LZ2qwKiPM0CKECFPjIfOI18zMNYhIRmooKuBUzZ2WcG+2oYtZl5X1GDXud
	 gvew5gYCMGZFuQ+5nRfx81VVizeicxSMUWPaDN9VgaWj+tSNrJEuSmITwDpASdEP0x
	 9UOM9DWj3S8PA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68N5e1gX5094968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 13:40:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 13:40:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 23 Sep 2026 13:40:01 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
	<bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	Brian Masney <bmasney@redhat.com>
Subject: RE: [PATCH v14 04/11] clk: realtek: Introduce common probe()
Thread-Topic: [PATCH v14 04/11] clk: realtek: Introduce common probe()
Thread-Index: AQHdOeL8lfqoyPvcM0uyz9jr1hCJobbPIO2AgAym+sA=
Date: Wed, 23 Sep 2026 05:40:01 +0000
Message-ID: <ad7145e19a114673a2ffe78c702440a6@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-5-eleanor.lin@realtek.com>
 <178947517742.448573.7975580808033616494.b4-reply@b4>
In-Reply-To: <178947517742.448573.7975580808033616494.b4-reply@b4>
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

SGkgSmVyb21lLA0KDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVhbHRlay9LY29uZmlnDQo+ID4g
QEAgLTAsMCArMSwzMCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkgY29uZmlnIENPTU1PTl9DTEtfUkVBTFRFSw0KPiA+ICsgICAgIHRyaXN0YXRlICJDbG9j
ayBkcml2ZXIgZm9yIFJlYWx0ZWsgU29DcyINCj4gPiArICAgICBkZXBlbmRzIG9uIEFSQ0hfUkVB
TFRFSyB8fCBDT01QSUxFX1RFU1QNCj4gPiArICAgICBkZWZhdWx0IEFSQ0hfUkVBTFRFSw0KPiA+
ICsgICAgIGhlbHANCj4gPiArICAgICAgIEVuYWJsZSB0aGUgY29tbW9uIGNsb2NrIGZyYW1ld29y
ayBpbmZyYXN0cnVjdHVyZSBmb3IgUmVhbHRlaw0KPiA+ICsgICAgICAgc3lzdGVtLW9uLWNoaXAg
cGxhdGZvcm1zLg0KPiA+ICsNCj4gPiArICAgICAgIFRoaXMgcHJvdmlkZXMgdGhlIGJhc2Ugc3Vw
cG9ydCByZXF1aXJlZCBieSBpbmRpdmlkdWFsIFJlYWx0ZWsNCj4gPiArICAgICAgIGNsb2NrIGNv
bnRyb2xsZXIgZHJpdmVycyB0byBleHBvc2UgY2xvY2tzIHRvIHBlcmlwaGVyYWwgZGV2aWNlcy4N
Cj4gPiArDQo+ID4gKyAgICAgICBJZiB5b3UgaGF2ZSBhIFJlYWx0ZWstYmFzZWQgcGxhdGZvcm0s
IHNheSBZLg0KPiA+ICsNCj4gPiAraWYgQ09NTU9OX0NMS19SRUFMVEVLDQo+ID4gKw0KPiA+ICtj
b25maWcgUlRLX0NMS19DT01NT04NCj4gPiArICAgICB0cmlzdGF0ZSAiUmVhbHRlayBDbG9jayBD
b21tb24iDQo+ID4gKyAgICAgZGVwZW5kcyBvbiBSRVNFVF9DT05UUk9MTEVSDQo+ID4gKyAgICAg
c2VsZWN0IEFVWElMSUFSWV9CVVMNCj4gPiArICAgICBzZWxlY3QgUkVHTUFQX01NSU8NCj4gPiAr
ICAgICBzZWxlY3QgUkVTRVRfUlRLX0NPTU1PTg0KPiANCj4gSXMgdGhlcmUgY29tcGlsZSB0aW1l
IGRlcGVuZGVuY3kgd2l0aCByZXNldCB0aGF0IEkgbWlzc2VkID8NCj4gVGhlIHBvaW50IG9mIHRo
ZSBhdXggYnVzIGlzIHRvIHJlbW92ZSBzdWNoIGRlcA0KPiANCg0KQWNrLg0KDQo+ID4gKyAgICAg
aGVscA0KPiA+ICsgICAgICAgQ29tbW9uIGhlbHBlciBjb2RlIHNoYXJlZCBieSBSZWFsdGVrIGNs
b2NrIGNvbnRyb2xsZXIgZHJpdmVycy4NCj4gPiArDQo+ID4gKyAgICAgICBUaGlzIHByb3ZpZGVz
IHV0aWxpdHkgZnVuY3Rpb25zIGFuZCBkYXRhIHN0cnVjdHVyZXMgdXNlZCBieQ0KPiA+ICsgICAg
ICAgbXVsdGlwbGUgUmVhbHRlayBjbG9jayBpbXBsZW1lbnRhdGlvbnMsIGFuZCBpbmNsdWRlIGlu
dGVncmF0aW9uDQo+ID4gKyAgICAgICB3aXRoIHJlc2V0IGNvbnRyb2xsZXJzIHdoZXJlIHJlcXVp
cmVkLg0KPiA+ICsNCg0KWy4uLl0NCg0KPiA+ICtpbnQgcnRrX2Nsa19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LCBjb25zdCBzdHJ1Y3QNCj4gPiArcnRrX2Nsa19kZXNjICpkZXNj
KSB7DQo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArICAg
ICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ID4gKyAgICAgdm9pZCBfX2lvbWVtICpiYXNlOw0K
PiA+ICsgICAgIHN0cnVjdCBjbGtfaHcgKmh3Ow0KPiA+ICsgICAgIGludCBpLCByZXQ7DQo+ID4g
Kw0KPiA+ICsgICAgIGJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7DQo+ID4gKyAgICAgaWYgKElTX0VSUihiYXNlKSkNCj4gPiArICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKGJhc2UpOw0KPiA+ICsNCj4gPiArICAgICByZWdtYXAgPSBkZXZtX3JlZ21hcF9p
bml0X21taW8oZGV2LCBiYXNlLA0KPiAmcnRrX2Nsa19yZWdtYXBfY29uZmlnKTsNCj4gPiArICAg
ICBpZiAoSVNfRVJSKHJlZ21hcCkpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihy
ZWdtYXApOw0KPiA+ICsNCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgZGVzYy0+bnVtX2Nsa3M7
IGkrKykNCj4gPiArICAgICAgICAgICAgIGRlc2MtPmNsa3NbaV0tPnJlZ21hcCA9IHJlZ21hcDsN
Cj4gPiArDQo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IGRlc2MtPmNsa19kYXRhLT5udW07IGkr
Kykgew0KPiA+ICsgICAgICAgICAgICAgaHcgPSBkZXNjLT5jbGtfZGF0YS0+aHdzW2ldOw0KPiA+
ICsgICAgICAgICAgICAgaWYgKCFodykNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgcmV0ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXIo
ZGV2LCBodyk7DQo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byByZWdpc3Rl
cg0KPiBodyBvZiBjbGslZFxuIiwgaSk7DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAgICBy
ZXQgPSBkZXZtX29mX2Nsa19hZGRfaHdfcHJvdmlkZXIoZGV2LCBvZl9jbGtfaHdfb25lY2VsbF9n
ZXQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlc2MtPmNs
a19kYXRhKTsNCj4gPiArICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gYWRkIGNsb2NrDQo+ID4gKyBwcm92aWRl
clxuIik7DQo+ID4gKw0KPiA+ICsgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsICh2b2lk
ICopZGVzYyk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiBydGtfcmVzZXRfY29udHJvbGxlcl9y
ZWdpc3RlcihkZXYsIGRlc2MtPmF1eF9uYW1lLA0KPiA+ICsgcmVnbWFwKTsNCj4gDQo+IHNhc2hp
a28gcmVwb3J0IG9uIFBhdGNoIDEwIGlzIGFjdHVhbGx5IG5vdCBhIHByZXhpc3RpbmcgaXNzdWUu
IGl0IGlzIGhlcmUuDQo+IENvdWxkIHlvdSBhZGRyZXNzIGl0ID8NCj4gDQoNCldpbGwgZml4LiBJ
IHdpbGwgc3dhcCB0aGUgcmVnaXN0cmF0aW9uIG9yZGVyIG9mIHRoZSByZXNldCBjb250cm9sbGVy
IGFuZCB0aGUNCmNsb2NrIHByb3ZpZGVyLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQo=
