Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA8DC4360F
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 14:57:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0645D204EC
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 14:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="cVfT4o6m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730022AbfDBO5R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:57:17 -0400
Received: from mail-eopbgr130080.outbound.protection.outlook.com ([40.107.13.80]:58849
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729855AbfDBO5R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Apr 2019 10:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOhHiAKuSsdFqAyaCZ0ERaZmPWaFUAa8GaF1S4Q4zWU=;
 b=cVfT4o6m6UJC1Ldzuw6E2UUVQp29ZcxMkhp3/XRPgWbJpvmGh1+7ijRQqhbvODuOTO4/HNXAL3zIcno0A7HWckVTj+mvA0LRE/l2AYDeMJ5j8sSJ7SJb0TxhMeJRO/vPfyHLRYaI9kZ20G0YCkDRYh8IccKKT3+RbfFhwS4ZKuk=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5025.eurprd04.prod.outlook.com (20.177.40.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.22; Tue, 2 Apr 2019 14:55:30 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::4514:91e2:16b7:ee2b]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::4514:91e2:16b7:ee2b%4]) with mapi id 15.20.1750.014; Tue, 2 Apr 2019
 14:55:30 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/4] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Thread-Topic: [PATCH 2/4] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Thread-Index: AQHUyg/Kxp1YOB0bxEaB6SXWVnNLZ6Xw8WgAgCCnHWCAF5liUA==
Date:   Tue, 2 Apr 2019 14:55:29 +0000
Message-ID: <AM0PR04MB42119CF865B3C9659FBF9C7E80560@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-3-git-send-email-aisheng.dong@nxp.com>
 <155112397472.191923.18309287020361500256@swboyd.mtv.corp.google.com>
 <AM0PR04MB421102D948A6972B8A19C78880470@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB421102D948A6972B8A19C78880470@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bdfd9f5-a845-43bc-5452-08d6b77b3fe8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5025;
x-ms-traffictypediagnostic: AM0PR04MB5025:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR04MB50258F75FA50B9CECDC8627580560@AM0PR04MB5025.eurprd04.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(396003)(136003)(346002)(376002)(189003)(199004)(3846002)(71190400001)(6116002)(71200400001)(44832011)(966005)(478600001)(14444005)(105586002)(106356001)(256004)(2501003)(14454004)(33656002)(229853002)(66066001)(2906002)(486006)(6436002)(186003)(93886005)(7696005)(4326008)(76176011)(6246003)(5660300002)(68736007)(6506007)(97736004)(476003)(74316002)(11346002)(446003)(52536014)(305945005)(86362001)(110136005)(99286004)(316002)(9686003)(7736002)(8936002)(54906003)(55016002)(8676002)(53936002)(6306002)(81166006)(81156014)(102836004)(26005)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5025;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S1HOY16ArqZDcL9f1FPF6tpUPQMPa9CGoh0IM6+mOeESRK25JG+2jmeKHR+eOiTOV3ktb1tTR+jSsT5MCBz1/c1780V+NYMOwYRHSa9k4cECNgbD6C/x5Vkhnap5HW0sT8FQS5Yd1rOq8uflJSfdCARHUce1eMYTEG7eiWoGUe0pGKbD6NFrGoOClwwY8d9KMybKuycUpievttpAwCWBB5T01G7nDdExp995zBOUKLKRdOOA27cEvdMov6jBRymMcWzIPD5pr+BIiCvbduHCpjarj3jYbcdakjyTWcJIX+ZPsPzAVYjNDnE+IFEYn1u94b7979esYUrsNzGNOYAF/hxpZPtXb+php3P0HNiUiic4zQl99IJios4aJ7fCyifTlH0c+DRqh4dm7QVv39xcqPxkG+aCHoiIKifixG1GBqU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdfd9f5-a845-43bc-5452-08d6b77b3fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 14:55:29.9834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5025
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svaW14OHF4cC1scGNnLnR4dA0KPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY2xvY2svaW14OHF4cC1scGNnLnR4dA0KPiA+ID4gaW5kZXggOTY1Y2ZhNC4uYTMx
Nzg0NCAxMDA2NDQNCj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jbG9jay9pbXg4cXhwLWxwY2cudHh0DQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OHF4cC1scGNnLnR4dA0KPiA+ID4gQEAgLTExLDYgKzEx
LDIwIEBAIGVuYWJsZWQgYnkgdGhlc2UgY29udHJvbCBiaXRzLCBpdCBtaWdodCBzdGlsbCBub3QN
Cj4gPiA+IGJlIHJ1bm5pbmcgYmFzZWQgIG9uIHRoZSBiYXNlIHJlc291cmNlLg0KPiA+ID4NCj4g
PiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ID4gKy0gY29tcGF0aWJsZTogICAgICAgICAg
U2hvdWxkIGJlIG9uZSBvZjoNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgImZzbCxp
bXg4cXhwLWxwY2ciDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICJmc2wsaW14OHFt
LWxwY2ciIGZvbGxvd2VkIGJ5DQo+ID4gImZzbCxpbXg4cXhwLWxwY2ciLg0KPiA+ID4gKy0gcmVn
OiAgICAgICAgICAgICAgICAgQWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlciBzZXQu
DQo+ID4gPiArLSAjY2xvY2stY2VsbHM6ICAgICAgICAgICAgICAgIFNob3VsZCBiZSAxLiBPbmUg
TFBDRyBzdXBwb3J0cyBtdWx0aXBsZQ0KPiA+IGNsb2Nrcy4NCj4gPiA+ICstIGNsb2NrczogICAg
ICAgICAgICAgIElucHV0IHBhcmVudCBjbG9ja3MgcGhhbmRsZSBhcnJheSBmb3IgZWFjaCBjbG9j
ay4NCj4gPiA+ICstIGJpdC1vZmZzZXQ6ICAgICAgICAgIEFuIGludGVnZXIgYXJyYXkgaW5kaWNh
dGluZyB0aGUgYml0IG9mZnNldCBmb3IgZWFjaA0KPiA+IGNsb2NrLg0KPiA+ID4gKy0gaHctYXV0
b2dhdGU6ICAgICAgICAgQm9vbGVhbiBhcnJheSBpbmRpY2F0aW5nIHdoZXRoZXIgc3VwcG9ydHMg
SFcNCj4gPiBhdXRvZ2F0ZSBmb3INCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGVhY2gg
Y2xvY2suDQo+ID4NCj4gPiBUaGlzIGxvb2tzIGxpa2Ugb25lIGNsayBwZXIgbm9kZSBzdHlsZSBv
ZiBiaW5kaW5ncyB3aGljaCBpcyBhDQo+ID4gZGlyZWN0aW9uIHdlIGRvbid0IHdhbnQgRFQgYmlu
ZGluZ3MgdG8gZ28gaW4uIEl0IGxlYWRzIHRvIGEgYnVuY2ggb2YNCj4gPiB0aW1lIHBhcnNpbmcg
RFQgdG8gZ2VuZXJhdGUgY2xrcyBhbmQgaW4gZ2VuZXJhbCBkb2Vzbid0IHJlcHJlc2VudCB0aGUN
Cj4gPiBjbG9jayBjb250cm9sbGVyIGhhcmR3YXJlIHRoYXQgaXMgdGhlcmUuIEJhc2ljYWxseSwg
YW55dGhpbmcgd2l0aCAnYml0LW9mZnNldCcNCj4gPiBpbiB0aGUgYmluZGluZyBpcyBub3QgZ29p
bmcgdG8gYmUgYWNjZXB0YWJsZS4NCj4gPg0KPiANCj4gVGhpcyBpcyBub3Qgb25lIGNsayBwZXIg
bm9kZSBidXQgb25lIGNsb2NrIGNvbnRyb2xsZXIgcGVyIG5vZGUgd2hpY2ggc3RyaWN0bHkNCj4g
ZGVzY3JpYmVzIHRoZSBIVy4NCj4gDQo+IE9uIE1YOCwgZWFjaCBMUENHIGlzIGEgc2VwYXJhdGUg
Y2xvY2sgY29udHJvbGxlciB3aGljaCBjYW4gY29udHJvbCBhIGNvdXBsZSBvZg0KPiBjbG9jayBv
dXRwdXQgZ2F0ZXMgZm9yIG9uZSBzcGVjaWZpYyBkZXZpY2UgdG8gdXNlLiBFYWNoIGRldmljZSBo
YXMgYQ0KPiBjb3JyZXNwb25kaW5nIExQQ0cgY2xvY2sgY29udHJvbGxlciBhbmQgdGhvc2UgTFBD
R3MgYXJlIGluZGVwZW5kZW50IHdpdGgNCj4gZWFjaCBvdGhlciB3aXRoIHNlcGFyYXRlIElPIHNw
YWNlLg0KPiANCj4gVGhvc2UgTFBDR3MgYXJlIGRpc3RyaWJ1dGVkIGluIHZhcmlvdXMgU1MgKHN1
YnN5c3RlbXMpIGFsb25nIHdpdGggZGV2aWNlDQo+IHJlc291cmNlcy4NCj4gRGVzY3JpYmluZyB0
aGVtIGluIGRldmljZSB0cmVlIFNTIGR0c2kgZG9lc24ndCBzZWVtIHRvIGJlIGFuIGlzc3VlIGFz
IGl0IGlzDQo+IHJlcHJlc2VudGluZyB0aGUgcmVhbCBoYXJkd2FyZS4NCj4gDQo+IEZvciBTQ1Ug
Y2xvY2tzLCB0aGV5J3JlIHNpbWlsYXIgY2FzZSB0aGF0IGVhY2ggU1MgaGF2aW5nIHNlcGFyYXRl
IGNsb2NrDQo+IGNvbnRyb2xsZXJzIEluIEhXIHdoaWNoIGFyZSBtYW5hZ2VkIGJ5IFNDVSBmaXJt
d2FyZS4gU28gaXQgc2VlbXMgYWxzbyBva2F5DQo+IHRvIHB1dCB0aGVtIGluIGRldmljZSB0cmVl
IFNTIGR0c2kgZmlsZSwgcmlnaHQ/DQo+IA0KPiBJZiB5b3UncmUgY29uY2VybmluZyBlYWNoIG5v
ZGUgaGF2aW5nIG9uZSBjb21wYXRpYmxlIHN0cmluZywgaG93IGFib3V0IGRvaW5nDQo+IGxpa2Ug
bWFueSBwb3dlciBkb21haW4gZG9lcyBhcyBiZWxvdz8NCj4gDQo+IEhhdmluZyBvbmx5IG9uZSBj
b21wYXRpYmxlIHN0cmluZyBpbiBjbG9jayBwYXJlbnQgbm9kZXMuDQo+IA0KPiAvL0xTSU8gU1MN
Cj4gbHNpb19zY3VfY2xrOiBsc2lvLXNjdS1jbG9jay1jb250cm9sbGVyIHsNCj4gICAgICAgICBj
b21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWNsb2NrIiwgImZzbCxzY3UtY2xrIjsNCj4gDQo+ICAg
ICAgICAgZnNwaTBfY2xrOiBjbG9jay1mc3BpMHsNCj4gICAgICAgICAgICAgICAgICNjbG9jay1j
ZWxscyA9IDwwPjsNCj4gICAgICAgICAgICAgICAgIHJzcmMtaWQgPSA8SU1YX1NDX1JfRlNQSV8w
PjsNCj4gICAgICAgICAgICAgICAgIGNsay10eXBlID0gPElNWF9TQ19QTV9DTEtfUEVSPjsNCj4g
ICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX0ZTUElfMD47DQo+
ICAgICAgICAgfTsNCj4gDQo+IAkJZnNwaTFfY2xrOiBjbG9jay1mc3BpMXsNCj4gCQkJLi4uDQo+
IAkJfTsNCj4gICAgICAgICAuLi4NCj4gfTsNCj4gDQo+IC8qIExQQ0cgY2xvY2tzICovDQo+IGxz
aW9fbHBjZ19jbGs6IGxzaW8tbHBjZy1jbG9jay1jb250cm9sbGVyIHsNCj4gICAgICAgICBjb21w
YXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KPiANCj4gICAgICAgICBwd20wX2xwY2c6IGNs
b2NrLWNvbnRyb2xsZXJANWQ0MDAwMDAgew0KPiAgICAgICAgICAgICAgICAgcmVnID0gPDB4NWQ0
MDAwMDAgMHgxMDAwMD47DQo+ICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+
ICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnB3bTBfY2xrPiwgPCZwd20wX2Nsaz4sIDwmcHdt
MF9jbGs+LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgPCZsc2lvX2J1c19jbGs+LCA8JnB3
bTBfY2xrPjsNCj4gICAgICAgICAgICAgICAgIGJpdC1vZmZzZXQgPSA8MCA0IDE2IDIwIDI0PjsN
Cj4gICAgICAgICAgICAgICAgIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJwd20wX2xwY2dfaXBnX2Ns
ayIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicHdtMF9scGNnX2lw
Z19oZl9jbGsiLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInB3bTBf
bHBjZ19pcGdfc19jbGsiLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
InB3bTBfbHBjZ19pcGdfc2x2X2NsayIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAicHdtMF9scGNnX2lwZ19tc3RyX2NsayI7DQo+ICAgICAgICAgICAgICAgICBwb3dl
ci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9QV01fMD47DQo+ICAgICAgICAgICAgICAgICBzdGF0
dXMgPSAiZGlzYWJsZWQiOw0KPiAgICAgICAgIH07DQo+ICAgICAgICAgLi4uDQo+IH07DQo+IA0K
PiBJIGFsc28gaGF2ZSBzcGVudCBhIGxvdCB0aW1lIHRvIGludmVzdGlnYXRlIGhvdyBUSSBhbmQg
U2Ftc3VuZyBkb2VzLiBIb3dldmVyLA0KPiBmaW5hbGx5IGkuTVggaXMgc3RpbGwgZGlmZmVyZW50
IGFuZCBJIHN0aWxsIGJlbGlldmUgY3VycmVudCB3YXkgaXMgYmV0dGVyIGZvciBpLk1YLA0KPiBt
YWlubHkgZHVlIHRvIGJlbG93IHJlYXNvbnM6DQo+IA0KPiAxKSBJTVggaGF2aW5nIHNlcGFyYXRl
IGNsb2NrIGNvbnRyb2xsZXJzIGluIEhXLCBub3Qgc2hhcmVkIG9uZSBsaWtlIG90aGVycw0KPiAy
KSBJTVggU29DIGlzIGNvbXByaXNlZCBvZiB2YXJpb3VzIEhXIFNTIChTdWJzeXN0ZW0pIHdoaWxl
IG90aGVycyBkb24ndCBoYXZlLg0KPiAgIERlc2NyaWJpbmcgY2xvY2tzIGluIERUIGNhbiBoZWxw
IGEgYmV0dGVyIFNXIGFyY2hpdGVjdHVyZSB0byBkZXNjcmliZSBIVy4NCj4gMykgRWFjaCBjbG9j
ayBpcyBhc3NvY2lhdGVkIHdpdGggYSBwb3dlciBkb21haW4uIERUIGlzIHRoZSBiZXN0IHBsYWNl
IHRvDQo+IGluZGljYXRlIGl0Lg0KPiA0KSBDbG9jayBhdmFpbGFiaWxpdHkgKEJvdGggU0NVIGFu
ZCBMUENHKSBhcmUgY29uZmlndXJhYmxlIGFjY29yZGluZyB0bw0KPiAgIGRpZmZlcmVudCBIVyBw
YXJ0aXRpb24gY29uZmlndXJhdGlvbiBieSBTQ1UgZmlybXdhcmUuDQo+ICAgRGVmaW5pbmcgdGhl
bSBhbGwgaW4gZHJpdmVyIHdpbGwgY2F1c2UgYW5ub3lpbmcgYW5kIGNvbnRpbnVlZCBjaHVybiBp
biBkcml2ZXINCj4gICBhbGwgdGhlIHRpbWUgd2hlbiBhZGRpbmcgbmV3IFNvQyBzdXBwb3J0Lg0K
PiAgIGUuZy4NCj4gICBIYW5kbGluZyBhdmFpbGFiaWxpdHkgZm9yIGRpZmZlcmVudCBTUyBpbiBk
aWZmZXJlbnQgU29DLg0KPiAgIERlZmluaW5nIENsb2NrIElEcyBmb3IgZGlmZXJlbnQgU1MgaW4g
ZGlmZmVyZW50IFNvQyBmb3Igc2FtZSBjbG9ja3MuDQo+IA0KPiBCeSBwdXR0aW5nIGNsb2NrcyBp
biBEVCwgd2UgY2FuIG1ha2UgdGhlIGNsb2NrIGRyaXZlciBjb21wbGV0ZWx5IGdlbmVyaWMgYW5k
DQo+IG5vIG1vcmUgY2h1cm4gaW4gdGhlIGRyaXZlciBhbnltb3JlIGluIHRoZSBmdXR1cmUgZm9y
IGFkZGluZyBuZXcgU29DIHN1cHBvcnQuDQo+IEl0IGNhbiBzaWduaWZpY2FudGx5IHNhdmUgdGhl
IGRyaXZlciBtYWludGFpbiBlZmZvcnQuDQo+IA0KDQpTaGF3biBpcyBva2F5IHdpdGggdGhlIHdo
b2xlIHBvaW50IG9mIE1YOCBBcmNoIGltcHJvdmVtZW50WzFdLiANCihlLmcuIG1vdmluZyBjbG9j
a3MgaW50byBEVCkNCkJ1dCB3ZSBzdGlsbCBuZWVkIHRoZSB5b3VyIGFncmVlbWVudCBvbiB0aGUg
Y2xvY2sgcGFydCBmaXJzdC4NCkNvdWxkIHlvdSBoZWxwIHJldmlldyBpZiB0aGlzIGlzIG9rYXkg
dG8geW91Pw0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDgyNDUz
Ny8NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQoNCj4gTGFzdCwgdGhpcyB3b24ndCBicmVhayBj
b21wYXRpYmlsaXR5LiBJdCdzIGp1c3QgaW50cm9kdWNlIGEgbmV3IGJpbmRpbmcuDQo+IA0KPiBS
ZWdhcmRzDQo+IERvbmcgQWlzaGVuZw0KPiANCj4gPiA+ICstIGNsb2NrLW91dHB1dC1uYW1lczog
IFNoYWxsIGJlIHRoZSBjb3JyZXNwb25kaW5nIG5hbWVzIG9mIHRoZSBvdXRwdXRzLg0KPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgTk9URSB0aGlzIHByb3BlcnR5IG11c3QgYmUgc3BlY2lm
aWVkIGluIHRoZQ0KPiA+IHNhbWUgb3JkZXINCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGFzIHRoZSBjbG9jayBiaXQtb2Zmc2V0IGFuZCBody1hdXRvZ2F0ZQ0KPiBwcm9wZXJ0eS4NCj4g
PiA+ICsNCj4gPiA+ICtMZWdhY3kgYmluZGluZyAoREVQUkVDQVRFRCk6DQo+ID4gPiAgLSBjb21w
YXRpYmxlOiAgU2hvdWxkIGJlIG9uZSBvZjoNCj4gPiA+ICAgICAgICAgICAgICAgICAgICJmc2ws
aW14OHF4cC1scGNnLWFkbWEiLA0K
