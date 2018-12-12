Return-Path: <SRS0=3egD=OV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D8CC6783B
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 01:09:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3099D2084E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 01:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aLmrH0xj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3099D2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbeLLBJb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:09:31 -0500
Received: from mail-eopbgr140088.outbound.protection.outlook.com ([40.107.14.88]:62311
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726218AbeLLBJb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Dec 2018 20:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka3PsR2rjbNKxoDoy7R4u6MDmTcGI6lWNx3MoQ6LbaY=;
 b=aLmrH0xjYjk0rp6LxntzTXE6SurrbFXQHOEcyHS0ilv0XvMLP6OFZV9xPXAuII/2moYwxiBhUUmVqAp8gZ9vN43cwSAGJi2g2KS5kcJLL952NqIUCm38CNp36hCIICinZb+2D6OnTDBPsuz85Njl2aQlzS4YmyA4Q6H1KfOkpYI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0SPR01MB17.eurprd04.prod.outlook.com (52.134.125.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.18; Wed, 12 Dec 2018 01:09:26 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Wed, 12 Dec 2018
 01:09:26 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V9 1/7] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V9 1/7] clk: imx: add configuration option for mmio clks
Thread-Index: AQHUi98lQ6o73Estskm1k5h96wz2oqV4fYEAgABeCkCAARxjAIAAXN6Q
Date:   Wed, 12 Dec 2018 01:09:26 +0000
Message-ID: <AM0PR04MB4211D9C32A4DDCCF266B60C380A70@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
 <1543934041-12572-2-git-send-email-aisheng.dong@nxp.com>
 <154447530435.17204.3027810086542897433@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211B87A842FB8AF14621E3380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154455657071.17204.2493209125185218529@swboyd.mtv.corp.google.com>
In-Reply-To: <154455657071.17204.2493209125185218529@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0SPR01MB17;6:XBXBnbADfPXtuBZ4VtEir8aw/LbZOghsXxKw1vKYFPsAfSNzxGgp5su2FDRqBZdNZV61ZAsAMnA/M1a+vva1/YQUPbK6zGfTiOh6uZR4v93SGLoT9y7aA8Jvu69s4dh0+JDZqkndFNuwqhX2EtF2R9cwAfrCgZrNW979JCsCoqcgJFRrulnUEJM7ofVV1SOBcAT7Jgfs+qbnt2dcTN1Oi5zDcCmQSPuR7FCQgrnYvxpXloc29efsfPHnIFZt4YM5ZMqSCPpLMgPtlIx7N8SQj1e0F0uTrGxP4UM7zIq5G0S3kMNc8kM4b7h96her11cXljTZNREaI3mWDieVG51wJJVKSjJMpK7/AdpqcAhrOBy/SpMbREj2XFqEHa9xRapA/CX9E6+28bM+/5fLILTtrcPN46hGqiEFU3dhZ5moU0SdsiCW/cwm+RCfKNWazkGrDuLuGXsohRHElS2T+opkOQ==;5:6YonEZIAAutO49XkUP8kjg4YaiOTg+FTRyeDoD4QrX9nbc24q1jz/lIu9CzxHYeQXJnBWXorWb83jSwwPp5SR2ZbPr7engC0OnsOpZTwo2VwCp10sey0xSCkERWP7k8IxdaC1Q3DYNTUcIsv2PYA4EqgOJV4fo01gwH59GWdwFU=;7:uPC/qhO1GVoNcDjJvxWWfuqE4918yUi2rKL5HFsyTLVYp6/dXwrR2f6Vo/OjyZfvPshYdpL5jzRGGfbWP2/PIYkjJYw/9UDh4ILEpVBg3tWGoioh2eZBdyYNFXV1P8OXWkNm0X697uTM1JKCDMg7/w==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f074a389-100f-4567-c088-08d65fce75c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0SPR01MB17;
x-ms-traffictypediagnostic: AM0SPR01MB17:
x-microsoft-antispam-prvs: <AM0SPR01MB173AAC408FFBB2CC4FAFC580A70@AM0SPR01MB17.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0SPR01MB17;BCL:0;PCL:0;RULEID:;SRVR:AM0SPR01MB17;
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(376002)(39860400002)(366004)(136003)(51914003)(13464003)(199004)(189003)(105586002)(476003)(44832011)(8936002)(106356001)(486006)(25786009)(4001150100001)(66066001)(81156014)(256004)(14444005)(8676002)(14454004)(81166006)(6436002)(55016002)(74316002)(33656002)(68736007)(9686003)(229853002)(6246003)(4326008)(53936002)(5660300001)(99286004)(76176011)(7736002)(305945005)(6506007)(71190400001)(71200400001)(446003)(6116002)(2501003)(3846002)(2906002)(11346002)(93886005)(86362001)(575784001)(110136005)(316002)(7696005)(97736004)(54906003)(478600001)(26005)(102836004)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0SPR01MB17;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: lpQ1ew7Le25+r0UY3jISAkkAiFrD2a/8382SQs8EuMEB+STYhyP02nPWBLK0hVLCt52FU8nUmwrLbf4pR/z6eMn/qw862nj/U80Sl6Mn8HDHqehymeFCJdW2097jAyiG7jPa8unXCX7MHpHD0bPpu5DFZzkCMxoFpCFm+c1du9V4adgJvXff4DG8bQ87fPq5ylMQxxlXeUvawDQi9Jq8RSQkfuI2hxONTOt2HbAyaSdF4Jao+iV9bifEct4bMmtCOk/FNUaehixeQ0Re2sfSN7cLtOaijrWmN3mCdeICOzhMnRkcPSMaSCmHEHYV88Kg
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f074a389-100f-4567-c088-08d65fce75c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 01:09:26.2501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB17
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5nIEFpc2hlbmcgRG9uZyAoMjAxOC0xMi0xMCAx
ODozNjoyOSkNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBT
dGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiA+ID4gU2VudDogVHVlc2Rh
eSwgRGVjZW1iZXIgMTEsIDIwMTggNDo1NSBBTQ0KPiA+IFsuLi5dDQo+ID4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFY5IDEvN10gY2xrOiBpbXg6IGFkZCBjb25maWd1cmF0aW9uIG9wdGlvbiBmb3IN
Cj4gPiA+IG1taW8gY2xrcw0KPiA+ID4NCj4gPiA+IFF1b3RpbmcgQWlzaGVuZyBET05HICgyMDE4
LTEyLTA0IDA2OjM5OjIyKQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1pbXgv
S2NvbmZpZyBiL2FyY2gvYXJtL21hY2gtaW14L0tjb25maWcNCj4gPiA+ID4gaW5kZXggYzEyYTA1
Yy4uMzAzMDgyYyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvYXJjaC9hcm0vbWFjaC1pbXgvS2NvbmZp
Zw0KPiA+ID4gPiArKysgYi9hcmNoL2FybS9tYWNoLWlteC9LY29uZmlnDQo+ID4gPiA+IEBAIC01
NzAsNiArNTgwLDcgQEAgY29uZmlnIFNPQ19JTVg3VUxQICBjb25maWcgU09DX1ZGNjEwDQo+ID4g
PiA+ICAgICAgICAgYm9vbCAiVnlicmlkIEZhbWlseSBWRjYxMCBzdXBwb3J0Ig0KPiA+ID4gPiAg
ICAgICAgIHNlbGVjdCBBUk1fR0lDIGlmIEFSQ0hfTVVMVElfVjcNCj4gPiA+ID4gKyAgICAgICBz
ZWxlY3QgTVhDX0NMSw0KPiA+ID4gPiAgICAgICAgIHNlbGVjdCBQSU5DVFJMX1ZGNjEwDQo+ID4g
PiA+DQo+ID4gPg0KPiA+ID4gSW5zdGVhZCBvZiBzZWxlY3QgY2FuIHdlIGJyZWFrIHRoaXMgZGVw
ZW5kZW5jeSBvbiB0aGUgYXJjaCBLY29uZmlnDQo+ID4gPiBhbmQNCj4gPiA+IGhhdmU6DQo+ID4g
Pg0KPiA+ID4gICAgICAgY29uZmlnIE1YQ19DTEsNCj4gPiA+ICAgICAgICAgICAgICAgZGVmX2Jv
b2wgQVJDSF9NWEMgJiYgIUFSTTY0DQo+ID4gPg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgc3Vn
Z2VzdGlvbi4NCj4gPiBPbmUgbGl0dGxlIHByb2JsZW0gaXMgdGhhdCB3ZSBhbHNvIGhhdmUgTFMx
MDIxIHN1cHBvcnRlZCB1bmRlcg0KPiA+IEFSQ0hfTVhDIHdoaWNoIGRvZXMgbm90IHVzZSBNWENf
Q0xLLg0KPiANCj4gT2suIFNvIHRoZW4geW91ciBjaGFuZ2UgaXMgYWxzbyBsaW1pdGluZyB0aGUg
Y29tcGlsYXRpb24gb2YgZHJpdmVycy9jbGsvaW14LyB0bw0KPiBvbmx5IHRoZSBwbGF0Zm9ybXMg
dGhhdCBzZWxlY3QgaXQgbm93LCBpbnN0ZWFkIG9mIGFsbCBBUkNIX01YQyBsaWtlIGl0IHdhcyBk
b25lDQo+IGJlZm9yZS4NCj4gDQo+IFdlIGNhbiBhbHNvIGhhdmUgZGVmX2Jvb2wgPGJpZyBsaXN0
IG9mIFNvQyBwbGF0Zm9ybXM+IGlmIHRoYXQgaGVscHMgZm9yIHRoZQ0KPiBvcHRpbWl6YXRpb24g
dGhhdCB0aGlzIHBhdGNoIGlzIG1ha2luZy4NCj4gDQo+IGFybS1zb2MgaGFzIGdlbmVyYWxseSBw
dXNoZWQgYWdhaW5zdCBoYXZpbmcgc28gbWFueSBkaWZmZXJlbnQgYXJjaCBsZXZlbA0KPiBLY29u
ZmlnIG9wdGlvbnMgYmVjYXVzZSB0aGV5IG1ha2UgZm9yIHVud2llbGR5IEtjb25maWcgZnJhZ21l
bnRzIHRoYXQgbWF5DQo+IGJlY29tZSBjb25mbGljdGluZy4gSW5zdGVhZCwgdGhlIG9wdGlvbnMg
Zm9yIHRoZSBkaWZmZXJlbnQgU29DcyBhcmUgcmVtb3ZlZA0KPiBhbmQgd2UganVzdCBoYXZlIG9u
ZSBmb3IgdGhlIHBsYXRmb3JtIGFuZCByZWx5IG9uIGRlZmNvbmZpZ3MgdG8gcGljayB0aGUgcmln
aHQNCj4gZHJpdmVycy4NCj4gDQoNClRoYW5rcyBmb3IgdGVsbGluZyB0aGUgZGV0YWlsZWQgYmFj
a2dyb3VuZC4gVmVyeSBjbGVhciBub3cuDQoNCj4gV2h5IGNhbid0IHdlIGRvIHRoYXQgaGVyZT8N
Cj4gDQo+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lteC9NYWtlZmlsZSBi
L2RyaXZlcnMvY2xrL2lteC9NYWtlZmlsZQ0KPiA+ID4gPiBpbmRleA0KPiA+ID4gPiA1YzBiMTFl
Li5mODUwNDI0IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Nsay9pbXgvTWFrZWZpbGUN
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvaW14L01ha2VmaWxlDQo+ID4gPiA+IEBAIC0xLDYg
KzEsNiBAQA0KPiA+ID4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+
ID4gPg0KPiA+ID4gPiAtb2JqLXkgKz0gXA0KPiA+ID4gPiArb2JqLSQoQ09ORklHX01YQ19DTEsp
ICs9IFwNCj4gPiA+DQo+ID4gPiBCZWNhdXNlIHRoaXMgY2hhbmdlcyB0byBvYmotJChDT05GSUcp
IHdlIHNob3VsZCBjaGFuZ2UgdGhlDQo+ID4gPiBkcml2ZXJzL2Nsay9NYWtlZmlsZSB0byBoYXZl
IG9iai15IGZvciB0aGlzIE1ha2VmaWxlIGluc3RlYWQgb2YNCj4gPiA+IGRlcGVuZGluZyBvbiBB
UkNIX01YQy4NCj4gPg0KPiA+IFdlIGFsc28gdXNlIEFSQ0hfTVhDIGZvciBBUk12OCBTb0MgY2xv
Y2tzLg0KPiANCj4gWWVzLCBhbmQ/IEknbSBzdWdnZXN0aW5nIGRyaXZlcnMvY2xrL01ha2VmaWxl
IGhhdmUgYW4gb2JqLXkgKz0gZHJpdmVycy9jbGsvaW14Lw0KPiBhbmQgdGhlbiBkZWNpZGUgdG8g
Y29tcGlsZSBvciBub3QgY29tcGlsZSB0aGUgTVhDX0NMSyAiY29yZSIgYml0cyBiYXNlZCBvbg0K
PiBDT05GSUdfTVhDX0NMSyBjb25maWcgb3B0aW9uLg0KDQpTb3JyeSBmb3IgdGhlIG1pc3N1bmRl
cnN0YW5kaW5nIGJlZm9yZS4NCkkgZ3Vlc3MgeW91IHBvaW50IGlzIGhhdmUgYW4gb2piLXkgKz0g
ZHJpdnJzL2Nsay9pbXgvDQpUaGVuIGluIGRyaXZlcnMvY2xrL2lteC9LY29uZmlnDQpjb25maWcg
TVhDX0NMSw0KCQlkZWZfYm9vbCBBUkNIX01YQyAmJiAhQVJNNjQNCgkJc2VsZWN0IE1YQ19jbGsg
Yml0cw0KY29uZmlnIE1YQ19DTEtfU0NVDQoJCWRlZl9ib29sIEFSQ0hfTVhDICYmIEFSTTY0DQoJ
CXNlbGVjdCBTQ1UgY2xvY2sgYml0cw0KDQpJZiB3cm9uZyBwbGVhc2UgbGV0IG1lIGtub3cuDQoN
CldpbGwgdXBkYXRlIHRoZSBwYXRjaCBzZXJpZXMgYW5kIHJlLXNlbmQuDQpUaGFua3MgZm9yIHRo
ZSBzdWdnZXN0aW9uLg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==
