Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3896438023;
	Wed, 23 Sep 2026 05:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142086; cv=none; b=chPFN0gEn88F7RgAYRrF6IqLrFtR9nECNZHT7QzWgKXjG4j3LM7U6lJoQzZP5RB4wcymzihlf/+0+Oi2PhwteFM1Qgsx9A4cfuXugSlIuZDHue+L/7Suh+CqsfBb3Fbk+xCqiA0jhpfeAA68XzMKpUeUXXVW+Vh4Q20s4nChrlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142086; c=relaxed/simple;
	bh=FsG6ot7ZlmOazh1UtDrX8fT8gQWrTeFG4WBeIFI+eJs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NQ1fqb3a0S6PhwxGdDSDzxXEdUlvXq7MIS3lFKWFQbLNZ7EXaeTX4CJkL3aj9r1tvjB8Oj6UOqtwK7iGnC2/IF2gnV+0d2DIGqy1qCq492hzFeeRYlK6Dl7ZkvFDx8QVeIKZ2IyYbr5JyyAZUFRHlGSTBSDDppNjNJrHvv4T5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=pymqhFPP; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="pymqhFPP"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68N5f17d9095196, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790142062; bh=FsG6ot7ZlmOazh1UtDrX8fT8gQWrTeFG4WBeIFI+eJs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=pymqhFPPeU4tER84cy1XcFtHI6a1KC31LW9vA5Q2a9sLk8f5NZvVgxRIo3Z27dLnV
	 15TaSUTUiVeaD3U/noIKlDAnxdqCf800nIeRc+CqUa2j35mxLzKD3y74gTHJ56PD5e
	 VO1YVb6j/rY26DzXLbVFS/4aKZ6/Uwn4z6TII5y67yqcuGxuLtJh3QOLDi+8Sn1jhW
	 avLFgtrd25VFiYWaRs401wLDj2y+guF0c+ae/nZwZBHjAoUkFDN4UMXLa+CP7NpMDk
	 CTg1xQCjoEpCYY/xr1NPK5HrTQ5hsdfUjfWT6crk4vTD+I1FPVm0pSb8beZeUmL19N
	 DUskn6t7TIJxw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68N5f17d9095196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 13:41:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 13:41:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 13:41:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 23 Sep 2026 13:41:00 +0800
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
Subject: RE: [PATCH v14 06/11] clk: realtek: Add support for gate clock
Thread-Topic: [PATCH v14 06/11] clk: realtek: Add support for gate clock
Thread-Index: AQHdOeL+riV/rLDnjUiZnj9EMhgPfbbPJVYAgAyi+QA=
Date: Wed, 23 Sep 2026 05:41:00 +0000
Message-ID: <63254471a74d49f198cb69718e3a565b@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-7-eleanor.lin@realtek.com>
 <178947612411.448573.8319851834736456413.b4-reply@b4>
In-Reply-To: <178947612411.448573.8319851834736456413.b4-reply@b4>
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

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyBpbnQgcnRrX2Nsa19yZWdtYXBfZ2F0ZV9lbmFibGUo
c3RydWN0IGNsa19odyAqaHcpIHsNCj4gPiArICAgICBzdHJ1Y3QgcnRrX2Nsa19yZWdtYXBfZ2F0
ZSAqY2xrZyA9IHRvX3J0a19jbGtfcmVnbWFwX2dhdGUoaHcpOw0KPiA+ICsgICAgIHVuc2lnbmVk
IGludCBtYXNrOw0KPiA+ICsgICAgIHVuc2lnbmVkIGludCB2YWw7DQo+ID4gKw0KPiA+ICsgICAg
IG1hc2sgPSBCSVQoY2xrZy0+Yml0X2lkeCk7DQo+ID4gKyAgICAgdmFsID0gQklUKGNsa2ctPmJp
dF9pZHgpOw0KPiA+ICsNCj4gPiArICAgICBpZiAoY2xrZy0+d3JpdGVfZW4pIHsNCj4gPiArICAg
ICAgICAgICAgIG1hc2sgfD0gQklUKGNsa2ctPmJpdF9pZHggKyAxKTsNCj4gPiArICAgICAgICAg
ICAgIHZhbCB8PSBCSVQoY2xrZy0+Yml0X2lkeCArIDEpOw0KPiA+ICsgICAgIH0NCj4gPiArDQo+
ID4gKyAgICAgcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhjbGtnLT5jbGtyLnJlZ21hcCwgY2xr
Zy0+Z2F0ZV9vZnMsDQo+ID4gK21hc2ssIHZhbCk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lk
IHJ0a19jbGtfcmVnbWFwX2dhdGVfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykgew0KPiA+ICsg
ICAgIHN0cnVjdCBydGtfY2xrX3JlZ21hcF9nYXRlICpjbGtnID0gdG9fcnRrX2Nsa19yZWdtYXBf
Z2F0ZShodyk7DQo+ID4gKyAgICAgdW5zaWduZWQgaW50IG1hc2s7DQo+ID4gKyAgICAgdW5zaWdu
ZWQgaW50IHZhbDsNCj4gPiArDQo+ID4gKyAgICAgbWFzayA9IEJJVChjbGtnLT5iaXRfaWR4KTsN
Cj4gPiArICAgICB2YWwgPSAwOw0KPiA+ICsNCj4gPiArICAgICBpZiAoY2xrZy0+d3JpdGVfZW4p
IHsNCj4gPiArICAgICAgICAgICAgIG1hc2sgfD0gQklUKGNsa2ctPmJpdF9pZHggKyAxKTsNCj4g
PiArICAgICAgICAgICAgIHZhbCB8PSBCSVQoY2xrZy0+Yml0X2lkeCArIDEpOw0KPiA+ICsgICAg
IH0NCj4gDQo+IENvdWxkIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB0aGlzIHdyaXRlX2VuIHRo
aW5nID8gU29tZSBraW5kIG9mIHZvbGF0aWxlIGJpdA0KPiB0byBjb21taXQgdGhlIGNoYW5nZSA/
DQo+IA0KDQpXaWxsIGFkZCBhIGNvbW1lbnQgYW5kIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UuDQpJ
dCBpcyBhIGhhcmR3YXJlLXNwZWNpZmljIGRlc2lnbi4gVG8gbW9kaWZ5IHRoZSB0YXJnZXQgYml0
LCB0aGUgYWRqYWNlbnQNCndyaXRlLWVuYWJsZSBiaXQgbXVzdCBiZSBhc3NlcnRlZC4NCg0KPiA+
ICsNCj4gPiArICAgICByZWdtYXBfdXBkYXRlX2JpdHMoY2xrZy0+Y2xrci5yZWdtYXAsIGNsa2ct
PmdhdGVfb2ZzLCBtYXNrLA0KPiA+ICsgdmFsKTsNCj4gDQo+IE5pdHBpY2s6IHRoZSAyIGZ1bmN0
aW9ucyBhYm92ZSBtb3JlIGxlc3MgY29weS9wYXN0ZS4NCj4gDQoNCkkgd2lsbCBleHRyYWN0IHRo
ZSBjb21tb24gbG9naWMgaW50byBhIGhlbHBlciBmdW5jdGlvbi4NCg0KQmVzdCBSZWdhcmRzLA0K
WXUtQ2h1bg0K
