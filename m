Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C03FC67839
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 06:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B26020811
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 06:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="w8/1Vwgz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B26020811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbeLNGQ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 01:16:56 -0500
Received: from mail-eopbgr30053.outbound.protection.outlook.com ([40.107.3.53]:62272
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726437AbeLNGQz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 01:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+FBpd83tk2ANQ9vywX9ZBzbdXe9hn5snnyeqOYqJVA=;
 b=w8/1Vwgz3d1zGwCaToi2OK4QIefRhQ56ihl/e+AXe4ZDv9M91DGjKqLmJK/0sizM3QNeLZg9q6j0Ag9BHqRptZ6SyB9KP8j4kazvzdY5g154nN2ht5Lo+IpJ0Om0GW2qkfdXadKOpzp9JhZZSdPv4n+wmSjMR1tBvelJNVgfhbw=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4865.eurprd04.prod.outlook.com (20.176.215.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.18; Fri, 14 Dec 2018 06:16:52 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.028; Fri, 14 Dec 2018
 06:16:52 +0000
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
Thread-Index: AQHUkvp+2I/kA9Gq1kKYOSfh1d+quqV9fQkAgAABMXCAABN6AIAAA+qggAAGT4CAAA3/QIAADGWAgAAKNwCAAAJOgIAAACKA
Date:   Fri, 14 Dec 2018 06:16:52 +0000
Message-ID: <AM0PR04MB4211E547638B39B2A44015A080A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
 <20181214020533.GC13243@dragon>
 <AM0PR04MB42114ACB1A55BB42D2C5523280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214031931.GD13243@dragon>
 <AM0PR04MB4211D692CBED348EF8C109A180A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214035606.GE13243@dragon>
 <AM0PR04MB4211CEFB586B7878BBB58FEB80A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214053033.GF13243@dragon>
 <154476762849.19322.6761040252503231833@swboyd.mtv.corp.google.com>
 <154476812306.19322.4832664425826114886@swboyd.mtv.corp.google.com>
In-Reply-To: <154476812306.19322.4832664425826114886@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4865;6:R44mCOPINz2//Kp7/mm6OxxBaQspChR2YOy/HO6jxNbmh4OwULRkFGxcKrufoKWAdKQ+PnyQns/k0YCMrZFb7jJ+QoAW5Lxf/p5W2wuEBxXIH1Q4+pD1aFKzy7XXPhIkXSytWTqNCDVEGtM7KWnFUXS5EHlCKxR/FRKyCjbv4w7uYhe75nfAbL3wuVEpQeng+8DHkCy8LITAKjdqbqOa2wvjlvlCkQj98Gb5Bwu5JjQL5EriyfUeM7pZbawazxX3moLXWrMl6HlQ6NO+52yOh5SdjC5AvwqnmHclobuSKXGWlX5ggob1vxLE9z1/RAmMyIh9aJxR3U89coe2hZ2TlFUaepnVtPbrchE4q8estm96NG3EFY2nqkRXvbPFMsriOLdw36SQ6UWERVUrKLx0eaaPzaYnzwrACaN1IoFHTxOIjlL1VhguvfSIRN9GOO7i3GidGlogueOvgE4hBOYYmA==;5:EqRiN/SwaPeuLNKrbCDsFw2GCA8X2gNKrCl2qJ2g+FGARsl4o+/axhsc+38iSw1xpIlTqw0rXSy+UIPYNcwQWl8DHQsAKGtRfBHlYRuBnrxJBv5we/tJhDo2Cl3L6xRZqvjfe2Rpg0aonk3fPewpqqJfEfdEjXggQ5O8PuB5zkM=;7:HVljdSp1eFCtw2JZ3VkW56cRqN4uaebZacHj6BPfsAADzK7Ygaw8AMCdaHx48qHcuuoDHRZa4bO4o2JOQjoGvul1qV1EYRi8EnA+1f7vq+XnX/nOqAd/VLU/e6/AI61hpZjMCx/PyYsGE1Wr3/3Q1A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b1f82e5a-b312-4626-65e1-08d6618bbd40
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4865;
x-ms-traffictypediagnostic: AM0PR04MB4865:
x-microsoft-antispam-prvs: <AM0PR04MB486558B13EA4C1D649A0545E80A10@AM0PR04MB4865.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231475)(944501520)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4865;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4865;
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(396003)(39860400002)(136003)(376002)(13464003)(199004)(189003)(2906002)(33656002)(93886005)(66066001)(71200400001)(6436002)(71190400001)(55016002)(478600001)(7736002)(305945005)(14454004)(256004)(99286004)(106356001)(105586002)(4001150100001)(5660300001)(316002)(229853002)(81166006)(86362001)(102836004)(74316002)(26005)(76176011)(54906003)(9686003)(44832011)(8936002)(486006)(8676002)(81156014)(6246003)(476003)(6506007)(53936002)(6116002)(186003)(3846002)(68736007)(25786009)(11346002)(4326008)(446003)(110136005)(7696005)(97736004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4865;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: tr81m/iF9SWYG4RwvM+iGns+n5QcT7jaA4r2R7+7yjamRWi8RKU/c6LDRoaCv7XOph5BlnAqKMVngY06hchnyMC3JSEgtOAktNR0XuYsCMjuC3zczJxtabpnzp4jrRl+t3nm5I3AvnWfbyD5Gkg7vTYrZ4TAS1Fdrga1Zrtyu6bD2RPsyU+Y8txJkecvzBlnwqHLjcQNzZg8bqnpO5ANxW3WUNvJ9avK6mZAChZb0m015EnhDTlfYYezrSt5NUVHaEu3XlM4PFOz6+G1rOpoq/pHURK3wavPxqLzn2vf74Zc+7rxCuZ7LF+4JI69Sqjn
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f82e5a-b312-4626-65e1-08d6618bbd40
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 06:16:52.1755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4865
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5nIFN0ZXBoZW4gQm95ZCAoMjAxOC0xMi0xMyAy
MjowNzowOCkNCj4gPiBRdW90aW5nIFNoYXduIEd1byAoMjAxOC0xMi0xMyAyMTozMDozNSkNCj4g
PiA+DQo+ID4gPiBJbiBjYXNlIFN0ZXBoZW4gaXMgZmluZSBieSBwdWxsaW5nIGRlcGVuZGVuY3kg
ZnJvbSBteSB0cmVlLCBpdCdzIGFsbA0KPiA+ID4gb24gYnJhbmNoIGJlbG93LCB3aGljaCBoYXMg
YmVlbiBwdWxsZWQvcXVldWVkIGJ5IGFybS1zb2MgZm9sa3MgZm9yDQo+ID4gPiA0LjIxIG1lcmdl
IHdpbmRvdy4NCj4gPiA+DQo+ID4gPiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3NoYXduZ3VvL2xpbnV4LmdpdA0KPiA+ID4gaW14L2RyaXZlcnMNCj4gPiA+
DQo+ID4NCj4gPiBJIGNhbiBwdWxsIGp1c3QgdGhlIGZpcnN0IHBhdGNoIGZyb20gdGhpcyBicmFu
Y2ggYW5kIHRoZW4gZXZlcnl0aGluZw0KPiA+IHdpbGwgY29tcGlsZT8gVGhhdCBzaG91bGQgYmUg
T0suDQo+ID4NCj4gDQo+IEhtLi4gdHVybnMgb3V0IEkgbmVlZCB0byBwdWxsIHVwIHRvDQo+IA0K
PiAwYTkxNGE0OTQ4ZDQgZmlybXdhcmU6IGlteDogYWRkIHBtIHN2YyBoZWFkZmlsZQ0KPiANCj4g
YnV0IHRoZW4gaXQgYWxsIGNvbXBpbGVzIGZpbmUuIE9rIEkgY2FuIGRvIHRoYXQuDQoNClllcywg
aXQgaXMuDQpSZWFsbHkgYXBwcmVjaWF0ZSBmb3IgeW91ciBraW5kIGhlbHAuDQoNClJlZ2FyZHMN
CkRvbmcgQWlzaGVuZw0K
