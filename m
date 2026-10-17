Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08546C835;
	Sat, 17 Oct 2026 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792227984; cv=none; b=E7q8kPIQvusXWJvK999Myn98NDkse/FvvFS2RuwjbN02SJAdglIDd7tyP6DRpv6pWEo5dH+cIkYG477cROqDaTiuaVDmlXA6beePaWG0TqGSgh9umb0h4XjkgI2dE4rPcENNAnVb8YnQCOou8JMNvO+Mf3U1sniO7/NM7jmcnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792227984; c=relaxed/simple;
	bh=FbibGSHctlVdbJsTuBC/kmZGeVRnYngnwTvlaiUstwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EJk8IZ0kIS+lpsNfjLKzjou5QwaQa9jhVilCDRTYP7gDL6ovd+KRdPOjRVmd8D/Os0ip5XDBZAVH1xht4dxyvkHro445J1nDfhFPel4qGv/pNNJuc5Sh+DHNHh7Le7eghiWr1lRN4A3x8zSzza2gO+m7u4/G0QOcP3juxDwSSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=k6KBkH9n; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="k6KBkH9n"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H95G9m8009797, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792227916; bh=FbibGSHctlVdbJsTuBC/kmZGeVRnYngnwTvlaiUstwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=k6KBkH9nmehZdn7s3kmV9BOKv4wqGAiL4H2VR2l5TeE2fhIowRTS7gUZpTj9ATerU
	 oW6NnyuqdpChEe6a3srv7V3oEnQ1spoYGBevmpYKl8bpL2lG7t7KS8FyfGqGClTA6N
	 JOjZtiPFCGtq7q/qDTX6nPe4YmxU8Mzyo4mXKj/FazxmshOgChv85B0gSfMMNqRbEC
	 6f/2dEK/+3MqHhT/LZUghgtj+Xzk1RREUSQDCkfNWxFVsj/oAG8bgEHY3s9DQBVFZj
	 AmvYPX0n+ye9pLZmWyjOn9NVv4ZeANSrjUAB6XQNZvGM3kizKcTXpl7S0mHPqThTO7
	 IUyA0n9PhQbdQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H95G9m8009797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 17:05:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:05:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 17:05:15 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
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
Subject: RE: [PATCH v15 06/11] clk: realtek: Add support for gate clock
Thread-Topic: [PATCH v15 06/11] clk: realtek: Add support for gate clock
Thread-Index: AQHdUkHCGMJ17VacYUWU4SZmtnaJtrb1DaSAgAx6+iA=
Date: Sat, 17 Oct 2026 09:05:15 +0000
Message-ID: <fd89a628e14546a3ac28c78f7cc0419e@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-7-eleanor.lin@realtek.com>
 <179157057524.266328.4248123787670079601.b4-review@b4>
In-Reply-To: <179157057524.266328.4248123787670079601.b4-review@b4>
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

SGkgSmVyb21lLA0KDQo+ID4gSW50cm9kdWNlIGNsa19yZWdtYXBfZ2F0ZV9vcHMgc3VwcG9ydGlu
ZyBlbmFibGUsIGRpc2FibGUsIGFuZA0KPiA+IGlzX2VuYWJsZWQgZm9yIHN0YW5kYXJkIHJlZ21h
cCBnYXRlIGNsb2Nrcy4gVG8gYWNjb21tb2RhdGUgaGFyZHdhcmUNCj4gPiBkZXNpZ25zLCB0aGUg
ZW5hYmxlIGFuZCBkaXNhYmxlIG9wZXJhdGlvbnMgaGFuZGxlIGEgJ3dyaXRlX2VuJyBmbGFnLA0K
PiA+IHdoaWNoIGFzc2VydHMgYW4gYWRqYWNlbnQgd3JpdGUtZW5hYmxlIGJpdCAoYml0X2lkeCAr
IDEpDQo+ID4gc2ltdWx0YW5lb3VzbHkgd2hlbiBtb2RpZnlpbmcgdGhlIGdhdGUgYml0Lg0KPiA+
DQo+ID4gQWRkIGNsa19yZWdtYXBfZ2F0ZV9yb19vcHMgYXMgYSByZWFkLW9ubHkgdmFyaWFudCBl
eHBvc2luZyBvbmx5DQo+IGlzX2VuYWJsZWQuDQoNClsuLi5dDQoNCj4gPiArI2RlZmluZSBSVEtf
Q0xLX1JFR01BUF9HQVRFX05PX1BBUkVOVChfbmFtZSwgX2ZsYWdzLCBfb2ZzLA0KPiBfYml0X2lk
eCwgX3dyaXRlX2VuKSAgICAgICAgXA0KPiA+ICsgICAgIF9fUlRLX0NMS19SRUdNQVBfR0FURV9O
T19QQVJFTlQoX25hbWUsDQo+ICZydGtfY2xrX3JlZ21hcF9nYXRlX29wcywgX2ZsYWdzLCBfb2Zz
LCBcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9iaXRfaWR4LCBfd3Jp
dGVfZW4pDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFJUS19DTEtfUkVHTUFQX0dBVEVfTk9fUEFSRU5U
X1JPKF9uYW1lLCBfZmxhZ3MsIF9vZnMsDQo+IF9iaXRfaWR4LCBfd3JpdGVfZW4pICBcDQo+ID4g
KyAgICAgX19SVEtfQ0xLX1JFR01BUF9HQVRFX05PX1BBUkVOVChfbmFtZSwNCj4gJnJ0a19jbGtf
cmVnbWFwX2dhdGVfcm9fb3BzLCBfZmxhZ3MsIFwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX29mcywgX2JpdF9pZHgsIF93cml0ZV9lbikNCj4gDQo+IElzIHRoaXMgX05P
X1BBUkVOVCBzdGlsbCB1c2VkID8gaWYgbm90IGRyb3AgaXQNCg0KQWNrLiBXaWxsIGRyb3AuDQoN
CkJlc3QgUmVnYXJkcywNCll1LUNodW4NCj4gDQo+IC0tDQo+IEplcm9tZQ0K
