Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A166EECDE32
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:45:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 498F62150F
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qGno1fOm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 498F62150F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbeJQXl2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:41:28 -0400
Received: from mail-eopbgr80077.outbound.protection.outlook.com ([40.107.8.77]:38033
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727018AbeJQXl2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PGjIjr+84ay8yt/BoVwIi77T5P9nXz52CZSR9JuYXc=;
 b=qGno1fOm0tQX/FWc0lNSrr5EiC/dqcx/SHn4wsnO7jLLxsF4ESyHFhXEG/3Mwe4JmmEDEEEG9lPSEm8wKejJ5Dxe7cxJ3l1+ixMigXvBHscSD8CX0HRPgA3n2F/J4nOA51Tagg8rXGU+ORgNl4WmMmEO6Nre9Lw/8LFn+Qezczw=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4593.eurprd04.prod.outlook.com (52.135.149.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.24; Wed, 17 Oct 2018 15:45:05 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 15:45:05 +0000
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
Subject: RE: [PATCH V4 03/11] clk: imx: scu: add scu clock divider
Thread-Topic: [PATCH V4 03/11] clk: imx: scu: add scu clock divider
Thread-Index: AQHUY5T/CGJq5NUmM068EllqdgynW6UiZpyAgACpCoCAAIIcgIAAAzxQ
Date:   Wed, 17 Oct 2018 15:45:05 +0000
Message-ID: <AM0PR04MB42114436952826801D15BA3E80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-4-git-send-email-aisheng.dong@nxp.com>
 <153972518358.5275.8551722631185725008@swboyd.mtv.corp.google.com>
 <AM0PR04MB42111D180BE6D7557F71D15380FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153978942538.5275.15892434593141965554@swboyd.mtv.corp.google.com>
In-Reply-To: <153978942538.5275.15892434593141965554@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4593;6:PLZk1IFpRqiFUZP6c71GGoJz0jIqZzSIvjsdMBQJYB+23gmtZVFy65hanqfJSovz6lrdPxvnbtQfaj5fgXV0f4vSjHnXRqbhi2jsk4RuoMdywnS/tY8qns7k8S2o3YDD4lyFbNSYTb0ApFbJkfmHA2s+SGtSXRjnoJpR8YiICWBFeLl+8i71P41X1UE/5Ws4/AByxIgQ/EQbeYL7+ChO4c3EVBjLo/C5lG/whi2BMqTVPyjlVX5ZQ6bmM9bjmAVc3+P8K0dOYzk3rxpkIyuOeQLKmoKQmxua+2Zg0dXscFo+LyuFXrahhh7as29mM0RkoheH9ckJ/sIGYEJfQCy6Opug2mQMz3bin+tUH0u8M1DSLDT0gT3AZAchcym0ie0JlDWL0vfZG99pvKi/ZO7E/aGNQh6PIGh9j7+bT/GbcMvaz96WMXW6BC7lXznx7IEsQLlVBNcxSHBKcYXVrxGO3A==;5:MkVGtRNGxygfTrct9bEujHQOSdsMhrWUnzL9i8M+LbgN3LOeF5fMEh7MTlZ9y+aOBVQWT8RImNViAxWxzQbDRc3Ge3R5gOI1HprNRTZ8wsCKIFR5US5xbzaJywiezNcTNlQzwhIkZgeBZPx4z8xOj9yjK+7nmyNxGdAqdX4IBY4=;7:OwnmrawO+HPHxuRoV4Qt+ZMOP9JksZ5JEuRJr9xCgCBt4BL2wQxjZ3stHosHiwfRW0CBCDFF3lxMVMpIin7RqiMFQTmMuV0jMzhDXyNgnwyXUsNmtmjD6re9/21rc0L/2aR1Bbtdsi9MhHsBJe1el+zFmmjpX3NN3dKP0lAdoy5j2Jf7LflYy3FI5HOxEIKb/16tdiFl2Fmni0ESopd753+SRLYwhSphW2V6rhA0RgTNmWD22wi92s5+o50P+uRc
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 767ee323-faa7-4cf0-ad32-08d634478290
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4593;
x-ms-traffictypediagnostic: AM0PR04MB4593:
x-microsoft-antispam-prvs: <AM0PR04MB4593F60819115DDD6DEE469B80FF0@AM0PR04MB4593.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(269456686620040);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4593;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4593;
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(136003)(396003)(39860400002)(376002)(189003)(54094003)(51914003)(13464003)(199004)(8676002)(68736007)(7696005)(110136005)(9686003)(33656002)(6246003)(81156014)(5660300001)(2501003)(54906003)(55016002)(81166006)(478600001)(25786009)(53936002)(86362001)(2906002)(6506007)(316002)(102836004)(76176011)(66066001)(8936002)(486006)(14444005)(256004)(5250100002)(229853002)(186003)(106356001)(105586002)(476003)(97736004)(26005)(11346002)(2900100001)(446003)(6436002)(3846002)(99286004)(4326008)(6346003)(14454004)(6116002)(93886005)(71200400001)(74316002)(305945005)(4001150100001)(7736002)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4593;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: WA6a41AqaxVjxow6LPDqGU06Ful4HZYgPJMAAk9R8c154zk+WTYK/L7hkMdeOCcJM2OeyDci+w5IdaLHMCh1eHT5/bmFcePRcM7fjhK2UrsKbZz/vC0RzMXgnhnVdLk1EJoiw/0zDJcA1KjfxrFYIY9Xxov2NFcj4LP1Hzl+LEQWxSn1ft1wL/nLks75ifVbIRUr7fyGctZ5t8bbLtkrSisuj0X9A0PyA4iBwY696mRP0tPUb1sZjpUXyoJ4k1YQpSRviqI/p9vXHNactfVT7bIDSm5VTXy6xgGeoXLDOvEkdq2H44Xb2RLyDpSJaScytt52BpW7TkdoAX0k/hDdeEbzyEh3je0NhuLeD9pN5wc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767ee323-faa7-4cf0-ad32-08d634478290
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 15:45:05.5894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4593
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTcsIDIwMTgg
MTE6MTcgUE0NCj4gUXVvdGluZyBBLnMuIERvbmcgKDIwMTgtMTAtMTcgMDE6NTY6MzUpDQo+ID4g
PiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiA+ID4gU2Vu
dDogV2VkbmVzZGF5LCBPY3RvYmVyIDE3LCAyMDE4IDU6MjYgQU0gUXVvdGluZyBBLnMuIERvbmcN
Cj4gPiA+ICgyMDE4LTEwLTE0IDAxOjA3OjQ5KQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbGsvaW14L3NjdS9jbGstZGl2aWRlci1zY3UuYw0KPiA+ID4gPiBiL2RyaXZlcnMvY2xrL2lt
eC9zY3UvY2xrLWRpdmlkZXItc2N1LmMNCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiA+ID4gaW5kZXggMDAwMDAwMC4uNTFjYjgxNg0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9zY3UvY2xrLWRpdmlkZXItc2N1LmMNCj4gPiA+ID4g
QEAgLTAsMCArMSwxNzYgQEANCj4gPiA+ID4gKyAgICAgICBtc2cuY2xrID0gZGl2LT5jbGtfdHlw
ZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHJldCA9IGlteF9zY3VfY2FsbF9ycGMoY2Nt
X2lwY19oYW5kbGUsICZtc2csIHRydWUpOw0KPiA+ID4gPiArICAgICAgIGlmIChyZXQpIHsNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgIHByX2VycigiJXM6IGZhaWxlZCB0byBnZXQgY2xvY2sgcmF0
ZSAlZFxuIiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xrX2h3X2dldF9uYW1l
KGh3KSwgcmV0KTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gPiAr
ICAgICAgIH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHJlc3AgPSAoc3RydWN0IGlteF9z
Y19tc2dfcmVzcF9nZXRfY2xvY2tfcmF0ZSAqKSZtc2c7DQo+ID4gPg0KPiA+ID4gRG9lcyB0aGUg
cmVzcG9uc2UgZ2V0IHdyaXR0ZW4gdG8gdGhlIHNhbWUgcGxhY2UgdGhhdCB0aGUgbWVzc2FnZSBp
cw0KPiA+ID4gd3JpdHRlbj8gSWYNCj4gPg0KPiA+IFllcw0KPiA+DQo+ID4gPiBzbywgaXQgd291
bGQgYmUgYmV0dGVyIHRvIGNvbWJpbmUgdGhlIGRpZmZlcmVudCBzdHJ1Y3RzIGludG8gYSB1bmlv
bg0KPiA+ID4gdGhhdCdzIGFsd2F5cyBsYXJnZSBlbm91Z2ggdG8gaGFuZGxlIHRoaXM/IEZvciBl
eGFtcGxlLCBpdCBsb29rcw0KPiA+ID4gbGlrZSB0aGVyZSBhcmUgb25seSAxNg0KPiA+ID4gKyA4
IGJ5dGVzIGZvciB0aGUgZ2V0X2Nsb2NrX3JhdGUgc3RydWN0dXJlLCBidXQgdGhlbiB0aGUgcmVz
cG9uc2UgaXMNCj4gPiA+ICsgcmV0dXJuaW5nDQo+ID4gPiB0aGUgcmF0ZSBpbiAzMiBieXRlcy4g
V2hlbiB3ZSBjYXN0IHRoYXQgaGVyZSB3ZSdyZSBub3cgZ2V0dGluZyBhbg0KPiA+ID4gZXh0cmEg
OCBieXRlcyBvZiBzdGFjaywgYXJlbid0IHdlPyBDb21iaW5pbmcgdGhlIGRpZmZlcmVudA0KPiA+
ID4gc3RydWN0dXJlcyBpbnRvIG9uZSBiaWdnZXIgc3RydWN0dXJlIHdvdWxkIGFsbGV2aWF0ZSB0
aGlzIGFuZCBhdm9pZCB0aGUgbmVlZA0KPiBmb3IgY2FzdGluZy4NCj4gPiA+DQo+ID4NCj4gPiBH
b29kIGNhdGNoLg0KPiA+IFRoYW5rcyBmb3IgdGhlIHByb2Zlc3Npb25hbCBleHBsYW5hdGlvbi4N
Cj4gPg0KPiA+IEhvdyBhYm91dCBkbyBzb21ldGhpbmcgbGlrZSBiZWxvdz8NCj4gPiBzdHJ1Y3Qg
cmVxX2dldF9jbG9ja19yYXRlIHsNCj4gPiAgICAgICAgIHUxNiByZXNvdXJjZTsNCj4gPiAgICAg
ICAgIHU4IGNsazsNCj4gPiB9IF9fcGFja2VkOw0KPiA+DQo+ID4gc3RydWN0IHJlc3BfZ2V0X2Ns
b2NrX3JhdGUgew0KPiA+ICAgICAgICAgdTMyIHJhdGU7DQo+ID4gfSBfX3BhY2tlZDsNCj4gDQo+
IFRoaXMgZG9lc24ndCBuZWVkIF9fcGFja2VkIGJlY2F1c2UgaXQncyBhIHNpbmdsZSB1MzIuDQo+
IA0KDQpJdCdzIGEgc2FmZSB3cml0aW5nLCBidXQgeWVzLCBjYW4gYmUgcmVtb3ZlZC4NCg0KPiA+
DQo+ID4gc3RydWN0IGlteF9zY19tc2dfZ2V0X2Nsb2NrX3JhdGUgew0KPiA+ICAgICAgICAgc3Ry
dWN0IGlteF9zY19ycGNfbXNnIGhkcjsNCj4gPiAgICAgICAgIHVuaW9uIHsNCj4gPiAgICAgICAg
ICAgICAgICAgc3RydWN0IHJlcV9nZXRfY2xvY2tfcmF0ZSByZXE7DQo+ID4gICAgICAgICAgICAg
ICAgIHN0cnVjdCByZXNwX2dldF9jbG9ja19yYXRlIHJlc3A7DQo+ID4gICAgICAgICB9IGRhdGE7
DQo+ID4gfSBfX3BhY2tlZDsNCj4gPg0KPiANCj4gWWVzIHNvbWV0aGluZyBsaWtlIHRoaXMgd291
bGQgYmUgYmVzdC4gQW5kIG5vdyBJIHdvbmRlciBpZg0KPiBpbXhfc2N1X2NhbGxfcnBjKCkgaXMg
ZG9pbmcgZW5kaWFubmVzcyBzd2FwcGluZz8gT3IgZG9lcyBpdCBjb3B5IGRhdGEgaW50bw0KPiB0
aGVzZSByZXNwb25zZSBzdHJ1Y3R1cmVzPyBJJ20gc2F5aW5nIHRoYXQgdGhlIHUzMi8xNi84IG1h
eSBuZWVkIHRvIGJlDQo+IF9fbGUzMi8xNi84IGFuZCB0aGVuIGhhdmUgdGhlIHByb3BlciBhY2Nl
c3NvcnMuDQo+IA0KDQpObyBlbmRpYW5uZXNzIHN3YXBwaW5nLiBJdCdzIGZpeGVkIGxpdHRsZSBl
bmRpYW4uDQpTQ1UgcHJvdG9jb2wgaXNuJ3QgYXdhcmUgb2YgdGhlc2Ugc3RydWN0dXJlcy4gVGhl
IHN0cnVjdHVyZXMgYXJlIGRlZmluZWQNCmFjY29yZGluZyB0byBTQ1UgcHJvdG9jb2wgZGVmaW5p
dGlvbiB0byBtYWtlIHN1cmUgZWFjaCBmaWVsZCBwb3NpdGlvbiBhbmQgc2l6ZQ0KYXJlIGNvcnJl
Y3QuIFRoZW4gU0NVIElQQyBkcml2ZXIganVzdCBzZW5kIGFuZCByZWNlaXZlIHRoZW0gc2VxdWVu
dGlhbGx5Lg0KQ2xpZW50IGRyaXZlciB1c2VzIHRoZSBzdHJ1Y3R1cmVzIHRvIHJldHJpZXZlIHRo
ZSByZXNwb25kaW5nIGZpbGVkIHZhbHVlcy4NCg0KV2UgZG8gdGhpcyBsaWtlIGRyaXZlcnMvZmly
bXdhcmUvdGlfc2NpLmgNCkRvIHlvdSB0aGluayB3ZSBzdGlsbCBuZWVkIHNwZWNpZnkgX19sZTMy
LzE2LzggZm9yIHRoaXMgY2FzZT8NCg0KPiA+DQo+ID4gPiA+ICsgICAgICAgaGRyLT5zaXplID0g
MzsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIG1zZy5yYXRlID0gcmF0ZTsNCj4gPiA+ID4g
KyAgICAgICBtc2cucmVzb3VyY2UgPSBkaXYtPnJzcmNfaWQ7DQo+ID4gPiA+ICsgICAgICAgbXNn
LmNsayA9IGRpdi0+Y2xrX3R5cGU7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICByZXQgPSBp
bXhfc2N1X2NhbGxfcnBjKGNjbV9pcGNfaGFuZGxlLCAmbXNnLCB0cnVlKTsNCj4gPiA+ID4gKyAg
ICAgICBpZiAocmV0KQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgcHJfZXJyKCIlczogZmFpbGVk
IHRvIHNldCBjbG9jayByYXRlICVsZCA6IHJldCAlZFxuIiwNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgY2xrX2h3X2dldF9uYW1lKGh3KSwgcmF0ZSwgcmV0KTsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgY2xrX2RpdmlkZXJfc2N1X29wcyA9IHsNCj4g
PiA+ID4gKyAgICAgICAucmVjYWxjX3JhdGUgPSBjbGtfZGl2aWRlcl9zY3VfcmVjYWxjX3JhdGUs
DQo+ID4gPiA+ICsgICAgICAgLnJvdW5kX3JhdGUgPSBjbGtfZGl2aWRlcl9zY3Vfcm91bmRfcmF0
ZSwNCj4gPiA+ID4gKyAgICAgICAuc2V0X3JhdGUgPSBjbGtfZGl2aWRlcl9zY3Vfc2V0X3JhdGUs
IH07DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0cnVjdCBjbGtfaHcgKmlteF9jbGtfcmVnaXN0ZXJf
ZGl2aWRlcl9zY3UoY29uc3QgY2hhciAqbmFtZSwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyDQo+ID4gPiAqcGFyZW50X25hbWUs
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMy
IHJzcmNfaWQsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTggY2xrX3R5cGUpIHsNCj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgY2xrX2RpdmlkZXJf
c2N1ICpkaXY7DQo+ID4gPiA+ICsgICAgICAgc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdDsNCj4g
PiA+ID4gKyAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsNCj4gPiA+ID4gKyAgICAgICBpbnQgcmV0
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgZGl2ID0ga3phbGxvYyhzaXplb2YoKmRpdiks
IEdGUF9LRVJORUwpOw0KPiA+ID4gPiArICAgICAgIGlmICghZGl2KQ0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAg
ICAgICBkaXYtPnJzcmNfaWQgPSByc3JjX2lkOw0KPiA+ID4gPiArICAgICAgIGRpdi0+Y2xrX3R5
cGUgPSBjbGtfdHlwZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIGluaXQubmFtZSA9IG5h
bWU7DQo+ID4gPiA+ICsgICAgICAgaW5pdC5vcHMgPSAmY2xrX2RpdmlkZXJfc2N1X29wczsNCj4g
PiA+ID4gKyAgICAgICBpbml0LmZsYWdzID0gQ0xLX0dFVF9SQVRFX05PQ0FDSEU7DQo+ID4gPg0K
PiA+ID4gV2h5IG5vY2FjaGU/IFBsZWFzZSBoYXZlIGEgZ29vZCByZWFzb24gYW5kIGFkZCBhIGNv
bW1lbnQgaW5kaWNhdGluZw0KPiB3aHkuDQo+ID4gPg0KPiA+DQo+ID4gQmVjYXVzZSBvbiBNWDgs
IHRoZSBjbG9ja3MgYXJlIHRpZ2h0bHkgY291cGxlIHdpdGggcG93ZXIgZG9tYWluIHRoYXQNCj4g
PiBvbmNlIHRoZSBwb3dlciBkb21haW4gaXMgb2ZmLCB0aGUgY2xvY2sgc3RhdHVzIHdpbGwgYmUg
bG9zdC4NCj4gPiBNYWtpbmcgaXQgTk9DQUNIRSBoZWxwcyB1c2VyIHRvIHJldHJpZXZlIHRoZSBy
ZWFsIGNsb2NrIHN0YXR1cyBmcm9tIEhXDQo+ID4gSW5zdGVhZCBvZiB1c2luZyB0aGUgcG9zc2li
bGUgaW52YWxpZCBjYWNoZWQgcmF0ZS4NCj4gPg0KPiA+IElzIHRoYXQgcmVhc29uYWJsZSBlbm91
Z2ggdG8gc3BlY2lmeSBpdD8NCj4gDQo+IFllcywgeW91IGNhbiBhZGQgYSBjb21tZW50IGxpa2Ug
dGhhdC4gT3IgdGhlIGNsayByYXRlIGNhbiBiZSByZXN0b3JlZCB3aGVuIHRoZQ0KPiBwb3dlciBk
b21haW4gaXMgZW5hYmxlZCBhZ2Fpbj8NCg0KTm8gcmVzdG9yZSB3aGVuIHBvd2VyIGRvbWFpbiBp
cyBlbmFibGVkIGFnYWluLiBUaGF0IG5lZWRzIGRyaXZlciB0byBkbyBzcGVjaWFsDQpoYW5kbGlu
Zy4gDQoNCkNhbiB3ZSBhZGQgdGhlIGNvbW1lbnQgaW4gY29tbWl0IG1lc3NhZ2UgYXMgdGhlcmUn
cmUgc3RpbGwgbWFueSBvdGhlciBwbGFjZXMNCnVzaW5nIHRoaXM/DQoNClJlZ2FyZHMNCkRvbmcg
QWlzaGVuZw0K
