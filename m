Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9B1E8332;
	Mon, 30 Mar 2026 02:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774839111; cv=none; b=T3cIKocZ2nTZFs4Gco+ugMAa8h2M4hybB36hJVHoSTw+2ycJgBn4HvzGBwoLE1O/Qu1r1MG97ETSwu97haimYs8zhZM/6AuLp9j2lOXgNEo7PqjYejEIWRXJZVkhPBpr5siZIaK4oBn+hZnL4dAGLZ9XTZUsIy2ah/OqkGMBNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774839111; c=relaxed/simple;
	bh=O4Y5n3cKRY/d5CxfoJrhyaJ0JdpBNWMx4YBDOlTjOOM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t9bxcPDr+4Oz+8/u0Zu5TeqAaLN9n0PZyi7dgVQO/v1X5sM7AdKJ9nxkb4+wezJO13+7zf7PaL4T9sXG4/t0Ou/C2Bx4x3QiomxzuCOMfDNCYp8DB7w4t0HAxK2xcFUOiQbnSBMhhstQ6IwPP4S/12TSELLhWlBEy2p6Sx8hFK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=MBDHnZ0S; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="MBDHnZ0S"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62U2n2l85188408, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774838942; bh=O4Y5n3cKRY/d5CxfoJrhyaJ0JdpBNWMx4YBDOlTjOOM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=MBDHnZ0SiW97gci0/0VJoREqQwLAmFN6VgUzwnvyY6l1OrLpNxXXJcl0gtNofUMEc
	 EwE5DrLYBC289Mnlxai7KcmZN+oOIY0iXwzTVXBnkwFK6wNW92w2dy7eT49UFNliqQ
	 0/uw3hGNGSIPPOIBczXRP4sG1fwcKDyuAIvZUcEk1gPYvc4+VddJ9HqDqxowLrEBhZ
	 1tY6lMTDtkKkuEFM9cAzEo1A7fQoek/4Pgwh9FLxUv5DjYTkdi/GJCplkIoBw9l57n
	 0deEJfd1BxFc54TqvKeeHE2Pp6vedkNL8XCY4f1wn2cH7/ukcyYUGPR74F4V1yHOEh
	 NuOvVrA2Z8HUQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62U2n2l85188408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 10:49:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Mar 2026 10:49:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::46e9:fab9:b2cf:c99b%10]) with mapi id
 15.02.1748.010; Mon, 30 Mar 2026 10:49:02 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Stephen Boyd <sboyd@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        =?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "mturquette@baylibre.com"
	<mturquette@baylibre.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh@kernel.org" <robh@kernel.org>
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
Subject: RE: [PATCH v5 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Thread-Topic: [PATCH v5 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Thread-Index: AQHcuzlnvO48bJAfYk+MJ8/TttSgv7W9+VeAgAhvUYA=
Date: Mon, 30 Mar 2026 02:48:45 +0000
Message-ID: <a90343db950541bfbeadcc63a835165e@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
 <20260324025332.3416977-2-eleanor.lin@realtek.com>
 <177440394165.5403.17868576455504268400@localhost.localdomain>
In-Reply-To: <177440394165.5403.17868576455504268400@localhost.localdomain>
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

PiBRdW90aW5nIFl1LUNodW4gTGluICgyMDI2LTAzLTIzIDE5OjUzOjIyKQ0KPiA+IGRpZmYgLS1n
aXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZWFsdGVr
LHJ0ZDE2MjUtY2xrLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jbG9jay9yZWFsdGVrLHJ0ZDE2MjUtY2xrLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNmZhYmMyZGEzOTc1DQo+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZWFs
dGVrLHJ0ZDE2MjUtY2xrLnlhbWwNCj4gPiBAQCAtMCwwICsxLDUyIEBADQo+ID4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAx
LjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvY2xv
Y2svcmVhbHRlayxydGQxNjI1LWNsay55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBSZWFs
dGVrIFJURDE2MjUgQ2xvY2sgJiBSZXNldCBDb250cm9sbGVyDQo+ID4gKw0KPiA+ICttYWludGFp
bmVyczoNCj4gPiArICAtIFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCj4g
PiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAgVGhlIFJlYWx0ZWsgUlREMTYyNSBDbG9j
ayBDb250cm9sbGVyIG1hbmFnZXMgYW5kIGRpc3RyaWJ1dGVzIGNsb2NrDQo+ID4gKyAgc2lnbmFs
cyB0byB2YXJpb3VzIGNvbnRyb2xsZXJzIGFuZCBpbXBsZW1lbnRzIGEgUmVzZXQgQ29udHJvbGxl
cg0KPiA+ICtmb3IgdGhlDQo+ID4gKyAgU29DIHBlcmlwaGVyYWxzLg0KPiA+ICsNCj4gPiArICBD
bG9ja3MgYW5kIHJlc2V0cyBhcmUgcmVmZXJlbmNlZCBieSB1bmlxdWUgaWRlbnRpZmllcnMsIHdo
aWNoIGFyZQ0KPiA+ICsgZGVmaW5lZCBhcyAgcHJlcHJvY2Vzc29yIG1hY3JvcyBpbg0KPiA+ICsg
aW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yZWFsdGVrLHJ0ZDE2MjUtY2xrLmggYW5kDQo+IGlu
Y2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvcmVhbHRlayxydGQxNjI1LmguDQo+ID4gKw0KPiA+ICtw
cm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVtOg0KPiA+ICsgICAg
ICAtIHJlYWx0ZWsscnRkMTYyNS1jcnQtY2xrDQo+ID4gKyAgICAgIC0gcmVhbHRlayxydGQxNjI1
LWlzby1jbGsNCj4gPiArICAgICAgLSByZWFsdGVrLHJ0ZDE2MjUtaXNvLXMtY2xrDQo+ID4gKw0K
PiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgICIjY2xvY2st
Y2VsbHMiOg0KPiA+ICsgICAgY29uc3Q6IDENCj4gPiArDQo+ID4gKyAgIiNyZXNldC1jZWxscyI6
DQo+ID4gKyAgICBjb25zdDogMQ0KPiANCj4gQXJlIHRoZXJlIGFueSBpbnB1dCBjbGtzIGZvciB0
aGUgY2xrIHRyZWU/DQo+IA0KDQpXZSBkb24ndCBkeW5hbWljYWxseSBjYWxjdWxhdGUgZnJlcXVl
bmNpZXMgYmFzZWQgb24gYW4gaW5wdXQgY2xvY2suDQpTaW5jZSBhbGwgb2Ygb3VyIGN1cnJlbnQg
U29DcyB1c2UgYSBmaXhlZCAyN01IeiBvc2NpbGxhdG9yLCB3ZSB1c2UNCnByZWRlZmluZWQgbG9v
a3VwIHRhYmxlcyBpbiB0aGUgZHJpdmVyIGZvciB0aGUgdGFyZ2V0IGZyZXF1ZW5jaWVzIGluc3Rl
YWQuDQoNCk5ldmVydGhlbGVzcywgdG8gcHJvcGVybHkgZGVzY3JpYmUgdGhlIGhhcmR3YXJlIGxh
eW91dCwgSSB3aWxsIGFkZCB0aGUgY2xvY2sNCnByb3BlcnRpZXMgaW4gdGhlIGJpbmRpbmdzIGFu
ZCBEVFMgaW4gdjYuDQoNCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJs
ZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSAiI2Nsb2NrLWNlbGxzIg0KPiA+ICsgIC0gIiNyZXNl
dC1jZWxscyINCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsN
Cj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICBjbG9jay1jb250cm9sbGVyQDk4
MDAwMDAwIHsNCj4gPiArICAgICAgY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0ZDE2MjUtY3J0LWNs
ayI7DQo+ID4gKyAgICAgIHJlZyA9IDw5ODAwMDAwMCAweDEwMDA+Ow0KPiANCj4gU2hvdWxkIGJl
IDB4OTgwMDAwMDAgdG8gbWF0Y2ggdGhlIHVuaXQgYWRkcmVzcy4NCj4gDQoNCkFjay4NCg0KQmVz
dCBSZWdhcmRzLA0KWXUtQ2h1bg0KDQo+ID4gKyAgICAgICNjbG9jay1jZWxscyA9IDwxPjsNCj4g
PiArICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgfTsNCg==
