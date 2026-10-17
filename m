Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAED27A462;
	Sat, 17 Oct 2026 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226323; cv=none; b=gRbl0EqCdWhSqzb4YoFfwqrjduQtYbYLE5ApGLZOw9xVVAul8RZz8YDV8U02kQx9KOwgSORSJHoLdvTv+pLFdsuEqhUKBywgJOrUy1YOP6UFMygIT7IxaROr5AukKeKHOlCvAiTrA6OHVYwssexSZ3JfLMjFudjW84+TUxzHFUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226323; c=relaxed/simple;
	bh=ROQGttvnrz53Og6SHqMoqConxaD+Kdjmwoj2PX0LzIg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nzilToD/6uolVzKp2YVTnEciHsiOdpD19iwXaWUKdLcFeegSxpWGhlx1L179uYl7D+lXxbdc/+dLuzZRGz99lcSKvSdWNqsKv7gyYNoS2bjvj+YmTTPIDSEop/KYOfilMNNqVFere0X8OPJAxtqSdqmc+MCHlAHzbfFcpLCPT2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=s9ne5iO3; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="s9ne5iO3"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H8bH341001360, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792226237; bh=ROQGttvnrz53Og6SHqMoqConxaD+Kdjmwoj2PX0LzIg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=s9ne5iO3Al0Vt6YDsBMlSVrXzDtQSbAG+tx/c+klMIjT+TM42luEHv0TXE7sUjTdN
	 z+s+dQDbs0i6HvkK1lXLjLuxhK593jfcURxFvC8Y/oigoiV+V+uATtvcHFkWWfudzm
	 zpS6/Dq2hfFuH/aCSQkMEAz8PzXlt0JNchgNf+vkycNQ8JqDrezfQBW8JH65HQTMjP
	 eip+/btMKrUcgZUA31PIgeD6MJg0Yc3tKVFsWFEAigcMYYU+JkbLI5aYDG5PoVbv6g
	 Xo3JiXztayB4pNZmgCbgjyCiNqxggq3IgU5OmDWm91UGA+BqV8NWJrSggbZKbDjhqH
	 X4kHE/Ebgge2A==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H8bH341001360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 16:37:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 16:37:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 16:37:14 +0800
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
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and
 reset support
Thread-Topic: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and
 reset support
Thread-Index: AQHdUkHB5XaBTXVELkuRjLnOEVjsZrb1DaSAgAxy+WA=
Date: Sat, 17 Oct 2026 08:37:14 +0000
Message-ID: <4c78868d5f734fc198b4d0b38a04098d@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <179157057523.266328.2566485767894163325.b4-review@b4>
In-Reply-To: <179157057523.266328.2566485767894163325.b4-review@b4>
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

SGkgSmVyb21lLA0KDQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRz
IHRoZSBjbG9jayBhbmQgcmVzZXQgY29udHJvbGxlciBzdXBwb3J0IGZvcg0KPiA+IFJlYWx0ZWsn
cw0KPiA+IFJURDE2MjUgU29DIHBsYXRmb3JtLg0KPiA+DQo+ID4gQmVjYXVzZSB0aGUgcmVzZXQg
Y29udHJvbGxlcnMgc2hhcmUgdGhlIHNhbWUgcmVnaXN0ZXIgc3BhY2Ugd2l0aCB0aGUNCj4gPiBj
bG9jayBjb250cm9sbGVycyBvbiB0aGlzIHBsYXRmb3JtLCB3ZSB1dGlsaXplIHRoZSBBdXhpbGlh
cnkgQnVzDQo+ID4gZnJhbWV3b3JrIHRvIGRlY291cGxlIHRoZW0uIFRoZSBjbG9jayBjb250cm9s
bGVycyBhY3QgYXMgdGhlIHByaW1hcnkNCj4gPiBkZXZpY2VzLCByZWdpc3RlcmluZyB0aGUgcmVz
ZXQgY29udHJvbGxlcnMgYXMgYXV4aWxpYXJ5IGRldmljZXMuDQo+IA0KPiBDb25zaWRlcmluZyB0
aG9zZSBhcmUgcHJvcGVybHkgZGVjb3VwbGVkLCB0aGVyZSBpcyBubyByZWFzb24gdG8gc2VuZCB0
aGVtDQo+IHRvZ2V0aGVyIGFueW1vcmUuIFlvdSBjb3VsZCBzZW5kIHRoZSByZXNldCBwYXJ0IHRv
IHJlc2V0LCBhbmQganVzdCBjbG9jayBwYXJ0IHRvDQo+IGNsb2NrLg0KPiANCj4gU2VuZGluZyBh
IHNlcmllcyB0aGF0IGFkZHJlc3MgYSBzaW5nbGUgdHJlZSBoZWxwcyBiZWNhdXNlIHRoZW4gd2Ug
Y2FuIG1lcmdlIGl0DQo+IHVzaW5nIHlvdXIgY292ZXItbGV0dGVyIGFzIG1lcmdlIGNvbW1pdCwg
aW5zdGVhZCBvZiBjaGVycnktcGlja2luZy4NCj4gDQoNCkkgd2lsbCBzcGxpdCB0aGlzIGludG8g
dHdvIHNlcGFyYXRlIHBhdGNoIHNlcmllczoNCg0KMS4gZHQtYmluZGluZ3MsIGR0cywgY2xrLXJl
bGF0ZWQgcGF0Y2hlcyAodGFyZ2V0aW5nIHRoZSBjbGsgdHJlZSkuDQoyLiBUaGUgcmVtYWluaW5n
IHJlc2V0LXJlbGF0ZWQgcGF0Y2hlcyAodGFyZ2V0aW5nIHRoZSByZXNldCB0cmVlKS4NCg0KQmVz
dCBSZWdhcmRzLA0KWXUtQ2h1bg0KDQo+IC0tDQo+IEplcm9tZQ0K
