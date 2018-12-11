Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E937C04EB8
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 02:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCDD120645
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 02:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="puYzedac"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCDD120645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbeLKCgc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 21:36:32 -0500
Received: from mail-eopbgr30053.outbound.protection.outlook.com ([40.107.3.53]:22112
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727485AbeLKCgc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 21:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoendakPlsuJwqwnlaSWI2qM67V8cpuUEsP5twFSmYg=;
 b=puYzedacrW+NX0HQ3c9IHkdYIhRJ7uEnEfo7puHvz08tI0Lb3ABGcMMfwmhoy9+8Gyhm1UQFKiw3KjtfuGY0m6bQXMRtJLWFufujbHxRdPaswBvWSK6HwKcfXDhqjwpIs2qcV9U3AOtDslI/ZtO3DoN/XqyheCO0CavtjTZIkZ4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB3970.eurprd04.prod.outlook.com (52.134.90.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.21; Tue, 11 Dec 2018 02:36:29 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Tue, 11 Dec 2018
 02:36:29 +0000
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
Thread-Index: AQHUi98lQ6o73Estskm1k5h96wz2oqV4fYEAgABeCkA=
Date:   Tue, 11 Dec 2018 02:36:29 +0000
Message-ID: <AM0PR04MB4211B87A842FB8AF14621E3380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
 <1543934041-12572-2-git-send-email-aisheng.dong@nxp.com>
 <154447530435.17204.3027810086542897433@swboyd.mtv.corp.google.com>
In-Reply-To: <154447530435.17204.3027810086542897433@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB3970;6:GNVHnNqmCfpXI0zS3F+l5sasj9UzvFlQ2QUDwHFlAebq1KPpAGYT/m/a7cqCHUBjAZ4j7NYgzSK2XqHvrfDGgdRkS1JeVVsBm515AJMiRoWYWBrJYTbhWbQz/2+F2245NEbjZ7qD4dB6mLLOfPmB7pcWtZ80KnxGfV+CNHPkQu5KekTUYqXd9cyKhwswDvCF1ikHjCNyCMDiPna6OsVPOGhM27+3rQs379ktXznrLVBlHFK41pbT1PzLH09DMVPWmd/Uo9UMi8S9MP4xYYqtpr3OkN/4LxjuHe4WNRSKMO4MrLXfXgKgMzXDk9K6VeqNtj5M4GmjQ/mSNDOg9Rq5k3WhxuXfq4ACMmW0wn7EhTFAbq5q9k1qeJDZW3Pds132aM1kP7k+HJ/wpirvn5zN5WcyAiXhN8Q9X+svBbc5t653YqOIJ2j7Z9lfNh8jgEMJxKp+M3csCUXMrfspScw11g==;5:K6DAfx3jKx8WI2PGZGH53J19hm4K8B59PSvdJc2WftcmjbIV8H2VC2FxthFW1U4yGZJvl8bog8KomFwQMPyEB5x05wk5A5FwmNMdbwDcWPN+K2tzjCdhkUm6HWtCt74WucnqYlagjVUp1bNqg0igNKycIYOpmmVGUFHbl0T5zSI=;7:ySILl0IELZqJ+tCiMCQElj4ePT7HFY+2AP75HoLIBxAMqtEffwlk1CSQg1eN7+Gm00IpF2f9SXLYzNh8EmR7wEa+STBhw36xdRQfHQal7yzXZwQ8DpI8VB2cCmiTlKJIysZ8Uyh6780IXcGC9DuK8g==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: daca6f0e-2da7-4662-14c0-08d65f1174a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB3970;
x-ms-traffictypediagnostic: AM0PR04MB3970:
x-microsoft-antispam-prvs: <AM0PR04MB3970B7B8B6DBFF4A84F01C3980A60@AM0PR04MB3970.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231472)(944501520)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB3970;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB3970;
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(13464003)(51914003)(6506007)(105586002)(8676002)(71200400001)(53546011)(6246003)(53936002)(6436002)(575784001)(86362001)(26005)(186003)(81156014)(106356001)(102836004)(316002)(110136005)(54906003)(2501003)(8936002)(9686003)(81166006)(229853002)(66066001)(55016002)(99286004)(76176011)(5660300001)(14454004)(305945005)(3846002)(486006)(7736002)(71190400001)(7696005)(74316002)(478600001)(2906002)(44832011)(6116002)(476003)(11346002)(256004)(4326008)(33656002)(68736007)(97736004)(25786009)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB3970;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: eoTxGyVcVltsUAP9E4KKjK+wibjM7CnvXnKvBvBrMzO2UeDnGaFUMcTuVhrDC0nw+IablsojcOOW+xNmLiDV1DhRixRaJmpsP8w6JoWJuCUb07FuZ2PvKO5Qu09wt7wEvlXreuKUneONguuMd0HOL9GMjSWWqd+StC6tUyxEgJOP2hypQPHIOEmfLova4GeELGRlrfdFek5/TtcmCsMgl/Xfi3oVNqiEAOf7lG8KYlJyIhhXvEp8Xr5CCvZe6KyHIreJGwmB59hGenPdJoUrLPSvDUlhtHNDWtAe6fY4sIxGny5ix+Aph5C/dciRWP0n
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daca6f0e-2da7-4662-14c0-08d65f1174a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 02:36:29.4300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3970
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMSwgMjAxOCA0
OjU1IEFNDQpbLi4uXQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY5IDEvN10gY2xrOiBpbXg6IGFk
ZCBjb25maWd1cmF0aW9uIG9wdGlvbiBmb3IgbW1pbyBjbGtzDQo+IA0KPiBRdW90aW5nIEFpc2hl
bmcgRE9ORyAoMjAxOC0xMi0wNCAwNjozOToyMikNCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
bWFjaC1pbXgvS2NvbmZpZyBiL2FyY2gvYXJtL21hY2gtaW14L0tjb25maWcNCj4gPiBpbmRleCBj
MTJhMDVjLi4zMDMwODJjIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL21hY2gtaW14L0tjb25m
aWcNCj4gPiArKysgYi9hcmNoL2FybS9tYWNoLWlteC9LY29uZmlnDQo+ID4gQEAgLTU3MCw2ICs1
ODAsNyBAQCBjb25maWcgU09DX0lNWDdVTFAgIGNvbmZpZyBTT0NfVkY2MTANCj4gPiAgICAgICAg
IGJvb2wgIlZ5YnJpZCBGYW1pbHkgVkY2MTAgc3VwcG9ydCINCj4gPiAgICAgICAgIHNlbGVjdCBB
Uk1fR0lDIGlmIEFSQ0hfTVVMVElfVjcNCj4gPiArICAgICAgIHNlbGVjdCBNWENfQ0xLDQo+ID4g
ICAgICAgICBzZWxlY3QgUElOQ1RSTF9WRjYxMA0KPiA+DQo+IA0KPiBJbnN0ZWFkIG9mIHNlbGVj
dCBjYW4gd2UgYnJlYWsgdGhpcyBkZXBlbmRlbmN5IG9uIHRoZSBhcmNoIEtjb25maWcgYW5kDQo+
IGhhdmU6DQo+IA0KPiAJY29uZmlnIE1YQ19DTEsNCj4gCQlkZWZfYm9vbCBBUkNIX01YQyAmJiAh
QVJNNjQNCj4gDQoNClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uDQpPbmUgbGl0dGxlIHByb2Js
ZW0gaXMgdGhhdCB3ZSBhbHNvIGhhdmUgTFMxMDIxIHN1cHBvcnRlZCB1bmRlciBBUkNIX01YQyB3
aGljaA0KZG9lcyBub3QgdXNlIE1YQ19DTEsuDQogDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL2lteC9NYWtlZmlsZSBiL2RyaXZlcnMvY2xrL2lteC9NYWtlZmlsZSBpbmRleA0KPiA+IDVj
MGIxMWUuLmY4NTA0MjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvaW14L01ha2VmaWxl
DQo+ID4gKysrIGIvZHJpdmVycy9jbGsvaW14L01ha2VmaWxlDQo+ID4gQEAgLTEsNiArMSw2IEBA
DQo+ID4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPg0KPiA+IC1vYmot
eSArPSBcDQo+ID4gK29iai0kKENPTkZJR19NWENfQ0xLKSArPSBcDQo+IA0KPiBCZWNhdXNlIHRo
aXMgY2hhbmdlcyB0byBvYmotJChDT05GSUcpIHdlIHNob3VsZCBjaGFuZ2UgdGhlDQo+IGRyaXZl
cnMvY2xrL01ha2VmaWxlIHRvIGhhdmUgb2JqLXkgZm9yIHRoaXMgTWFrZWZpbGUgaW5zdGVhZCBv
ZiBkZXBlbmRpbmcgb24NCj4gQVJDSF9NWEMuDQoNCldlIGFsc28gdXNlIEFSQ0hfTVhDIGZvciBB
Uk12OCBTb0MgY2xvY2tzLg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==
