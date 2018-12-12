Return-Path: <SRS0=3egD=OV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB5CC04EB8
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 10:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5C392084E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 10:27:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="X84kgaH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C392084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbeLLK1c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:27:32 -0500
Received: from mail-eopbgr00072.outbound.protection.outlook.com ([40.107.0.72]:11968
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726591AbeLLK1b (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Dec 2018 05:27:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwpuEu5fzBl5ztmr3P2kpFVI1L1td3Z5+RJmOOW1ljE=;
 b=X84kgaH24S4Vjr5GUABvQE5nOcfi/OhlxLiJRGgQX1I8Ir5DCPD3BHB/SXEED8THEjkKGtlgGMAvuWnev6xgF8YRCX+LnrDvFX6cRpR7KA3C6paJyZEweghI5vSm4Iq1gMjTYTAgV+2SmyuUhMpdNdOg3eqU1KVrPzRxQlY3C1w=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB3955.eurprd04.prod.outlook.com (52.134.90.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.22; Wed, 12 Dec 2018 10:27:24 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Wed, 12 Dec 2018
 10:27:24 +0000
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
Thread-Index: AQHUi98lQ6o73Estskm1k5h96wz2oqV4fYEAgABeCkCAARxjAIAAXN6QgACazVA=
Date:   Wed, 12 Dec 2018 10:27:24 +0000
Message-ID: <AM0PR04MB4211C8B8DC2D5F2133D30B9F80A70@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
 <1543934041-12572-2-git-send-email-aisheng.dong@nxp.com>
 <154447530435.17204.3027810086542897433@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211B87A842FB8AF14621E3380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154455657071.17204.2493209125185218529@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211D9C32A4DDCCF266B60C380A70@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4211D9C32A4DDCCF266B60C380A70@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB3955;6:b8ibR8TLb12iW31MMWLH8gvoxrOK0rYGk9F4ORL6lYgTn0kusXUDaEqBdlON4fyfXpGWtGxXW5Yf0dHklMOt1gWSXqS3q2oV5qA3mq4gvg+N6huqftT2bTgB6bofkqtrrkFjBxpvZp/HGUPdQVbO7FFu4XCqZdXOUMqNLcrp7UdelHKT2mciARLFSwrCsDZXkMzCA9muHMIKZyLiXEQCyKdzQ9Gc98MhWjXF1WcrwgsGdcegjV80+VY1f2qnCXge5xNjMCOtAbKnjF1tkOTsMhdsUkn35c5Ol3EvuGPnFt6Lm1ccepiSnfrFoZjEAKdnMNaFASCn9aJwSZW2Ib/vuOJAoewjIgr8ohLTB1rWNRiX8t7GNgPiQ/OsW7ZVP2rzamD85wioRLC4Hk/0HbMRmMk3KF15AOq3kQNfG0Y0l4GwOHYfHHE7ikSbqXWceufRQtGi7euAFfL14Y84NZvMjw==;5:rJ49of83wgCnAbnnuQH5on9ztyyrIMYjBrAD/9KPRCC9xr19EKYNCxCQl0LVr1A4+1Y/q6j8mS+PunkhGxgrpJinbPrUJPUd2ipD36XQ/G79TKOwIq1+pLONnEtfih/+qKxtijCWfN9YwY1lnh0ipaCzaq/s9++nbRXe+bZveUI=;7:GOpv6T9ggKt7iCiMrvbzZkxj/FPk3cj68eaGJryvzXWGQwaLVYi3h+PNXf4okROjvm+J8E7S1ysP5XIgW2fdO8oK4AK0dBUb+im0paScnSsVZnFoZ6q0Cjm3nAm7uY33oaRHPXCDTk0u8leGexQVBQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: cc196a77-c774-42a2-13a9-08d6601c6888
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB3955;
x-ms-traffictypediagnostic: AM0PR04MB3955:
x-microsoft-antispam-prvs: <AM0PR04MB39554D19A01DB4D6AB02919A80A70@AM0PR04MB3955.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231455)(999002)(944501520)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB3955;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB3955;
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(366004)(376002)(396003)(136003)(199004)(51914003)(189003)(26005)(53936002)(4326008)(3846002)(6506007)(76176011)(14454004)(7736002)(33656002)(71200400001)(9686003)(68736007)(7696005)(71190400001)(66066001)(6436002)(305945005)(486006)(55016002)(186003)(102836004)(6246003)(446003)(93156006)(6116002)(476003)(99286004)(2906002)(2940100002)(229853002)(478600001)(575784001)(54906003)(86362001)(256004)(110136005)(93886005)(44832011)(105586002)(81156014)(97736004)(106356001)(81166006)(11346002)(74316002)(14444005)(25786009)(5660300001)(8936002)(8676002)(316002)(2501003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB3955;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Bqfhn4wz01p0lP8mwvrLdU/eFnv41s4poupHjORq7Z52dlTOjrOlsu77kgFmUKk+cEv/DlSAku+Iqbr/0noUaYfV2q9GGmaK3pQRHYCJjYadxnCF+t2kXQx4GVYp7KOPbBxSiyI+BGp00wein/Ze2eP43IgIaQrWjsX2xZ46y9OwbpsOklz0x2ZQjrdgfILkLoYa7YYNzJsY+8wT3zREDSC+PNsIxBOkJGFMLDdjvWRqdhJYDQuxbra/XbygKW960h6g+zB6gtdwg/Xka1rgbt3+ZoXnmpvHp910ESeE+cY354HiMy2CoQ+heUpUArbM
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc196a77-c774-42a2-13a9-08d6601c6888
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 10:27:24.7792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3955
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvTWFr
ZWZpbGUgYi9kcml2ZXJzL2Nsay9pbXgvTWFrZWZpbGUNCj4gPiA+ID4gPiBpbmRleA0KPiA+ID4g
PiA+IDVjMGIxMWUuLmY4NTA0MjQgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsv
aW14L01ha2VmaWxlDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvaW14L01ha2VmaWxlDQo+
ID4gPiA+ID4gQEAgLTEsNiArMSw2IEBADQo+ID4gPiA+ID4gICMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjANCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC1vYmoteSArPSBcDQo+ID4gPiA+
ID4gK29iai0kKENPTkZJR19NWENfQ0xLKSArPSBcDQo+ID4gPiA+DQo+ID4gPiA+IEJlY2F1c2Ug
dGhpcyBjaGFuZ2VzIHRvIG9iai0kKENPTkZJRykgd2Ugc2hvdWxkIGNoYW5nZSB0aGUNCj4gPiA+
ID4gZHJpdmVycy9jbGsvTWFrZWZpbGUgdG8gaGF2ZSBvYmoteSBmb3IgdGhpcyBNYWtlZmlsZSBp
bnN0ZWFkIG9mDQo+ID4gPiA+IGRlcGVuZGluZyBvbiBBUkNIX01YQy4NCj4gPiA+DQo+ID4gPiBX
ZSBhbHNvIHVzZSBBUkNIX01YQyBmb3IgQVJNdjggU29DIGNsb2Nrcy4NCj4gPg0KPiA+IFllcywg
YW5kPyBJJ20gc3VnZ2VzdGluZyBkcml2ZXJzL2Nsay9NYWtlZmlsZSBoYXZlIGFuIG9iai15ICs9
DQo+ID4gZHJpdmVycy9jbGsvaW14LyBhbmQgdGhlbiBkZWNpZGUgdG8gY29tcGlsZSBvciBub3Qg
Y29tcGlsZSB0aGUgTVhDX0NMSw0KPiA+ICJjb3JlIiBiaXRzIGJhc2VkIG9uIENPTkZJR19NWENf
Q0xLIGNvbmZpZyBvcHRpb24uDQo+IA0KPiBTb3JyeSBmb3IgdGhlIG1pc3N1bmRlcnN0YW5kaW5n
IGJlZm9yZS4NCj4gSSBndWVzcyB5b3UgcG9pbnQgaXMgaGF2ZSBhbiBvamIteSArPSBkcml2cnMv
Y2xrL2lteC8gVGhlbiBpbg0KPiBkcml2ZXJzL2Nsay9pbXgvS2NvbmZpZyBjb25maWcgTVhDX0NM
Sw0KPiAJCWRlZl9ib29sIEFSQ0hfTVhDICYmICFBUk02NA0KPiAJCXNlbGVjdCBNWENfY2xrIGJp
dHMNCj4gY29uZmlnIE1YQ19DTEtfU0NVDQo+IAkJZGVmX2Jvb2wgQVJDSF9NWEMgJiYgQVJNNjQN
Cj4gCQlzZWxlY3QgU0NVIGNsb2NrIGJpdHMNCj4gDQo+IElmIHdyb25nIHBsZWFzZSBsZXQgbWUg
a25vdy4NCj4gDQo+IFdpbGwgdXBkYXRlIHRoZSBwYXRjaCBzZXJpZXMgYW5kIHJlLXNlbmQuDQo+
IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uDQo+IA0KDQpJIHRyaWVkIGFuZCBtZXQgYW5vdGhl
ciBwcm9ibGVtIHRoYXQgTVg4TVEgKEFSTTY0KSBpcyBhbHNvDQp1c2luZyBsZWdhY3kgTVhDX0NM
Sy4gKEFuZCAzIG1vcmUgTVg4TSBzZXJpZXMgYmFzZWQgY2hpcHMuKQ0KDQpUaGF0IG1lYW5zIEkg
aGF2ZSB0byB3cml0ZSBzb21ldGhpbmcgbGlrZToNCmNvbmZpZyBNWENfQ0xLDQogICAgICAgIGJv
b2wNCiAgICAgICAgZGVmX2Jvb2wgKEFSQ0hfTVhDICYmICFBUk02NCkgfHwgKEFSQ0hfTVhDICYm
IEFSTTY0ICYmIFNPQ19JTVg4TVEpDQoNCmNvbmZpZyBNWENfQ0xLX1NDVQ0KICAgICAgICBib29s
DQogICAgICAgIGRlZl9ib29sIChBUkNIX01YQyAmJiBBUk02NCAmJiAhU09DX0lNWDhNUSkNCg0K
QnV0IGl0IGNhbid0IHdvcmsgYXMgQVJNNjQgc3VwcG9ydHMgbXVsdGlwbGF0Zm9ybXMuDQplLmcu
IHdlIGhhdmUgYWxzbyBTT0NfSU1YOFFYUCwgU09DX0lNWDhRTSwgU09DX0lNWDhETSAuLi4NCg0K
RG8geW91IGhhdmUgYSBzdWdnZXN0aW9uIGFib3V0IHRoaXM/DQoNClJlZ2FyZHMNCkRvbmcgQWlz
aGVuZw0KDQo+IFJlZ2FyZHMNCj4gRG9uZyBBaXNoZW5nDQo=
