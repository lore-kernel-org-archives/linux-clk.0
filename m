Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A946C07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 04:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24C5620672
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 04:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="eTicZj6G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C5620672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbeLKEGj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 23:06:39 -0500
Received: from mail-eopbgr40072.outbound.protection.outlook.com ([40.107.4.72]:28032
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727594AbeLKEGj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 23:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iRLmvYNgZEshPDfT5bQXdhVD3/xeaBxphY5yHqq/wY=;
 b=eTicZj6Ga5IYob/g0AohJEyKFIPyuRJ9tgRzPccc+BhR4W0WXtxjYNTGIek6aKH/3u0x3nfGKL8x7JhHLkjZ9vYtOt6OlPvK44lPqX3rn0Yo3TKH1sLbu1zkIf6IVVdUugrq4BRAobBztJohiiVabR2Kl/k7VR6PaOvOPJLGMF8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4145.eurprd04.prod.outlook.com (52.134.125.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.21; Tue, 11 Dec 2018 04:05:56 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Tue, 11 Dec 2018
 04:05:56 +0000
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
Subject: RE: [PATCH V9 0/7] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V9 0/7] clk: imx: add imx8qxp clock support
Thread-Index: AQHUi98jvykrnvKQL0Kg33biwal6j6V4eymAgAB4qnA=
Date:   Tue, 11 Dec 2018 04:05:55 +0000
Message-ID: <AM0PR04MB4211BE52F403155BD09538C780A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
 <154447480107.17204.18337865638259063687@swboyd.mtv.corp.google.com>
In-Reply-To: <154447480107.17204.18337865638259063687@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4145;6:sjQhA3lWz9lC7HWM1pTCDSkJBDmC0MCXPkDB1tfqd2g+NZ7ryCYlYamDnMfnTMWj9dLDXCuabnmkgQlbT3dY6w0EgN2/WEvVZtRt3oXlGbF+sUXRANWBvmcxTgd9PAY8wnb8EMFYBRuKI7e4s/xzj3xbJpwx4m6wwsvFeMbEG46CIRspWZ/2Jxzj8qSRZbZh4oo+WMc6OIQnN7leuzVPkGnPqa28wR/fzNxSuwRFhA81jV4sNnu9vCicvU6+x7BZgdB2u7XiCc3LRn+J6nHowrvCnzdxxfotosM9LGRBmrEkCwhsTtkpBiKp/9qir25+rqxmy4p5YCvQXaG5atTC8MbPuvhTSUrr33hjoDnZMPc5ZSviaU4eYMemPbbafA65v6pAZR9DXr79ldpFkyAIqYCYYvjz43KPDdnI1y7rSe8fNKIZgEZIy9bwCOvj4AA8YN+gOAwEjz/R+Wmd0JcmSw==;5:aN70vqpSq1uZVKlxlW31N1T+O8OmMp4HYsLrZSACUFsJ76ImFT2W8DzMYRkJdedVmafF7uU8PlGxmGYeXNHSNMGU+T5bBiE4yIQYFCMlux/XHU9rIVNiekHEI2pvOCJq+NAafkjlF5X6cMUDSBH6Q73NBQEXge/H9Bnz4JwXwFY=;7:vsKoBTbrYC868R/2zPeGRx1NC1oLeQNx5JCr5Ns8PkzX2j5C6qIerLPxRJKXhPVNWQBVW7BArcmI5II43220gaPcW+yua1M0yRH9Zexw7I+oh8UB+CV4wD5GtHpmXj0PgCvJmGnqxUsniYjQ2PnTUw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 6759afdf-35bc-4c7d-cd87-08d65f1df353
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4145;
x-ms-traffictypediagnostic: AM0PR04MB4145:
x-microsoft-antispam-prvs: <AM0PR04MB41455977796C5BD3973FDC1380A60@AM0PR04MB4145.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4145;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4145;
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(366004)(136003)(39860400002)(396003)(199004)(13464003)(189003)(9686003)(53936002)(2501003)(446003)(3846002)(81156014)(2906002)(11346002)(81166006)(110136005)(316002)(54906003)(486006)(476003)(55016002)(8676002)(6116002)(97736004)(14454004)(86362001)(44832011)(99286004)(8936002)(106356001)(6246003)(25786009)(74316002)(186003)(66066001)(68736007)(105586002)(71200400001)(33656002)(5660300001)(102836004)(256004)(76176011)(6506007)(229853002)(7696005)(14444005)(6436002)(305945005)(71190400001)(7736002)(26005)(478600001)(4326008)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4145;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: wCO0wVJP/39W11tVO7bqL+jYSAJeEOddDyW5xn6gJiJ/+QrAa1kgRQIv0neMaLGAdQBgyNYTlIw/ibBlldOi7Xwufi5T/zdj7krUbc1KgxASLdDmkVpxmGqBcREbTPFuAhtkzgdutE76lGzRGOnYJIa2gDYknHHDQK1obZzbrwjpZiCNyxoXSJOBX06zp3KyDF1p2q7o3LtU6Hh+Z/GlQKRAgHKyXw9BtzGu+4W5/MrXKc7DJjs7/WBwfLI9O4+YKQwya1tU4CF/p4r+ObpystSsBlbSGXFw++0I4BQdoymdy7RExBL2FAw8ktWJMzKk
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6759afdf-35bc-4c7d-cd87-08d65f1df353
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 04:05:55.9669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4145
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5nIEFpc2hlbmcgRE9ORyAoMjAxOC0xMi0wNCAw
NjozOToxOCkNCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGkuTVg4UVhQIGNsb2NrIHN1cHBv
cnQgd2hpY2ggaXMgYmFzZWQgb24gdGhlDQo+ID4gY2xvY2sgc2VydmljZSBwcm92aWRlZCBieSBT
Q1UgZmlybXdhcmUuDQo+ID4NCj4gPiBOb3RlOiBJdCBkZXBlbmRzIG9uIFNDVSBkcml2ZXIgd2hp
Y2ggaGFzIGFscmVhZHkgYmVlbiBtZXJnZWQgYnkgU2hhd24uDQo+ID4gU28gdGhpcyBwYXRjaCBz
ZXJpZXMgY291bGQgZ28gdGhyb3VnaCBTaGF3bidzIHRyZWUgYXMgd2VsbC4NCj4gDQo+IFdoaWNo
IHBhdGNoIHNlcmllcz8NCj4gDQo+IEknbSBoYXZpbmcgdHJvdWJsZSBhcHBseWluZyB0aGUgZmly
c3QgcGF0Y2gsIHNvIEkgc3VzcGVjdCBzb21ldGhpbmcgaXMgd3JvbmcuDQoNCkFzIEkgcmVwbGll
ZCBpbiBsYXN0IG1haWwsIHBhdGNoZXMgd2VyZSBtYWRlIGFnYWluc3QgY2xrLW5leHQgYnJhbmNo
Lg0KSSBhbHNvIHRyaWVkIGFwcGx5IGFnYWluc3QgY2xrLW1hc3RlciBicmFuY2ggYW5kIG1ldCB0
aGUgc2FtZSBmYWlsdXJlLg0KDQokIGdpdCBhbSAqLnBhdGNoDQpQYXRjaCBpcyBlbXB0eS4gV2Fz
IGl0IHNwbGl0IHdyb25nPw0KV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlzIHByb2JsZW0sIHJ1
biAiZ2l0IGFtIC0tY29udGludWUiLg0KSWYgeW91IHByZWZlciB0byBza2lwIHRoaXMgcGF0Y2gs
IHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4NClRvIHJlc3RvcmUgdGhlIG9yaWdpbmFsIGJy
YW5jaCBhbmQgc3RvcCBwYXRjaGluZywgcnVuICJnaXQgYW0gLS1hYm9ydCIuDQokIGdpdCBhbSAt
LXNraXANCkFwcGx5aW5nOiBjbGs6IGlteDogYWRkIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGZvciBt
bWlvIGNsa3MNCmVycm9yOiBwYXRjaCBmYWlsZWQ6IGRyaXZlcnMvY2xrL2lteC9NYWtlZmlsZTox
DQplcnJvcjogZHJpdmVycy9jbGsvaW14L01ha2VmaWxlOiBwYXRjaCBkb2VzIG5vdCBhcHBseQ0K
UGF0Y2ggZmFpbGVkIGF0IDAwMDIgY2xrOiBpbXg6IGFkZCBjb25maWd1cmF0aW9uIG9wdGlvbiBm
b3IgbW1pbyBjbGtzDQpUaGUgY29weSBvZiB0aGUgcGF0Y2ggdGhhdCBmYWlsZWQgaXMgZm91bmQg
aW46IC5naXQvcmViYXNlLWFwcGx5L3BhdGNoDQpXaGVuIHlvdSBoYXZlIHJlc29sdmVkIHRoaXMg
cHJvYmxlbSwgcnVuICJnaXQgYW0gLS1jb250aW51ZSIuDQpJZiB5b3UgcHJlZmVyIHRvIHNraXAg
dGhpcyBwYXRjaCwgcnVuICJnaXQgYW0gLS1za2lwIiBpbnN0ZWFkLg0KVG8gcmVzdG9yZSB0aGUg
b3JpZ2luYWwgYnJhbmNoIGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdpdCBhbSAtLWFib3J0Ii4N
Cg0KSWYgbWFudWFsbHkgYXBwbHksIGl0IGNhbiB3b3JrLg0KJCBwYXRjaCAtcDEgPCAwMDAxLWNs
ay1pbXgtYWRkLWNvbmZpZ3VyYXRpb24tb3B0aW9uLWZvci1tbWlvLWNsa3MucGF0Y2gNCnBhdGNo
aW5nIGZpbGUgYXJjaC9hcm0vbWFjaC1pbXgvS2NvbmZpZw0KSHVuayAjNyBzdWNjZWVkZWQgYXQg
NTcxIChvZmZzZXQgLTkgbGluZXMpLg0KcGF0Y2hpbmcgZmlsZSBkcml2ZXJzL2Nsay9LY29uZmln
DQpwYXRjaGluZyBmaWxlIGRyaXZlcnMvY2xrL2lteC9LY29uZmlnDQpwYXRjaGluZyBmaWxlIGRy
aXZlcnMvY2xrL2lteC9NYWtlZmlsZQ0KSHVuayAjMSBzdWNjZWVkZWQgYXQgMSB3aXRoIGZ1enog
MS4NCg0KSSBndWVzcyBpdCBtaWdodCBiZWNhdXNlIGNsay1uZXh0IG1lcmdlZCBjbGstaW14N3Vs
cC5jIGFuZCBjbGstaW14OG1xLmMgd2hpY2gNCkNoYW5nZWQgdGhlIGRyaXZlcnMvY2xrL2lteC9N
YWtlZmlsZSBhIGJpdC4NCg0KSWYgeW91IHdhbnQgbWUgdG8gZ2VuZXJhdGUgdGhlIHBhdGNoIHNl
dCBhZ2FpbnN0IGNsay1tYXN0ZXIsIHBsZWFzZSBsZXQgbWUga25vdy4NCg0KUmVnYXJkcw0KRG9u
ZyBBaXNoZW5nDQo=
