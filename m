Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2C364EA6;
	Mon,  3 Aug 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751028; cv=none; b=bcT8PtHw+icP0xvIIgKtSQDvs9pZ3Neksw7HpzdcbRKSVchTdFgFwQFojrJlc4KZvkexhOXk1rIaNO1czB6opqP1mtyfpjy9V+aNQuoNkbdIQVkApi1N72z+Ap3dTXNA6cZd3eJwGLG2cAVmhM4zx3JBYHi9mh/tieniKzT4DOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751028; c=relaxed/simple;
	bh=L7lHqJ/Hl5Sm73+oTCqDi4vn8wXD99IJUxH9/6loJzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jKpPm6fJkpID5cGHGS2s0XgNe29OJSHipbsRBsHT1u56vovoQs4I5cgAZpr8q8SHTyfLLy3rX9AtLeJM6666C8mVQDawtB8F7YY7NyIAlFx0Tf6zwD2fD2ylXwgkRYrV6TLzD8d+a3Zwn+upa30AIwS9sIf/LvWO+MTuwfVLdfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=e4LY5R9X; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="e4LY5R9X"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6739u1ohD232142, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785750962; bh=L7lHqJ/Hl5Sm73+oTCqDi4vn8wXD99IJUxH9/6loJzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=e4LY5R9Xvamz7+byx8pe5ih1kqftXm3r3vcjgzHMDV7XOf7F+6Bc57gMs9Wu663Ya
	 Wt0AKinO3uoaLOCsIdFqujrrnhSxSCEVmHXfikJP+a2jG2T/GzkXP8oAPtS0RReLuG
	 KP7lEvDsAv23V+2uX/yKFF8E57RyD1qDTJ1fML4SIyehUt+A3OlDhsPESBjMJvaC49
	 7RytFYq9G0DRWdsEqdWbtPfQD0RZC8sc4fC/bjVuScS8GkWRjvEl3MYSsSiFC97FGY
	 uJQO+Q5ch8yF2cIXv1iV0YVnFf7iwsOmlfyPCjP/p5exTq5P2+2QLkFJGRJBW4+8Db
	 49OMinQTYswzw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6739u1ohD232142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Aug 2026 17:56:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 3 Aug 2026 17:56:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Mon, 3 Aug 2026 17:56:02 +0800
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
Thread-Index: AQHdHp1PRrydlNtj20y7WRFW4A3UiraFxLQAgAGIGQD//+r2AIAE5x2Q
Date: Mon, 3 Aug 2026 09:56:01 +0000
Message-ID: <a216b77c125544c0871b40f31c021ef7@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com> <577a6882b25e457fa94fa199e66f3197@realtek.com>
 <amy47how40BJnHsn@redhat.com>
In-Reply-To: <amy47how40BJnHsn@redhat.com>
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

SGkgQnJpYW4sDQoNCj4gT24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMDg6MTc6NDRBTSArMDAwMCwg
WXUtQ2h1biBMaW4gW+ael+elkOWQm10gd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEp1bCAyOCwgMjAy
NiBhdCAxMDoyODowNFBNICswODAwLCBZdS1DaHVuIExpbiB3cm90ZToNCj4gPiA+ID4gRnJvbTog
Q2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+ID4gPg0KPiA+DQo+ID4gKC4u
LikNCj4gPg0KPiA+ID4gPiArICAgICB7IC8qIHNlbnRpbmVsICovIH0NCj4gPiA+ID4gK307DQo+
ID4gPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBydGQxNjI1X2NydF9tYXRjaCk7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0ZDE2MjVfY3J0
X2RyaXZlciA9IHsNCj4gPiA+ID4gKyAgICAgLnByb2JlID0gcnRkMTYyNV9jcnRfcHJvYmUsDQo+
ID4gPiA+ICsgICAgIC5kcml2ZXIgPSB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAi
cnRrLXJ0ZDE2MjUtY3J0LWNsayIsDQo+ID4gPiA+ICsgICAgICAgICAgICAgLm9mX21hdGNoX3Rh
YmxlID0gcnRkMTYyNV9jcnRfbWF0Y2gsDQo+ID4gPiA+ICsgICAgICAgICAgICAgLnN1cHByZXNz
X2JpbmRfYXR0cnMgPSB0cnVlLA0KPiA+ID4NCj4gPiA+IFRoaXMgZHJpdmVyIGlzIGxpc3RlZCBh
cyBhIHRyaXN0YXRlIGluIHRoZSBLY29uZmlnIGJ1dCB0aGVuIHlvdSBoYXZlDQo+ID4gPiB0aGlz
LiBJcyB0aGUgaW50ZW50aW9uIG9mIHRoaXMgZHJpdmVyIHRvIGJlIGJ1aWx0IGluIG9ubHk/DQo+
ID4gPg0KPiA+DQo+ID4gSSB3aWxsIGNoYW5nZSB0aGUgS2NvbmZpZyBvcHRpb25zIGZvciB0aGlz
IGRyaXZlciwgYXMgd2VsbCBhcyB0aGUNCj4gPiByZWxhdGVkIGNvbmZpZywgZnJvbSB0cmlzdGF0
ZSB0byBib29sLg0KPiANCj4gS2VlcCBpdCBhcyBhIHRyaXN0YXRlIGlmIHlvdSBhcmUgZ29pbmcg
dG8gdXNlIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKS4NCj4gWW91IGNhbiBhbHNvIGRyb3Agc3Vw
cHJlc3NfYmluZF9hdHRycyB1bmxlc3MgeW91IGhhdmUgYSBzcGVjaWZpYyBuZWVkIHdoeS4NCj4g
DQo+IEJyaWFuDQoNCllvdSBhcmUgcmlnaHQuIEtlZXBpbmcgaXQgdHJpc3RhdGUgaXMgYmVuZWZp
Y2lhbCwgZXNwZWNpYWxseSBmb3IgYWxpZ25pbmcNCndpdGggdGhlIEFuZHJvaWQgR0tJIGRlc2ln
bi4NCg0KVG8gcHJvcGVybHkgc3VwcG9ydCBtb2R1bGUgdW5sb2FkaW5nIGFuZCBkcml2ZXIgdW5i
aW5kaW5nLCBJIHdpbGwgYWRkDQp0aGUgLnJlbW92ZSBjYWxsYmFjayBhbmQgZHJvcCBzdXBwcmVz
c19iaW5kX2F0dHJzLg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgdGhvcm91Z2ggcmV2
aWV3IGFuZCBzdWdnZXN0aW9ucyENCg0KQmVzdCByZWdhcmRzLA0KWXUgQ2h1bg0K
