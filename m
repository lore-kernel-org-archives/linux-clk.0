Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D936F8F2;
	Wed, 30 Sep 2026 06:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749119; cv=none; b=O0/INa2xC/WzHmrKQTp37acaqoiPmMFxo2Vbh9b2m2XQjiq6S2S93Dh/k38WpUsGrAZIANf9bnoD7mo7GKmxH107BWNCnpe7u2O4r8mQXuR+JZtYEUC70EKVUzaZUea9KG5qmWGyTZPLgF5DkQfqvQ7ambm3al17EJcpL/R3OdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749119; c=relaxed/simple;
	bh=UVb8zD/5g9nDmZkg6J7LWWN8Az4TsZOGJJHRP7lPS3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gZuQPbzhJGnFE/YpSY+0LB6HiSTmCexvBAN/SZdxLqtUOFz3aj40hN+70ZESOYdJBK2QNBjpR0wFCQxXJ1Fag6bgSWTCDd5zaFTNHApep7hwFjpEqAGBpcLCTB6hf7ri244C4jBUNUFcQJOpn0FjeU8JgMArlifYquPK3xjpfes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=fqjBB3Oe; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="fqjBB3Oe"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68U6HfAI21871059, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790749061; bh=UVb8zD/5g9nDmZkg6J7LWWN8Az4TsZOGJJHRP7lPS3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fqjBB3OemeU7gm5EiQ6s42L/u3FVSDdho0InToK+cB5kmbG7/x/WnawfGupGG3nYN
	 gQVg7Wu/qYSnZudoIw1CDYtB87IOVZVEuzP6+9TP0I5z0JzOmR94hLH+FdxPmJcNeJ
	 8J3rRhHyy0JOyLS+J0ms8Gf+x91HyT5TarOIjkS2QcZmiJvxP9YIqOBnb8+yziiPPi
	 HEVElD9FwBr19hS19rzLgoXL00RgpxastjmYoV9RIzJB13QfErAky5bFXcV5Cklp3A
	 9EKy9KrsiYSRakJKLws3phPqgs/mIeh/Vd4pvEzNQ6Kb3nk6Y3VjS2rmbBELyPWI5r
	 PWOvCPcAipO7g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68U6HfAI21871059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Sep 2026 14:17:41 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 14:17:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 14:17:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 30 Sep 2026 14:17:40 +0800
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
Subject: RE: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdOeMAtkU9yq5qUkW8LZXsVLtozbbPKxAAgAyd7PCAAtmagIAIL/4w
Date: Wed, 30 Sep 2026 06:17:40 +0000
Message-ID: <0288fc6490dd4bd4abb0773ad4b5e8d2@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-10-eleanor.lin@realtek.com>
 <178947735404.448573.10061486937030065064.b4-reply@b4>
 <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
 <1jjyo98zh4.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jjyo98zh4.fsf@starbuckisacylon.baylibre.com>
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

PiA+IEhpIEplcm9tZSwNCj4gPg0KPiA+PiA+ICsNCj4gPj4gPiArc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdCBjbGtfZ3B1X3BhcmVudHNbXSA9IHsicGxsX2dwdSIsDQo+ID4+ID4gKyJjbGtfc3lz
In07IHN0YXRpYyBSVEtfQ0xLX1JFR01BUF9NVVgoY2xrX2dwdSwgY2xrX2dwdV9wYXJlbnRzLA0K
PiA+PiBDTEtfU0VUX1JBVEVfUEFSRU5UIHwgQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5ULA0KPiA+
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4MjgsIDEyLCAweDEpOyBzdGF0aWMgY29uc3Qg
Y2hhciAqIGNvbnN0DQo+ID4+ID4gK2Nsa192ZV9wYXJlbnRzW10gPSB7InBsbF92byIsICJjbGtf
c3lzaCIsICJwbGxfdmUxIiwgInBsbF92ZTIifTsNCj4gPj4gPiArc3RhdGljIFJUS19DTEtfUkVH
TUFQX01VWChjbGtfdmUxLCBjbGtfdmVfcGFyZW50cywNCj4gPj4gQ0xLX1NFVF9SQVRFX1BBUkVO
VCB8IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCwNCj4gPj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAweDRjLCAwLCAweDMpOyBzdGF0aWMNCj4gPj4gPiArUlRLX0NMS19SRUdNQVBfTVVYKGNs
a192ZTIsIGNsa192ZV9wYXJlbnRzLA0KPiBDTEtfU0VUX1JBVEVfUEFSRU5UIHwNCj4gPj4gQ0xL
X1NFVF9SQVRFX05PX1JFUEFSRU5ULA0KPiA+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4
NGMsIDMsIDB4Myk7IHN0YXRpYw0KPiA+PiA+ICtSVEtfQ0xLX1JFR01BUF9NVVgoY2xrX3ZlNCwg
Y2xrX3ZlX3BhcmVudHMsDQo+IENMS19TRVRfUkFURV9QQVJFTlQgfA0KPiA+PiBDTEtfU0VUX1JB
VEVfTk9fUkVQQVJFTlQsDQo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgMHg0YywgNiwg
MHgzKTsgc3RhdGljDQo+ID4+ID4gK1JUS19DTEtfUkVHTUFQX0dBVEVfTk9fUEFSRU5UKGNsa19l
bl9taXNjLCBDTEtfSVNfQ1JJVElDQUwsDQo+IDB4NTAsDQo+ID4+IDAsDQo+ID4+ID4gKzEpOyBj
bGtfZW5fcGNpZTAsIDAsIDB4NTAsIDIsDQo+ID4+ID4gKzEpOyBjbGtfZW5fZ3NwaSwgMCwgMHg1
MCwgNiwgMSk7DQo+ID4+ID4gK2Nsa19lbl9pc29fbWlzYywgMCwgMHg1MCwgMTAsDQo+ID4+ID4g
KzEpOyBjbGtfZW5fc2RzLCAwLCAweDUwLCAxMiwgMSk7DQo+ID4+ID4gK2Nsa19lbl9oZG1pLCAw
LCAweDUwLCAxNCwgMSk7DQo+ID4+DQo+ID4+IFRoaXMgaXMgYSBsb3Qgb2YgY2xvY2sgd2l0aCBu
byBwYXJlbnRzIHdoaWNoIGlzIGEgYml0IHN1c3BpY2lvdXMNCj4gPj4gZXNwZWNpYWxseSBmb3Ig
Z2F0ZXMuDQo+ID4+IFdoYXQgaXMgcmVhbGx5IGZlZWRpbmcgdGhvc2UgPw0KPiA+Pg0KPiA+DQo+
ID4gSW4gdjE1LCB3ZSB3aWxsIGRvIG91ciBiZXN0IHRvIHJlZHVjZSB0aGUgbnVtYmVyIG9mIGdh
dGUgY2xvY2tzIHdpdGhvdXQgYQ0KPiBwYXJlbnQuDQo+ID4NCj4gPiBIb3dldmVyLCBhZnRlciBk
aXNjdXNzaW5nIHdpdGggb3VyIGNvbGxlYWd1ZSwgd2UgY29uZmlybWVkIHRoYXQgZm9yDQo+ID4g
c29tZSBvZiB0aGVzZSBOT19QQVJFTlQgZ2F0ZSBjbG9ja3MsIHRoZWlyIGFjdHVhbCB1cHN0cmVh
bSBjbG9ja3MNCj4gPiAobGlrZSBQTExzIGFuZA0KPiA+IE11eGVzKSBhcmUgbG9jYXRlZCBpbiBz
ZXBhcmF0ZSwgaW5kZXBlbmRlbnQgaGFyZHdhcmUgc3Vic3lzdGVtcy4gVGhlDQo+ID4gcmVnaXN0
ZXJzIGNvbnRyb2xsaW5nIHRob3NlIHVwc3RyZWFtIGNsb2NrcyBhcmUgcGh5c2ljYWxseQ0KPiA+
IGluYWNjZXNzaWJsZSBmcm9tIHRoZSBMaW51eCBDUFUgZG9tYWluLg0KPiANCj4gQ29udHJvbCBh
bmQgaW5wdXQgYXJlIGRpZmZlcmVudCB0aGluZ3MuIEl0IGZlZWxzIGxpa2UgeW91ciBEVCAoYmlu
ZGluZykgZGVzY3JpcHRpb24NCj4gaXMgbm90IGNvbXBsZXRlIGFzIGl0IHN0YW5kcyB3aGljaCB3
aWxsIGV2ZW50dWFsbHkgYmUgYSBwcm9ibGVtLg0KPiANCj4gQSBjbG9jayB3aXRoIG5vIGlucHV0
IGlzIHNvbWV0aGluZyB0aGF0IGRvZXMgZ2VuZXJhdGUgdGhlIGNsb2NrIGJ5IGl0c2VsZiwgbGlr
ZSBhbg0KPiBvc2NpYWxsYXRvci4gUHJldGVuZGluZyBpdCBoYXMgbm8gcGFyZW50IGJlY2F1c2Ug
eW91IGRvbid0IGtub3cgaG93IGRlc2NyaWJlIGl0DQo+IHlldCBpcyB3cm9uZy4NCj4gDQoNClRo
YW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbi4NCg0KSW4gdjE1LCB0aGVyZSB3aWxsIGJlIG5vIG1v
cmUgTk9fUEFSRU5UIGZvciBnYXRlcy4gRm9yIGV4YW1wbGUsDQptaXBpX2NzaSAtPiBjbGtfc3lz
aCwgYW5kIGFsbCBvdGhlciBnYXRlcyAtPiBjbGtfc3lzLg0KDQpBZGRpdGlvbmFsbHksIHdlIHdp
bGwgcHJvcGVybHkgbW9kZWwgdGhlIGZpcm13YXJlLW1hbmFnZWQgUExMcyBiYWNrZWQgYnkNCnJl
YWwgaGFyZHdhcmUgcmVnaXN0ZXJzLiBXZSB3aWxsIHJlcGxhY2UgdGhlIGZpeGVkIDM1MSBNSHog
cGxsX3ZvZG1hIHdpdGgNCmEgcmVhZC1vbmx5IE1OTyBQTEwuDQoNClRoaXMgYWxsb3dzIHRoZSBD
Q0YgdG8gY29ycmVjdGx5IGRlcml2ZSB0aGUgZnJlcXVlbmN5IGZyb20gdGhlIHJlZ2lzdGVyDQoo
ZS5nLiwgd2hlbiBhY3RpbmcgYXMgYSBwYXJlbnQgZm9yIG11eGVzKSwgd2hpbGUgZ3VhcmFudGVl
aW5nIHRoZSBrZXJuZWwNCndpbGwgbmV2ZXIgcmVwcm9ncmFtIG9yIGRpc2FibGUgdGhlIGJvb3Qg
Y29kZSdzIHNldHRpbmdzLg0KDQpCZXN0IHJlZ2FyZHMsDQpZdS1DaHVuDQoNCg0K
