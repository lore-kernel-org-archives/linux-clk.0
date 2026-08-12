Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DB410D32;
	Wed, 12 Aug 2026 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527735; cv=none; b=s55TuTzJWg+ZeX+w7fU2aXwGG3T6x1+wN6GXXGPP8Y/QbNVbwUhaGsWC84K3IMNz5Fc7iv/GhWHrPinU3QzSBPKqZn2eyuFsRkdTWpO8sn4NDMAIQpuCCTI9l6kKakmn55OWcM54mdRynIlaZA17JzeqPPNNdotfqm0wXKxBVwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527735; c=relaxed/simple;
	bh=D9dgD8NETMczdDIL/VoWWE5yrLNaW/+4UzsIrHmvh40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n2rxp3IDpnxdr8TnTVGhf7EZ0gz642bxut7Iq/XGriDTqT2TkVXwyv1zdXCwhINUDhnsuD7Y7Y3OjkXFjp0qnpBGY8TPuHpGFR5q8mkfem0gwjqOSwYdI7nBPYWLKTmk0dp0lwwSnvFOshyUgt/CGNkO7PZohO1fXIQJJJ0D3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=rjGVv6bd; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="rjGVv6bd"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C9f6bjD3497543, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786527666; bh=D9dgD8NETMczdDIL/VoWWE5yrLNaW/+4UzsIrHmvh40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=rjGVv6bd3y+Z+j8T1xoakVTILwLRMq2USZHsM0ri3blImk+nR+Ib7QftnmLNSutWL
	 ROdvXm08aoNMoE0AHJfI5TzsF2W30QFeTzdDZKMvr6AovAHzCwESeY19rcN47mH9TO
	 X5gOYJZSIoM8XwsftLfprUTmCVc4H6i8vojKpjCU9n/SliuOlkixf9hQCtrof6xGv3
	 p970v9pZ4IcM9G906ZCmLYT9viErmrzTWhuE5oqCkgqu8DjZ5zuoehsjE5xa0z02zd
	 6pi9mttyMtDaBNqOQqZ83UXEhb4khN3mV7PyfGfldamUZ1ZSYZrzK+2Ky4ImKEfsdt
	 ySg7Y0k5S9lDA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C9f6bjD3497543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 17:41:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 17:41:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Wed, 12 Aug 2026 17:41:06 +0800
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
Thread-Index: AQHdKf6sqK1LXpXPjkadMFMzDtoXkraZlK4AgACT8SA=
Date: Wed, 12 Aug 2026 09:41:06 +0000
Message-ID: <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
In-Reply-To: <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
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

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIDEyLzA4LzIwMjYgMDM6NTksIFl1LUNodW4gTGluIHdyb3Rl
Og0KPiA+IEFkZCBEVCBiaW5kaW5nIHNjaGVtYSBmb3IgUmVhbHRlayBSVEQxNjI1IGNsb2NrIGFu
ZCByZXNldCBjb250cm9sbGVyDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiANCj4gSG93IG15
IHRhZyBjb3VsZCBhcHBlYXIgaGVyZT8NCj4gDQo+IExvb2s6DQo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyNjAzMjQwMjUzMzIuMzQxNjk3Ny0yLWVsZWFub3IubGluQHJlYWx0ZWsu
Yw0KPiBvbS8NCj4gDQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJA
cmVhbHRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJl
YWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkBy
ZWFsdGVrLmNvbT4NCj4gDQo+IFdobyBhZGRlZCBteSB0YWc/IFdoYXQgaXMgdGhlIGFjdHVhbCBm
bG93IG9mIHRoaXMgcGF0Y2g/DQo+IA0KDQpZb3UgZ2F2ZSB5b3VyIFJldmlld2VkLWJ5IHRhZyBp
biB2NS4gSG93ZXZlciwgYWZ0ZXIgdGhhdCwgU3RlcGhvbiBwcm92aWRlZA0KYWRkaXRpb25hbCBm
ZWVkYmFjay4gSW4gdjYsIEkgbW9kaWZpZWQgdGhlIHBhdGNoIGJhc2VkIG9uIFN0ZXBob24ncw0K
Y29tbWVudHMgYW5kIG1hZGUgc29tZSBvdGhlciBjaGFuZ2VzLiBGdXJ0aGVybW9yZSwgSSBhZGRl
ZCB0aGUgY2xvY2sgSUQNCjE0NCBpbiB2MTEuDQoNCkFmdGVyIHY2LCBJIGRpZG4ndCBkcm9wIHlv
dXIgdGFnLiBJIGFwb2xvZ2l6ZSBmb3IgdGhlIG1pc3Rha2UgaW4gdGhlIHBhdGNoDQpmbG93Lg0K
DQpJIHdpbGwgZHJvcCB5b3VyIHRhZyBpbiB2MTQuDQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4N
Cg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
