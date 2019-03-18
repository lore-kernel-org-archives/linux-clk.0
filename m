Return-Path: <SRS0=cbsA=RV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE74C43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 15:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 782032085A
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 15:10:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OqeuO7V5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfCRPKL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Mar 2019 11:10:11 -0400
Received: from mail-eopbgr00047.outbound.protection.outlook.com ([40.107.0.47]:50756
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726757AbfCRPKL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Mar 2019 11:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Yg3CpIhITKGPZ6uVts2BIBdbacpqE3Pp5ja12CxqcM=;
 b=OqeuO7V5zT5+CGYBqQaQD0HMmeTjEek5zmpjfd8aMEG+6JFVBUeGAaO10KKwIt0wyBGfyqcGtsiCrE3b9VUpS+XNaSc5/1iEWVlS6W0/7KM7YcUq+iFVBBagW8+LFD+rshW5Kyk7ZymFZKzj2UxFh110jtLPjptVWBZzpwHa/Co=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4353.eurprd04.prod.outlook.com (52.134.125.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Mon, 18 Mar 2019 15:10:04 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::50ed:d1b5:c043:3b79]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::50ed:d1b5:c043:3b79%2]) with mapi id 15.20.1709.015; Mon, 18 Mar 2019
 15:10:04 +0000
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
Thread-Index: AQHUyg/Kxp1YOB0bxEaB6SXWVnNLZ6Xw8WgAgCCnHWA=
Date:   Mon, 18 Mar 2019 15:10:04 +0000
Message-ID: <AM0PR04MB421102D948A6972B8A19C78880470@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-3-git-send-email-aisheng.dong@nxp.com>
 <155112397472.191923.18309287020361500256@swboyd.mtv.corp.google.com>
In-Reply-To: <155112397472.191923.18309287020361500256@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d9b4832-f2b5-4741-2da0-08d6abb3cd1d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4353;
x-ms-traffictypediagnostic: AM0PR04MB4353:
x-microsoft-antispam-prvs: <AM0PR04MB43537B12E7EBAB3F472F1BFB80470@AM0PR04MB4353.eurprd04.prod.outlook.com>
x-forefront-prvs: 098076C36C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(68736007)(476003)(9686003)(486006)(446003)(11346002)(3846002)(7736002)(2906002)(6116002)(55016002)(81166006)(81156014)(8936002)(8676002)(25786009)(229853002)(86362001)(52536014)(71200400001)(6436002)(66066001)(5660300002)(71190400001)(316002)(478600001)(14454004)(54906003)(99286004)(14444005)(256004)(186003)(2501003)(110136005)(6246003)(53936002)(44832011)(305945005)(102836004)(76176011)(7696005)(106356001)(33656002)(97736004)(6506007)(26005)(105586002)(74316002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4353;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LmiGEXz0uN2Lng5mRpxj/5wZeffEN+Qut6ulLBfrtLzRJkWe14Ty5DpyA18rVnyBQSvyexy8+cqK2RM8ZsBlN9yCw66GIBg8/q0HCGYaQSf9MvyaGYEnjEoX9aHC29hvWUy14bJ3qc/F/pdesfaKerof/w67ZtLH3QGV0VUDIE7ULgM8bzrJ5VoDuEc63dT8pzjBj0+QCFf9Os0nB8YHiA4gKEsQCYSNBs2RhRnOvjdk5IZns079+n2aPTahPrzHI7B7wudIPqr1k9gF4rQpbsHTByUMcCO7sn/K6bOaQS8OycqmaUYLy1fNN1419vnR4LAGGpOjEoI3amc3GHp0Zxb1m6RnE4uD3XNDkmOu/co4V+F8wM4JK//nLFLF8SfqGl4DWVJMYLju9pAin2Rj9x1Ap5GWo9iXpblIm5AbuGg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9b4832-f2b5-4741-2da0-08d6abb3cd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2019 15:10:04.7200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4353
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wy4uLl0NCg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svaW14OHF4cC1scGNnLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2lteDhxeHAtbHBjZy50eHQNCj4gPiBpbmRleCA5NjVjZmE0Li5hMzE3
ODQ0IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9pbXg4cXhwLWxwY2cudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2lteDhxeHAtbHBjZy50eHQNCj4gPiBAQCAtMTEsNiArMTEsMjAgQEAg
ZW5hYmxlZCBieSB0aGVzZSBjb250cm9sIGJpdHMsIGl0IG1pZ2h0IHN0aWxsIG5vdA0KPiA+IGJl
IHJ1bm5pbmcgYmFzZWQgIG9uIHRoZSBiYXNlIHJlc291cmNlLg0KPiA+DQo+ID4gIFJlcXVpcmVk
IHByb3BlcnRpZXM6DQo+ID4gKy0gY29tcGF0aWJsZTogICAgICAgICAgU2hvdWxkIGJlIG9uZSBv
ZjoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICJmc2wsaW14OHF4cC1scGNnIg0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgImZzbCxpbXg4cW0tbHBjZyIgZm9sbG93ZWQgYnkN
Cj4gImZzbCxpbXg4cXhwLWxwY2ciLg0KPiA+ICstIHJlZzogICAgICAgICAgICAgICAgIEFkZHJl
c3MgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc2V0Lg0KPiA+ICstICNjbG9jay1jZWxsczog
ICAgICAgICAgICAgICAgU2hvdWxkIGJlIDEuIE9uZSBMUENHIHN1cHBvcnRzIG11bHRpcGxlDQo+
IGNsb2Nrcy4NCj4gPiArLSBjbG9ja3M6ICAgICAgICAgICAgICBJbnB1dCBwYXJlbnQgY2xvY2tz
IHBoYW5kbGUgYXJyYXkgZm9yIGVhY2ggY2xvY2suDQo+ID4gKy0gYml0LW9mZnNldDogICAgICAg
ICAgQW4gaW50ZWdlciBhcnJheSBpbmRpY2F0aW5nIHRoZSBiaXQgb2Zmc2V0IGZvciBlYWNoDQo+
IGNsb2NrLg0KPiA+ICstIGh3LWF1dG9nYXRlOiAgICAgICAgIEJvb2xlYW4gYXJyYXkgaW5kaWNh
dGluZyB3aGV0aGVyIHN1cHBvcnRzIEhXDQo+IGF1dG9nYXRlIGZvcg0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGVhY2ggY2xvY2suDQo+IA0KPiBUaGlzIGxvb2tzIGxpa2Ugb25lIGNsayBw
ZXIgbm9kZSBzdHlsZSBvZiBiaW5kaW5ncyB3aGljaCBpcyBhIGRpcmVjdGlvbiB3ZSBkb24ndA0K
PiB3YW50IERUIGJpbmRpbmdzIHRvIGdvIGluLiBJdCBsZWFkcyB0byBhIGJ1bmNoIG9mIHRpbWUg
cGFyc2luZyBEVCB0byBnZW5lcmF0ZQ0KPiBjbGtzIGFuZCBpbiBnZW5lcmFsIGRvZXNuJ3QgcmVw
cmVzZW50IHRoZSBjbG9jayBjb250cm9sbGVyIGhhcmR3YXJlIHRoYXQgaXMNCj4gdGhlcmUuIEJh
c2ljYWxseSwgYW55dGhpbmcgd2l0aCAnYml0LW9mZnNldCcNCj4gaW4gdGhlIGJpbmRpbmcgaXMg
bm90IGdvaW5nIHRvIGJlIGFjY2VwdGFibGUuDQo+IA0KDQpUaGlzIGlzIG5vdCBvbmUgY2xrIHBl
ciBub2RlIGJ1dCBvbmUgY2xvY2sgY29udHJvbGxlciBwZXIgbm9kZSB3aGljaCBzdHJpY3RseQ0K
ZGVzY3JpYmVzIHRoZSBIVy4NCg0KT24gTVg4LCBlYWNoIExQQ0cgaXMgYSBzZXBhcmF0ZSBjbG9j
ayBjb250cm9sbGVyIHdoaWNoIGNhbiBjb250cm9sIGEgY291cGxlIG9mDQpjbG9jayBvdXRwdXQg
Z2F0ZXMgZm9yIG9uZSBzcGVjaWZpYyBkZXZpY2UgdG8gdXNlLiBFYWNoIGRldmljZSBoYXMgYSBj
b3JyZXNwb25kaW5nDQpMUENHIGNsb2NrIGNvbnRyb2xsZXIgYW5kIHRob3NlIExQQ0dzIGFyZSBp
bmRlcGVuZGVudCB3aXRoIGVhY2ggb3RoZXIgd2l0aA0Kc2VwYXJhdGUgSU8gc3BhY2UuDQoNClRo
b3NlIExQQ0dzIGFyZSBkaXN0cmlidXRlZCBpbiB2YXJpb3VzIFNTIChzdWJzeXN0ZW1zKSBhbG9u
ZyB3aXRoIGRldmljZSByZXNvdXJjZXMuDQpEZXNjcmliaW5nIHRoZW0gaW4gZGV2aWNlIHRyZWUg
U1MgZHRzaSBkb2Vzbid0IHNlZW0gdG8gYmUgYW4gaXNzdWUgYXMgaXQgaXMgcmVwcmVzZW50aW5n
DQp0aGUgcmVhbCBoYXJkd2FyZS4NCg0KRm9yIFNDVSBjbG9ja3MsIHRoZXkncmUgc2ltaWxhciBj
YXNlIHRoYXQgZWFjaCBTUyBoYXZpbmcgc2VwYXJhdGUgY2xvY2sgY29udHJvbGxlcnMNCkluIEhX
IHdoaWNoIGFyZSBtYW5hZ2VkIGJ5IFNDVSBmaXJtd2FyZS4gU28gaXQgc2VlbXMgYWxzbyBva2F5
IHRvIHB1dCB0aGVtDQppbiBkZXZpY2UgdHJlZSBTUyBkdHNpIGZpbGUsIHJpZ2h0Pw0KDQpJZiB5
b3UncmUgY29uY2VybmluZyBlYWNoIG5vZGUgaGF2aW5nIG9uZSBjb21wYXRpYmxlIHN0cmluZywg
aG93IGFib3V0IGRvaW5nIGxpa2UNCm1hbnkgcG93ZXIgZG9tYWluIGRvZXMgYXMgYmVsb3c/DQoN
CkhhdmluZyBvbmx5IG9uZSBjb21wYXRpYmxlIHN0cmluZyBpbiBjbG9jayBwYXJlbnQgbm9kZXMu
DQoNCi8vTFNJTyBTUw0KbHNpb19zY3VfY2xrOiBsc2lvLXNjdS1jbG9jay1jb250cm9sbGVyIHsN
CiAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1jbG9jayIsICJmc2wsc2N1LWNsayI7
DQoNCiAgICAgICAgZnNwaTBfY2xrOiBjbG9jay1mc3BpMHsNCiAgICAgICAgICAgICAgICAjY2xv
Y2stY2VsbHMgPSA8MD47DQogICAgICAgICAgICAgICAgcnNyYy1pZCA9IDxJTVhfU0NfUl9GU1BJ
XzA+Ow0KICAgICAgICAgICAgICAgIGNsay10eXBlID0gPElNWF9TQ19QTV9DTEtfUEVSPjsNCiAg
ICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9GU1BJXzA+Ow0KICAg
ICAgICB9Ow0KCQkNCgkJZnNwaTFfY2xrOiBjbG9jay1mc3BpMXsNCgkJCS4uLg0KCQl9Ow0KICAg
ICAgICAuLi4NCn07ICAgIA0KDQovKiBMUENHIGNsb2NrcyAqLw0KbHNpb19scGNnX2NsazogbHNp
by1scGNnLWNsb2NrLWNvbnRyb2xsZXIgew0KICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg4
cXhwLWxwY2ciOw0KDQogICAgICAgIHB3bTBfbHBjZzogY2xvY2stY29udHJvbGxlckA1ZDQwMDAw
MCB7DQogICAgICAgICAgICAgICAgcmVnID0gPDB4NWQ0MDAwMDAgMHgxMDAwMD47DQogICAgICAg
ICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Ow0KICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwm
cHdtMF9jbGs+LCA8JnB3bTBfY2xrPiwgPCZwd20wX2Nsaz4sDQogICAgICAgICAgICAgICAgICAg
ICAgICAgPCZsc2lvX2J1c19jbGs+LCA8JnB3bTBfY2xrPjsNCiAgICAgICAgICAgICAgICBiaXQt
b2Zmc2V0ID0gPDAgNCAxNiAyMCAyND47DQogICAgICAgICAgICAgICAgY2xvY2stb3V0cHV0LW5h
bWVzID0gInB3bTBfbHBjZ19pcGdfY2xrIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAicHdtMF9scGNnX2lwZ19oZl9jbGsiLA0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJwd20wX2xwY2dfaXBnX3NfY2xrIiwNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAicHdtMF9scGNnX2lwZ19zbHZfY2xrIiwNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAicHdtMF9scGNnX2lwZ19tc3RyX2NsayI7DQogICAgICAg
ICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfUFdNXzA+Ow0KICAgICAgICAg
ICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgIH07DQogICAgICAgIC4uLg0KfTsN
Cg0KSSBhbHNvIGhhdmUgc3BlbnQgYSBsb3QgdGltZSB0byBpbnZlc3RpZ2F0ZSBob3cgVEkgYW5k
IFNhbXN1bmcgZG9lcy4gSG93ZXZlciwgDQpmaW5hbGx5IGkuTVggaXMgc3RpbGwgZGlmZmVyZW50
IGFuZCBJIHN0aWxsIGJlbGlldmUgY3VycmVudCB3YXkgaXMgYmV0dGVyIGZvciBpLk1YLA0KbWFp
bmx5IGR1ZSB0byBiZWxvdyByZWFzb25zOg0KDQoxKSBJTVggaGF2aW5nIHNlcGFyYXRlIGNsb2Nr
IGNvbnRyb2xsZXJzIGluIEhXLCBub3Qgc2hhcmVkIG9uZSBsaWtlIG90aGVycw0KMikgSU1YIFNv
QyBpcyBjb21wcmlzZWQgb2YgdmFyaW91cyBIVyBTUyAoU3Vic3lzdGVtKSB3aGlsZSBvdGhlcnMg
ZG9uJ3QgaGF2ZS4NCiAgRGVzY3JpYmluZyBjbG9ja3MgaW4gRFQgY2FuIGhlbHAgYSBiZXR0ZXIg
U1cgYXJjaGl0ZWN0dXJlIHRvIGRlc2NyaWJlIEhXLg0KMykgRWFjaCBjbG9jayBpcyBhc3NvY2lh
dGVkIHdpdGggYSBwb3dlciBkb21haW4uIERUIGlzIHRoZSBiZXN0IHBsYWNlIHRvIGluZGljYXRl
IGl0Lg0KNCkgQ2xvY2sgYXZhaWxhYmlsaXR5IChCb3RoIFNDVSBhbmQgTFBDRykgYXJlIGNvbmZp
Z3VyYWJsZSBhY2NvcmRpbmcgdG8NCiAgZGlmZmVyZW50IEhXIHBhcnRpdGlvbiBjb25maWd1cmF0
aW9uIGJ5IFNDVSBmaXJtd2FyZS4NCiAgRGVmaW5pbmcgdGhlbSBhbGwgaW4gZHJpdmVyIHdpbGwg
Y2F1c2UgYW5ub3lpbmcgYW5kIGNvbnRpbnVlZCBjaHVybiBpbiBkcml2ZXINCiAgYWxsIHRoZSB0
aW1lIHdoZW4gYWRkaW5nIG5ldyBTb0Mgc3VwcG9ydC4NCiAgZS5nLiANCiAgSGFuZGxpbmcgYXZh
aWxhYmlsaXR5IGZvciBkaWZmZXJlbnQgU1MgaW4gZGlmZmVyZW50IFNvQy4NCiAgRGVmaW5pbmcg
Q2xvY2sgSURzIGZvciBkaWZlcmVudCBTUyBpbiBkaWZmZXJlbnQgU29DIGZvciBzYW1lIGNsb2Nr
cy4NCg0KQnkgcHV0dGluZyBjbG9ja3MgaW4gRFQsIHdlIGNhbiBtYWtlIHRoZSBjbG9jayBkcml2
ZXIgY29tcGxldGVseSBnZW5lcmljIGFuZA0Kbm8gbW9yZSBjaHVybiBpbiB0aGUgZHJpdmVyIGFu
eW1vcmUgaW4gdGhlIGZ1dHVyZSBmb3IgYWRkaW5nIG5ldyBTb0Mgc3VwcG9ydC4NCkl0IGNhbiBz
aWduaWZpY2FudGx5IHNhdmUgdGhlIGRyaXZlciBtYWludGFpbiBlZmZvcnQuDQoNCkxhc3QsIHRo
aXMgd29uJ3QgYnJlYWsgY29tcGF0aWJpbGl0eS4gSXQncyBqdXN0IGludHJvZHVjZSBhIG5ldyBi
aW5kaW5nLg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg0KPiA+ICstIGNsb2NrLW91dHB1dC1u
YW1lczogIFNoYWxsIGJlIHRoZSBjb3JyZXNwb25kaW5nIG5hbWVzIG9mIHRoZSBvdXRwdXRzLg0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIE5PVEUgdGhpcyBwcm9wZXJ0eSBtdXN0IGJlIHNw
ZWNpZmllZCBpbiB0aGUNCj4gc2FtZSBvcmRlcg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGFzIHRoZSBjbG9jayBiaXQtb2Zmc2V0IGFuZCBody1hdXRvZ2F0ZSBwcm9wZXJ0eS4NCj4gPiAr
DQo+ID4gK0xlZ2FjeSBiaW5kaW5nIChERVBSRUNBVEVEKToNCj4gPiAgLSBjb21wYXRpYmxlOiAg
U2hvdWxkIGJlIG9uZSBvZjoNCj4gPiAgICAgICAgICAgICAgICAgICAiZnNsLGlteDhxeHAtbHBj
Zy1hZG1hIiwNCg==
