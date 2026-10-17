Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B2E3C9897;
	Sat, 17 Oct 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792228275; cv=none; b=j3OzXQPnAjrPZVi+WrsVxzXDidApq/pY1P/YuJAezevP8Ezhj+rMmo7Qx3uccXtW/43hlCvQ4U+RxE2B6tqPaMkuSZgSNf7aSkVFlFydeqyJlFMo4Wb7hs6pPtIlccnpi17zTGT/j0xyogYeR+lHxguN4ML05ItbZvP4bMqZ52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792228275; c=relaxed/simple;
	bh=LfgRchHlRQeAdTd0SX5cVUflKKL7Nljihx/jYn85Ba8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tHQUem7jMwDgY+QYH7C629IQZ66mU2qynWonj3JjdKXsiNA96uGpcxOwmQiZ3NYuR56g+CC3y7PhVp1gDPJC4gZ+0I1fDfeqGdzUvSlt89AmMdPepfs4yUK4egN7Q6IGJi/uwTuAqN9YJE5gpJJjJWduPSovjhAvJsUhDx67fGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Abh4zKiO; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Abh4zKiO"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H9ATNO0011149, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792228229; bh=LfgRchHlRQeAdTd0SX5cVUflKKL7Nljihx/jYn85Ba8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Abh4zKiO0k2YtyNyKkh/W+vf4vxV7if925DmsYTgx+JPgYvFkjOQJf32DOAqvGZ4k
	 +NysjTt/vR13Cb0JKWQ4Re5vMB/5HDCL+BHSpZSA6SENGemUX9fhQ1crqQOplFNBpO
	 D0maATMITR7tfm2p2vDQ7O0s/iYM6pWy+i7yC7gWqMCuZ9MuWtsDE6nSSdAmfElMWv
	 qJZhXeNfygj4eJixTx+R5MMLqjb8he7nTxweSiZRlaIIr2i+82chVq4yOvnvT5BCvC
	 6LSVWPdkmuelvHOGZLqVX5WjbxCzTSgABqgOPwtBlO2t7aVwBuuEhv2vW4YLcDe1ft
	 DU/tsBN6rlX8Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H9ATNO0011149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 17:10:29 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:10:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:10:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 17:10:29 +0800
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
Subject: RE: [PATCH v15 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Thread-Topic: [PATCH v15 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Thread-Index: AQHdUkG6u/r2V0yIkUqBUlG0HylGb7b1DaWAgAx8c1A=
Date: Sat, 17 Oct 2026 09:10:29 +0000
Message-ID: <cda5b6f190ab4ad6adcff57e4811fcf7@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-11-eleanor.lin@realtek.com>
 <179157057525.266328.2342228871690409432.b4-review@b4>
In-Reply-To: <179157057525.266328.2342228871690409432.b4-review@b4>
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

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyBSVEtfQ0xLX1JFR01BUF9HQVRFKGNsa19lbl91c2Jf
cDQsICJjbGtfc3lzIiwgMCwgMHg4YywgMCwgMCk7DQo+ID4gK3N0YXRpYyBSVEtfQ0xLX1JFR01B
UF9HQVRFKGNsa19lbl91c2JfcDMsICJjbGtfc3lzIiwgMCwgMHg4YywgMSwgMCk7DQo+ID4gK3N0
YXRpYyBSVEtfQ0xLX1JFR01BUF9HQVRFKGNsa19lbl9taXNjX2NlYzAsICJjbGtfZW5fbWlzYyIs
IDAsIDB4OGMsDQo+ID4gKzIsIDApOyBzdGF0aWMgUlRLX0NMS19SRUdNQVBfR0FURShjbGtfZW5f
Y2J1c3J4X3N5cywgImNsa19zeXMiLCAwLA0KPiA+ICsweDhjLCAzLCAwKTsgc3RhdGljIFJUS19D
TEtfUkVHTUFQX0dBVEUoY2xrX2VuX2NidXN0eF9zeXMsICJjbGtfc3lzIiwNCj4gPiArMCwgMHg4
YywgNCwgMCk7IHN0YXRpYyBSVEtfQ0xLX1JFR01BUF9HQVRFKGNsa19lbl9jYnVzX3N5cywNCj4g
PiArImNsa19zeXMiLCAwLCAweDhjLCA1LCAwKTsgc3RhdGljDQo+ID4gK1JUS19DTEtfUkVHTUFQ
X0dBVEUoY2xrX2VuX2NidXNfb3NjLCAib3NjMjdtIiwgMCwgMHg4YywgNiwgMCk7DQo+IA0KPiBZ
b3UgYXJlIHJlcXVlc3RpbmcgeW91ciBpbnB1dCBieSBnbG9iYWwgaGVyZS4gVGhpcyBpcyB3cm9u
Zy4NCj4gRFQgbmFtZXMgYXJlIHN0YWJsZSwgaW50ZXJuYWwgQ0NGIGFyZSBub3QuIFlvdSBzaG91
bGQgbm90IHJlbHkgb24gdGhpcy4NCj4gDQo+IEVpdGhlciBnaXZlIGl0IGEgbmFtZSBpbiB5b3Vy
IGJpbmRpbmdzIGFuZCB1c2UgZndfbmFtZSBvciB1c2UgaW5kZXgNCj4gDQo+IFNhbWUgYXBwbGll
cyB0byB0aGUgb3RoZXIgY29udHJvbGxlcg0KPiANCg0KQWdyZWVkLg0KDQpXZSB3aWxsIGFkZCBh
ICdjbG9jay1uYW1lcycgcHJvcGVydHkgaW4gdGhlIGR0LWJpbmRpbmdzIGZvciBleHRlcm5hbCBp
bnB1dCBjbG9ja3MuDQoNCkFuZCB3aWxsIHVzZSAnUlRLX0NMS19SRUdNQVBfR0FURV9GV19OQU1F
KCknLCB3aGljaCB1c2VzDQonQ0xLX0hXX0lOSVRfRldfTkFNRSgpJyB0byBzZXQgJy5md19uYW1l
JyBmb3IgdGhlc2UgZXh0ZXJuYWwgaW5wdXQgY2xvY2tzLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1D
aHVuDQoNCj4gLS0NCj4gSmVyb21lDQo=
