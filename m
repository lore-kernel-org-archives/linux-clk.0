Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF83128D7;
	Fri, 31 Jul 2026 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485904; cv=none; b=FZQC+TWtIlfuqJmKPX/acss+DYcd4P2lmnki2D++MkG8tFM/JCMcqdwmngtTDa7c85Zz45Phb+OyxYDufBnXhaKvXI64DCWlS+AFkKD348g/wHumciokyyTr1L+JAjfayDumjRh1fZ58qHT3WpsejdoOHJ1pgAnWyn7jjf+DLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485904; c=relaxed/simple;
	bh=TDq/39NYkCTEKLDC0hjx3kVLjkZNdyDTk8aSX84/Fus=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MFBggHJgLBDxphDLmAypRDdb3vcQMtBJDFuD1eh6wc0ts46OXi1RpqYXAFNzdZ4b2qbBg7qVauzAPee4JmOMxbtGRTNbyQP0RSCNufDl3xgyaq2+p5HRAUjwPK+xw19AZVOQAqi9Euwfbafurqf7k9K6jC8u8DdLqeFnxBiRYhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=O0820tfM; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="O0820tfM"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66V8HinX61760576, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785485864; bh=TDq/39NYkCTEKLDC0hjx3kVLjkZNdyDTk8aSX84/Fus=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=O0820tfMFtLGtMVH2gspHi/gE2vBsFsDePTWWP3QC0T+90Op/yr8ivbWqxYykG4mu
	 +NneuSni+j5gvzuIKXg243fCyBuhaPjbX9u5ghBZgzNizNYIo1ylDoBiArCmQwcdNR
	 haRh0aU2noHbZpyNquXuWxeDg/o2KQy0NasDyPUfIrBhh5oWQk6MKjRjabSzY3OtBH
	 tvxAt1otXtcV+D3w/sTyQx0DUwN7IjSFkPp6TNgpye6hHitmMONPnqNutx1a6RBZJK
	 CSETjwwry9CxsOeFmJOhaE77TDszueHyanm8uWrM80i5ycbf1LTT7aJ2woNG3x5ua1
	 GcpqsE3+u6y8Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66V8HinX61760576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jul 2026 16:17:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Jul 2026 16:17:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 31 Jul 2026 16:17:44 +0800
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
Subject: RE: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdHp1PRrydlNtj20y7WRFW4A3UiraFxLQAgAGIGQA=
Date: Fri, 31 Jul 2026 08:17:44 +0000
Message-ID: <577a6882b25e457fa94fa199e66f3197@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com>
In-Reply-To: <amuBqi43ce9bYbir@redhat.com>
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

SGkgQnJpYW4sDQoNCj4gSGkgWXUtQ2h1biwNCj4gDQo+IE9uIFR1ZSwgSnVsIDI4LCAyMDI2IGF0
IDEwOjI4OjA0UE0gKzA4MDAsIFl1LUNodW4gTGluIHdyb3RlOg0KPiA+IEZyb206IENoZW5nLVl1
IExlZSA8Y3lsZWUxMkByZWFsdGVrLmNvbT4NCj4gPg0KDQooLi4uKQ0KDQo+ID4gKw0KPiA+ICtz
dGF0aWMgaW50IHJ0ZDE2MjVfY3J0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
IHsNCj4gPiArICAgICBjb25zdCBzdHJ1Y3QgcnRrX2Nsa19kZXNjICpkZXNjOw0KPiA+ICsNCj4g
PiArICAgICBkZXNjID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiAN
Cj4gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgaXMgZGVwcmVjYXRlZC4gVXNlDQo+IGRldmlj
ZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KSBpbnN0ZWFkLiBZb3Ugc2hvdWxkIGJlIGFibGUg
dG8gZHJvcCB0aGUNCj4gbGludXgvb2ZfZGV2aWNlLmggaW5jbHVkZSBhdCB0aGUgdG9wLg0KPiAN
Cg0KQWNrLg0KDQo+IA0KPiA+ICsgICAgIGlmICghZGVzYykNCj4gPiArICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gcnRrX2Nsa19wcm9iZShwZGV2
LCBkZXNjKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
cnRkMTYyNV9jcnRfbWF0Y2hbXSA9IHsNCj4gPiArICAgICB7LmNvbXBhdGlibGUgPSAicmVhbHRl
ayxydGQxNjI1LWNydC1jbGsiLCAuZGF0YSA9DQo+ID4gKyZydGQxNjI1X2NydF9kZXNjLH0sDQo+
IA0KPiBBZGQgYSBzcGFjZSBhZnRlciB0aGUgeyBhbmQgYmVmb3JlIHRoZSBlbmRpbmcgfS4NCj4g
DQoNCkFjay4NCg0KPiA+ICsgICAgIHsgLyogc2VudGluZWwgKi8gfQ0KPiA+ICt9Ow0KPiA+ICtN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBydGQxNjI1X2NydF9tYXRjaCk7DQo+ID4gKw0KPiA+ICtz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBydGQxNjI1X2NydF9kcml2ZXIgPSB7DQo+ID4g
KyAgICAgLnByb2JlID0gcnRkMTYyNV9jcnRfcHJvYmUsDQo+ID4gKyAgICAgLmRyaXZlciA9IHsN
Cj4gPiArICAgICAgICAgICAgIC5uYW1lID0gInJ0ay1ydGQxNjI1LWNydC1jbGsiLA0KPiA+ICsg
ICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gcnRkMTYyNV9jcnRfbWF0Y2gsDQo+ID4gKyAg
ICAgICAgICAgICAuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUsDQo+IA0KPiBUaGlzIGRyaXZl
ciBpcyBsaXN0ZWQgYXMgYSB0cmlzdGF0ZSBpbiB0aGUgS2NvbmZpZyBidXQgdGhlbiB5b3UgaGF2
ZSB0aGlzLiBJcyB0aGUNCj4gaW50ZW50aW9uIG9mIHRoaXMgZHJpdmVyIHRvIGJlIGJ1aWx0IGlu
IG9ubHk/DQo+IA0KDQpJIHdpbGwgY2hhbmdlIHRoZSBLY29uZmlnIG9wdGlvbnMgZm9yIHRoaXMg
ZHJpdmVyLCBhcyB3ZWxsIGFzIHRoZSByZWxhdGVkDQpjb25maWcsIGZyb20gdHJpc3RhdGUgdG8g
Ym9vbC4NCg0KPiA+ICsgICAgIH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9f
aW5pdCBydGQxNjI1X2NydF9pbml0KHZvaWQpIHsNCj4gPiArICAgICByZXR1cm4gcGxhdGZvcm1f
ZHJpdmVyX3JlZ2lzdGVyKCZydGQxNjI1X2NydF9kcml2ZXIpOw0KPiA+ICt9DQo+ID4gK3N1YnN5
c19pbml0Y2FsbChydGQxNjI1X2NydF9pbml0KTsNCj4gDQo+IElzIHRoZXJlIGEgcmVhc29uIHRo
YXQgeW91IGNhbid0IHVzZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkgdG8gaGF2ZSB0aGlzDQo+
IHJlZ2lzdGVyZWQgYXQgdGhlIGRldmljZV9pbml0Y2FsbCBsZXZlbD8NCj4gDQo+IEJyaWFuDQoN
Ck5vIHNwZWNpZmljIHJlYXNvbi4gSSB3aWxsIGNoYW5nZSBpdCB0byB1c2UgbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcigpIHRvDQp0YWtlIGFkdmFudGFnZSBvZiB0aGUgZGVmZXJyZWQgcHJvYmUgbWVj
aGFuaXNtLg0KDQpUaGFuayB5b3UgZm9yIHJldmlld2luZy4NCg0KQmVzdCBSZWdhcmRzLA0KWXUt
Q2h1bg0K
