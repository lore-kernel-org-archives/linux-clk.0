Return-Path: <SRS0=7v9C=NF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BB2ECDE47
	for <linux-clk@archiver.kernel.org>; Thu, 25 Oct 2018 14:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0179A20848
	for <linux-clk@archiver.kernel.org>; Thu, 25 Oct 2018 14:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kGs2qWWT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0179A20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbeJYXQQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Oct 2018 19:16:16 -0400
Received: from mail-eopbgr10046.outbound.protection.outlook.com ([40.107.1.46]:56504
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727401AbeJYXQP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Oct 2018 19:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/ZIVLYNXxasQjRAaUaZDGzr5DyiTdoTBCDtbTZro6Q=;
 b=kGs2qWWTkCMhRWRBhzKfRw0FHljCJrHoQyO7DG7lA0gpC4tNVQYBq/wEYKdGZBN9fRfSE8sgF2WxxDvbjE/px9CRvZW23gTIGCPt/e5OjeS/+M0anDyidxK/zH0WArI7tg/DmwJpxj8F4tlp1cCclxNV5YkpSDApXfm00O69KR4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4036.eurprd04.prod.outlook.com (52.134.125.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1273.21; Thu, 25 Oct 2018 14:43:07 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1273.021; Thu, 25 Oct 2018
 14:43:06 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Thread-Topic: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Thread-Index: AQHUZwMzoA17UBIsSkGVKzG2jHXioaUlRLCAgAAIYRCAACwagIAAyKWwgAnRp5A=
Date:   Thu, 25 Oct 2018 14:43:06 +0000
Message-ID: <AM0PR04MB4211CE37D05973D6CE521D7080F70@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
 <1539881347-20871-10-git-send-email-aisheng.dong@nxp.com>
 <153988429912.5275.13469659599335212731@swboyd.mtv.corp.google.com>
 <AM0PR04MB42112CB1324B0994A26AB15D80F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153989556955.53599.9032716427049619310@swboyd.mtv.corp.google.com>
 <AM0PR04MB42112BEEF4DB939F13D6AF1680F90@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42112BEEF4DB939F13D6AF1680F90@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4036;6:LV/ILahXfs4vlGJRof5BJDiRfL3yzGWnmXe+I+9AjG91FusVndULk42p0OevRfLYVGuR8L1y8hszvksrFGXe1+BcGQi8Ylchhtetvk3KObodx1CCep17T+dyKlKYDnyCZMhRHulVoR1P9hQDs6aj6QrJqwNam5FjBvbTe3Uv7MJdmC0y/J0va3+M8Yx5Jgsjlf9fmw+R1zhkK3bawcjC9y+otngpeyq4SnBDvwBuAXKQYV+SB+pb10ySUrTjFcd2FrN5PmKboxbFbFAmbq9YKMWPhQtJfXfg3hS4mrc2qAgQJouTEs1xZOuPPbMEX2NhwNRARab/W3lME01VAGpiMIqPqfEBj+gqyHlYmgQyZr/q4dX44Vd/rWXGc0dg6RWHPt/2ydIcHaVvd0+NS71TMMRYhodpHUt2gFUDbJEPfsx0FPvWBbWmezC+koR6kb4WKGxyJjWhqaghnr7u+T+J9g==;5:suKhuvCeZJts9QiEZPhpJxJHCBGbWm7tY8/gyI57vyNgzj/UdfswkN8EPw6jgwzOYmSosM5fe5R8wRNa6Ois9hd7c7Md0ZVMhN2/E6smauyJPT17uwvI77hL1vKNiGBHHRjgktPaGA/DzEDNQAveoyDTfE3qPt30vwwuZgs0QEI=;7:2EaDmb4WrUyusJ4iy8mFKDTnweO076/xVJvGWTDmgMxHAs/HHcx0KG6yvb6BJi6kQ+Kw9aLkl48iI5EU9918piztCjR3oKhWJFNxJIQdGtQ/4P2CYOZQDhK+roQrW2eCHrc8XOTMIqk6uuurJs8gfw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 82b1cd1c-dada-41ab-3eff-08d63a882d54
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4036;
x-ms-traffictypediagnostic: AM0PR04MB4036:
x-microsoft-antispam-prvs: <AM0PR04MB40360C3953A4FED6BD41BD7880F70@AM0PR04MB4036.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(9452136761055)(258649278758335)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231355)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4036;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4036;
x-forefront-prvs: 083691450C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(396003)(376002)(346002)(13464003)(199004)(189003)(52084003)(7736002)(25786009)(110136005)(99286004)(74316002)(54906003)(4326008)(14454004)(305945005)(316002)(3846002)(6116002)(8936002)(81156014)(8676002)(2906002)(93886005)(5660300001)(68736007)(33656002)(478600001)(229853002)(106356001)(71190400001)(105586002)(71200400001)(486006)(476003)(11346002)(446003)(102836004)(53546011)(6506007)(26005)(81166006)(6246003)(2900100001)(4001150100001)(2501003)(5250100002)(97736004)(55016002)(9686003)(14444005)(53936002)(256004)(6436002)(86362001)(66066001)(76176011)(186003)(7696005)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4036;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: lMzEJ4MrpJQP5SI4K5E3UPANBCFsU2m/Cx6E8rNZkeYBOmvkO22WxWzJIcs/dkWYmOH4ZsW+P6+dKpjyHUJy+q5SwzEHfidUbYjD0vNuFJ4hCSp9k2pV8o6/Dr5x0Mixl/p2LU9G5jxlbyH1djc4ZlvtWKayCXnumSo9JiLOKbhmIr7ynpp8srQRsecME1N187w1xDSL7qCz6KCNmb+YOic9l5j4hoMNPP3toZjHbhg9zwyAsZAB7Cmv8nJgGuZDAKDwUvHFcxbH1Yzy/Pt/frIlA1vioticyFjBQLRlZgUNJK8WNadyrBJLBVKR8FU/4uQZzWw9cueVxDCdg7tkT4naJh9VWTpS0Er9R+laVJA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b1cd1c-dada-41ab-3eff-08d63a882d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2018 14:43:06.8381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4036
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBLnMu
IERvbmcNCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDE5LCAyMDE4IDU6MDUgUE0NClsuLi5dDQo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBTdGVwaGVuIEJveWQgW21h
aWx0bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiA+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxOSwgMjAx
OCA0OjQ2IEFNDQo+ID4gVG86IEEucy4gRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBsaW51
eC1jbGtAdmdlci5rZXJuZWwub3JnDQo+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+ID4gc2hhd25ndW9Aa2VybmVs
Lm9yZzsgRmFiaW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPjsNCj4gPiBkbC1saW51
eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsga2VybmVsQHBlbmd1dHJvbml4LmRlDQo+ID4gU3Vi
amVjdDogUkU6IFtQQVRDSCBWNSA5LzldIGNsazogaW14OiBhZGQgaW14OHF4cCBjbGsgZHJpdmVy
DQo+ID4NCj4gPiBRdW90aW5nIEEucy4gRG9uZyAoMjAxOC0xMC0xOCAxMToxMzozOSkNCj4gPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogU3RlcGhlbiBCb3lk
IFttYWlsdG86c2JveWRAa2VybmVsLm9yZ10NCj4gPiA+ID4gU2VudDogRnJpZGF5LCBPY3RvYmVy
IDE5LCAyMDE4IDE6MzggQU0NCj4gPiA+ID4gVG86IEEucy4gRG9uZyA8YWlzaGVuZy5kb25nQG54
cC5jb20+OyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnDQo+ID4gPiA+IENjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IG10dXJxdWV0dGVAYmF5bGlicmUuY29tOw0KPiA+
ID4gPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBGYWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54
cC5jb20+Ow0KPiA+ID4gPiBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsga2VybmVs
QHBlbmd1dHJvbml4LmRlOyBBLnMuIERvbmcNCj4gPiA+ID4gPGFpc2hlbmcuZG9uZ0BueHAuY29t
Pg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFY1IDkvOV0gY2xrOiBpbXg6IGFkZCBpbXg4
cXhwIGNsayBkcml2ZXINCj4gPiA+ID4NCj4gPiA+ID4gUXVvdGluZyBBLnMuIERvbmcgKDIwMTgt
MTAtMTggMDk6NTQ6MTUpDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvY2xvY2svaW14OHF4cC1jbG9jay5oPg0KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgv
Y2xrLmg+DQo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gPiA+ID4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+
ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KPiA+ID4gPiA+ICsjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICsjaW5jbHVkZSA8c29jL2lteC9pbXg4cXhwL2xwY2cuaD4NCj4g
PiA+ID4gPiArDQo+ID4gPiA+ID4gKyNpbmNsdWRlICJjbGstc2N1LmgiDQo+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ICtzdGF0aWMgc3RydWN0IGNsa19od19vbmVjZWxsX2RhdGEgKmlteDhxeHBfY2xr
X2RhdGE7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0
IGVuZXRfc2Vsc1tdID0geyAiZW5ldF8yNU1IeiIsDQo+ID4gPiA+ID4gKyJlbmV0XzEyNU1IeiIs
IH07IHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QNCj4gPiA+ID4gPiArZW5ldDBfcm1paV90eF9z
ZWxzW10gPSB7ICJlbmV0MF9yZWZfZGl2IiwgImR1bW15IiwgfTsgc3RhdGljDQo+ID4gPiA+ID4g
K2NvbnN0IGNoYXIgKiBjb25zdCBlbmV0MV9ybWlpX3R4X3NlbHNbXSA9IHsgImVuZXQxX3JlZl9k
aXYiLA0KPiA+ID4gPiA+ICsiZHVtbXkiLCB9Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArc3Rh
dGljIGludCBpbXg4cXhwX2Nsa19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7
DQo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNjbV9ub2RlID0gcGRldi0+
ZGV2Lm9mX25vZGU7DQo+ID4gPiA+DQo+ID4gPiA+IFdoZXJlJ3MgdGhlIERUIGJpbmRpbmcgZm9y
IHRoaXMgZGV2aWNlPw0KPiA+ID4NCj4gPiA+IFNvcnJ5IGZvciBtaXNzZWQgdG8gbWVudGlvbiB0
aGlzLg0KPiA+ID4gSXQncyBiZWVuIG1lcmdlZCBpbnRvIHNjdSBiaW5kaW5nIGRvYyBwZXIgUm9i
J3MgcmVxdWVzdCB3aGljaCBoYXMNCj4gPiA+IGFscmVhZHkgYmVlbiBpbiBTaGF3bidzIHRyZWUu
DQo+ID4gPg0KPiA+ID4gUGxlYXNlIHRha2UgYSBsb29rIGF0IGhlcmU6DQo+IFsuLi5dDQo+ID4N
Cj4gPiBPayBJIGFzayBiZWNhdXNlIGl0J3Mgb2RkIHRvIGhhcmRjb2RlIHBoeXNpY2FsIGFkZHJl
c3NlcyBpbiBhIGNsaw0KPiA+IGRyaXZlciB3aGVuIHRob3NlIHNob3VsZCBjb21lIGZyb20gRFQg
aW4gcmVnIHByb3BlcnRpZXMuIFdhcyBSb2IgYXdhcmUNCj4gPiB0aGF0IHRoaXMgY2xrIG5vZGUg
d2FzIGNvbWJpbmluZyBJL08gbWVtb3J5IGFuZCBtZXNzYWdlIHBhc3Npbmc/DQo+IA0KPiBZZXMs
IEkgYWdyZWUgd2l0aCB5b3UuIFRoYXQgc2VlbXMgbGlrZSBhIHNwZWNpYWwgdG8gaS5NWCBjYXNl
Lg0KPiBUaGUgcHJvYmxlbSBpcyBub3QgYWxsIGNsb2NrcyBoYXZpbmcgYSBMUENHIGdhdGUuIEFu
ZCB0aG9zZSBMUENHcyBhcmUgYWxzbyBub3QNCj4gY29udGludW91cyBhbmQgbWF5IGJlIHNoYXJl
ZCBieSBtYW55IGNsb2NrcyB3aGljaCBtYWtlIHRoaW5ncyBtb3JlDQo+IGNvbXBsaWNhdGVkLg0K
PiBJJ20gbm90IHN1cmUgcGFyc2luZyBmcm9tIGRldmljZSB0cmVlIGNvdWxkIGJlIGJldHRlciB3
YXkgdG8gZG8gaXQuDQo+IFByb2JhYmx5IG5lZWQgaHVnZSBjaGFuZ2VzLg0KPiANCj4gSG93IHdv
dWxkIHlvdSBzdWdnZXN0Pw0KPiBEbyB5b3UgdGhpbmsgd2UgY2FuIHdvcmthcm91bmQgdGhpcyBk
dWUgdG8gdGhlIHNwZWNpYWwgaU1YPw0KPiANCg0KRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24g
YWJvdXQgdGhpcz8NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQo=
