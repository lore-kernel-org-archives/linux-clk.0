Return-Path: <SRS0=xlmH=M7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2329ECDE3D
	for <linux-clk@archiver.kernel.org>; Fri, 19 Oct 2018 09:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 417122064A
	for <linux-clk@archiver.kernel.org>; Fri, 19 Oct 2018 09:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Om4humB8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 417122064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbeJSRKc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Oct 2018 13:10:32 -0400
Received: from mail-ve1eur01on0047.outbound.protection.outlook.com ([104.47.1.47]:29767
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726968AbeJSRKc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Oct 2018 13:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMxYqj/zI06xfqWiur7fOzR2C7iZMGYl5vZgXuxHCWo=;
 b=Om4humB85gf1rz6C9V/bmuVOs5UAsLNpoJV5ABSVhL+HJOusd28OuXtzj2bVdi7dS12DF6IHPRyaSF7KXGuVM4pgEtNgMzWccoPpNuHr1jAC9932t0TaYi21RfT+TpUI8E1gP0CBEcKG5JYjI/FC+V03H+3hSeGebNiE03gajrY=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5329.eurprd04.prod.outlook.com (52.134.125.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.29; Fri, 19 Oct 2018 09:05:16 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1250.028; Fri, 19 Oct 2018
 09:05:16 +0000
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
Thread-Index: AQHUZwMzoA17UBIsSkGVKzG2jHXioaUlRLCAgAAIYRCAACwagIAAyKWw
Date:   Fri, 19 Oct 2018 09:05:16 +0000
Message-ID: <AM0PR04MB42112BEEF4DB939F13D6AF1680F90@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
 <1539881347-20871-10-git-send-email-aisheng.dong@nxp.com>
 <153988429912.5275.13469659599335212731@swboyd.mtv.corp.google.com>
 <AM0PR04MB42112CB1324B0994A26AB15D80F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153989556955.53599.9032716427049619310@swboyd.mtv.corp.google.com>
In-Reply-To: <153989556955.53599.9032716427049619310@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5329;6:/gPDfssP4YCcRirG//5AbDnHi73Ybvam2IyPPODbGp1XDbmCjOwEbLgxrUKklH1nWXsyWHlcMwg2gJDQEzgVczXB/lbyV0fVGMI537+yRAZKGOxVhPp+BFBRBSpule1KY+pFFWuUGQI3hsvpvkoEY3VfTYmekR3pzi/faf4h80U443kkTp5rDLrVLU7yrhw5VoG1ySkHUMUaMb7JAi9K3306ZC/WfZEGSpdBKFOJRWw/dER3MN8dEKHX6+SjTIEoYQjN0aCocUJoneJH5OD8mI3Z7I00K00CD6mHY86+wiTzixzrXeKMXHuVZruURQMGlK8gAGluWnXzahRuTvSEqR54s8M15q0tOo4A1t9IouN7M1xCBDv8CD7UUwFrK8secis9t76Ct6wfXTDgC/gCGfr+nbeuShvEpdwXAYBToayKwYSiHUCLYY7WLwZGVCcitR0TbXRvPdqJx0cPxLHGAg==;5:s47H76xy25wuTCLuvhd1nEuNGRKosLc2sJglNYXAviAa9OPdeIGk9EbNqf6yifck2BVHBKKG6sqMudIZnt9RNckCm2JZuk036qANWsEXwnnbC2EUX0CWjRyrcWs8tOBLVKQ76jH++yzhQRpiruA89RQGhw2KJF+CxApSLxcE9oo=;7:ZvGd/EqVpAwxO1DvwEuRD3HqQF8DAQGqINw3JkgEdLRoYWWNnfVVDc1ERXgA++wzWxdCi4vXVSTWwOpNtWkVvlME9qTZdrEp5QQ1oytGAooHlGUSMI+7Z4JTu9gQuNDF4ylO3IjoR31Av/jw02BJds+dDAnrmHwZPJvxPS2S0ZFEPt8AknfHWLiO35bL5dTKlKKLReBRt/y4Nw4FKGDEr+jJtlq+5L9Ma5scQ2VvWz0SkW8t0kmtA3CyhbfrdUxe
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 3c34fec3-ab8d-40b3-7aed-08d635a1fcf2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5329;
x-ms-traffictypediagnostic: AM0PR04MB5329:
x-microsoft-antispam-prvs: <AM0PR04MB53295D7DA73E5C8EEAC0421180F90@AM0PR04MB5329.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(9452136761055)(258649278758335)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231355)(944501410)(52105095)(10201501046)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5329;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5329;
x-forefront-prvs: 0830866D19
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(366004)(346002)(52084003)(199004)(189003)(13464003)(74316002)(478600001)(66066001)(99286004)(7736002)(76176011)(2501003)(7696005)(305945005)(9686003)(55016002)(6346003)(26005)(53936002)(81156014)(6436002)(81166006)(102836004)(8676002)(2906002)(4001150100001)(229853002)(71190400001)(186003)(476003)(53546011)(6506007)(97736004)(11346002)(14454004)(446003)(6246003)(486006)(71200400001)(8936002)(93886005)(106356001)(54906003)(33656002)(105586002)(25786009)(256004)(14444005)(5250100002)(110136005)(4326008)(316002)(5660300001)(3846002)(6116002)(2900100001)(68736007)(86362001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5329;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: HQyf2ua7SsirJxzkJBglxrvXlmlr58y/SNX5s4klqKq+L2bHcPXpQ1XL0xyV+Fj3IUMMzaZNmfPMyDsP7IrrFffPD546Vx/hoYdrqmZ7hX09cu+aPloLR8B9cIKTSIOeuJUGUuQ4M5SpYWzKt4dxtZfv9HwU3eZaCezfCArqZOumAGeE8xJ+RAi63mgk6SyoDYSx7yZMx+oEA36/gceY+brgpwwIdhn4enXiY8w2hsbRHz6cYl2aBEP0ARXagFnEYh4B/tbUhrgoFXGLsCk3lLo9uS3i9gFQZt+U2omfHPwUoAK0DOD5uo/b2snGO6wfnXjYEsBnO3Sjlh31Jg/4UTeeaVoWkxN6neHWUiP5QyU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c34fec3-ab8d-40b3-7aed-08d635a1fcf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2018 09:05:16.8166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5329
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTksIDIwMTggNDo0
NiBBTQ0KPiBUbzogQS5zLiBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IGxpbnV4LWNsa0B2
Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IEZhYmlv
IEVzdGV2YW0gPGZhYmlvLmVzdGV2YW1AbnhwLmNvbT47IGRsLWxpbnV4LWlteA0KPiA8bGludXgt
aW14QG54cC5jb20+OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGUNCj4gU3ViamVjdDogUkU6IFtQQVRD
SCBWNSA5LzldIGNsazogaW14OiBhZGQgaW14OHF4cCBjbGsgZHJpdmVyDQo+IA0KPiBRdW90aW5n
IEEucy4gRG9uZyAoMjAxOC0xMC0xOCAxMToxMzozOSkNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJuZWwu
b3JnXQ0KPiA+ID4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDE5LCAyMDE4IDE6MzggQU0NCj4gPiA+
IFRvOiBBLnMuIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgbGludXgtY2xrQHZnZXIua2Vy
bmVsLm9yZw0KPiA+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+ID4gPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBGYWJp
byBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+Ow0KPiA+ID4gZGwtbGludXgtaW14IDxs
aW51eC1pbXhAbnhwLmNvbT47IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgQS5zLiBEb25nDQo+ID4g
PiA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFY1IDkv
OV0gY2xrOiBpbXg6IGFkZCBpbXg4cXhwIGNsayBkcml2ZXINCj4gPiA+DQo+ID4gPiBRdW90aW5n
IEEucy4gRG9uZyAoMjAxOC0xMC0xOCAwOTo1NDoxNSkNCj4gPiA+ID4gKw0KPiA+ID4gPiArI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2lteDhxeHAtY2xvY2suaD4NCj4gPiA+ID4gKyNpbmNs
dWRlIDxsaW51eC9jbGsuaD4NCj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gPiA+
ID4gKyNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+
DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KPiA+ID4gPiArI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+
ID4gPiArDQo+ID4gPiA+ICsjaW5jbHVkZSA8c29jL2lteC9pbXg4cXhwL2xwY2cuaD4NCj4gPiA+
ID4gKw0KPiA+ID4gPiArI2luY2x1ZGUgImNsay1zY3UuaCINCj4gPiA+ID4gKw0KPiA+ID4gPiAr
c3RhdGljIHN0cnVjdCBjbGtfaHdfb25lY2VsbF9kYXRhICppbXg4cXhwX2Nsa19kYXRhOw0KPiA+
ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGVuZXRfc2Vsc1tdID0g
eyAiZW5ldF8yNU1IeiIsDQo+ID4gPiA+ICsiZW5ldF8xMjVNSHoiLCB9OyBzdGF0aWMgY29uc3Qg
Y2hhciAqIGNvbnN0IGVuZXQwX3JtaWlfdHhfc2Vsc1tdDQo+ID4gPiA+ICs9IHsgImVuZXQwX3Jl
Zl9kaXYiLCAiZHVtbXkiLCB9OyBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0DQo+ID4gPiA+ICtl
bmV0MV9ybWlpX3R4X3NlbHNbXSA9IHsgImVuZXQxX3JlZl9kaXYiLCAiZHVtbXkiLCB9Ow0KPiA+
ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgaW50IGlteDhxeHBfY2xrX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpIHsNCj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
KmNjbV9ub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ID4gPg0KPiA+ID4gV2hlcmUncyB0aGUg
RFQgYmluZGluZyBmb3IgdGhpcyBkZXZpY2U/DQo+ID4NCj4gPiBTb3JyeSBmb3IgbWlzc2VkIHRv
IG1lbnRpb24gdGhpcy4NCj4gPiBJdCdzIGJlZW4gbWVyZ2VkIGludG8gc2N1IGJpbmRpbmcgZG9j
IHBlciBSb2IncyByZXF1ZXN0IHdoaWNoIGhhcw0KPiA+IGFscmVhZHkgYmVlbiBpbiBTaGF3bidz
IHRyZWUuDQo+ID4NCj4gPiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQgaGVyZToNClsuLi5dDQo+IA0K
PiBPayBJIGFzayBiZWNhdXNlIGl0J3Mgb2RkIHRvIGhhcmRjb2RlIHBoeXNpY2FsIGFkZHJlc3Nl
cyBpbiBhIGNsayBkcml2ZXIgd2hlbg0KPiB0aG9zZSBzaG91bGQgY29tZSBmcm9tIERUIGluIHJl
ZyBwcm9wZXJ0aWVzLiBXYXMgUm9iIGF3YXJlIHRoYXQgdGhpcyBjbGsNCj4gbm9kZSB3YXMgY29t
YmluaW5nIEkvTyBtZW1vcnkgYW5kIG1lc3NhZ2UgcGFzc2luZz8NCg0KWWVzLCBJIGFncmVlIHdp
dGggeW91LiBUaGF0IHNlZW1zIGxpa2UgYSBzcGVjaWFsIHRvIGkuTVggY2FzZS4NClRoZSBwcm9i
bGVtIGlzIG5vdCBhbGwgY2xvY2tzIGhhdmluZyBhIExQQ0cgZ2F0ZS4gQW5kIHRob3NlIExQQ0dz
IGFyZSBhbHNvIG5vdA0KY29udGludW91cyBhbmQgbWF5IGJlIHNoYXJlZCBieSBtYW55IGNsb2Nr
cyB3aGljaCBtYWtlIHRoaW5ncyBtb3JlIGNvbXBsaWNhdGVkLg0KSSdtIG5vdCBzdXJlIHBhcnNp
bmcgZnJvbSBkZXZpY2UgdHJlZSBjb3VsZCBiZSBiZXR0ZXIgd2F5IHRvIGRvIGl0Lg0KUHJvYmFi
bHkgbmVlZCBodWdlIGNoYW5nZXMuDQoNCkhvdyB3b3VsZCB5b3Ugc3VnZ2VzdD8NCkRvIHlvdSB0
aGluayB3ZSBjYW4gd29ya2Fyb3VuZCB0aGlzIGR1ZSB0byB0aGUgc3BlY2lhbCBpTVg/DQoNClJl
Z2FyZHMNCkRvbmcgQWlzaGVuZw0K
