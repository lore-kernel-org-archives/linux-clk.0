Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801363C1095;
	Fri, 31 Jul 2026 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485654; cv=none; b=dbAuxJnPby0wRMQ7Xxek9jaAMHZGhiJgyMXq83TuBealQXs/swe/dTJu5YRXDrFbt4ZR770PTdLyYjUeZvNuuXh5xDT4aiXxt9Ync2CG2ejvMBhTkOmqhUhVAtzEtAF2bD/H6y0iVWL8A4y1y7RVtb7cC8birj3rCFbsnM6u6wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485654; c=relaxed/simple;
	bh=Uf4FbMkTu1U8ZgNv5y7aY6VnlEFJtw0SZQrULXJkABg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ikVZkzUZWPhKbH9iH8Gm5qFZG9kv9H/s/jey9rej+OtyCBDsFa9QAv4DSHRAxyUHLkh5hr61I2d1fHd+wCu2wiQqRNckTxWB2DqXkoxZnae/qNTFIgXLDRu8RrdIPr35idQ8p1iI62mCESSzyDm5amrj1eSchkBZS9Czn37ApjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Yn3D1QMB; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Yn3D1QMB"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66V8DhmG61759307, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785485623; bh=Uf4FbMkTu1U8ZgNv5y7aY6VnlEFJtw0SZQrULXJkABg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Yn3D1QMB0WGOkIXxzlw1CHBDXjLHbmsKKCytV8gbQhcKOoZnnxv0lIH5lcYtpBZxc
	 siXSEguxaPXfyWg+Rj1nCLifRKTxBVQDW1srl+km0umpjRH9he3qjRiicP6Tya0Q7C
	 HJWaauzkWxcZa6c+QzcigCSz/iPeqyyTywJznV8VKnVkeIIf3mXcCy3YxpDt3Cv7es
	 TJdvV2jn2+9RTT6PZ9+qvQCoOPQsBIYHzNsicHbKpDhxEPe6mauXB1+qHMJM7ppQU3
	 POYpTVX5/BY9ewRKV41a82v2AkI5VAeNEznczY+oMkNGOxfsO+1tEVa60o+B1GAw/b
	 609ckEF72VBiA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66V8DhmG61759307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jul 2026 16:13:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Jul 2026 16:13:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Jul 2026 16:13:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 31 Jul 2026 16:13:43 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?big5?B?RWRnYXIgTGVlIFun9anTv9ld?= <cylee12@realtek.com>,
	=?big5?B?SnlhbiBDaG91IFupUKrppndd?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v11 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Topic: [PATCH v11 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Index: AQHdHp1PpoI6mE/b0EW79Zrx7YIiPraFwhOAgAGFtsA=
Date: Fri, 31 Jul 2026 08:13:43 +0000
Message-ID: <b6a9451f04e34051b06d16778b12feb4@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-9-eleanor.lin@realtek.com>
 <amt_dXo576fJeqKU@redhat.com>
In-Reply-To: <amt_dXo576fJeqKU@redhat.com>
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

SGkgQnJpYW4sDQogDQo+IEhpIFl1LUNodW4sDQo+DQo+IE9uIFR1ZSwgSnVsIDI4LCAyMDI2IGF0
IDEwOjI4OjAzUE0gKzA4MDAsIFl1LUNodW4gTGluIHdyb3RlOg0KPiA+IEZyb206IENoZW5nLVl1
IExlZSA8Y3lsZWUxMkByZWFsdGVrLmNvbT4NCiANCiguLi4pDQogDQo+ID4gK3N0YXRpYyBpbnQg
cnRrX2Nsa19yZWdtYXBfcGxsX21tY19waGFzZV9nZXRfcGhhc2Uoc3RydWN0IGNsa19odyAqaHcp
DQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgY2xrX2h3ICpod3A7DQo+ID4gKyAgICAgc3RydWN0
IHJ0a19jbGtfcmVnbWFwX3BsbF9tbWMgKmNsa207DQo+ID4gKyAgICAgaW50IHBoYXNlX2lkOw0K
PiA+ICsgICAgIGludCByZXQ7DQo+ID4gKyAgICAgdTMyIHZhbDsNCj4NCj4gUHV0IGluIHJldmVy
c2UgQ2hyaXN0bWFzIHRyZWUgb3JkZXIuIFlvdSBjYW4gY29tYmluZSB0aGUgdHdvIGludCByb3dz
Lg0KPg0KIA0KQWNrLg0KIA0KPiA+ICsNCj4gPiArICAgICBod3AgPSBjbGtfaHdfZ2V0X3BhcmVu
dChodyk7DQo+ID4gKyAgICAgaWYgKCFod3ApDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVO
T0VOVDsNCj4gPiArDQo+ID4gKyAgICAgY2xrbSA9IHRvX2Nsa19wbGxfbW1jKGh3cCk7DQo+ID4g
KyAgICAgcGhhc2VfaWQgPSAoaHcgPT0gJmNsa20tPnBoYXNlMF9odykgPyAwIDogMTsNCj4gPiAr
ICAgICByZXQgPSBnZXRfcGhzZWwoY2xrbSwgcGhhc2VfaWQsICZ2YWwpOw0KPiA+ICsgICAgIGlm
IChyZXQpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgICB2
YWwgPSBESVZfUk9VTkRfQ0xPU0VTVCh2YWwgKiBDWUNMRV9ERUdSRUVTLCBQSEFTRV9TVEVQUyk7
DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiB2YWw7DQo+ID4gK30NCj4gPiArDQo+ID4gK2NvbnN0
IHN0cnVjdCBjbGtfb3BzIHJ0a19jbGtfcGxsX21tY19waGFzZV9vcHMgPSB7DQo+ID4gKyAgICAg
LnNldF9waGFzZSA9IHJ0a19jbGtfcmVnbWFwX3BsbF9tbWNfcGhhc2Vfc2V0X3BoYXNlLA0KPiA+
ICsgICAgIC5nZXRfcGhhc2UgPSBydGtfY2xrX3JlZ21hcF9wbGxfbW1jX3BoYXNlX2dldF9waGFz
ZSwNCj4gPiArfTsNCj4gPiArRVhQT1JUX1NZTUJPTF9OU19HUEwocnRrX2Nsa19wbGxfbW1jX3Bo
YXNlX29wcywgIlJFQUxURUtfQ0xLIik7DQo+DQo+IEp1c3QgbG9va2luZyBhdCBleGlzdGluZyBj
bGsgZHJpdmVycywgdGhlcmUncyA1IHRoYXQgdXNlDQo+IEVYUE9SVF9TWU1CT0xfTlNfR1BMKCku
IDMgb2YgdGhlbSB1c2UgQ0xLX0ZPTywgc28gbGV0J3MganVzdCBtYWtlIHRoaXMNCj4gQ0xLX1JF
QUxURUsgZm9yIGNvbnNpc3RlbmN5IHdpdGggdGhlIG90aGVyIGRyaXZlcnMuIEkgbGlrZSB0aGlz
IGJlY2F1c2UgaXQncw0KPiBmcmFtZXdvcmsvY2xrIHN1YnN5c3RlbS4gSSdtIG5vdCBnb2luZyB0
byBjYWxsIHRoaXMgb3V0IG9uIHRoZSBvdGhlciBwYXRjaGVzLg0KPg0KIA0KQWNrLiBXaWxsIHJl
bmFtZSB0byBDTEtfUkVBTFRFSy4NCiANCj4gPiArDQogDQooLi4uKQ0KIA0KPiA+ICtzdGF0aWMg
aW50IHJ0a19jbGtfcmVnbWFwX3BsbF9tbWNfc2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVu
c2lnbmVkDQo+IGxvbmcgcmF0ZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpDQo+IHsNCj4gPiArICAgICBzdHJ1
Y3QgcnRrX2Nsa19yZWdtYXBfcGxsX21tYyAqY2xrbSA9IHRvX2Nsa19wbGxfbW1jKGh3KTsNCj4g
PiArICAgICB1MzIgdmFsID0gUlRLX1BMTF9NTUNfU1NDX0RJVl9OX1ZBTDsNCj4gPiArICAgICBp
bnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICAvKg0KPiA+ICsgICAgICAqIFRoZSAncmF0ZScgYW5k
ICdwYXJlbnRfcmF0ZScgYXJlIGludGVudGlvbmFsbHkgdW51c2VkIGhlcmUuDQo+ID4gKyAgICAg
ICoNCj4gPiArICAgICAgKiBEZXNwaXRlIHJlY2VpdmluZyB2YXJpb3VzIHJhdGUgcmVxdWVzdHMg
KGUuZy4sIDI2TUh6LCA1Mk1IeiwNCj4gMjAwTUh6KSwNCj4gPiArICAgICAgKiB0aGlzIGZ1bmN0
aW9uIGNvbnNpc3RlbnRseSBjb25maWd1cmVzIHRoZSBoYXJkd2FyZSBmb3IgMjdNSHoNCj4gKDB4
MWIpLg0KPiA+ICsgICAgICAqIFRoaXMgaXMgYmVjYXVzZSB0aGVzZSBzZXR0aW5ncyByZWZsZWN0
IHRoZSBpbnB1dCByZWZlcmVuY2UgY2xvY2sNCj4gPiArICAgICAgKiBmcmVxdWVuY3kgdG8gdGhl
IFNTQ1BMTCwgbm90IHRoZSBmaW5hbCBQTEwgb3V0cHV0IGZyZXF1ZW5jeS4NCj4gPiArICAgICAg
Kg0KPiA+ICsgICAgICAqIFRoZSBhY3R1YWwgZnJlcXVlbmN5IGRpdmlzaW9uIHRvIGFjaGlldmUg
dGhlIHJlcXVlc3RlZCBlTU1DIHJhdGUNCj4gPiArICAgICAgKiBpcyBoYW5kbGVkIGludGVybmFs
bHkgYnkgdGhlIGRvd25zdHJlYW0gZU1NQyBob3N0IGNvbnRyb2xsZXIuDQo+ID4gKyAgICAgICov
DQo+ID4gKw0KPiA+ICsgICAgIHJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhjbGttLT5jbGtyLnJl
Z21hcCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrbS0+c3NjX2RpZ19v
ZnMgKw0KPiBSVEtfUExMX1NTQ19ESUdfRU1NQzFfT0ZGU0VULA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBSVEtfUExMX0ZMQUdfSU5JVEFMX0VNTUNfTUFTSywNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwIDw8DQo+IFJUS19QTExfRkxBR19JTklUQUxf
RU1NQ19TSElGVCk7DQo+DQo+IGRldGVybWluZV9yYXRlKCkgYWJvdmUgaW1wbGllcyB0aGF0IHRo
aXMgUExMIGNhbiBkbyBtdWx0aXBsZSBmcmVxdWVuY2llcy4NCj4gVGhlcmUgd2lsbCBiZSBhIG1p
c21hdGNoIGJldHdlZW4gd2hhdCB0aGUgY2xrIGNvcmUgdGhpbmtzIHRoZSBmcmVxdWVuY3kgaXMN
Cj4gY29tcGFyZWQgdG8gd2hhdCdzIGFjdHVhbGx5IHByb2dyYW1tZWQgaW4gdGhlIGhhcmR3YXJl
LiBTaG91bGQNCj4gZGV0ZXJtaW5lX3JhdGUgYWJvdmUgYWxzbyByZXR1cm4gdGhlIGZpeGVkIHJh
dGUgYXMgd2VsbD8NCj4NCj4gQnJpYW4NCiANCllvdSdyZSByaWdodC4gVGhpcyBQTEwgaXMgYWN0
dWFsbHkgY29uZmlndXJlZCB0byBvcGVyYXRlIGF0IGEgZml4ZWQNCmZyZXF1ZW5jeSBmb3IgdGhl
IE1NQy4NCiANCldpbGwgdXBkYXRlIGRldGVybWluZV9yYXRlKCkgbGlrZSB0aGlzOg0KIA0KICAg
IHZhbCA9IFJUS19QTExfTU1DX1NTQ19ESVZfTl9WQUwgKyAyOw0KICAgIHJlcS0+cmF0ZSA9IHJl
cS0+YmVzdF9wYXJlbnRfcmF0ZSAvIDQgKiB2YWwgKw0KICAgICAgICAgICAgICAgIChyZXEtPmJl
c3RfcGFyZW50X3JhdGUgLyA0ICogMTUxNykgLyA4MTkyOw0KIA0KQmVzdCBSZWdhcmRzLA0KWXUt
Q2h1bg0K
