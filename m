Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62D46AF0A;
	Thu, 13 Aug 2026 12:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624128; cv=none; b=XTiPJIN8tal2OYbo3HGAoqixDi8DJYmkuVpyi/YPCDYMDZhyX11FcCbCma5cOFYSORCLfhqS9+KX6cGJEnkUkuNs9XPEa2eVa97REM/Xz1E3Pu3NDGqO490uVQEGpiEGdooSRGPK4TMNSlp9c2Cd2YrWs+vw2i0/H7uu306nxuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624128; c=relaxed/simple;
	bh=7/hIs90LN+YWZ2QTLOrkIPhW7uPAG/CbhH++hkokYbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZiybukncnLI/MDd0YbFzcE0CnzCkRz1kCARVkR6NTs5irR6tAdIBkbWe2YO/Sz/MqGl8d1iLmJPwb8IxoAbHFlEG5kNp6anieMXR7Kcnq5Gc2LAnRsfgdlJ9i3ZGXB1NpBpBJEZdEns5I537V6jarNqXySsNAVwBTbVxRTUdFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=EsUZY+l9; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="EsUZY+l9"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67DCRe0aA324590, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786624060; bh=7/hIs90LN+YWZ2QTLOrkIPhW7uPAG/CbhH++hkokYbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EsUZY+l9fWmfr20KpP8slDU8xItkZMuoTn7c0eSjaSZUqeJ4xeBHHRkm+tZSia56/
	 u2ewTDRZtCUrLlkX2cXQqgR2TDblh+1Y4lOtLxxV0ls22RCFBYchP74p5+wIGl9pwj
	 T9WUCSaYhLJIoZR9zeOKwwCgKn0srK5oo3I/pn8eZagQg8bpOC0EL+MSCqXCdjqdD9
	 KWT+o1KWlGPCQ9n7mcoRlyeq9+4dPX5WNFjD1BXUSNMFXK/zb9+HsuR4j1/AF5VdF3
	 JrhpuGUfrpPdYyXinT3NiwZDitFGfk/au+s1f7lHDZPmJ1ZObKKXo+NjUEI6EppYY1
	 9D2ZiKw7kCvnA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67DCRe0aA324590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Aug 2026 20:27:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 13 Aug 2026 20:27:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Thu, 13 Aug 2026 20:27:40 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
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
Subject: RE: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Thread-Topic: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock
 & Reset Controller
Thread-Index: AQHdKf6sqK1LXpXPjkadMFMzDtoXkraZlK4AgACT8SD//3zlAIAAjtXw//+jrwCAAhGm4A==
Date: Thu, 13 Aug 2026 12:27:40 +0000
Message-ID: <2c6ddfeba0074866b4bd2d4276ec4508@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
 <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
 <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
 <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
 <e5a838f3-609e-48b9-aca6-a25fe5453cd8@oss.qualcomm.com>
In-Reply-To: <e5a838f3-609e-48b9-aca6-a25fe5453cd8@oss.qualcomm.com>
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

PiBPbiAxMi8wOC8yMDI2IDEyOjIyLCBZdS1DaHVuIExpbiBb5p6X56WQ5ZCbXSB3cm90ZToNCj4g
Pj4gT24gMTIvMDgvMjAyNiAxMTo0MSwgWXUtQ2h1biBMaW4gW+ael+elkOWQm10gd3JvdGU6DQo+
ID4+PiBIaSBLcnp5c3p0b2YsDQo+ID4+Pg0KPiA+Pj4+IE9uIDEyLzA4LzIwMjYgMDM6NTksIFl1
LUNodW4gTGluIHdyb3RlOg0KPiA+Pj4+PiBBZGQgRFQgYmluZGluZyBzY2hlbWEgZm9yIFJlYWx0
ZWsgUlREMTYyNSBjbG9jayBhbmQgcmVzZXQNCj4gPj4+Pj4gY29udHJvbGxlcg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+Pj4+PiA8a3J6eXN6
dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiA+Pj4+DQo+ID4+Pj4gSG93IG15IHRh
ZyBjb3VsZCBhcHBlYXIgaGVyZT8NCj4gPj4+Pg0KPiA+Pj4+IExvb2s6DQo+ID4+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDMyNDAyNTMzMi4zNDE2OTc3LTItZWxlYW5vci5s
aW5Acg0KPiA+Pj4+IGVhDQo+ID4+Pj4gbHRlay5jDQo+ID4+Pj4gb20vDQo+ID4+Pj4NCj4gPj4+
Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+
ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IENoZW5nLVl1IExlZSA8Y3lsZWUxMkByZWFsdGVrLmNvbT4N
Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsu
Y29tPg0KPiA+Pj4+DQo+ID4+Pj4gV2hvIGFkZGVkIG15IHRhZz8gV2hhdCBpcyB0aGUgYWN0dWFs
IGZsb3cgb2YgdGhpcyBwYXRjaD8NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IFlvdSBnYXZlIHlvdXIg
UmV2aWV3ZWQtYnkgdGFnIGluIHY1LiBIb3dldmVyLCBhZnRlciB0aGF0LCBTdGVwaG9uDQo+ID4+
PiBwcm92aWRlZCBhZGRpdGlvbmFsIGZlZWRiYWNrLiBJbiB2NiwgSSBtb2RpZmllZCB0aGUgcGF0
Y2ggYmFzZWQgb24NCj4gPj4+IFN0ZXBob24ncyBjb21tZW50cyBhbmQgbWFkZSBzb21lIG90aGVy
IGNoYW5nZXMuIEZ1cnRoZXJtb3JlLCBJIGFkZGVkDQo+ID4+PiB0aGUgY2xvY2sgSUQNCj4gPj4+
IDE0NCBpbiB2MTEuDQo+ID4+DQo+ID4+IFNvIGhvdyBteSB0YWcgY291bGQgYXBwZWFyIGJlZm9y
ZSBDaGVuZy1ZdSBMZWUgc2lnbmVkIG9mZiB0aGUgcGF0Y2g/DQo+ID4+DQo+ID4NCj4gPiBBaCwg
SSByZWFkIHRoZSBydWxlcyBzdGF0aW5nIHRoYXQgInRoZSBsYXN0IFNpZ25lZC1vZmYtYnk6IG11
c3QgYWx3YXlzDQo+ID4gYmUgdGhhdCBvZiB0aGUgZGV2ZWxvcGVyIHN1Ym1pdHRpbmcgdGhlIHBh
dGNoIi4NCj4gDQo+IFRoaXMgaXMgY29ycmVjdCBpbnRlcnByZXRhdGlvbiAoYWx0aG91Z2ggc29t
ZSBzdWJzeXN0ZW1zIHdpbGwgaW50ZXJwcmV0IGFib3ZlDQo+IG9ubHkgaW4gcmVzcGVjdCBvZiBv
dGhlciBTb0JzKS4NCj4gDQo+ID4NCj4gPiBJIG1pc3Rha2VubHkgdGhvdWdodCBteSBTaWduZWQt
b2ZmLWJ5IGhhZCB0byBiZSB0aGUgYWJzb2x1dGUgbGFzdCBsaW5lDQo+ID4gb2YNCj4gDQo+IFRo
aXMgaXMgY29ycmVjdC4NCj4gDQo+ID4gdGhlIGVudGlyZSBjb21taXQgbWVzc2FnZS4gVGhlcmVm
b3JlLCB3aGVuIEkgaW5zZXJ0ZWQgeW91ciB0YWcgYXQgdGhlDQo+ID4gdG9wIG9mIHRoZSB0YWcg
YmxvY2suDQo+IA0KPiBUaGlzIGlzIG9kZCByZXN1bHQgb2YgZWFybGllciBsb2dpYy4gSWYgeW91
ciBTb0IgaGFzIHRvIGJlIHRoZSBsYXN0LCB0aGVuIG9idmlvdXMNCj4gY2hvaWNlIGlzIHRvIHB1
dCB0aGUgUmV2aWV3ZWQtYnkgdGFnIEJFRk9SRSB5b3VyIFNvQi4NCj4gDQo+IEFuZCBpbiBhbnkg
Y2FzZSB5b3Ugc2hvdWxkIHVzZSBiNCBzaW5jZSBpdCB3b3VsZCBkbyB0aGUgY29ycmVjdCB0aGlu
Zy4NCj4gQWxsIHBhdGNoIHN1Ym1pc3Npb25zIGFyZSBzdXBwb3NlZCB0byB1c2UgYjQsIHNvIHlv
dSBkb24ndCBtYWtlIHRyaXZpYWwNCj4gcHJvY2VzcyBtaXN0YWtlcy4NCj4gDQoNClRoYW5rIHlv
dSBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJJ2xsIGxlYXJuIGhvdyB0byB1c2UgYjQuDQoNCkp1c3Qg
dG8gYmUgc3VyZSBJIGdldCBpdCByaWdodDogc2hvdWxkIEkga2VlcCB5b3VyIHRhZyBhbmQgbW92
ZSBpdCBiZXR3ZWVuDQpteSBDby1kZXZlbG9wZWQtYnkgYW5kIFNpZ25lZC1vZmYtYnksIG9yIHNo
b3VsZCBJIGRyb3AgaXQ/DQoNCkFsc28sIHRvIG1ha2Ugc3VyZSBJIGZvbGxvdyB0aGUgY29ycmVj
dCBwcm9jZXNzIGFuZCB1bmRlcnN0YW5kIHRoZSBjbG9jaw0KbWFpbnRhaW5lcidzIHByZWZlcmVu
Y2U6IFNob3VsZCBJIHNlbmQgYSB2MTQgdG8gZml4IHRoZSB0YWcsIG9yIGlzIGl0DQpwb3NzaWJs
ZSBmb3IgdGhlIGNsb2NrIG1haW50YWluZXIgdG8gaGVscCBhbWVuZCB0aGlzIGlmIHRoZXJlIGFy
ZSBubyBvdGhlcg0KY2hhbmdlcz8NCg0KQmVzdCByZWdhcmRzLA0KWXUtQ2h1bg0KDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
