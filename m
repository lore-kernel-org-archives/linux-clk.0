Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F88C6786C
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 06:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92BB720811
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 06:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="sa3VOh05"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92BB720811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbeLNGPh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 01:15:37 -0500
Received: from mail-eopbgr80079.outbound.protection.outlook.com ([40.107.8.79]:19296
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727020AbeLNGPh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 01:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK8e9vEur2yMaG3gDpadpfvSLLAk5k8lij0WLx2+1V0=;
 b=sa3VOh05lpry+xw0Twi9UXZ2H2lsAMZ2ylHoBWT3fImyYF1yMWIV2X9olgPwew6BDuDTzJUjV6zht2ByoOgaxinc1oRWPo1D5hGWrOuk8ZDeA4dBdaspD7aOFDUQQ+2gqa+PrRXT2C+QL9Z7yOLD2r/LAwD6Ps2tXdXFXu2w08I=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4129.eurprd04.prod.outlook.com (52.134.125.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Fri, 14 Dec 2018 06:15:32 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.028; Fri, 14 Dec 2018
 06:15:31 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
CC:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V12 0/5] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V12 0/5] clk: imx: add imx8qxp clock support
Thread-Index: AQHUkvp+2I/kA9Gq1kKYOSfh1d+quqV9fQkAgAABMXCAABN6AIAAA+qggAAGT4CAAA3/QIAADGWAgAAKNwCAAADXMA==
Date:   Fri, 14 Dec 2018 06:15:31 +0000
Message-ID: <AM0PR04MB421173833F56341C5445FAFD80A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
 <20181214020533.GC13243@dragon>
 <AM0PR04MB42114ACB1A55BB42D2C5523280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214031931.GD13243@dragon>
 <AM0PR04MB4211D692CBED348EF8C109A180A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214035606.GE13243@dragon>
 <AM0PR04MB4211CEFB586B7878BBB58FEB80A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214053033.GF13243@dragon>
 <154476762849.19322.6761040252503231833@swboyd.mtv.corp.google.com>
In-Reply-To: <154476762849.19322.6761040252503231833@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4129;6:CHPwvXARw7awMrwqiWCz4+8nR/vYgPz7Ve26KXPsnSVTB2hM6W83q4DpdcRDDds/zMYUHKlgJ2wakTlTdwPs5Zdc8d0Gnkml2QkMWMNsHNvKyFeOgqvDZz7vi5WjVuexW9vv7ttNmd4BCeqwHzRNyNRUoNa8Ft6WruojevKKl3MO+l5DGX6SxXTLD/Fvu2lm5J8OQ5NIOK7emiQCKMxHO6GLDm11LVxTgLrHQ7gDggEr4XohfZozGau6/rXjrDNFM750ghzqju2Iht7EzDg4kUqzHSO2YUXjTSBWvIkoDCbpeYLp5ysH5h8xhFwkTKpScOzdLjzQNq0lpOhv4+0wuma+LkKrqQ9bHvMwmmoXaxocMbndXnFGIHayFH8xc30LkvkERVZrGWzNmk3BH5yp0Elnv6AyXpfJtfPoaSqb0hCPd5lMVisYQR9WwnIZM3PC9khTajBYMVEcXGLRau1icA==;5:zxPF0CHauMQu1+rGWGIKj+8Zc2+cWDBDaRFv5xR1M0jw4pLYEDacktVHWI3cIgljIOohoC8qV9KO8YsghxURUu3GM4vlPyzDYeyXVhk+oNNUP+pQPDPqnN9tc5f+9mZq1+6JJeHvDhx47dfwJhAA5cswktNSNBb0ELBUuW9Hj4E=;7:UefmllgpWwany1H/BPZuFT7CXTaTJHwa2AcwP+ft5tDuzB2RjnSLgl1nAIuFHsAQIVX0f5odgfXmuI830J27tRZoYohoOIOWlDjeX2DxQzgkdFO3Fp2rW/gbVWtUQH58rtFaQjx+0oFfSIXvu1P+ng==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a0170ab7-3edc-44a3-c3c2-08d6618b8d5b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4129;
x-ms-traffictypediagnostic: AM0PR04MB4129:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-prvs: <AM0PR04MB412937D6757970054DD5279A80A10@AM0PR04MB4129.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4129;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4129;
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(396003)(376002)(346002)(366004)(136003)(39860400002)(189003)(199004)(25786009)(110136005)(186003)(4326008)(9686003)(55016002)(81156014)(106356001)(81166006)(97736004)(229853002)(105586002)(8676002)(54906003)(316002)(33656002)(4001150100001)(26005)(71190400001)(6506007)(6246003)(102836004)(71200400001)(478600001)(99286004)(14454004)(7736002)(305945005)(74316002)(53936002)(86362001)(76176011)(7696005)(6436002)(5660300001)(256004)(66066001)(6116002)(3846002)(44832011)(8936002)(476003)(486006)(2906002)(68736007)(11346002)(446003)(93886005)(32563001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4129;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: S84Jlx1xemyUyO+J/Gpve7uXu0qDeW0otxcdeg8v2UMeGluLGpXHv1eq5JCu04ccg70zLUWCk21nGNInhKdqInTvAszM1jCxcYrDPI2pQoAwFZRRJcrILHdqkytQQZ4pw0Zdr5FCtgSeDqZc0+Poh3ErTKyC2NVbli6hlmB2zGCAtuWs7nAkSjz2sI+u/jREojDNEHstFpZUid8wEe5PPwlUCbtNAnOSQuuExB3cdYdGmagfAPPR6x6at1UeTS2NpFKAKbV5ruN09nbEUJgKDah9oOCuWE4LZKI0GoIOr2GUQh+K9xuuggNJSas+7uiJ
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0170ab7-3edc-44a3-c3c2-08d6618b8d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 06:15:31.8342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4129
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5n
IFNoYXduIEd1byAoMjAxOC0xMi0xMyAyMTozMDozNSkNCj4gPg0KPiA+IEluIGNhc2UgU3RlcGhl
biBpcyBmaW5lIGJ5IHB1bGxpbmcgZGVwZW5kZW5jeSBmcm9tIG15IHRyZWUsIGl0J3MgYWxsDQo+
ID4gb24gYnJhbmNoIGJlbG93LCB3aGljaCBoYXMgYmVlbiBwdWxsZWQvcXVldWVkIGJ5IGFybS1z
b2MgZm9sa3MgZm9yDQo+ID4gNC4yMSBtZXJnZSB3aW5kb3cuDQo+ID4NCj4gPiAgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3NoYXduZ3VvL2xpbnV4LmdpdA0K
PiA+IGlteC9kcml2ZXJzDQo+ID4NCj4gDQo+IEkgY2FuIHB1bGwganVzdCB0aGUgZmlyc3QgcGF0
Y2ggZnJvbSB0aGlzIGJyYW5jaCBhbmQgdGhlbiBldmVyeXRoaW5nIHdpbGwgY29tcGlsZT8NCj4g
VGhhdCBzaG91bGQgYmUgT0suDQoNCkl0IGFsc28gbmVlZHMgdGhlIDR0aCBwYXRjaCAiZmlybXdh
cmU6IGlteDogYWRkIHBtIHN2YyBoZWFkZmlsZSIuDQpCdXQgSSBjYW4gY29weSB0aGUgcmVxdWly
ZWQgZGVmaW5pdGlvbnMgaW50byBjbGsgZHJpdmVyIGFuZCBjbGVhbiB1cCB0aGUgb3JpZ2luYWwg
b25lIGxhdGVyDQphZnRlciBtZXJnZSBpZiB5b3UgdGhpbmsgaXQncyBvay4NCg0KUmVnYXJkcw0K
RG9uZyBBaXNoZW5nDQoNCg==
