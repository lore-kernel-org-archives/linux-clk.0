Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFD5ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 368FC2148D
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YI51291o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 368FC2148D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbeJQXY4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:24:56 -0400
Received: from mail-eopbgr50047.outbound.protection.outlook.com ([40.107.5.47]:24191
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727090AbeJQXY4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2b5qlgiHfNzUT7KH2NEJe6Jo0pyenoFMsKnZ1TpTEk=;
 b=YI51291oOH9jxm1uDuNirVJZGtl7s5ciYoEQD2gE4kbRzu8Aiy8ZbrhsaWVh6UhxZh+EXSjBriAW0FPQtDU1OINU/qc128qdEHQpQdBSkH8LEYNsVUBQsJH9t7Jo9M0j3ukgrWY9nLV7ou1GJg7IaZOlju6a03rcVtbfasH7Cf8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4275.eurprd04.prod.outlook.com (52.134.126.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.24; Wed, 17 Oct 2018 15:27:57 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 15:27:57 +0000
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
Subject: RE: [PATCH V4 02/11] clk: imx: scu: add scu clock common part
Thread-Topic: [PATCH V4 02/11] clk: imx: scu: add scu clock common part
Thread-Index: AQHUY5T9MGUT6Zv05kq5JPA5N1+iFqUiaByAgADCS0CAAGSXgIAABIUg
Date:   Wed, 17 Oct 2018 15:27:57 +0000
Message-ID: <AM0PR04MB4211F83EBE8EA339185C75BC80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-3-git-send-email-aisheng.dong@nxp.com>
 <153972550584.5275.12112973418888551824@swboyd.mtv.corp.google.com>
 <AM0PR04MB42110A50FDC33E66A9DDF63D80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153978883132.5275.17975663103503100871@swboyd.mtv.corp.google.com>
In-Reply-To: <153978883132.5275.17975663103503100871@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4275;6:Vm7fp3uU+CcADo8VIi9CdM/a6fgQGdfqJic7uKWskUd3vhhlL9xJx7TTTgpkBaMFm9EKkm7RejDNgi7hKqedf602oB5U482Fd4gsqjnNWeSRfC1KV4Yt+aHSygYoIhyWZjrlAu0BoAZ0JKn8rSpc13nAKVqTAfIydhlNPWqA1jpMvm6bHxky6/oTMbSB3FSsSm+7UNkU0ktq9Enradxq0pyGfbGmyxZrvmV/Fdr13jMuFHPLVcBTwfozbmKdy2Eqyrysb6tmqWubzOouMDlymca59/IJUjR46Uy9blMGZbLZ6NFnJn05Kr7aMRp4vDyu3wOrMVgQhAVw028c/QvmkWEzegpAXsdk46vMNZ9DegumuzCLIEpwEU7fCfQAnv0gOxWdXefpVgGTyYdPZR/8KnYlWDBwJNP40v1c8XRHu/AvLPMJE18tvLieXEiOBU8BDu+wZpCySR1rjwYKwpiKLg==;5:9fBgIBkWorehu+foLqN5yfGuiJx/6pNpu6GzFgRulmps/ksZY4zUlLFl05aKRYpnkMhfoAxppj08jGSDlPbvY3ELLQvaeCo/G+mT4Bff78OFEY/UUiySNrDTu7AkX1P9s+p69OJf9OnEz4wloTYCt6UKpSKgJbizE9YbA25ZJVk=;7:lUliasCexW94S6EclicS3aSBWgXtKyd5ljHIbk5r4M+kz1Eqr29eTbVjSRqHIa1zpCbdYucPsGPOIpzhRFNg/kZUKUEE0A1x6fKJlgJGK9Wpg0esroUx2uT/iZX3hmVHaNuE1DZmgCB/zHfo0OGHJw1vRJXPAvu1P6cjrh1Yopt5AXgiqvoxgfRGkuvrtUiOnoflLdUQGUsyFdODSUbJDCV3uv72EGFMwUIahwcUob73O2SA/MrhFjqiZMg6FlrC
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 6e84a43a-fd8a-49c9-8796-08d634451da9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4275;
x-ms-traffictypediagnostic: AM0PR04MB4275:
x-microsoft-antispam-prvs: <AM0PR04MB4275C751F8DF63054F185CB180FF0@AM0PR04MB4275.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231355)(944501410)(52105095)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4275;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4275;
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(376002)(39860400002)(346002)(366004)(13464003)(54534003)(189003)(199004)(93886005)(54906003)(14454004)(110136005)(66066001)(6116002)(478600001)(2906002)(6246003)(102836004)(3846002)(105586002)(68736007)(25786009)(14444005)(256004)(106356001)(4326008)(26005)(186003)(229853002)(2900100001)(316002)(97736004)(6506007)(476003)(33656002)(486006)(11346002)(53936002)(4001150100001)(9686003)(76176011)(7736002)(5660300001)(86362001)(55016002)(8936002)(99286004)(2501003)(8676002)(81156014)(81166006)(446003)(5250100002)(74316002)(305945005)(7696005)(6436002)(71190400001)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4275;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: EuSQymkdkq3IyrMV0avnjW3upvKrNHg05somUZwZjTYt3TFLSrtZN/U9VeP5LubYeQGeJnZxZWSDbKIDhT+H1cQ7Upe85D+ojOEqt0VC05R1jMqZXd7AoKyMpeNjOv60weETK/z+nSbQac3KZkgH2KqUSzvaJ02fXcqjtJJew5fl3LtiaH39mz0ud0mHrRmOu+uR1VXhwA/KnoU/aU74XXbaseNmw4v3biH7PeJ1cn0aAfICg+D1hX1K3kLpQpq+Zx9nfFkc6OKSOvs60ONSgEQ6jPdjCP9H286IcKuuifxoRSIsrrAWlCe0SnaOOl180QiE+rjeI7sYJwtjmJQv8Vd3Ggr9JwNw39XqHGAZypk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e84a43a-fd8a-49c9-8796-08d634451da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 15:27:57.2950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4275
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTcsIDIwMTgg
MTE6MDcgUE0NCj4gUXVvdGluZyBBLnMuIERvbmcgKDIwMTgtMTAtMTcgMDI6MTE6MDMpDQo+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogU3RlcGhlbiBCb3lkIFtt
YWlsdG86c2JveWRAa2VybmVsLm9yZ10NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAx
NywgMjAxOCA1OjMyIEFNIFF1b3RpbmcgQS5zLiBEb25nDQo+ID4gPiAoMjAxOC0xMC0xNCAwMTow
Nzo0NSkNCj4gPiA+ID4gQWRkIHNjdSBjbG9jayBjb21tb24gcGFydCB3aGljaCB3aWxsIGJlIHVz
ZWQgYnkgY2xpZW50IGNsb2NrIGRyaXZlcnMuDQo+ID4gPiA+DQo+ID4gPiA+IENjOiBTaGF3biBH
dW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+ID4gPiA+IENjOiBTYXNjaGEgSGF1ZXIgPGtlcm5l
bEBwZW5ndXRyb25peC5kZT4NCj4gPiA+ID4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZhYmlvLmVzdGV2
YW1AbnhwLmNvbT4NCj4gPiA+ID4gQ2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4N
Cj4gPiA+ID4gQ2M6IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNvbT4N
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNv
bT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IENoYW5nZUxvZzoNCj4gPiA+ID4gdjMtPnY0Og0KPiA+
ID4gPiAgKiBzY3UgaGVhZGZpbGUgcGF0aCBjaGFuZ2UNCj4gPiA+ID4gdjItPnYzOg0KPiA+ID4g
PiAgKiBubyBjaGFuZ2VzDQo+ID4gPiA+IHYxLT52MjoNCj4gPiA+ID4gICogdXBkYXRlIGZ1bmN0
aW9uIGNhbGwgbmFtZQ0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvY2xrL2lteC9LY29u
ZmlnICAgICAgIHwgIDIgKysNCj4gPiA+ID4gIGRyaXZlcnMvY2xrL2lteC9NYWtlZmlsZSAgICAg
IHwgIDIgKysNCj4gPiA+ID4gIGRyaXZlcnMvY2xrL2lteC9zY3UvS2NvbmZpZyAgIHwgIDUgKysr
KysNCj4gPiA+ID4gIGRyaXZlcnMvY2xrL2lteC9zY3UvTWFrZWZpbGUgIHwgIDQgKysrKw0KPiA+
ID4gPiBkcml2ZXJzL2Nsay9pbXgvc2N1L2Nsay1zY3UuYyB8IDE3ICsrKysrKysrKysrKysrKysr
DQo+ID4gPiA+IGRyaXZlcnMvY2xrL2lteC9zY3UvY2xrLXNjdS5oIHwgMTggKysrKysrKysrKysr
KysrKysrDQo+ID4gPg0KPiA+ID4gV2h5IGlzIHNjdSBuZXN0ZWQgb25lIGxldmVsIGRlZXBlciBp
biB0aGUgaW14IGRpcmVjdG9yeT8gQ2FuJ3Qgd2UNCj4gPiA+IGp1c3Qga2VlcCB0aGVtIGFsbCB3
aXRoaW4gaW14IHRvcGxldmVsIGRpcmVjdG9yeT8NCj4gPiA+DQo+ID4NCj4gPiBNb3N0bHkgYmVj
YXVzZSBTQ1UgY2xvY2tzIGFyZSB0b3RhbGx5IGRpZmZlcmVudCBmcm9tIHRoZSBsZWdhY3kgY2xv
Y2tzLg0KPiA+IChObyBtdWNoIGxlZ2FjeSB0aGluZ3MgY2FuIGJlIHJldXNlZCkgU28gb3JnYW5p
emVkIHRoZW0gdG9nZXRoZXIgaW4gYQ0KPiA+IGRlZXBlciBmb2xkZXIgZm9yIGNsZWFyIHNlcGFy
YXRpb24gYW5kIGJldHRlciBtYWludGVuYW5jZQ0KPiA+DQo+ID4gRG8geW91IHRoaW5rIHdlIHN0
aWxsIHNob3VsZCBwdXQgdGhlbSB3aXRoaW4gaW14IHRvcGxldmVsIGRpcmVjdG9yeQ0KPiA+IGFu
ZCBtaXggdGhlbSB3aXRoIExlZ2FjeSBjbG9ja3M/DQo+ID4NCj4gDQo+IFllcy4gT3IgbWFrZSBh
IG5ldyBpbXgtZm9vIGRpcmVjdG9yeSBmb3IgeW91ciBuZXcgZmFuZ2xlZCBTb0MgY2xrIGRyaXZl
ciBjb2RlDQo+IGluIGRyaXZlcnMvY2xrLy4NCg0KT2theSwgdGhlbiBsZXQncyBzdGlsbCBwdXQg
dGhlbSBpbiB0aGUgc2FtZSBpbXggZGlyZWN0b3J5Lg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcN
Cg==
