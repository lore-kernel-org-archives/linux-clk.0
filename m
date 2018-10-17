Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876F2ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31370214C3
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 09:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZmIMsR2O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31370214C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbeJQRS7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 13:18:59 -0400
Received: from mail-eopbgr50077.outbound.protection.outlook.com ([40.107.5.77]:22208
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726923AbeJQRS6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 13:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXZlNIK347YNjiMnMKvxmBWnbbis7VjX9hLNQnDIlqs=;
 b=ZmIMsR2OL/AnoLH7FQOHwwssrWA4rBIZxW5rRQGQH/pguUczx3lr/zLreFlgOvkjNhXcagWj4DZQgSZ61eEAzsHg/2NQfHw36NzKHN+uaTJ/q37VNR2ucf0cSkZEfymwcsw0+ktdYUnH285xKTqmHFqhavan8CC0R1n2DNqQz3g=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5122.eurprd04.prod.outlook.com (20.177.40.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.21; Wed, 17 Oct 2018 09:24:06 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 09:24:06 +0000
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
Subject: RE: [PATCH V4 10/11] clk: imx: add imx_check_clk_hws helper function
Thread-Topic: [PATCH V4 10/11] clk: imx: add imx_check_clk_hws helper function
Thread-Index: AQHUY5UNE4nlmZrVm0GZcSWfEp8yGaUiaOiAgADFvsA=
Date:   Wed, 17 Oct 2018 09:24:05 +0000
Message-ID: <AM0PR04MB4211A0E210D834DD76DE655980FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-11-git-send-email-aisheng.dong@nxp.com>
 <153972567736.5275.15651461252543929480@swboyd.mtv.corp.google.com>
In-Reply-To: <153972567736.5275.15651461252543929480@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5122;6:Cqjaij9cyL/3ABeDYklFw33cPTmHaUwEUG9cIpeGNN/uBRDAoIOx8lcq9OlrVnylmi0KGja8QP/PvZaUt+kNWhgPlNffKvhss+ex3CbDb5/BHkhvnqCxTYTdIpPvjMDC5cQuy4F8xLTpPpY61wEaaz4+Dg6uM4DV/e+Q/t8Tkwab4Lfp88iPS67pU7ThoigzgBcbLEp3jc7i9L/L/fLmnvU40YUqIA9DxtUfup5YXXmikVm66VdHRcEa7osprJtPQdIWDClmwRa/wfoAwnv4EAEdabBwK2GImPZs/5q0t8NIeDgbjAGcfhy9y9CQQIQtsPij7gNeE1WKN5pCdrcC8uzZpzAaeD5sBP0x/HAuvRuOLgKrDiwhnluN/nD5Zrd/c6Lze2HGXvioizwgWW/wN29n31CuMbhwwtwP0ZQAS/cAYwOrdjUN9uqSov2RNx+dYvO89AFwIXIBg7HoMQU2cQ==;5:dgz09m6xbyz7sF/Ey8bJnpurQj15mfgww9hZlKfL5AqgKVtVzdQ/KUUFGwya82fH8ws4zNbIiggfaeCTfntId2BXAekD40fKTTQq8SQ93/H/wCHHx+cCkUbxcqckIiDYmDOiOd8mCGP2cu/o9uDIzBAPD0DP1NQI9xSbr1dn22I=;7:i7EsfCqhAgoqqEEOG00SIpqJYpZdC54TVWqrleQWp84d8rq2CMqZkey4N+IPZ2VtGAB7+eM2m0iPmRWBoJ/Sjai9lJDcQ5K62rJQZmd9bJnu1aF7niyb0JH8EiwejaWxUincX20JiMF/pjUJc0fApXZlE8FMqLeVY1Qdnt13rMu9vOwuTZHeTu0oVz5WVK1DnoZ2NUn5bomF3RJB2L2RFuyHDLreb0r3ISwEJ4efzRu2gTb7MgbCoMCfHpugkQ58
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a9eb0966-6612-4c5e-9724-08d63412491e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5122;
x-ms-traffictypediagnostic: AM0PR04MB5122:
x-microsoft-antispam-prvs: <AM0PR04MB51226EEE42E7A61C0F528FEC80FF0@AM0PR04MB5122.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231355)(944501410)(52105095)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5122;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5122;
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(366004)(136003)(39860400002)(376002)(189003)(199004)(51914003)(316002)(53936002)(6116002)(6246003)(256004)(2501003)(3846002)(86362001)(97736004)(476003)(486006)(446003)(2900100001)(11346002)(2906002)(4001150100001)(55016002)(9686003)(6436002)(5250100002)(229853002)(102836004)(71200400001)(71190400001)(8676002)(7696005)(8936002)(105586002)(66066001)(33656002)(26005)(76176011)(106356001)(186003)(81156014)(99286004)(5660300001)(6506007)(305945005)(54906003)(7736002)(110136005)(68736007)(14454004)(25786009)(4326008)(81166006)(74316002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5122;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Q8p/7Xbdlod7JNxgbONEyZSLfVudqKuyHjJ2vJ870pBVcxfZboZM5bu88Pvid/ZYSYhNMGS/cv1XP92NID9eAeTRbFccr/u/30uWv9QJvCCXZzXcpBGRqX1oZWGYOR22RW2Y/5ckyQpELQXB7ghElOyv+2f+hvlErmW2fgExOobLOCXla0J/YM9sVVh0o8VG0ogkOQ5Pj0k9MJk3v79jGYhGt8/hByoJ++X+j8DayveiDjta44grHRuQKsTv7PX67ywFn77vjfOpCc837EPFG1u8A8Gj+L8qJ/l96aFp/QiqleKQL8ZLPqMQNYKnXnJZwS4CQrnHtBlH5uZYzp/kLprMokefsw7YLHG0A/mEClI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eb0966-6612-4c5e-9724-08d63412491e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 09:24:05.9160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5122
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBX
ZWRuZXNkYXksIE9jdG9iZXIgMTcsIDIwMTggNTozNSBBTQ0KPiBRdW90aW5nIEEucy4gRG9uZyAo
MjAxOC0xMC0xNCAwMTowODoxMykNCj4gPiBBZGQgaW14X2NoZWNrX2Nsa19od3MgaGVscGVyIGZ1
bmN0aW9uDQo+ID4NCj4gPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiA+
IENjOiBTYXNjaGEgSGF1ZXIgPGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4gPiBDYzogRmFiaW8g
RXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPg0KPiA+IENjOiBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+DQo+ID4gQ2M6IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVldHRlQGJh
eWxpYnJlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9u
Z0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWNvbW1vbi5oIHwg
MTEgKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvY2xrLWNvbW1vbi5oDQo+ID4gYi9k
cml2ZXJzL2Nsay9pbXgvY2xrLWNvbW1vbi5oIGluZGV4IGUzNjM0YTUuLjAxNTUwZmQgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvaW14L2Nsay1jb21tb24uaA0KPiA+ICsrKyBiL2RyaXZl
cnMvY2xrL2lteC9jbGstY29tbW9uLmgNCj4gPiBAQCAtMTMsNCArMTMsMTUgQEAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgY2xrX2h3ICppbXhfY2xrX2h3X2ZpeGVkKGNvbnN0DQo+IGNoYXIgKm5hbWUs
IGludCByYXRlKQ0KPiA+ICAgICAgICAgcmV0dXJuIGNsa19od19yZWdpc3Rlcl9maXhlZF9yYXRl
KE5VTEwsIG5hbWUsIE5VTEwsIDAsIHJhdGUpOw0KPiA+IH0NCj4gPg0KPiA+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgaW14X2NoZWNrX2Nsa19od3Moc3RydWN0IGNsa19odyAqY2xrc1tdLCB1bnNpZ25l
ZA0KPiA+ICtpbnQgY291bnQpIHsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+ICsN
Cj4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgIGlmIChJU19FUlIoY2xrc1tpXSkpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
cHJfZXJyKCJpLk1YIGNsayAldTogcmVnaXN0ZXIgZmFpbGVkIHdpdGggJWxkXG4iLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSwgUFRSX0VSUihjbGtzW2ldKSk7DQo+ID4g
KyAgICAgICB9DQo+ID4gK30NCj4gDQo+IEFuZCBnZXQgcmlkIG9mIHRoaXMgdG9vPyBJIGRvbid0
IHNlZSB0aGUgbmVlZCBmb3IgbGF5ZXJzIG9uIHRvcCBvZiBjb2RlIHNuaXBwZXRzLg0KPiBKdXN0
IHdyaXRlIHRoZW0gbWFueSB0aW1lcyBpbiB0aGUgc2FtZSBkcml2ZXIsIGFuZCB0aGVuIGRlY2lk
ZSB0byBjb25zb2xpZGF0ZQ0KPiB0aGF0IGxvZ2ljIGJlaGluZCBzb21ldGhpbmcgbGFyZ2VyIHRo
YW4gYSBmZXcgaGVscGVyIGZ1bmN0aW9ucy4NCg0KT2theSwganVzdCBzZWUgdGhpcywgdGhlbiBm
b3JnZXQgbXkgZm9ybWVyIHF1ZXN0aW9uIGluIGFub3RoZXIgZW1haWwgdGFsa2luZyBhYm91dA0K
dGhpcyBmdW5jdGlvbi4gV2lsbCByZW1vdmUgdGhlbSBhbGwuDQpUaGFua3MgZm9yIHRoZSBzdWdn
ZXN0aW9uLg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg0KPiANCj4gPiArDQo=
