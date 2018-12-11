Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52090C04EB8
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 03:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04D7F2081B
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 03:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gGsDoutE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04D7F2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbeLKDfx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 22:35:53 -0500
Received: from mail-eopbgr60041.outbound.protection.outlook.com ([40.107.6.41]:61247
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727340AbeLKDfx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 22:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJF8VRCwWshVEPE0JNFxFbiz+LgUMoGkN4aMtFixvHg=;
 b=gGsDoutE+JtCDdBBAU/lbAHQ+qIa7DJY0pmeGI/MFEOU9SbMi2et30X3hHbu7Kod1LXOIA6bme/V7t7SvNBKgmnOVz+N7qryQxbMt+GP7PcXRHl/3dkKRgHsALXBWg7hzJPQQqlLFXtxy86YoSsRTnyRA2stEfc4/TxLqNkW4/8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5378.eurprd04.prod.outlook.com (20.178.115.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.21; Tue, 11 Dec 2018 03:35:48 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Tue, 11 Dec 2018
 03:35:48 +0000
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
Subject: RE: [PATCH V9 2/7] clk: imx: add scu clock common part
Thread-Topic: [PATCH V9 2/7] clk: imx: add scu clock common part
Thread-Index: AQHUi98nS3QbsFuE9k65NTuug/+jZaV4jpEAgABYpPA=
Date:   Tue, 11 Dec 2018 03:35:48 +0000
Message-ID: <AM0PR04MB4211E44C3B64033C3795BDB380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
 <1543934041-12572-3-git-send-email-aisheng.dong@nxp.com>
 <154447896872.17204.13777399275077720705@swboyd.mtv.corp.google.com>
In-Reply-To: <154447896872.17204.13777399275077720705@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5378;6:zKcCjT6eFqJpzKcuMwZGDgzmECMrbnW8IDhI9UFDtbvCBJ/STeFOmPqyLn56ZBmLeCRP4tcQLOg4P2Q0PdYOhZSOWPH11hQnViare4ss3vZAneXEEaMsz9jrcb4It9ckltWyuDqLv9HXenIqh2rm8ut76VJNeFuWulzNkDuvNEBs78s78VgF/x3HbRlPY9vkLKJVluJqPYKX7d8Wx/xtf2I5MVPMYu9Bj0iq+hmcZv3Suhh6BKFoNzQgM1EUhjt0tfNP0f5xkf9gQxGkoCgIwRx8d/IJuCeCwzolFMRhDX4/Fu0DT26dZscPzDr2YTXo4Jagc8gJf72Zb4m/XgQPHX4s1sPsA6RlNyj8Mt97AsQqlBoHifbKbqphDfJ2l2b26zOffoBq7KGI+aqKlaKB1saKzkwjO/0oPTuIuuuYgUhU/AtF4NDMD5uMYDUSD2606UPxTKgt/lbUyP6KJ98/4A==;5:EogZUbeltWQybtam6sxsFTSKpPWABZopLf74DwBm1KYw/qpyHxB8xuRV86VJMUgMr1gg0s6MH/+16MdtscUgbWd0n53Ghwu+7JyXaRHArREUY4twn51EXsmX0XJQdZSL25iEUP7sjlzIlU7AqiWQHrx6FMgMUDoPd9P7e4OaAOA=;7:aipFpzhwZ2VQlRcGNszqihb1fwneHf4O709oXM0gWjARDu1Ia0SC4YhTG1LsVEFnz0PTONsfBO/jd7fbUHb/a759FNzLjcR6oglI8ENyuu+9DId6JVFTeo57nJuNQvRwsV0jtxziVAqIkHdMxGkiTg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 0185b341-5aeb-47f3-dd99-08d65f19bdd6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5378;
x-ms-traffictypediagnostic: AM0PR04MB5378:
x-microsoft-antispam-prvs: <AM0PR04MB537873834F779F5BC7FB021680A60@AM0PR04MB5378.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231472)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5378;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5378;
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(366004)(396003)(39860400002)(189003)(199004)(13464003)(81166006)(81156014)(446003)(486006)(11346002)(4326008)(8676002)(8936002)(44832011)(476003)(478600001)(966005)(14454004)(7696005)(86362001)(76176011)(2906002)(99286004)(3846002)(6116002)(2501003)(66066001)(25786009)(97736004)(6506007)(102836004)(110136005)(26005)(6436002)(68736007)(186003)(305945005)(106356001)(256004)(74316002)(33656002)(5660300001)(229853002)(316002)(53936002)(6246003)(6306002)(9686003)(71200400001)(71190400001)(55016002)(105586002)(7736002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5378;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: eDI3guq/Y6FWX5sWncRl4QAkDdsKXYUvRLQpw4lFKre3ElCs1pWdSe3OAzBbNFzRdt2RYhdpGIVfcAAHjG8uuhh2xnYOPQ4kpU2clyNEWue6Df7O2dX/rUEGqrW+wO2A3bsYKoBBVMFH5vK1GLqVFJlf3LQ2I8OOniArnhp6Zk+6tgyz9+NI2DeaXniUwn1fDrYRS13gF4BwUFlkU9swiCel3Ps8KpVZLYXKFdRuiy3Jg4Y6H9GHLopBx+IcvB1cHX0R9d9Dr6gLMzuP4VdEkKtur/5AOtrcjhZ8Vp0Oa28nQrMKr+9nOuM+3ZOVNamW
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0185b341-5aeb-47f3-dd99-08d65f19bdd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 03:35:48.2209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5378
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBRdW90aW5nIEFpc2hlbmcgRE9ORyAoMjAxOC0xMi0wNCAw
NjozOToyNSkNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L0tjb25maWcgYi9kcml2
ZXJzL2Nsay9pbXgvS2NvbmZpZyBpbmRleA0KPiA+IDQzYTNlY2MuLjYzZTdiMDEgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9jbGsvaW14L0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9p
bXgvS2NvbmZpZw0KPiA+IEBAIC0zLDMgKzMsNyBAQA0KPiA+ICBjb25maWcgTVhDX0NMSw0KPiA+
ICAgICAgICAgYm9vbA0KPiA+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX01YQw0KPiA+ICsNCj4g
PiArY29uZmlnIE1YQ19DTEtfU0NVDQo+IA0KPiBJcyB0aGVyZSBhbnkgcmVhc29uIHRvIG1ha2Ug
dGhpcyBhIGhpZGRlbiBvcHRpb24gaW5zdGVhZCBvZiBtYWtpbmcgaXQgYQ0KPiBzZWxlY3RhYmxl
IG9wdGlvbj8gSXQgY2FuIHN0aWxsIGRlcGVuZCBvbiBBUkNIX01YQyBhbmQgQVJNNjQsIGJ1dCBv
dGhlcndpc2UNCj4gaXQgc2hvdWxkIGJlIGNvbXBpbGFibGUgYXMgbG9uZyBhcyBDT05GSUdfSU1Y
X1NDVSBpcyBkZWZpbmVkICh0aGlzIHNob3VsZA0KPiBhbHNvIGJlIGEgY29uZmlnIHdlIGRlcGVu
ZCBvbiBoZXJlKS4NCj4gDQoNClRoaXMgaXMgbW9zdGx5IGZvbGxvd2luZyB0aGUgZXhpc3QgdXNp
bmcgdGhhdCBDTEsgaXMgc2VsZWN0ZWQgYnkgU29DIGNvbmZpZyBvcHRpb24uDQpodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNjc3MzA5Lw0KDQpBcyBDTEsgdXN1YWxseSBpcyBy
ZXF1aXJlZCBmb3IgcGxhdGZvcm0gdG8gcnVuIHdlbGwsIHNvIHdlIGRpZCBub3QgbWFrZSBpdCBz
ZWxlY3RhYmxlLg0KDQo+ID4gKyAgICAgICBib29sDQo+ID4gKyAgICAgICBkZXBlbmRzIG9uIEFS
Q0hfTVhDICYmIEFSTTY0DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lteC9NYWtlZmls
ZSBiL2RyaXZlcnMvY2xrL2lteC9NYWtlZmlsZSBpbmRleA0KPiA+IGY4NTA0MjQuLjRhYmVkMzcg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvaW14L01ha2VmaWxlDQo+ID4gKysrIGIvZHJp
dmVycy9jbGsvaW14L01ha2VmaWxlDQo+ID4gQEAgLTIwLDYgKzIwLDkgQEAgb2JqLSQoQ09ORklH
X01YQ19DTEspICs9IFwNCj4gPiAgICAgICAgIGNsay1wbGx2NC5vIFwNCj4gPiAgICAgICAgIGNs
ay1zY2NnLXBsbC5vDQo+ID4NCj4gPiArb2JqLSQoQ09ORklHX01YQ19DTEtfU0NVKSArPSBcDQo+
ID4gKyAgICAgICBjbGstc2N1Lm8NCj4gPiArDQo+ID4gIG9iai0kKENPTkZJR19TT0NfSU1YMSkg
ICArPSBjbGstaW14MS5vDQo+ID4gIG9iai0kKENPTkZJR19TT0NfSU1YMjEpICArPSBjbGstaW14
MjEubw0KPiA+ICBvYmotJChDT05GSUdfU09DX0lNWDI1KSAgKz0gY2xrLWlteDI1Lm8gZGlmZiAt
LWdpdA0KPiA+IGEvZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyBiL2RyaXZlcnMvY2xrL2lteC9j
bGstc2N1LmMgbmV3IGZpbGUgbW9kZQ0KPiA+IDEwMDY0NCBpbmRleCAwMDAwMDAwLi5lYzhhNDcx
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstc2N1LmMN
Cj4gPiBAQCAtMCwwICsxLDI2NSBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCsNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IDIwMTggTlhQDQo+ID4gKyAqICAg
RG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gPiArICovDQo+ID4gKw0KPiA+
ICsjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9l
cnIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArDQo+ID4gKyNpbmNsdWRl
ICJjbGstc2N1LmgiDQo+ID4gKw0KPiA+ICtzdHJ1Y3QgaW14X3NjX2lwYyAqY2NtX2lwY19oYW5k
bGU7DQo+IA0KPiBXaHkgZG9lcyB0aGlzIG5lZWQgdG8gYmUgYSBnbG9iYWw/IENhbiBpdCBiZSBp
biBlYWNoIGNsa19zY3UgaW5zdGFuY2UgaW5zdGVhZD8NCj4gDQoNCk5vLCBubyBuZWVkIHRvIGJl
IGluIGVhY2ggY2xrX3NjdSBpbnN0YW5jZS4NClRoZXJlJ3Mgb25seSBvbmUgaGFuZGxlci4NCg0K
PiA+ICsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuaCBiL2RyaXZl
cnMvY2xrL2lteC9jbGstc2N1LmggbmV3DQo+ID4gZmlsZSBtb2RlIDEwMDY0NCBpbmRleCAwMDAw
MDAwLi4wOWYzODFiDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2lt
eC9jbGstc2N1LmgNCj4gPiBAQCAtMCwwICsxLDIxIEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wKyAqLw0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgMjAxOCBO
WFANCj4gPiArICogICBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+ICsg
Ki8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX19JTVhfQ0xLX1NDVV9IDQo+ID4gKyNkZWZpbmUgX19J
TVhfQ0xLX1NDVV9IDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8bGludXgvZmlybXdhcmUvaW14L3Nj
aS5oPg0KPiA+ICsNCj4gPiArZXh0ZXJuIHN0cnVjdCBpbXhfc2NfaXBjICpjY21faXBjX2hhbmRs
ZTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IGlteF9jbGtfc2N1X2luaXQodm9pZCkg
ew0KPiA+ICsgICAgICAgcmV0dXJuIGlteF9zY3VfZ2V0X2hhbmRsZSgmY2NtX2lwY19oYW5kbGUp
Ow0KPiANCj4gQW5kIHRoZW4gdGhpcyBjYW4gYmUgaW1wbGVtZW50ZWQgaW4gdGhlIEMgZHJpdmVy
IHNvIHRoYXQgY2NtX2lwY19oYW5kbGUNCj4gZG9lc24ndCBuZWVkIHRvIGJlIGV4cG9ydGVkIGlu
dG8gdGhlIGhlYWRlciBmaWxlPw0KDQpMb29rcyBsaWtlIGEgZ29vZCBzdWdnZXN0aW9uLg0KSSB3
aWxsIHRha2UgdGhpcyBhcyB0aGVyZSdzIG5vIG90aGVyIHVzZXJzIG9mIGNjbV9pcGNfaGFuZGxl
IG5vdywgc28gbm8gbmVlZCBpbiBoZWFkZmlsZS4NCg0KVGhhbmtzDQoNClJlZ2FyZHMNCkRvbmcg
QWlzaGVuZw0K
