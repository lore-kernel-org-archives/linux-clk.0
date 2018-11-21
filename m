Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49CDC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 01:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5713B20989
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 01:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="FcWVP84p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5713B20989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbeKUMZ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 07:25:57 -0500
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:27638
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725913AbeKUMZ5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 07:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeI7JEKRPZ/AvlCob5ORYeW4paao3AI3dEIGg3U98e8=;
 b=FcWVP84pRaE7IxcwLiiiWYxmqpPYeyb/WGryd2MS7mRmqtkZLPsw72XWTjb27J7smWYfXrX5vI5EUGtk6yiSDYfR3LOc3hMfPqbOFc8i7xl2SFvZpxC58OunK3Nt17izMn1kIJD6sslro25yTvghFcXaNZGOZbkxu+oBIfwbyrw=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4468.eurprd04.prod.outlook.com (52.135.148.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.27; Wed, 21 Nov 2018 01:50:47 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1339.027; Wed, 21 Nov 2018
 01:50:47 +0000
From:   Aisheng DONG <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V6 6/6] clk: imx: add imx8qxp lpcg driver
Thread-Topic: [PATCH V6 6/6] clk: imx: add imx8qxp lpcg driver
Thread-Index: AQHUeQjdj127rR5nB0C+9Z8nazMcu6VP8XmAgAAcG7CACQWjgIAAZYpg
Date:   Wed, 21 Nov 2018 01:50:47 +0000
Message-ID: <AM0PR04MB4211E36F9553E16A196C101C80DA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
 <1541862894-8209-7-git-send-email-aisheng.dong@nxp.com>
 <154223811948.88331.8860718270277533070@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211A7CA91D6188AB81BA6EA80DC0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154274014557.88331.17188709471206009766@swboyd.mtv.corp.google.com>
In-Reply-To: <154274014557.88331.17188709471206009766@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4468;6:IoLWjjaB66SCsXmESf3PKw4lvkMUZnjMGWcbQyjIjgGwAmPRqaAEvP6/B0Y4Gue1MsCGC5idArUigT5ybdjwXoiUUIwLC+MUstAktR7Q6HKNLpYYNgzy+TBjcpbiriEq2Hsj2NVI+vb5//2Gb4uaOViFzoUYZ2V20kpmFzs2wAMtWJ1HaApo1JAAlW7Fe5YIENvyLQ/188H5ND/cdMXili/IaCig2yw0pEAD8UEvPRWOJl1uyKnkM8bfGIlpUdyMZ0QzVQEERvWo3lamfl9lhqcqotchRFwfiitZVdYx55AoPGQZV2FQXrBYWNSaffuFGqrzs5DysQeAfy+qdu5E3YrMw1VbJoNXsPqXWHxZ2hrQZ8VnpMsHzbsGR/MZyPpgDbuJxJvaR5Ut29qWHGTQ6J+s27vCqVSKp877H7f69e6Bt3U4R3G6SC2ATtW4ndOd7pejfwhQtnAQMvMA99eRXg==;5:kyiq/lRCVO1JA9TFxw6PH2fY/HkrnEB+CzqJ2N3+URUDLo9kYbCy51FDY13HwiyN5HLqwZEyL5jbpOp+1NsJAzyDZPmPdoHDcWNAgOE5RRBU2QoegEoUu1ldPf8HauRUDo/CaYBD2/MZuVhE1kguXK2RLqO2tP6arrHNg5Aq8Vo=;7:eid+5QZUka92/VHggdtUpiO+eULJkMPjaTKxSG/Pqk4bD5cpf8Gyn7PvW4v5NgquPLYzt6E4GrwOHRfmvEFLjuCrKvEp9rwomKJDCB26a0pzmHMrn9OSpGnM4nJ60dEkVmrrZNOrDRu9qlZR41hrYQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: e4f21983-8936-4f0d-585e-08d64f53c1f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4468;
x-ms-traffictypediagnostic: AM0PR04MB4468:
x-microsoft-antispam-prvs: <AM0PR04MB446876C655D5BB670BEEC42680DA0@AM0PR04MB4468.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231442)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4468;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4468;
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(39860400002)(396003)(366004)(376002)(13464003)(199004)(189003)(5660300001)(305945005)(2906002)(7736002)(6506007)(8676002)(316002)(486006)(97736004)(476003)(74316002)(81156014)(102836004)(68736007)(99286004)(446003)(229853002)(66066001)(71190400001)(81166006)(11346002)(71200400001)(6436002)(86362001)(6116002)(53936002)(110136005)(4326008)(6246003)(7696005)(55016002)(26005)(8936002)(966005)(2900100001)(2501003)(3846002)(478600001)(54906003)(14454004)(25786009)(105586002)(14444005)(9686003)(256004)(76176011)(93886005)(6306002)(33656002)(106356001)(186003)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4468;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ad4IKZOPmont508YA8ITmkcsiXdiEmloCBnIrAuqJy5lgk7Qr7RMKZ4AA7pLS5qnWoNWRpHIaPD288bUKYUPvf0ug3byFPKP9pB78e/RHNlZwqIkl2J32Z37qNod77Ywwxu5uuYsacqp9b2g5rACghXxwVlfzstrJuY5FzZd7kQSVPVyYiZsx5tj+rkkw9quzBimZ0r89jZ5tQ47Jf/d2kfoGD9wbhRBy4Ui/d/AmaUIaQFp5qrQ6B9qNCppgxCxXn/VipFx+vagZ3aNJeqvDPpRnTgERx7AiE0F5csvuc/K5r9LcOxuBZvHDF76Lj6cG5AuIqguHyUYyo9rELRc/YSf14VhyC1uMafk96Ch00o=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f21983-8936-4f0d-585e-08d64f53c1f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 01:50:47.3633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4468
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KWy4uLl0NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHNz
X2xwY2cgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gPiA+ID4gKyAgICAgICBp
ZiAoIXNzX2xwY2cpDQo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2
LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ID4gPiA+ICsgICAgICAgYmFzZSA9IGRldm1faW9yZW1h
cChkZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7DQo+ID4gPg0KPiA+ID4gV2h5
IG5vdCBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKT8NCj4gPg0KPiA+IEJlY2F1c2UgTFBDR3MgYXJl
IGRpc3RyaWJ1dGVkIGluIHZhcmlvdXMgc3Vic3lzdGVtIG1lbW9yeSBzcGFjZSB3aGljaA0KPiA+
IG1heSBiZSBvdmVybGFwcGVkIHdpdGggc29tZSBJUCBtb2R1bGVzLiBTbyB3ZSBjYW4ndCB1c2UN
Cj4gPiBkZXZtX2lvcmVtYXBfcmVzb3VyY2Ugd2hpY2ggaGFzIGEgcmVxdWVzdF9tZW1fcmVnaW9u
KCkgaW4gaXQuDQo+ID4gSXQncyBzb21ldGhpbmcgbGlrZSB3aGF0IHdlJ3ZlIGRvbmUgZm9yIGRy
aXZlcnMvbWZkL3N5c2Nvbi5jLg0KPiANCj4gT2suIEFueSBjaGFuY2UgdGhhdCB0aGUgdmFyaW91
cyBzdWJzeXN0ZW1zIHRoYXQgYXJlIGNvbWJpbmVkIHdpdGggdGhlIGNsaw0KPiBjb250cm9sbGVy
IGNhbiBiZSBzcGxpdCB1cCBzbyB0aGF0IHdlIGNhbiB1c2UNCj4gZGV2bV9pb3JlbWFwX3Jlc291
cmNlKCkgaGVyZT8gDQoNCldlIGNhbiBhY2hpZXZlIHRoYXQgYnkgZGVzY3JpYmluZyBlYWNoIExQ
Q0dTIG5vZGUgaW4gZGV2aWNldHJlZSwgYnV0IHRoYXQgd291bGQNCmJsb2F0IHRoZSBEZXZpY2V0
cmVlIHNlcmlvdXNseSBhcyB3ZSBoYXZlIGh1bmRyZWRzIG9mIExQQ0dTLg0KDQpUaGlzIGlzIHNp
bWlsYXIgYXMgd2hhdCB3ZSBkaWQgZm9yIGxlZ2FjeSBTb0NzLCBlLmcgTVg3RC4NClRoZSBkaWZm
ZXJlbmNlIGlzIHRoYXQgb24gTVg3RCBMUENHUyBhcmUgY29udGludW91cy4NCmUuZy4NClRhYmxl
IDUtMTkuIENDR1IgTWFwcGluZyBUYWJsZQ0KR2F0aW5nIFJlZ2lzdGVyIExQQ0cgRW5hYmxlIE9m
ZnNldA0KQ0NNX0NDR1I0IHNpbV9tYWluIDB4NDA0MA0KQ0NNX0NDR1I1IHNpbV9kaXNwbGF5IDB4
NDA1MA0KLi4uDQpDQ01fQ0NHUjE2OCBpb211eCAweDRBODANCkNDTV9DQ0dSMTY5IGlvbXV4X2xw
c3IgMHg0QTkwDQpDQ01fQ0NHUjE3MCBrcHAgMHg0QUEwDQoNCkJ1dCBvbiBNWDhRWFAvUU0sIHRo
ZXkncmUgbm90IGNvbnRpbnVvdXMgYW55bW9yZSBhbmQgZGlzdHJpYnV0ZWQgaW4gZWFjaCBTUy4N
CkFuZCB3ZSBwcm9iYWJseSB3YW50IHRvIHB1c2ggb3VyIElDIGRlc2lnbmVyIHRvIHJlLW9yZ25p
emUgdGhlbSBpbnRvIGEgY29udGludW91cw0KbWVtb3J5IG1hcCBhZ2FpbiBmb3IgbmV3IGNoaXBz
IGluIHRoZSBmdXR1cmUuDQoNClNvIGRvIHlvdSB0aGluayB3ZSBjYW4gc3RhcnQgd2l0aCB0aGlz
IHdheSBmb3IgTVg4IGFzIHdlbGw/DQpUaGVuIHdlIHdvbid0IGJsb2NrIE1YOFFYUCBib290aW5n
IHVwIHRvbyBsb25nIG9yIHByb2JhYmx5IGNvdWxkIGltcHJvdmUgaXQNCkxhdGVyLg0KDQo+IEl0
IG1heSBiZSBiZXR0ZXIgdG8gY2FydmUgdXAgdGhlIEkvTyBzcGFjZSBvZg0KPiB0aGlzIFNvQyBp
bnRvIGRldmljZSBub2RlcyB0aGF0IG1hcCB0byB0aGUgaGFyZHdhcmUgSVAgYmxvY2tzLCBhbmQg
dGhlbiBoYXZlDQo+IHRob3NlIGRldmljZSBkcml2ZXJzIGdlbmVyYXRlIHN1Yi1kZXZpY2VzIGZv
ciB0aGUgdmFyaW91cyBsb2dpY2FsIHN1YnN5c3RlbXMNCj4gdGhhdCB0aGUgaGFyZHdhcmUgSVAg
c3BhbnMuIE9yIGl0IGNvdWxkIGJlIGEgYmlnIGRyaXZlciB0aGF0IHJlZ2lzdGVycyB3aXRoDQo+
IG11bHRpcGxlIHN1YnN5dGVtcy9mcmFtZXdvcmtzIGZyb20gb25lIGRldmljZSBkcml2ZXIuIFRo
aXMgd2F5LCB0aGUgbG9naWNhbA0KPiBzdHJ1Y3R1cmUgb2YgdGhlIGxpbnV4IGtlcm5lbCBkZXZp
Y2UgZHJpdmVyIGRlc2lnbiBkb2Vzbid0IGxlYWsgaW50byB0aGUgRFQNCj4gZGVzY3JpcHRpb24g
b2YgdGhlIFNvQy4NCj4gDQoNClllcywgd2UgY3VycmVudGx5IGFscmVhZHkgZGVzY3JpYmUgdGhl
bSB3aXRoIGVhY2ggc3Vic3lzdGVtcyBpbiBEZXZpY2V0cmVlLg0KaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMDY3NzMxMS8NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQoNCj4g
Pg0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJORUwpOw0K
PiA+ID4gPiArICAgICAgIGlmICghY2xrX2RhdGEpDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT01FTTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIGNsa19kYXRhLT5udW0g
PSBzc19scGNnLT5udW1fbWF4Ow0KPiA+ID4gPiArICAgICAgIGNsa3MgPSBjbGtfZGF0YS0+aHdz
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IHNzX2xwY2ctPm51
bV9scGNnOyBpKyspIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGxwY2cgPSBzc19scGNnLT5s
cGNnICsgaTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGNsa3NbbHBjZy0+aWRdID0gaW14X2Ns
a19scGNnX3NjdShscGNnLT5uYW1lLA0KPiA+ID4gbHBjZy0+cGFyZW50LA0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxwY2ctPmZsYWdz
LA0KPiA+ID4gPiArIGJhc2UgKw0KPiA+ID4gbHBjZy0+b2Zmc2V0LA0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxwY2ctPmJpdF9pZHgs
DQo+ID4gPiBscGNnLT5od19nYXRlKTsNCj4gPiA+ID4gKyAgICAgICB9DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgY2xrX2RhdGEtPm51bTsgaSsrKSB7DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICBpZiAoSVNfRVJSKGNsa3NbaV0pKQ0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBwcl9lcnIoImkuTVggY2xrICV1OiByZWdpc3RlciBmYWlsZWQNCj4g
d2l0aCAlbGRcbiIsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSwg
UFRSX0VSUihjbGtzW2ldKSk7DQo+ID4gPg0KPiA+ID4gQnV0IHdlJ3JlIE9LIHRvIGNvbnRpbnVl
PyBBbHJpZ2h0Li4uDQo+ID4gPg0KPiA+DQo+ID4gWWVzLCBwcm9iYWJseSBiZXR0ZXIgdG8gdXNl
IHByX3dhcm4oKT8NCj4gDQo+IFllcy4NCj4gDQo+ID4NCj4gPiA+ID4gKyAgICAgICB9DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKyAgICAgICByZXR1cm4gb2ZfY2xrX2FkZF9od19wcm92aWRlcihucCwg
b2ZfY2xrX2h3X29uZWNlbGxfZ2V0LA0KPiA+ID4gPiArIGNsa19kYXRhKTsNCj4gPiA+DQo+ID4g
PiBXaHkgbm90IHVzZSBkZXZtXz8gT3IgY2FuIHRoZSBkcml2ZXIgbmV2ZXIgYmUgdW5ib3VuZCBm
cm9tIHN5c2ZzPw0KPiA+ID4NCj4gPg0KPiA+IFdlIGV4cGVjdCB0aGUgZHJpdmVyIHRvIGJlIG5l
dmVyIHVuYm91bmQgZnJvbSBzeXNmcy4NCj4gPiBQcm9iYWJseSB3ZSdkIGJldHRlciBhZGQgLnN1
cHByZXNzX2JpbmRfYXR0cnMuDQo+IA0KPiBPay4gUGxlYXNlIGFkZCBpdC4NCg0K
