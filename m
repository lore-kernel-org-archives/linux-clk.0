Return-Path: <SRS0=6R0q=TX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32334C04AAC
	for <linux-clk@archiver.kernel.org>; Thu, 23 May 2019 05:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC7D120881
	for <linux-clk@archiver.kernel.org>; Thu, 23 May 2019 05:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="CNxpHC6c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfEWFff (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 May 2019 01:35:35 -0400
Received: from mail-eopbgr10067.outbound.protection.outlook.com ([40.107.1.67]:25857
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725786AbfEWFff (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 23 May 2019 01:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMH8RD8sl6yUuOIvyzYCW/6JsQEdmgntuaXBC/M1Nfw=;
 b=CNxpHC6cQDpS1KDIvrQXH5tYWaNtNFNv6fbFeq0DrW9KuHI/SX1ll2AmEIfNFfoMue9HJaFsC89tfkJNOgEVQFT3FAYHHf5coNB567gm8EP8cgI/hgzYjVQt4Mdh4YSPGUv+P9Orx+WEJhOgQwJdoxz3A9ElGVpTXczry17qyU4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5875.eurprd04.prod.outlook.com (20.178.203.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 23 May 2019 05:35:30 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c415:3cab:a042:2e13]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c415:3cab:a042:2e13%6]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 05:35:30 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V2 2/2] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Thread-Topic: [PATCH V2 2/2] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Index: AQHU/3scQmNSzEByRUu6j1Pj1Cb9paZ4UX7w
Date:   Thu, 23 May 2019 05:35:30 +0000
Message-ID: <AM0PR04MB4211D5D802D1F216F73360E580010@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
 <1556645270-20648-3-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB64342D68FBE19FFE3A5BC618EE060@AM0PR04MB6434.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB64342D68FBE19FFE3A5BC618EE060@AM0PR04MB6434.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f42ede5a-2e72-4aec-ca3b-08d6df407844
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5875;
x-ms-traffictypediagnostic: AM0PR04MB5875:
x-microsoft-antispam-prvs: <AM0PR04MB587566B3CFAA3FA2E56A22AA80010@AM0PR04MB5875.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(26005)(6246003)(229853002)(99286004)(186003)(74316002)(5660300002)(52536014)(81166006)(76176011)(8936002)(81156014)(71190400001)(86362001)(66066001)(478600001)(71200400001)(8676002)(476003)(44832011)(486006)(53936002)(7736002)(66476007)(66446008)(110136005)(64756008)(256004)(6116002)(66946007)(54906003)(66556008)(73956011)(76116006)(14454004)(6506007)(25786009)(53546011)(14444005)(305945005)(55016002)(6436002)(102836004)(316002)(446003)(2906002)(9686003)(68736007)(33656002)(3846002)(7696005)(2501003)(11346002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5875;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P4OPUsnL9CRVIJXitAmvsoHtQsRxl6tMRfLk3cG+M7XWpEmT0NQV+lw/X0eR8ubKOPitmkT/x0o2Ak7BbdKoQIcBh3ls2Au4h6eRdYbL6MhEEoENlVygIyUxWdR8+zFM+Heh/VoEgpLCtxlk9Umwfh5Fhu+JSi82UHUXXxfuM/n2y7qbXieX/DjR/Z4U7aqXLLMBufzmzGld/mItCL2q0+3QrsTRhc9ggsKu143/lxBkIGfIiqt+xNWVPI1MIBITwJUm879NVYFiOFhlDWg3USMA3m+wwwn+Ttq8eCudTa81FIy5GqwBp4qvRsYvccmBJvUkweXQS6SSh65jOovgfMibJj7LFmhpvilNhpCYFWBFg5fmmSLbWV1Dn3ZMXyjMeTHbsJQWemYzWGGKfLFa53sWZTFN1Fmy6lPJ4Nb/c5s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42ede5a-2e72-4aec-ca3b-08d6df407844
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 05:35:30.7349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5875
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBMZW9uYXJkIENyZXN0ZXoNCj4gU2VudDogTW9uZGF5LCBNYXkgMjAsIDIwMTkgNzo0
NSBQTQ0KPiANCj4gT24gMzAuMDQuMjAxOSAyMDozNSwgQWlzaGVuZyBEb25nIHdyb3RlOg0KPiA+
IE1YOFFNIGFuZCBNWDhRWFAgTFBDRyBDbG9ja3MgYXJlIG1vc3RseSB0aGUgc2FtZSBleGNlcHQg
dGhleSBtYXkNCj4gPiByZXNpZGUgaW4gZGlmZmVyZW50IHN1YnN5c3RlbXMgYWNyb3NzIENQVXMg
YW5kIGFsc28gdmFyeSBhIGJpdCBvbiB0aGUNCj4gYXZhaWxhYmlsaXR5Lg0KPiA+DQo+ID4gU2Ft
ZSBhcyBTQ1UgY2xvY2ssIHdlIHdhbnQgdG8gbW92ZSB0aGUgY2xvY2sgZGVmaW5pdGlvbiBpbnRv
IGRldmljZQ0KPiA+IHRyZWUgd2hpY2ggY2FuIGZ1bGx5IGRlY291cGxlIHRoZSBkZXBlbmRlbmN5
IG9mIENsb2NrIElEIGRlZmluaXRpb24NCj4gPiBmcm9tIGRldmljZSB0cmVlIGFuZCBtYWtlIHVz
IGJlIGFibGUgdG8gd3JpdGUgYSBmdWxseSBnZW5lcmljIGxwY2cgY2xvY2sNCj4gZHJpdmVyLg0K
PiA+DQo+ID4gQW5kIHdlIGNhbiBhbHNvIHVzZSB0aGUgZXhpc3RlbmNlIG9mIGNsb2NrIG5vZGVz
IGluIGRldmljZSB0cmVlIHRvDQo+ID4gYWRkcmVzcyB0aGUgZGV2aWNlIGFuZCBjbG9jayBhdmFp
bGFiaWxpdHkgZGlmZmVyZW5jZXMgYWNyb3NzIGRpZmZlcmVudCBTb0NzLg0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9pbXg4cXhw
LWxwY2cudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
aW14OHF4cC1scGNnLnR4dA0KPiA+DQo+ID4gICBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICst
IGNvbXBhdGlibGU6CQlTaG91bGQgYmUgb25lIG9mOg0KPiA+ICsJCQkgICJmc2wsaW14OHF4cC1s
cGNnIg0KPiA+ICsJCQkgICJmc2wsaW14OHFtLWxwY2ciIGZvbGxvd2VkIGJ5ICJmc2wsaW14OHF4
cC1scGNnIi4NCj4gPiArLSByZWc6CQkJQWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3Rl
ciBzZXQuDQo+ID4gKy0gI2Nsb2NrLWNlbGxzOgkJU2hvdWxkIGJlIDEuIE9uZSBMUENHIHN1cHBv
cnRzIG11bHRpcGxlIGNsb2Nrcy4NCj4gPiArLSBjbG9ja3M6CQlJbnB1dCBwYXJlbnQgY2xvY2tz
IHBoYW5kbGUgYXJyYXkgZm9yIGVhY2ggY2xvY2suDQo+ID4gKy0gYml0LW9mZnNldDoJCUFuIGlu
dGVnZXIgYXJyYXkgaW5kaWNhdGluZyB0aGUgYml0IG9mZnNldCBmb3IgZWFjaCBjbG9jay4NCj4g
PiArLSBody1hdXRvZ2F0ZToJCUJvb2xlYW4gYXJyYXkgaW5kaWNhdGluZyB3aGV0aGVyIHN1cHBv
cnRzIEhXDQo+IGF1dG9nYXRlIGZvcg0KPiA+ICsJCQllYWNoIGNsb2NrLg0KPiA+ICstIGNsb2Nr
LW91dHB1dC1uYW1lczoJU2hhbGwgYmUgdGhlIGNvcnJlc3BvbmRpbmcgbmFtZXMgb2YgdGhlIG91
dHB1dHMuDQo+ID4gKwkJCU5PVEUgdGhpcyBwcm9wZXJ0eSBtdXN0IGJlIHNwZWNpZmllZCBpbiB0
aGUgc2FtZSBvcmRlcg0KPiA+ICsJCQlhcyB0aGUgY2xvY2sgYml0LW9mZnNldCBhbmQgaHctYXV0
b2dhdGUgcHJvcGVydHkuDQo+IA0KPiBTcGxpdHRpbmcgdGhlIExQQ0cgYXJlYXMgaXMgZ29vZCBi
dXQgZGVzY3JpYmluZyAiYml0LW9mZnNldCIgYW5kIHNpbWlsYXIgaW5zaWRlDQo+IGRldmljZXRy
ZWUgc2VlbXMgZXhjZXNzaXZlbHkgZ2VuZXJpYy4NCj4gDQo+IFBlcmhhcHMgd2UgY291bGQgaGF2
ZSBtYW55IHNtYWxsZXIgaW14OHF4cC1scGNnLXNkaGMsIGlteDhxeHAtbHBjZy1lbmV0DQo+IGV0
YyB3aGVyZSB0aGUgYWN0dWFsIGNsa3MgaW5zaWRlIGVhY2ggbm9kZSBhcmUgc3RpbGwgZGVmaW5l
ZCBpbiBkcml2ZXIgY29kZS4NCj4gDQoNCklmIHRoYXQgd2F5LCB3ZSB3b3VsZCBoYXZlIHRvbyBt
YW55IG1vcmUgY29tcGF0aWJsZSBzdHJpbmdzIHBlciBjbG9ja3MNCmFuZCB3ZSBoYXZlIHRvIGFk
ZCBtb3JlIGZvciBuZXcgU29DcyB3aGljaCBJJ2QgbGlrZSB0byBhdm9pZC4NCg0KPiA+ICAgdXNk
aGMxOiBtbWNANWIwMTAwMDAgew0KPiA+IEBAIC00NCw4ICs2Niw4IEBAIHVzZGhjMTogbW1jQDVi
MDEwMDAwIHsNCj4gPiAgIAlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KPiA+ICAgCWludGVy
cnVwdHMgPSA8R0lDX1NQSSAyMzIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gICAJcmVnID0g
PDB4NWIwMTAwMDAgMHgxMDAwMD47DQo+ID4gLQljbG9ja3MgPSA8JmNvbm5fbHBjZyBJTVg4UVhQ
X0NPTk5fTFBDR19TREhDMF9JUEdfQ0xLPiwNCj4gPiAtCQkgPCZjb25uX2xwY2cgSU1YOFFYUF9D
T05OX0xQQ0dfU0RIQzBfUEVSX0NMSz4sDQo+ID4gLQkJIDwmY29ubl9scGNnIElNWDhRWFBfQ09O
Tl9MUENHX1NESEMwX0hDTEs+Ow0KPiA+ICsJY2xvY2tzID0gPCZzZGhjMF9scGNnIDE+LA0KPiA+
ICsJCSA8JnNkaGMwX2xwY2cgMD4sDQo+ID4gKwkJIDwmc2RoYzBfbHBjZyAyPjsNCj4gDQo+IFRo
aXMgaXMgbGVzcyByZWFkYWJsZSwgY2FuJ3Qgd2Uga2VlcCBzeW1ib2xpYyBjb25zdGFudHM/DQoN
CkknbSBzY2FyZWQgdG8gZGVmaW5lIG1vcmUgbWFjcm9zIGZvciBkZXZpY2UgY2xvY2tzLg0KSXQn
cyB1c3VhbGx5IGEgb25lIHRpbWUgam9iIGFuZCBjb3VsZCBiZSByZWZlcmVuY2VkIGVhc2lseSBi
eSBsb29raW5nIGludG8NCnRoZSBkZWZpbml0aW9uIG9mIHNkaGMwX2xwY2cgaW4gRFQuDQpTbyBs
ZXNzIHJlYWRhYmxlIG1heSBub3QgYmUgYSByZWFsIHByb2JsZW0uDQoNClJlZ2FyZHMNCkRvbmcg
QWlzaGVuZw0K
