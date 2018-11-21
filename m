Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECFAC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 01:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 600F420989
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 01:54:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="E4pBj7k+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600F420989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbeKUM0x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 07:26:53 -0500
Received: from mail-eopbgr00040.outbound.protection.outlook.com ([40.107.0.40]:61504
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725913AbeKUM0w (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 07:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rNOfe5KUHiGxTstEUK0Sqx3a9BvZAg6kPJQzrVkupY=;
 b=E4pBj7k+GrAzzRndFlC5CQUj1KQkB0iUypGS7d27YEwCtW1xinwk8nrYOz6NirEWBafcwrCN+/Arkd+Pc33N0ZY0dtxIx0vUpYX/S2AmX2WB8XAi7D3S+aE3fmLwKWcJ6FX4zN+oon1C07pw9k1VzJnIzbS7pouM+Sonavpomas=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4548.eurprd04.prod.outlook.com (52.135.149.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.21; Wed, 21 Nov 2018 01:54:35 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1339.027; Wed, 21 Nov 2018
 01:54:35 +0000
From:   Aisheng DONG <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V6 5/6] clk: imx: add lpcg clock support
Thread-Topic: [PATCH V6 5/6] clk: imx: add lpcg clock support
Thread-Index: AQHUeQjbR4L3PvLGlU66QmxGjWSLraVZKU0AgABd5mA=
Date:   Wed, 21 Nov 2018 01:54:34 +0000
Message-ID: <AM0PR04MB4211B12A895180F82BC9AE8180DA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
 <1541862894-8209-6-git-send-email-aisheng.dong@nxp.com>
 <154274488829.88331.14073987677874819400@swboyd.mtv.corp.google.com>
In-Reply-To: <154274488829.88331.14073987677874819400@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4548;6:sFzR6teG42JClpQD/77JUC+wa4+tQu+lVQFRVs0yj6nZiIuSPCoI61e+tM5eChwSXnxTseVv7nwqYUqRTWNVx6KlXXnK+oGJ3zuNJpJ3CvKo0U4GbT4a18kAZr3g+UTpbAUXaPpTyKvohoJjflv+50a1oHzlbZb/DhLNZWcs4Y0MhY55EK7ce4PrTSVrctG8CjdtiF8HgS2EIABNme+et6exTHEPlltYsmWGQ2dVPWcSRKh0KCsZgCoknL0HXvbriuM9mk/CwMKcNU1GdrbkPEqk4VpDhoKRU9G4Y3FDZGqQOrsXFjZ6W1EoZARH6DeFD5Cy49f6uyHDGK6EL/OeFDablwqVo4oO+2P+y8ceo+XUAgmdXdKYKDBHRpbcQmIUwvu4XnA/5tXH38tSmhXSbsBDHry+k9nBUTtslyIsq4p4LtEfcNX/zrOLy9NO4SvFc85Djy+CPDxGc6uKDe59uQ==;5:GJ7woiWrWZ+WRI7ffNNJkzoI3VmCE3wJasRIldDyaVSh1LLEuKMPevx5Hy0Vd0oEhkIsHl7a1Aw65ypJQoRyuzBn3xAYY778Y2nF/IdhbGX0cm/XG9nMLx9ZytduvfzON0r4lPBGauo5lpym5ZmTmYtF0HZvWVMFXZV7r2jVEAk=;7:jnrZiv3mmWXiBI6Z051ZOVZ3fq4DCkIp/gp0SBHTk69QyPT1w9YBHgWab5iMToyybBDlf50nfIOF5ZEmbJ93Q3q62ops64Sal0a2Gqxg9G/TFNnRml+90UztsgsV10BS7FmPMpAX1FZFsdY69sQYsg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 1c103b67-02ad-458c-85f6-08d64f5449b4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4548;
x-ms-traffictypediagnostic: AM0PR04MB4548:
x-microsoft-antispam-prvs: <AM0PR04MB454889280C3FB366B258DD5080DA0@AM0PR04MB4548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231442)(944501410)(52105112)(93006095)(93001095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4548;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4548;
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(396003)(346002)(376002)(39860400002)(13464003)(189003)(199004)(26005)(6116002)(106356001)(5660300001)(76176011)(6506007)(478600001)(4001150100001)(97736004)(105586002)(8936002)(86362001)(14444005)(3846002)(186003)(71200400001)(6246003)(74316002)(71190400001)(11346002)(99286004)(7736002)(6436002)(110136005)(66066001)(54906003)(4326008)(229853002)(68736007)(53936002)(8676002)(446003)(81156014)(476003)(305945005)(81166006)(9686003)(2900100001)(7696005)(486006)(256004)(14454004)(102836004)(2906002)(316002)(2501003)(33656002)(55016002)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4548;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: IxATZoE5IV928ty1JYY5WFuxbXuhzzOoZJ1PH+DOX7k2Zj5VbUXUBAfIF6h79meXbIAvRNYM0XTxWgTk2K8PW/hDLWTR8fO8DiLAH6TqGEg6FMUOtmxNwQkQ5hEWa195+8n5xsfOwx04u+T8AOAnepN+VB0Ie9V1peN0jaQH/aYq+1btHU2loFyUdP0h9Zo7S4q5z0wQvMbkdvPoGWYWd2tYi/1dOr1DGMb6/LFOu4SKGazJPdSy8R70qpoamFwBcRoTeiagMTr1dbsfOUPHYMa2DO7l7jUYXtM3u5oh0szh5zOhXEkmIR45Bu0K8bpKMvN7PV9QyzO1VYKow+HuMyarWHgxnai4eVAguRf1De8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c103b67-02ad-458c-85f6-08d64f5449b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 01:54:35.0981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4548
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KWy4uLl0NCj4gUXVvdGluZyBBLnMuIERvbmcgKDIwMTgtMTEt
MTAgMDc6MjA6MDQpDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lteC9jbGstbHBjZy1z
Y3UuYw0KPiA+IGIvZHJpdmVycy9jbGsvaW14L2Nsay1scGNnLXNjdS5jIG5ldyBmaWxlIG1vZGUg
MTAwNjQ0IGluZGV4DQo+ID4gMDAwMDAwMC4uNTRhMWNiMw0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9kcml2ZXJzL2Nsay9pbXgvY2xrLWxwY2ctc2N1LmMNCj4gPiBAQCAtMCwwICsxLDEw
OCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCj4gPiArLyoN
Cj4gPiArICogQ29weXJpZ2h0IDIwMTggTlhQDQo+ID4gKyAqICAgICBEb25nIEFpc2hlbmcgPGFp
c2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9jbGstcHJvdmlkZXIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvaW8uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+DQo+ID4gKw0KPiA+ICtzdGF0aWMgREVGSU5FX1NQSU5M
T0NLKGlteF9scGNnX3NjdV9sb2NrKTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgQ0xLX0dBVEVfU0NV
X0xQQ0dfTUFTSyAgICAgICAgIDB4Mw0KPiA+ICsjZGVmaW5lIENMS19HQVRFX1NDVV9MUENHX0hX
X1NFTCAgICAgICBCSVQoMCkNCj4gPiArI2RlZmluZSBDTEtfR0FURV9TQ1VfTFBDR19TV19TRUwg
ICAgICAgQklUKDEpDQo+ID4gKw0KPiA+ICtzdHJ1Y3QgY2xrX2xwY2dfc2N1IHsNCj4gPiArICAg
ICAgIHN0cnVjdCBjbGtfaHcgaHc7DQo+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKnJlZzsNCj4g
PiArICAgICAgIHU4IGJpdF9pZHg7DQo+ID4gKyAgICAgICBib29sIGh3X2dhdGU7DQo+IA0KPiBX
aGF0IGRvZXMgaHdfZ2F0ZSBtZWFuPyBDYW4geW91IGFkZCBrZXJuZWwtZG9jIHRvIHRoaXMgc3Ry
dWN0dXJlPw0KPiANCg0KSXQncyBmb3IgZW5hYmxpbmcgSFcgYXV0byBnYXRlIGZlYXR1cmUuDQpV
cCB0aWxsIG5vdywgbW9zdGx5IElQIGRyaXZlcnMgZG9lcyBub3QgdXNlIGl0LCBidXQgd2Ugc3Rp
bGwga2VlcCBpdCBpbiBjYXNlIHNvbWVvbmUNCndhbnRzIGl0IGluIHRoZSBmdXR1cmUuDQpJIHdp
bGwgYWRkIGtlcm5lbCBkb2MgZm9yIGl0IGxhdGVyLg0KDQo+ID4gK307DQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIHRvX2Nsa19scGNnX3NjdShfaHcpIGNvbnRhaW5lcl9vZihfaHcsIHN0cnVjdCBjbGtf
bHBjZ19zY3UsDQo+ID4gK2h3KQ0KPiA+ICsNCj4gPiArLyogV3JpdGUgdG8gdGhlIExQQ0cgYml0
cy4gKi8NCj4gDQo+IFBsZWFzZSByZW1vdmUgdGhpcyB1c2VsZXNzIGNvbW1lbnQuDQo+IA0KDQpH
b3QgaXQuDQoNCj4gPiArc3RhdGljIGludCBjbGtfbHBjZ19zY3VfZW5hYmxlKHN0cnVjdCBjbGtf
aHcgKmh3KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xrX2xwY2dfc2N1ICpjbGsgPSB0b19jbGtf
bHBjZ19zY3UoaHcpOw0KPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFncyA9IDA7DQo+IA0K
PiBEb24ndCBpbml0aWFsaXplIGZsYWdzIGhlcmUuDQo+IA0KDQpDYW4ndCByZW1lbWJlciB3aGV0
aGVyIGluaXRpYWxpemUgaXQgdG8gYXZvaWQgYSBrZXJuZWwgd2FybmluZy4NCldpbGwgY2hlY2sg
YW5kIHJlbW92ZSBpdCBpZiBub3QgbmVlZGVkLg0KDQo+ID4gKyAgICAgICB1MzIgcmVnOw0KPiA+
ICsNCj4gPiArICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpbXhfbHBjZ19zY3VfbG9jaywgZmxh
Z3MpOw0KPiA+ICsNCj4gPiArICAgICAgIGlmIChjbGstPnJlZykgew0KPiA+ICsgICAgICAgICAg
ICAgICByZWcgPSByZWFkbChjbGstPnJlZyk7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZyAmPSB+
KENMS19HQVRFX1NDVV9MUENHX01BU0sgPDwgY2xrLT5iaXRfaWR4KTsNCj4gPiArICAgICAgICAg
ICAgICAgaWYgKGNsay0+aHdfZ2F0ZSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcg
fD0gKENMS19HQVRFX1NDVV9MUENHX0hXX1NFTCB8DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBDTEtfR0FURV9TQ1VfTFBDR19TV19TRUwpIDw8DQo+IGNsay0+Yml0X2lkeDsN
Cj4gPiArICAgICAgICAgICAgICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyB8PSAoQ0xLX0dBVEVfU0NVX0xQQ0dfU1dfU0VMIDw8DQo+IGNsay0+Yml0X2lkeCk7DQo+ID4g
KyAgICAgICAgICAgICAgIHdyaXRlbChyZWcsIGNsay0+cmVnKTsNCj4gPiArICAgICAgIH0NCj4g
PiArDQo+ID4gKyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpbXhfbHBjZ19zY3VfbG9j
aywgZmxhZ3MpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0K
PiA+ICtzdGF0aWMgdm9pZCBjbGtfbHBjZ19zY3VfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykg
ew0KPiA+ICsgICAgICAgc3RydWN0IGNsa19scGNnX3NjdSAqY2xrID0gdG9fY2xrX2xwY2dfc2N1
KGh3KTsNCj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MgPSAwOw0KPiANCj4gU2FtZSBj
b21tZW50Lg0KPiANCj4gPiArICAgICAgIHUzMiByZWc7DQo+ID4gKw0KPiA+ICsgICAgICAgc3Bp
bl9sb2NrX2lycXNhdmUoJmlteF9scGNnX3NjdV9sb2NrLCBmbGFncyk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgaWYgKGNsay0+cmVnKSB7DQo+IA0KPiBXaHkgZG8gd2UgZXZlbiBjYWxsIHRoaXMgZnVu
Y3Rpb24gaWYgdGhlcmUgaXNuJ3QgYSBjbGstPnJlZyB2YWx1ZT8NCj4gQ2FuJ3Qgd2UganVzdCBu
b3QgYXNzaWduIHRoZSBjbGtfb3BzIGluIHRoYXQgY2FzZT8NCj4gDQoNCkdvb2QgY2F0Y2gsIHRo
aXMgaXMgbGVnYWN5IGNvZGUgYW5kIGNvdWxkIGJlIHJlbW92ZWQuDQoNClJlZ2FyZHMNCkRvbmcg
QWlzaGVuZw0KDQo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsKGNsay0+cmVnKTsNCj4g
PiArICAgICAgICAgICAgICAgcmVnICY9IH4oQ0xLX0dBVEVfU0NVX0xQQ0dfTUFTSyA8PCBjbGst
PmJpdF9pZHgpOw0KPiA+ICsgICAgICAgICAgICAgICB3cml0ZWwocmVnLCBjbGstPnJlZyk7DQo+
ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
aW14X2xwY2dfc2N1X2xvY2ssIGZsYWdzKTsgfQ0KPiA+ICsNCg==
