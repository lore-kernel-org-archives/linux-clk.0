Return-Path: <SRS0=PmFx=O6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80739C43387
	for <linux-clk@archiver.kernel.org>; Fri, 21 Dec 2018 01:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D826F218FE
	for <linux-clk@archiver.kernel.org>; Fri, 21 Dec 2018 01:44:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="snQN/t2D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388229AbeLUBoe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 20:44:34 -0500
Received: from mail-eopbgr50047.outbound.protection.outlook.com ([40.107.5.47]:58688
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730104AbeLUBoe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 20 Dec 2018 20:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2hQA/aYd6cVTC4BrkCrILKKlnWveT/yCkOsYRJrbmA=;
 b=snQN/t2DogU4JRUdr6v2kdFsLdQDHYVBiN3GAyBRrQJoEYJhAEGjrkaYTvMPQ4273pwW1fGU/kwxeza3eqMYzUmj5UOyemwx+s21FFFYqP/2Dt/oJ9Gerv6lxx8pazcSQtrsylVVf6dXmqoDEPZQymz0lIOHnVec0KXiD/iaGI4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4465.eurprd04.prod.outlook.com (52.135.148.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.22; Fri, 21 Dec 2018 01:44:29 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::9125:e806:7303:d8e6]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::9125:e806:7303:d8e6%7]) with mapi id 15.20.1446.020; Fri, 21 Dec 2018
 01:44:29 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
Thread-Topic: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
Thread-Index: AQHUl69S+HgseDOVoEaFEXoCLLe+SaWGS2qAgADXyCCAAOU2gIAAY27w
Date:   Fri, 21 Dec 2018 01:44:28 +0000
Message-ID: <AM0PR04MB4211F8786714DD6CCBB55F0A80B80@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com>
 <1545232888-9302-5-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com>
 <VI1PR04MB4222ABD43B82BD3C0B73404780BF0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <154533484105.79149.16225192496445475758@swboyd.mtv.corp.google.com>
In-Reply-To: <154533484105.79149.16225192496445475758@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4465;6:aijJLbJrV594lxxaUWsYh0uZGn1V5fKeuuM9ppXlw1w2rxQKpwOYb9wKoXE8Vxh581//JoTRe9N9WL4Guf892ytgUH2HetTCExciMtkDUmhwYdYv9jYqNBTgbKdGFnrt0KGrMHobh54YqaOCsCEarUagRVsydMG3awmBdKhzOhstMhtXaWjo6c/Emvtq5OtVGlN89pKy0Xr658Zh1FiQGn9QnI/y1BApnZnvkvWDwnTy5rupuT6IW3Q2mTtRqHeHCswpBIv5sa2lKjf6HSa/8a8/fkVeDqtBLnOj+2qiVXrUjVNn+p/nnSbETyKHggBe02mGFwawPqzDCETuyi2dVF4Sx3jduZHxrbt/huXkbIFVtlgDgI7mh1aaIru0p0DG6q5By1UVfViwnAN7uiFM40rmAU6Oq9icOuGFB4iNh2ufS0v57jTOXdBaWQG/DeOaw755M8cVdFqt26H4yG/9NQ==;5:Vreyjt8w0wVpLPV7DDWrBrD4+pcZUeHOi7Hn5kECf7iXiNIcgjU85DE87pmDYQjrIKbDsr2hLHWQpFXLDZYv2mUD9C5D9nYpnwr8F+tjUb3RThTc6QgTWCA3e2v9m0+U2mjcXke7Mi+3mQ+TdYa7egPRxbxgOXBmDGE9tkp7Fa0=;7:gQNyEf7pQPld+meWIqSrGHbLwPlxwFOowcz+wMpIYOrEmqkbxir5JSjDuuZx+1h8e5R26iQxUcryMz+oVZuUjsOgC6hoxeh13mB82tV8GwgEj70K0NAZ+Ku+FPUo5QAufvaOIfIsdHG4jCUVi7uc7g==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: bc0f98d2-a849-454e-7921-08d666e5d8d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4465;
x-ms-traffictypediagnostic: AM0PR04MB4465:
x-microsoft-antispam-prvs: <AM0PR04MB44657853F0058ED3B752908A80B80@AM0PR04MB4465.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(5005026)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4465;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4465;
x-forefront-prvs: 0893636978
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(39860400002)(366004)(136003)(376002)(199004)(189003)(13464003)(14444005)(76176011)(256004)(7696005)(476003)(11346002)(68736007)(5660300001)(25786009)(486006)(44832011)(54906003)(6246003)(39060400002)(71190400001)(229853002)(110136005)(71200400001)(86362001)(93886005)(53936002)(2906002)(55016002)(9686003)(4326008)(316002)(2501003)(99286004)(105586002)(305945005)(74316002)(97736004)(7736002)(6116002)(14454004)(106356001)(3846002)(6436002)(66066001)(8936002)(81156014)(446003)(8676002)(33656002)(81166006)(478600001)(4001150100001)(26005)(186003)(53546011)(102836004)(6506007)(41533002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4465;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: izz7vx5alLWFwTHjEdERmTTlcdfwUtHjVT86/p4iv/wGYm78MfSKeghQcMaBDV1YOPJF4yIJwHoSB3r5fX2T67jq/FPHFpoxTXZYUcogdP9InhwuuI04CEFbmOPOuuvoRJlGrjkju86a+4hkGuChDbLv7lnM52zl9Lk8dSBdwA+emG+bdhCIFJxUiADtcgB7zlwJsBXGycm246uaCaJBuqQgupW/qmEw34PNvbHDQLqCG4A+Td+AzplPubEhSBeB+j8iEeLFXceyQ8LDsb3Qrv9xQuJNjkVqawVsDgEEYSDkShhj7cgmXV7Zz+y0ZhO7
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0f98d2-a849-454e-7921-08d666e5d8d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2018 01:44:28.9523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4465
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5nIEFpc2hlbmcgRG9uZyAoMjAxOC0xMi0xOSAy
MjoyNjo1MCkNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBG
YWJpbyBFc3RldmFtIFttYWlsdG86ZmVzdGV2YW1AZ21haWwuY29tXSBIaSBBaXNoZW5nLA0KPiA+
ID4NCj4gPiA+IE9uIFdlZCwgRGVjIDE5LCAyMDE4IGF0IDE6MjkgUE0gQWlzaGVuZyBEb25nDQo+
IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBT
Q1UgY2xvY2sgY2FuIGJlIHVzZWQgaW4gYSBzaW1pbGFyIHdheSBieSBJTVg4UVhQIGFuZCBJTVg4
UU0gU29Dcy4NCj4gPiA+ID4gTGV0J3MgbWFrZSB0aGUgbmFtZSBvZiBjbG9jayBJRCBnZW5lcmlj
IHRvIGFsbG93IG90aGVyIFNvQ3MgdG8NCj4gPiA+ID4gcmV1c2UgdGhlIGNvbW1vbiBwYXJ0Lg0K
PiA+ID4gPg0KPiA+ID4gPiBUaGlzIHBhdGNoIG9ubHkgY2hhbmdlcyB0aGUgY2xvY2sgaWQgbmFt
ZSBhbmQgZmlsZSBuYW1lLCBzbyBubw0KPiA+ID4gPiBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gPiA+
ID4NCj4gPiA+ID4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCj4gPiA+ID4g
Q2M6IFNhc2NoYSBIYXVlciA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gPiBDYzogRmFi
aW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPg0KPiA+ID4gPiBDYzogU3RlcGhlbiBC
b3lkIDxzYm95ZEBrZXJuZWwub3JnPg0KPiA+ID4gPiBDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10
dXJxdWV0dGVAYmF5bGlicmUuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEb25nIEFpc2hl
bmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMv
Y2xrL2lteC9jbGstaW14OHF4cC1scGNnLmMgICAgICAgIHwgMTQ2ICsrKysrKystLS0tLS0tLQ0K
PiA+ID4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4cXhwLmMgICAgICAgICAgICAgfCAxNTIg
KysrKysrKystLS0tLS0tLQ0KPiA+ID4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9pbXg4
LWNsb2NrLmggICAgfCAyODkNCj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+ID4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9pbXg4cXhwLWNsb2NrLmggfCAyODkN
Cj4gPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ICA0IGZpbGVz
IGNoYW5nZWQsIDQzOCBpbnNlcnRpb25zKCspLCA0MzggZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+
ID4gVGhpcyBzZWVtcyBsaWtlIHVubmVlZGVkIGNodXJuLiBKdXN0IGtlZXAgdGhlIGV4aXN0aW5n
IG5hbWluZyBhbmQNCj4gPiA+IG90aGVyIFNvQ3MgY2FuIHJldXNlIGl0IHdpdGhvdXQgcHJvYmxl
bS4NCj4gPg0KPiA+IFRoZXJlJ3MgYSByZWFzb24uDQo+ID4gV2Ugc3RpbGwgbmVlZCBhZGQgc29t
ZSBjbG9jayBJRHMgd2hpY2ggZXhpc3Qgb24gTVg4UU0gb25seSAocHJvYmFibHkNCj4gPiBtb3Jl
IG9uIGZ1dHVyZSBTb0NzKSBIYXZpbmcgdGhlbSBwcmVmaXhlZCB3aXRoICdJTVg4UVhQJyBtYXkg
bG9vaw0KPiBzdHJhbmdlLg0KPiA+DQo+ID4gQmVzaWRlcyB0aGF0LCBhcyB0aG9zZSBjbG9jayBJ
RHMgd2lsbCBhbHNvIGJlIHVzZWQgaW4gZGV2aWNldHJlZSwgbWFrZQ0KPiA+IHRoZSBuYW1lIGdl
bmVyaWMgZm9yIGRpZmZlcmVudCBTb0NzIHNlZW1zIHN0aWxsIGJldHRlciBhbmQgbGVzcyBjb25m
dXNpbmcuDQo+ID4NCj4gDQo+IFRoaXMgbG9va3MgbGlrZSBhbiBpbnRlZ3JhdGlvbiBwcm9ibGVt
LiBJcyBhbnlvbmUgdXNpbmcgdGhlIGRlZmluZXMgdGhhdCBhcmUNCj4gbWVyZ2VkIHRocm91Z2gg
Y2xrIHRyZWUgbm93PyBBIGdyZXAgb2YgbGludXgtbmV4dCBzYXlzIG5vLCBidXQgaG93IGNhbiBJ
IGJlDQo+IHN1cmU/DQoNCkknbSBzdXJlIG5vIG9uZSBpcyB1c2luZyBpdCBub3cuDQpUaGUgb25s
eSB1c2VyIERUUyAoaW14OHF4cCBtZWspIGlzIHdhaXRpbmcgZm9yIG1lcmdlIGFmdGVyIDQuMjEt
cmMxIGlzIG91dC4NClNvIGl0J3MgYSBjaGFuY2UgdG8gdXBkYXRlIGl0LiANCg0KPiANCj4gU28g
Y2FuIHlvdSBsZWF2ZSBhcm91bmQgdGhlIGhlYWRlciBmaWxlIHdpdGggdGhlIGRlcHJlY2F0ZWQg
ZGVmaW5lIG5hbWVzIGFuZA0KPiBpbnRyb2R1Y2UgYW5vdGhlciBvbmUgdGhhdCdzIGEgY29weSBv
ZiB0aGUgaGVhZGVyIGZpbGUgYnV0IHdpdGggdGhlIG5vbi1Tb0MNCj4gc3BlY2lmaWMgbmFtZXM/
ICBUaGVuIHlvdSBjYW4gd2FpdCBmb3IgYSByZWxlYXNlIGN5Y2xlIGFuZCBkZWxldGUgdGhlIG9s
ZA0KPiBoZWFkZXIgZmlsZSB0aGF0IG5vYm9keSBzaG91bGQgYmUgdXNpbmcgaW4gRFQgYW55bW9y
ZS4NCj4gVW5sZXNzIHlvdSBwbGFuIHRvIG1ha2Ugc3VyZSB0aGF0IG5vYm9keSB1c2VzIHRoZSBk
ZXByZWNhdGVkIGRlZmluZXMNCj4gc29tZWhvdz8NCj4gDQoNClllcywgdGhlIHBsYW4gaXMgdG8g
bWFrZSBzdXJlIG5vYm9keSB1c2VzIHRoYXQuDQpPdGhlcndpc2UsIGl0IG1heSBiZSBoYXJkIHRv
IHNlbmQgRFRTIHBhdGNoZXMgdXNpbmcgbmV3IENMSyBJRCBuYW1lIHRocm91Z2gNCmRpZmZlcmVu
dCB0cmVlIGxhdGVyLg0KDQo+IEFuZCBwbGVhc2UgQ2MgRFQgbWFpbGluZyBsaXN0IGFuZCBtYWlu
dGFpbmVycyBvbmUgYWxsIGJpbmRpbmdzIHBhdGNoZXMuDQo+IFRoaXMgaW5jbHVkZXMgaW5jbHVk
ZS9kdC1iaW5kaW5ncy8uDQoNClNvcnJ5LCBJIHNob3VsZCBoYXZlIGFkZGVkIERldmljZXRyZWUg
bWFpbnRhaW5lci4NCkNvcHkgUm9iLg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==
