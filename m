Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139F3C04EB8
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 02:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE41620672
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 02:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="vvyAcbHt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE41620672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbeLKCFe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 21:05:34 -0500
Received: from mail-eopbgr30083.outbound.protection.outlook.com ([40.107.3.83]:40576
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727485AbeLKCFe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 21:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NP/ig3z3V7G8T649dnwUQik3nUaCGn+1C4sVlZD0z8=;
 b=vvyAcbHtYtmagPbdhJQz5Y/ksQOBiJX+7z2IScUEKB81qckejPa+1BF7HYFyVuI7XkWWZzwpWJyaPrZniuOMcnSGB2YBIBg8f0BKmXoVEPmBgYTPvNCpp4auaUklyancphkTV5cPAuqz797Hiiu3Gi5+18X8cdARn2crtGjUSpE=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4372.eurprd04.prod.outlook.com (52.135.148.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.19; Tue, 11 Dec 2018 02:04:48 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Tue, 11 Dec 2018
 02:04:48 +0000
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
Thread-Index: AQHUi98jvykrnvKQL0Kg33biwal6j6V4eymAgABSdPA=
Date:   Tue, 11 Dec 2018 02:04:48 +0000
Message-ID: <AM0PR04MB42115172881537E930C3D22180A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4372;6:BRGOh39Apofx2B6hf4quyAfFWJQGFxJigrToAcQGXRiTVJCIGyyQyp/amlDddejTCTM/8rc8C1mC3//+Jr6kCtiEPm1SVTF5A1sCMAfTgcUqy9DMy4Dk54IrnxD1i9FriY4YCRz7n1xRbVn0lCiaY4Zh1Nsrv5m4ctQyw6OC/UGXIGOjFiJaIQ247x9yKBZ9tKfmQdJRWamMxWDi0D12+1FhKtO6I53jWZXO3qUB0gYU6nK/u4fg0eq+CakzArK5yfhiZDByNYi+pgi5ovYCjIpJRP8Axxw5bStF6nak2bgjrAnNR1HaoUUxEhTz3fgFwsF8El/lXsHJpviCdguzG2Naz8avAS3jso31caehKmrf6Ede8DsBUSQE6G1rL5s/Kx1infnUJgtbRXtOf3GgSUsJeRowKcrAopBAjYBK7/qF28TNQvM4HK0gGR9S3Ew1DJRty/gtOi9r+Ms3vTFmOA==;5:UGmoGamqadSATn5i3DKpNOE7r57252Izo7rfDR2WSvqrNxSf2xqzLblSG65MiyZoDzem6P97tRum8x4N3DoGH2/naQxdh5l1RWUydDvmEzr9NxlFFgHNIZy5a/ugh1UltSBgnXk894/yH7YvV4ytRLAkwzjbnxHg3/TT1trv9Fk=;7:SEdMKvp5bnoy2btGjNAyN7ZxXKzuxhhdv/VwHDOM71zdN2ZVoXmWKOjuaRUlabO1fRrfmHGuM7Tyv09zNhkTINnvX35wkNF3OIAkFcyTiZL91loNymGsk4T80iExbzEmNbzB6RWk6pFR3iZv1+yXRQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 85ef7c1b-2336-4587-0903-08d65f0d0768
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4372;
x-ms-traffictypediagnostic: AM0PR04MB4372:
x-microsoft-antispam-prvs: <AM0PR04MB43722B89C737929CB533F63680A60@AM0PR04MB4372.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4372;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4372;
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(376002)(396003)(346002)(39860400002)(13464003)(189003)(199004)(68736007)(186003)(55016002)(25786009)(106356001)(9686003)(66066001)(478600001)(53936002)(97736004)(102836004)(6506007)(26005)(2501003)(53546011)(105586002)(76176011)(7696005)(99286004)(305945005)(6246003)(54906003)(74316002)(4326008)(5660300001)(256004)(86362001)(81156014)(81166006)(316002)(8936002)(8676002)(3846002)(110136005)(7736002)(14454004)(6436002)(6116002)(71190400001)(71200400001)(33656002)(229853002)(476003)(446003)(486006)(44832011)(2906002)(11346002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4372;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 75A5Hr5jgZn0w8V6sCfc9VI7UEiLPNCfHSCcLURfqu2lSNw7BhFpZgkXolkAmkoNSARQ29n0ViEjfFzYi4TRLzGBMKzONwVIJApAByv8Grmq1yboUC8zPYweOteyjbMrCQNlaszdvFdtu6OsME8SChZtyPxEqALLhx6bKo045prYPi3UI8D4aOeiGPPVwc1nI0ACuB0mD81mqruAgaSbHQpC0i9JO/BlKI5pJSTVKUi4BYkSIvbQqGd+bMKF74ZNQzaFfNl79YuqCdeYsjQ/j4dQzVNGwqQnSiXGCO+rn2s2JG36BEnAS4oYXUWuqK11
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ef7c1b-2336-4587-0903-08d65f0d0768
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 02:04:48.2355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4372
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMSwgMjAxOCA0
OjQ3IEFNDQo+IFRvOiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBBaXNoZW5nIERvbmcgPGFp
c2hlbmcuZG9uZ0BueHAuY29tPg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsNCj4gc2hhd25ndW9Aa2VybmVsLm9yZzsg
RmFiaW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPjsgZGwtbGludXgtaW14DQo+IDxs
aW51eC1pbXhAbnhwLmNvbT47IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgQWlzaGVuZyBEb25nDQo+
IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWOSAwLzddIGNs
azogaW14OiBhZGQgaW14OHF4cCBjbG9jayBzdXBwb3J0DQo+IA0KPiBRdW90aW5nIEFpc2hlbmcg
RE9ORyAoMjAxOC0xMi0wNCAwNjozOToxOCkNCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGku
TVg4UVhQIGNsb2NrIHN1cHBvcnQgd2hpY2ggaXMgYmFzZWQgb24gdGhlDQo+ID4gY2xvY2sgc2Vy
dmljZSBwcm92aWRlZCBieSBTQ1UgZmlybXdhcmUuDQo+ID4NCj4gPiBOb3RlOiBJdCBkZXBlbmRz
IG9uIFNDVSBkcml2ZXIgd2hpY2ggaGFzIGFscmVhZHkgYmVlbiBtZXJnZWQgYnkgU2hhd24uDQo+
ID4gU28gdGhpcyBwYXRjaCBzZXJpZXMgY291bGQgZ28gdGhyb3VnaCBTaGF3bidzIHRyZWUgYXMg
d2VsbC4NCj4gDQo+IFdoaWNoIHBhdGNoIHNlcmllcz8NCj4gDQo+IEknbSBoYXZpbmcgdHJvdWJs
ZSBhcHBseWluZyB0aGUgZmlyc3QgcGF0Y2gsIHNvIEkgc3VzcGVjdCBzb21ldGhpbmcgaXMgd3Jv
bmcuDQoNCldoaWNoIGJyYW5jaCB3b3VsZCB5b3UgbGlrZSBtZSB0byBtYWtlIHRoZSBwYXRjaCBh
Z2FpbnN0Pw0KSSBtYWRlIHRoZSBwYXRjaCBhZ2FpbnN0IGNsay1uZXh0IGJyYW5jaCBhbmQganVz
dCByZS10ZXN0ZWQgaXQgd2FzIG9rLg0KDQpCVFcsIGl0IGRlcGVuZHMgb24gdGhlIGZvbGxvd2lu
ZyBTQ1UgZmlybXdhcmUgcGF0Y2ggd2hpY2ggYWxyZWFkeSBpbiA0LjIwLVJDDQpJbiB5b3VyIHRy
ZWUuIFNvIGl0J3Mgc2FmZSB0byBhcHBseS4NCg0KY29tbWl0IGVkYmVlMDk1ZmFmYjRiNzI3YjUx
MDMyYmRjNDFlMzQ1Zjk1YmJjMjANCkF1dGhvcjogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdA
bnhwLmNvbT4NCkRhdGU6ICAgU3VuIE9jdCA3IDIxOjA0OjQyIDIwMTggKzA4MDANCg0KICAgIGZp
cm13YXJlOiBpbXg6IGFkZCBTQ1UgZmlybXdhcmUgZHJpdmVyIHN1cHBvcnQNCg0KICAgIFRoZSBT
eXN0ZW0gQ29udHJvbGxlciBGaXJtd2FyZSAoU0NGVykgaXMgYSBsb3ctbGV2ZWwgc3lzdGVtIGZ1
bmN0aW9uDQogICAgd2hpY2ggcnVucyBvbiBhIGRlZGljYXRlZCBDb3J0ZXgtTSBjb3JlIHRvIHBy
b3ZpZGUgcG93ZXIsIGNsb2NrLCBhbmQNCiAgICByZXNvdXJjZSBtYW5hZ2VtZW50LiBJdCBleGlz
dHMgb24gc29tZSBpLk1YOCBwcm9jZXNzb3JzLiBlLmcuIGkuTVg4UU0NCiAgICAoUU0sIFFQKSwg
YW5kIGkuTVg4UVggKFFYUCwgRFgpLg0KDQogICAgVGhpcyBwYXRjaCBpbXBsZW1lbnRzIHRoZSBT
Q1UgZmlybXdhcmUgSVBDIGZ1bmN0aW9uIGFuZCB0aGUgY29tbW9uDQogICAgbWVzc2FnZSBzZW5k
aW5nIEFQSSBzY19jYWxsX3JwYy4NCg0KICAgIENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5l
bC5vcmc+DQogICAgQ2M6IEZhYmlvIEVzdGV2YW0gPGZhYmlvLmVzdGV2YW1AbnhwLmNvbT4NCiAg
ICBDYzogSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPg0KICAgIFJldmlld2Vk
LWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQogICAgU2lnbmVkLW9m
Zi1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCiAgICBTaWduZWQtb2Zm
LWJ5OiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQoNClJlZ2FyZHMNCkRvbmcgQWlz
aGVuZw0KDQo=
