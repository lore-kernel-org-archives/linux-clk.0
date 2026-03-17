Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD131DDC3F;
	Tue, 17 Mar 2026 02:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773712821; cv=none; b=PFDbXUFl/QFHbJgQmd/Tfv5ptS7t9EOF7CJU+w9TBCRusY5ymw7lMFIW26/qnlLu8ytbTIWYyLIfX4CdtUhIYrttJGDJij2SLW+wmP5g037cEaDdldqtlGKkIK6XmgbRqyiYF74BmRpV399K5vDT/9tmBbCpglO7lJzzvLXXN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773712821; c=relaxed/simple;
	bh=G8mrea49hDZtSz8SU3IBfjCwAqm888S2KDreUaH9Nns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BLfUSsS90wRfJXnsFsW8tf+snYX9CICLdgS/MJEw9x4SA7L3UYshR1Ld9/XrYkuFRC1pUtVayTksO4ByYvSeRmHgA05ZLbGfULeCZZQX7d650ipnpGfHniaKwqdqoLM7YqxbSdMcCf+z2oUVQPN9MKVGKjyDeSZEWKOjZwTQwDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=qp+cQGIK; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="qp+cQGIK"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62H1vOcX53035946, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773712644; bh=G8mrea49hDZtSz8SU3IBfjCwAqm888S2KDreUaH9Nns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=qp+cQGIKQfxcaqPZq4D4oGpt3wXvzDxcgpqI+ROdg8Dg2UlQNtvbltJrgPR+Fpa4L
	 OhL256NrySEUVF/HPfIgFmCSGs5qPGwjxO55p4+4bSvzeIS3iaDvxWAj6khDL9P8Ye
	 WNu7CQ+xtZv2Z5JZn6rzvoDphqkyPoB+5iqINbKc/TuHFKgxihELROuRSwnCravgRK
	 qmlpmCSj4QobBlI3Qy6GpGPm0Iz2wmJe9Vvo8ogeno9dCoItXzCU/gbfDWAdofxBE3
	 SU0r52OULi2mVqRj3syf0csYI7OHEPKk5/H6aXceabKAkDldYq9ymEesBRwlGvmwke
	 8fIiv58z4HM9A==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62H1vOcX53035946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 09:57:24 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 09:57:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 17 Mar 2026 09:57:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Tue, 17 Mar 2026 09:57:24 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org"
	<sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
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
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v4 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Thread-Topic: [PATCH v4 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Thread-Index: AQHcssDu00Ji1VbGSEi0IIjjl/0gyLWtOvYAgATCPIA=
Date: Tue, 17 Mar 2026 01:57:24 +0000
Message-ID: <77e88b72f99c4a709f6fbae57162b090@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
 <20260313081100.596224-2-eleanor.lin@realtek.com>
 <20260314-orange-foxhound-of-felicity-997667@quoll>
In-Reply-To: <20260314-orange-foxhound-of-felicity-997667@quoll>
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

PiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCAwNDoxMDo1MVBNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4+ICsjZW5kaWYgLyogX19EVF9CSU5ESU5HU19SVEtfQ0xPQ0tfUlREMTYyNV9IICov
DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9yZWFsdGVrLHJ0ZDE2
MjUuaA0KPj4gYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3JlYWx0ZWsscnRkMTYyNS5oDQo+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5lNjliNWVlMTRj
YzYNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQv
cmVhbHRlayxydGQxNjI1LmgNCj4+IEBAIC0wLDAgKzEsMTk1IEBADQo+PiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAqLw0KPj4gKy8q
DQo+PiArICogQ29weXJpZ2h0IChDKSAyMDI1IFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDb3JwLg0K
Pj4gKyAqLw0KPj4gKyNpZm5kZWYgX19EVF9CSU5ESU5HU19SVEtfUkVTRVRfUlREMTYyNV9IICNk
ZWZpbmUNCj4+ICtfX0RUX0JJTkRJTkdTX1JUS19SRVNFVF9SVEQxNjI1X0gNCj4+ICsNCj4+ICsj
ZGVmaW5lIFJURDE2MjVfUlNUTl9SRUdfSURfU09GVF9SRVNFVDEgICAgIDANCj4+ICsjZGVmaW5l
IFJURDE2MjVfUlNUTl9SRUdfSURfU09GVF9SRVNFVDIgICAgIDENCj4+ICsjZGVmaW5lIFJURDE2
MjVfUlNUTl9SRUdfSURfU09GVF9SRVNFVDMgICAgIDINCj4+ICsjZGVmaW5lIFJURDE2MjVfUlNU
Tl9SRUdfSURfU09GVF9SRVNFVDQgICAgIDMNCj4+ICsjZGVmaW5lIFJURDE2MjVfUlNUTl9SRUdf
SURfU09GVF9SRVNFVDcgICAgIDQNCj4+ICsjZGVmaW5lIFJURDE2MjVfUlNUTl9SRUdfSURfU09G
VF9SRVNFVDkgICAgIDUNCj4+ICsjZGVmaW5lIFJURDE2MjVfUlNUTl9SRUdfSURfU09GVF9SRVNF
VF9CSVNUIDYNCj4+ICsjZGVmaW5lIFJURDE2MjVfUlNUTl9SRUdfSURfRFVNTVkwICAgICAgICAg
IDcNCj4+ICsjZGVmaW5lIFJURDE2MjVfUlNUTl9SRUdfSURfRFVNTVkxICAgICAgICAgIDgNCj4+
ICsjZGVmaW5lIFJURDE2MjVfUlNUTl9SRUdfSURfRFVNTVk0ICAgICAgICAgIDkNCj4+ICsjZGVm
aW5lIFJURDE2MjVfUlNUTl9SRUdfSURfU09GVF9SRVNFVDExICAgIDEwDQo+PiArI2RlZmluZSBS
VEQxNjI1X1JTVE5fUkVHX0lEX1NPRlRfUkVTRVQxMiAgICAxMQ0KPj4gKw0KPj4gKyNkZWZpbmUg
X1JFR19JRChuKSAoKFJURDE2MjVfUlNUTl9SRUdfSURfICMjIG4pIDw8IDUpDQo+PiArDQo+IA0K
PiBOb3QgYSBiaW5kaW5nLg0KPiANCj4+ICsjZGVmaW5lIFJURDE2MjVfQ1JUX1JTVE5fTUlTQyAg
ICAgIChfUkVHX0lEKFNPRlRfUkVTRVQxKSB8IDApDQo+PiArI2RlZmluZSBSVEQxNjI1X0NSVF9S
U1ROX0RJUCAgICAgICAoX1JFR19JRChTT0ZUX1JFU0VUMSkgfCAyKQ0KPj4gKyNkZWZpbmUgUlRE
MTYyNV9DUlRfUlNUTl9HU1BJICAgICAgKF9SRUdfSUQoU09GVF9SRVNFVDEpIHwgNCkNCj4gDQo+
IE5vbmUgb2YgdGhlc2UgYXJlIHJlYWxseSBiaW5kaW5ncy4gUmVnaXN0ZXIgb2Zmc2V0cyBpcyBo
YXJkd2FyZSBkYXRhLCBub3QgYQ0KPiBiaW5kaW5nLg0KPiANCj4gRHJvcCBhbGwgb2YgdGhpcyBh
Ym92ZSBhbmQgZnVydGhlciAtIGFjdHVhbGx5IG5vdGhpbmcgaW4gdGhpcyBoZWFkZXIgbG9vayBs
aWtlIGENCj4gYmluZGluZywgc2luY2UgeW91IGNhbGxlZCB0aGVzZSAiUkVHIi4NCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClRoZSBkZWZpbmVzIGluIHRoaXMgaGVhZGVyIGFy
ZSBOT1QgcmVnaXN0ZXIgb2Zmc2V0cy4gVGhleSBlbmNvZGUgIkJhbmsgSUQrIEJpdA0KUG9zaXRp
b24iIGZvciB1c2UgaW4gRGV2aWNlIFRyZWUuDQoNCkFncmVlZCwgVGhlIG5hbWluZyB3aXRoICJS
RUdfSUQiIGlzIG1pc2xlYWRpbmcuIEkgd2lsbCBpbXByb3ZlIG5hbWluZyBhbGwgcmVzZXQNCklE
cyBpbiB2NS4NCg0KQmVzdCByZWdhcmRzLA0KWXUtQ2h1bg0K
