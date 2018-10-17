Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D64ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C746E2151D
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="cNmQI1fi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C746E2151D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbeJQQ6Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 12:58:16 -0400
Received: from mail-eopbgr70079.outbound.protection.outlook.com ([40.107.7.79]:19568
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726482AbeJQQ6Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 12:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tflHn8sZWocxXEVUg9vVxHIVwHMze0QcUwR6nprRymI=;
 b=cNmQI1fiaotSsvBoS2c79c7N5Tz98WW2ElS0FCKwoK+Xq2KuQqouY2C/JxZ1keuQH/Fde/X92PiHA/k6Nsd1w4zz5r5umhY4OIU0wDCUwPFqfkgRZOUOa47iZJ3MtKkbEvYf6VqdZdsU+4GtekPzFVilY/2tEFKejjH2THY8/aI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5315.eurprd04.prod.outlook.com (20.177.42.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.24; Wed, 17 Oct 2018 09:03:29 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 09:03:29 +0000
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
Subject: RE: [PATCH V4 04/11] clk: imx: scu: add scu clock gpr divider
Thread-Topic: [PATCH V4 04/11] clk: imx: scu: add scu clock gpr divider
Thread-Index: AQHUY5UBs3glyi5ii0OPEdutN8EQcqUiZw0AgADA9jA=
Date:   Wed, 17 Oct 2018 09:03:28 +0000
Message-ID: <AM0PR04MB42119987039050D9488EB30F80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-5-git-send-email-aisheng.dong@nxp.com>
 <153972527843.5275.15123840961402192766@swboyd.mtv.corp.google.com>
In-Reply-To: <153972527843.5275.15123840961402192766@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5315;6:9riA5NroFaOUE+0XOC/bXMk27cnGt9e+RbVjyF2y+nTrViSJnRR6m23qMm3R2q+WZFe4y7d2SoPQ0dWmqPIEXm6yEt2+FYe2qoGha+SC6hImTs3dNzqXb/SXb0nAbRvD5+tSdAqHhoxYaZOKZYxRqjnTLSQ7KjEDYgk/mvTfwGTyNmt7H7/48yFzNS6o79p5a7ejPb+biGK484VJdZUi9Utiz7cHVUkTUgt0MXdWUO65z92aKwgTu7LXk68JlKRv4PCJ+OPjLIY7TVklTYr8LN8wXwVT6MZyf7BmW38G2vOUqocsTY2p4Lsf7+craFSO1nbxbHuUySTvEPpvtzR3C+bsuns9P6yYZMr7zSG02YldlCakvTiSrDbpcDd8fzxN3WrqP9f6NA330YaxXI1unUU0mKAUMm5QokRN3KLdK9MN6FmLAJkTJdGxreu1RD52rMr7ZC/1eIKEnZjr0U9Xwg==;5:XNgomKl7aVH/2FFzTA/z/kkIgQvDC4X9A6ibRjeTOt9kccSSLM0IOdcByIUa5RzDxZoQ98abPkpjlnRx2TqMoR+H8p7Dp0092dS1PxKU9bxoJMbn7wreGi3l9plN+Tj4I0WAg5jAWvZ28Pso3KiQi+QvXVQNDCWf26i9k6mw4fk=;7:zbXeTxcdgMZQggOUhQgQ75S+pLCj1ghvDqCnMr4D+E0nlJqVT1MnqxuX10Ie2NPp8iJPRAqsLbsX3yASyThDeh0sJG4Z37l6i/LMzwmSjLibZgA1ET9bKLQJlersotLTkp92fW4odgSRpCyeN7a+jZZY71WwqWPo00u3aXvGMqW7q9HVf6gcEP21RRm9rtrrSSpTrFD2tWbh8WHwTzTyD68GSAxNXGz+gXSA50AOW1oLuamcyzETaDL97v16yxLR
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 131a2a2c-c3b8-4555-717f-08d6340f67dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5315;
x-ms-traffictypediagnostic: AM0PR04MB5315:
x-microsoft-antispam-prvs: <AM0PR04MB53157411CFA9017AA4F01B6E80FF0@AM0PR04MB5315.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5315;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5315;
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(39860400002)(396003)(376002)(199004)(189003)(13464003)(2900100001)(71190400001)(4326008)(33656002)(6246003)(478600001)(14454004)(3846002)(2906002)(6116002)(316002)(105586002)(66066001)(229853002)(106356001)(71200400001)(5250100002)(2501003)(97736004)(256004)(55016002)(6436002)(81156014)(74316002)(68736007)(7736002)(305945005)(4001150100001)(53936002)(54906003)(8676002)(86362001)(9686003)(81166006)(8936002)(14444005)(486006)(476003)(102836004)(5660300001)(110136005)(186003)(25786009)(11346002)(446003)(7696005)(76176011)(6346003)(99286004)(6506007)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5315;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: qXD61bMH4pd34xWjSvgq0gpjb4vJJCp6dPl9tT4MrWlkAM/+Yl60U+X2ak9ybviC9rzwGocvHDia3UaHOfGDyuZG/bxiYN+w3wejJyEqpImsArQ6ZHyX9yBTIpKlHwTW6khnY/Fl4fh0s2jnrQYOZBUmgpsxerglGWO+AtqlIMt4g7gP6ume63AihZL6T/sHYaMyXi3bjfSXAIAYnugNCVlZjYTo69mQsoBuYEWy/AenddM1FMxvxHzywWOWeLn+Ejz0H8i9KER5E6rvKqF98LgJZ4AoAQ6HSrsgHCFbjrdrBQvBsXhSfJfn/ee8cGQukhXXrZMKf4sjpdAXs0igsFislNu8Kl06CL0km6/+rQY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 131a2a2c-c3b8-4555-717f-08d6340f67dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 09:03:28.9977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5315
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTcsIDIwMTgg
NToyOCBBTQ0KWy4uLl0NCj4gUXVvdGluZyBBLnMuIERvbmcgKDIwMTgtMTAtMTQgMDE6MDc6NTIp
DQo+ID4gKy8qDQo+ID4gKyAqIGNsa19kaXZpZGVyX3NjdV9yZWNhbGNfcmF0ZSAtIEdldCBjbG9j
ayByYXRlIGZvciBhIFNDVSBjbG9jaw0KPiA+ICsgKiBAaHc6IGNsb2NrIHRvIGdldCByYXRlIGZv
cg0KPiA+ICsgKiBAcGFyZW50X3JhdGU6IHBhcmVudCByYXRlIHByb3ZpZGVkIGJ5IGNvbW1vbiBj
bG9jayBmcmFtZXdvcmsNCj4gPiArICoNCj4gPiArICogR2V0cyB0aGUgY3VycmVudCBjbG9jayBy
YXRlIG9mIGEgU0NVIGNsb2NrLiBSZXR1cm5zIHRoZSBjdXJyZW50DQo+ID4gKyAqIGNsb2NrIHJh
dGUsIG9yIHplcm8gaW4gZmFpbHVyZS4NCj4gPiArICovDQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBs
b25nIGNsa19kaXZpZGVyX2dwcl9zY3VfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nDQo+ID4gK3BhcmVudF9yYXRlKSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xr
X2RpdmlkZXJfZ3ByX3NjdSAqY2xrID0gdG9fY2xrX2RpdmlkZXJfZ3ByX3NjdShodyk7DQo+ID4g
KyAgICAgICB1MzIgdmFsOw0KPiA+ICsgICAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAg
ICByZXQgPSBpbXhfc2NfbWlzY19nZXRfY29udHJvbChjY21faXBjX2hhbmRsZSwgY2xrLT5yc3Jj
X2lkLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrLT5ncHJf
aWQsICZ2YWwpOw0KPiA+ICsgICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICBw
cl9lcnIoIiVzOiBmYWlsZWQgdG8gZ2V0IGNsb2NrIHJhdGUgJWRcbiIsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY2xrX2h3X2dldF9uYW1lKGh3KSwgcmV0KTsNCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDA7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJu
IHZhbCA/IHBhcmVudF9yYXRlIC8gMiA6IHBhcmVudF9yYXRlOw0KPiANCj4gSSBob3BlIHBhcmVu
dF9yYXRlIGNhbid0IGJlIHplcm8gaGVyZS4NCj4gDQoNCkl0IGNhbiBiZSB6ZXJvLCBJIGd1ZXNz
Lg0KQnV0IHplcm8gc2VlbXMgc2FmZSB0byBtZSwgYW0gSSB3cm9uZz8NCg0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICsvKg0KPiA+ICsgKiBjbGtfZGl2aWRlcl9zY3Vfcm91bmRfcmF0ZSAtIFJvdW5kIGNs
b2NrIHJhdGUgZm9yIGEgU0NVIGNsb2NrDQo+ID4gKyAqIEBodzogY2xvY2sgdG8gcm91bmQgcmF0
ZSBmb3INCj4gPiArICogQHJhdGU6IHJhdGUgdG8gcm91bmQNCj4gPiArICogQHBhcmVudF9yYXRl
OiBwYXJlbnQgcmF0ZSBwcm92aWRlZCBieSBjb21tb24gY2xvY2sgZnJhbWV3b3JrDQo+ID4gKyAq
DQo+ID4gKyAqIFJvdW5kIGNsb2NrIHJhdGUgZm9yIGEgU0NVIGNsb2NrIGFjY29yZGluZyB0byBw
YXJlbnQgcmF0ZSAgKi8NCj4gPiArc3RhdGljIGxvbmcgY2xrX2RpdmlkZXJfZ3ByX3NjdV9yb3Vu
ZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZA0KPiBsb25nIHJhdGUsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnBy
YXRlKSB7DQo+ID4gKyAgICAgICBpZiAocmF0ZSA8ICpwcmF0ZSkNCj4gPiArICAgICAgICAgICAg
ICAgcmF0ZSA9ICpwcmF0ZSAvIDI7DQo+ID4gKyAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAg
ICAgIHJhdGUgPSAqcHJhdGU7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIHJhdGU7DQo+ID4g
K30NCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIGNsa19kaXZpZGVyX3NjdV9zZXRfcmF0ZSAtIFNl
dCByYXRlIGZvciBhIFNDVSBjbG9jaw0KPiA+ICsgKiBAaHc6IGNsb2NrIHRvIGNoYW5nZSByYXRl
IGZvcg0KPiA+ICsgKiBAcmF0ZTogdGFyZ2V0IHJhdGUgZm9yIHRoZSBjbG9jaw0KPiA+ICsgKiBA
cGFyZW50X3JhdGU6IHJhdGUgb2YgdGhlIGNsb2NrIHBhcmVudA0KPiA+ICsgKg0KPiA+ICsgKiBT
ZXRzIGEgY2xvY2sgZnJlcXVlbmN5IGZvciBhIFNDVSBjbG9jay4gUmV0dXJucyB0aGUgU0NVDQo+
ID4gKyAqIHByb3RvY29sIHN0YXR1cy4NCj4gPiArICovDQo+ID4gK3N0YXRpYyBpbnQgY2xrX2Rp
dmlkZXJfZ3ByX3NjdV9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZw0K
PiByYXRlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHBhcmVudF9yYXRlKSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xrX2RpdmlkZXJf
Z3ByX3NjdSAqY2xrID0gdG9fY2xrX2RpdmlkZXJfZ3ByX3NjdShodyk7DQo+ID4gKyAgICAgICB1
aW50MzJfdCB2YWw7DQo+ID4gKw0KPiA+ICsgICAgICAgdmFsID0gKHJhdGUgPCBwYXJlbnRfcmF0
ZSkgPyAxIDogMDsNCj4gDQo+IE5pdHBpY2s6IFdyaXRlIGl0IG91dCBhcw0KPiANCj4gCXZhbCA9
IDA7DQo+IAlpZiAocmF0ZSA8IHBhcmVudF9yYXRlKQ0KPiAJCXZhbCA9IDE7DQo+IA0KDQpHb29k
IHN1Z2dlc3Rpb24NCg0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiBpbXhfc2NfbWlzY19zZXRf
Y29udHJvbChjY21faXBjX2hhbmRsZSwgY2xrLT5yc3JjX2lkLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNsay0+Z3ByX2lkLCB2YWwpOyB9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgY2xrX2RpdmlkZXJfZ3ByX3NjdV9vcHMgPSB7
DQo+ID4gKyAgICAgICAucmVjYWxjX3JhdGUgPSBjbGtfZGl2aWRlcl9ncHJfc2N1X3JlY2FsY19y
YXRlLA0KPiA+ICsgICAgICAgLnJvdW5kX3JhdGUgPSBjbGtfZGl2aWRlcl9ncHJfc2N1X3JvdW5k
X3JhdGUsDQo+ID4gKyAgICAgICAuc2V0X3JhdGUgPSBjbGtfZGl2aWRlcl9ncHJfc2N1X3NldF9y
YXRlLCB9Ow0KPiA+ICsNCj4gPiArc3RydWN0IGNsa19odyAqaW14X2Nsa19kaXZpZGVyX2dwcl9z
Y3UoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhcg0KPiAqcGFyZW50X25hbWUsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHJzcmNfaWQsIHU4IGdwcl9p
ZCkgew0KPiA+ICsgICAgICAgc3RydWN0IGNsa19kaXZpZGVyX2dwcl9zY3UgKmRpdjsNCj4gPiAr
ICAgICAgIHN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQ7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xr
X2h3ICpodzsNCj4gPiArICAgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgICAgZGl2ID0g
a3phbGxvYyhzaXplb2YoKmRpdiksIEdGUF9LRVJORUwpOw0KPiA+ICsgICAgICAgaWYgKCFkaXYp
DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiA+ICsNCj4g
PiArICAgICAgIGRpdi0+cnNyY19pZCA9IHJzcmNfaWQ7DQo+ID4gKyAgICAgICBkaXYtPmdwcl9p
ZCA9IGdwcl9pZDsNCj4gPiArDQo+ID4gKyAgICAgICBpbml0Lm5hbWUgPSBuYW1lOw0KPiA+ICsg
ICAgICAgaW5pdC5vcHMgPSAmY2xrX2RpdmlkZXJfZ3ByX3NjdV9vcHM7DQo+ID4gKyAgICAgICBp
bml0LmZsYWdzID0gQ0xLX0dFVF9SQVRFX05PQ0FDSEU7DQo+IA0KPiBTYW1lIE5PQ0FDSEUgY29t
bWVudC4NCj4gDQoNClJlcGxpZWQgaW4gYW5vdGhlciBtYWlsLg0KDQpSZWdhcmRzDQpEb25nIEFp
c2hlbmcNCg0KPiA+ICsgICAgICAgaW5pdC5wYXJlbnRfbmFtZXMgPSBwYXJlbnRfbmFtZSA/ICZw
YXJlbnRfbmFtZSA6IE5VTEw7DQo+ID4gKyAgICAgICBpbml0Lm51bV9wYXJlbnRzID0gcGFyZW50
X25hbWUgPyAxIDogMDsNCj4gPiArDQo+ID4gKyAgICAgICBkaXYtPmh3LmluaXQgPSAmaW5pdDsN
Cj4gPiArDQo+ID4gKyAgICAgICBodyA9ICZkaXYtPmh3Ow0KPiA+ICsgICAgICAgcmV0ID0gY2xr
X2h3X3JlZ2lzdGVyKE5VTEwsIGh3KTsNCj4gPiArICAgICAgIGlmIChyZXQpIHsNCj4gPiArICAg
ICAgICAgICAgICAga2ZyZWUoZGl2KTsNCj4gPiArICAgICAgICAgICAgICAgaHcgPSBFUlJfUFRS
KHJldCk7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIGh3Ow0KPiA+
ICt9DQo=
