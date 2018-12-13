Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBED7C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:22:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B44320880
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="owfNFi/Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B44320880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbeLMLWf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 06:22:35 -0500
Received: from mail-eopbgr60079.outbound.protection.outlook.com ([40.107.6.79]:1104
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728590AbeLMLWe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 06:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrN0UFruDfCB+XTThiWu/zcFnsT2ePc0cF8ci2yGta0=;
 b=owfNFi/ZlJPRbTvxeZMjzX2wUIovh+v5hXIKYHGhglh/FPtk7QvMFmDFYI28tmNcGJRtG4ud6+dnfUmpIoBcLt4Tw2xTswTJdOHBSAiBQsBtA0ndOaSE589yzj/hORzZL4yRvPMGnaIAHQdntCTx4cCv8ZvHoVqM6JvddJMvLEA=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5457.eurprd04.prod.outlook.com (20.178.115.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.19; Thu, 13 Dec 2018 11:22:30 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Thu, 13 Dec 2018
 11:22:29 +0000
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
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH V11 3/7] dt-bindings: clock: imx8qxp: add SCU clock IDs
Thread-Topic: [PATCH V11 3/7] dt-bindings: clock: imx8qxp: add SCU clock IDs
Thread-Index: AQHUkoBJ3nMlGROFrU6bg2ZCY4FtGaV8ToAAgAA4W+A=
Date:   Thu, 13 Dec 2018 11:22:29 +0000
Message-ID: <AM0PR04MB42118E9A492C8AE921791F6B80A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-4-git-send-email-aisheng.dong@nxp.com>
 <154468796011.19322.4309575824691854273@swboyd.mtv.corp.google.com>
In-Reply-To: <154468796011.19322.4309575824691854273@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5457;6:2wbedK1tEHn49l5APdUKGvnSJLEVbwm7I8nxaQEdrcPFvPDC3f1t7rTl07sQqE2nR73mBIeIYvsG29lPYWjrdnkz+lXvkf/pdCUUFPRJNvEJP399/DS8arziqSOyC0nl+lt5a5t2xWZkOc+nnehsQaoHabiGOJqlIENgsohjgH36DP1tK0Q/uWLUDcAYgH2R9Lh2flVukybzPqrUfvJpZpWQL9ib+XJflgLy9uL7Z/0a4AYscHK44jWDQAoQugzVKdAZlcjpmA4PR+Y9TGMawgkw8NaegM7ha29pYpJSANlUtszIsaCV0NSyidDWRVAa1He4bdYjErmlGvJH3QBtuGWm+agfePCojujpn7IGUPdx0eET90Cnr0gqnNl6w7qi7sY6js53lMHCufOBuz1Hxnqguve1kgYgLX0nqLlsYirX14ldQWVGqj4cbxNvR7On/mrROo5A2u0dVNqXW01pBg==;5:iyM5n6mpLtZTX1RAI94IeekvQrboujLTKXBjOkTut9kmX1n5gBHgjSB+poodZuv0sMCU4Jc3OL87+gwmEN0hHsMfmQgKYy2Rx/4fEVx0mmP9LIiCmJFMXzee962yuQQLWXJPMTF2fSMaaF0Mm7bBPQrY5Gu+QKVuaqpMgrL25lA=;7:GSga3RfXgrJjJI8TGs+SMQOLHpsVgt7gvsl/SlPp2XaeWffn8KspJePtyiMvgJRUYq10EbaxtZq0TjbTdkiOcdYBhzqhvkwHp4bo6faaSV3fFjCGdXu8suzk2D08FuK2YjlF5Gcj4XbLbgj3BkHSUg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 66fa3e58-bafa-4227-4600-08d660ed44e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5457;
x-ms-traffictypediagnostic: AM0PR04MB5457:
x-microsoft-antispam-prvs: <AM0PR04MB545748B1E3508761E71D8AF180A00@AM0PR04MB5457.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3231475)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5457;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5457;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(396003)(136003)(376002)(346002)(51914003)(13464003)(189003)(199004)(81166006)(54906003)(8936002)(14454004)(7736002)(305945005)(74316002)(478600001)(9686003)(316002)(102836004)(81156014)(5660300001)(7696005)(110136005)(2906002)(3846002)(76176011)(6116002)(68736007)(4326008)(11346002)(6506007)(99286004)(446003)(25786009)(476003)(2501003)(6436002)(26005)(53936002)(66066001)(44832011)(106356001)(229853002)(105586002)(486006)(186003)(8676002)(71200400001)(55016002)(86362001)(97736004)(6246003)(33656002)(4001150100001)(71190400001)(256004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5457;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 8bS7wJrGIudSwAVtL2+EhW+dW7NbxSTtx7/Sw/5ILvDna34wCD8sblYWcDLO5zqT8k1WgJzuDWN91CVKmmRXMYXclx2ZmLUl1jfSQ9p9BL4cULvrNN5noPB5i+9CwDD0P1/DLdIG+znHpkRocBZmu/SRmLyObAeMLJM0drWq7xgx18gH7RNnl3DIS37vK2zemMvegTbP9a/l2X8Xl6QplwXrJT1pRG+leWRHO4sLy1Wjjllx6xDvLMAL85wm5Z8Pyx8tn+x3yxbGV4ZSUaVm27MtCJEU1dUF1f/FEp0n6V+Xuca8G0Eq9lcT+oqW7mzl
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fa3e58-bafa-4227-4600-08d660ed44e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 11:22:29.8261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5457
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5nIEFpc2hlbmcgRG9uZyAoMjAxOC0xMi0xMiAx
NzowNzo1OSkNCj4gPiBBZGQgSU1YOFFYUCBTQ1UgY2xvY2sgSURzLg0KPiA+DQo+ID4gQ2M6IFN0
ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1
b0BrZXJuZWwub3JnPg0KPiA+IENjOiBTYXNjaGEgSGF1ZXIgPGtlcm5lbEBwZW5ndXRyb25peC5k
ZT4NCj4gPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBDYzogbGludXgtY2xr
QHZnZXIua2VybmVsLm9yZw0KPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54
cC5jb20+DQo+ID4gLS0tDQo+IA0KPiBBcHBsaWVkIHRvIGNsay1uZXh0DQo+IA0KPiBQbGVhc2Ug
c2VuZCB0aGVzZSBhdCB0aGUgc3RhcnQgb2YgdGhlIHNlcmllcyBpbiB0aGUgZnV0dXJlLiBUaGF0
IHdheSBwbGF0Zm9ybQ0KPiBtYWludGFpbmVycyBjYW4gbWVyZ2UgdGhlIGZpcnN0IGZldyBiaW5k
aW5nIHBhdGNoZXMgaW50byB0aGVpciB0cmVlIGFuZCBub3QNCj4gZHJhZyBpbiB0aGUgZHJpdmVy
IGNvZGUgdG8gdGhlaXIgYXJtLXNvYyBwdWxscy4NCg0KR290IGl0LCB0aGFua3MgZm9yIHRoZSBn
b29kIGV4cGVyaWVuY2Ugc2hhcmluZy4NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQoNCg==
