Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFAA26FA60;
	Tue,  4 Aug 2026 02:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785811878; cv=none; b=rM8NePNFme2UHK/JZW5eRxKD5I88d64NkpE1E3H6s85iBHOGUa7oA7uTWRj2/sFag1gzEVVamA4jYjiJ9a0BjGF5MpZFfd8E5bIUHJnwpn9y4dG1oXI8gfGvjSOgcY1ykg+vwGQBqPHMHtBnOd0mYvwlCYLXfBjJZasmUNFJppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785811878; c=relaxed/simple;
	bh=Glc6UAfiJxXWX4rTJSzOsAmV3soZFnJEPo2fZl86Gno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l1yUnIUUuxVctECe9na1Tr7H09Nn9E9DlXvEkM4vi8LSz1kXCkRDbAlnAKVcLHO04Y9ypV3ZZ2thYogfYxo6D3ey/fWqjZrluMSdv+aoHQSt5jd/4KtkDGSTD62BZAbWNQ2+ropyL1O+ZgoEBSGvZ7KZm5rCNLpPAfnZ5S1Y0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Plg9a3Tt; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Plg9a3Tt"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6742o8dhD753734, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785811808; bh=Glc6UAfiJxXWX4rTJSzOsAmV3soZFnJEPo2fZl86Gno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Plg9a3TtLhXCfHcQCSCV4Y09eFPDP+DjvmRM8fYh3DyF8ooRXLO32RKf3WtKQVogQ
	 HlQq3VDzchtYo3Z5quJIg0kfdoUO+Q35OaSGqlv3KurwnE5C4WodJZF93n4s8Qyin0
	 RAxpCtdtGuB74mBnGuyfdb4+62ED+peb5tYTmOyVMziGaZLPoptJJdAAEVEHlOnMIY
	 oVFddF9ZXnm0AxsZpVzrk7lhxggKdh+SCDxbf5MJVuVILKik4gdY4D5A8cTRE9bThV
	 vZd8F+fAbmnNEd6M+0mkHEggQdFlzkmQhPk/9q6GfrOAlMJaoCrlVZzbCTRVXu3sUc
	 L6UNEPokuWB0w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6742o8dhD753734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Aug 2026 10:50:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Aug 2026 10:50:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Tue, 4 Aug 2026 10:50:08 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdHp1PRrydlNtj20y7WRFW4A3UiraFxLQAgAGIGQD//+r2AIAE5x2Q//+uAACAAWyoQA==
Date: Tue, 4 Aug 2026 02:50:08 +0000
Message-ID: <be6d1e827cba4a779757b81ce084c108@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com> <577a6882b25e457fa94fa199e66f3197@realtek.com>
 <amy47how40BJnHsn@redhat.com> <a216b77c125544c0871b40f31c021ef7@realtek.com>
 <anCRAqhQ93QAihsS@redhat.com>
In-Reply-To: <anCRAqhQ93QAihsS@redhat.com>
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

PiBPbiBNb24sIEF1ZyAwMywgMjAyNiBhdCAwOTo1NjowMUFNICswMDAwLCBZdS1DaHVuIExpbiBb
5p6X56WQ5ZCbXSB3cm90ZToNCj4gPiA+IE9uIEZyaSwgSnVsIDMxLCAyMDI2IGF0IDA4OjE3OjQ0
QU0gKzAwMDAsIFl1LUNodW4gTGluIFvmnpfnpZDlkJtdIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1
ZSwgSnVsIDI4LCAyMDI2IGF0IDEwOjI4OjA0UE0gKzA4MDAsIFl1LUNodW4gTGluIHdyb3RlOg0K
PiA+ID4gPiA+ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gKC4uLikNCj4gPiA+ID4NCj4gPiA+ID4gPiA+ICsg
ICAgIHsgLyogc2VudGluZWwgKi8gfQ0KPiA+ID4gPiA+ID4gK307DQo+ID4gPiA+ID4gPiArTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgcnRkMTYyNV9jcnRfbWF0Y2gpOw0KPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0ZDE2MjVfY3J0X2Ry
aXZlciA9IHsNCj4gPiA+ID4gPiA+ICsgICAgIC5wcm9iZSA9IHJ0ZDE2MjVfY3J0X3Byb2JlLA0K
PiA+ID4gPiA+ID4gKyAgICAgLmRyaXZlciA9IHsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
Lm5hbWUgPSAicnRrLXJ0ZDE2MjUtY3J0LWNsayIsDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAg
IC5vZl9tYXRjaF90YWJsZSA9IHJ0ZDE2MjVfY3J0X21hdGNoLA0KPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUsDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBUaGlzIGRyaXZlciBpcyBsaXN0ZWQgYXMgYSB0cmlzdGF0ZSBpbiB0aGUgS2NvbmZpZyBidXQg
dGhlbiB5b3UNCj4gPiA+ID4gPiBoYXZlIHRoaXMuIElzIHRoZSBpbnRlbnRpb24gb2YgdGhpcyBk
cml2ZXIgdG8gYmUgYnVpbHQgaW4gb25seT8NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJ
IHdpbGwgY2hhbmdlIHRoZSBLY29uZmlnIG9wdGlvbnMgZm9yIHRoaXMgZHJpdmVyLCBhcyB3ZWxs
IGFzIHRoZQ0KPiA+ID4gPiByZWxhdGVkIGNvbmZpZywgZnJvbSB0cmlzdGF0ZSB0byBib29sLg0K
PiA+ID4NCj4gPiA+IEtlZXAgaXQgYXMgYSB0cmlzdGF0ZSBpZiB5b3UgYXJlIGdvaW5nIHRvIHVz
ZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkuDQo+ID4gPiBZb3UgY2FuIGFsc28gZHJvcCBzdXBw
cmVzc19iaW5kX2F0dHJzIHVubGVzcyB5b3UgaGF2ZSBhIHNwZWNpZmljIG5lZWQgd2h5Lg0KPiA+
ID4NCj4gPiA+IEJyaWFuDQo+ID4NCj4gPiBZb3UgYXJlIHJpZ2h0LiBLZWVwaW5nIGl0IHRyaXN0
YXRlIGlzIGJlbmVmaWNpYWwsIGVzcGVjaWFsbHkgZm9yDQo+ID4gYWxpZ25pbmcgd2l0aCB0aGUg
QW5kcm9pZCBHS0kgZGVzaWduLg0KPiA+DQo+ID4gVG8gcHJvcGVybHkgc3VwcG9ydCBtb2R1bGUg
dW5sb2FkaW5nIGFuZCBkcml2ZXIgdW5iaW5kaW5nLCBJIHdpbGwgYWRkDQo+ID4gdGhlIC5yZW1v
dmUgY2FsbGJhY2sgYW5kIGRyb3Agc3VwcHJlc3NfYmluZF9hdHRycy4NCj4gDQo+IElmIHlvdSBh
cmUgYWJsZSB0byB1c2UgYWxsIGRldm1fKigpIEFQSXMsIHRoZW4geW91IHNob3VsZG4ndCBuZWVk
IGEgcmVtb3ZlDQo+IGNhbGxiYWNrLg0KPiANCg0KVGhlIHJlYXNvbiBJIHBsYW5uZWQgdG8gYWRk
IGEgLnJlbW92ZSBjYWxsYmFjayBpcyBub3QgdG8gZnJlZSBtZW1vcnkgb3INCnVucmVnaXN0ZXIg
Y2xvY2tzLCBidXQgdG8gY2xlYXIgdGhlIHJlZ21hcCBwb2ludGVycy4NCg0KSSB3YW50IHRvIHNl
dCBkZXNjLT5jbGtzW2ldLT5yZWdtYXAgPSBOVUxMOyBpbiAucmVtb3ZlIGNhbGxiYWNrLg0KDQpC
ZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4gQnJpYW4NCj4gDQoNCg==
