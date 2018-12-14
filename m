Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1ECBC65BAE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 02:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C5E42086D
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 02:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SW91BnTv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C5E42086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbeLNC2b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 21:28:31 -0500
Received: from mail-eopbgr50053.outbound.protection.outlook.com ([40.107.5.53]:41940
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728517AbeLNC2b (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 21:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY7nB0/u6njwE5leZ/6kT7aP/E5OD9jPBP/BWCC+hiQ=;
 b=SW91BnTvIGb7nPVlHXu7G/KBFWapQ+wzrH1Z0waoY4kvyaHU1bwUrXTJi3GuNuD4y8poMROpv7cmnOygF/xmwOfIxD7hCv/GdI8+1x/hGPsAgQha7Xe8ZMWtnIDS0PdZHsmpZPYZlA9NjXXYtEVa3xg/WFGcEaEnulyJ9pIoGqc=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5809.eurprd04.prod.outlook.com (20.178.203.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.18; Fri, 14 Dec 2018 02:28:23 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Fri, 14 Dec 2018
 02:28:23 +0000
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
Subject: RE: [PATCH V11 2/7] clk: imx: add scu clock common part
Thread-Topic: [PATCH V11 2/7] clk: imx: add scu clock common part
Thread-Index: AQHUkoBHoRLNmKbTG0W2ArFlHoWixqV8S10AgAA08PCAAPPtgIAAAqXggAAKbQCAAAAo8A==
Date:   Fri, 14 Dec 2018 02:28:23 +0000
Message-ID: <AM0PR04MB42111F2B6702F6B9D699A67480A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-3-git-send-email-aisheng.dong@nxp.com>
 <154468728640.19322.12955855783518519739@swboyd.mtv.corp.google.com>
 <AM0PR04MB42118C3E7F49A0437453BA5880A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154475103791.19322.8783777114832958727@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211D584BCE4B6D06D57637280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154475384479.19322.759264653632754113@swboyd.mtv.corp.google.com>
In-Reply-To: <154475384479.19322.759264653632754113@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5809;6:QuKGJ4vBVRuIA6rzdfLNAZA8t2CYl16rKdPQboo5VaNSOsE2HJ6+luj1XlqayXPWkdYcCbkfzZ8TfTK9yKgFbSkIpR1KNhDdgYjx4xbjjml0rYK0B6OTFIN+C68hDozcFPWIOvm4lQ7GZINUcs9NWjgRrMpo2eDrKG+P0NErdCg3ygSbYWH4TmHJOH3AqL7ygiQVhrMs+g/bAFJeU948daeegBqdsK/wKYmZb5JIb3yN7C3J99RSpDiVew0PySHwiDlOQ/ttIe3xTtOJnrISmIQXxEy+T2v54VWURhWm5jopZloEnZ4ZfDZqXidAgXhrYEgDXQC7693iiagBmKfCC4SXQ+7jTzlsUrfkBY0TdkkWp+PuGa0tT/hYFkhr2rH+y9vdroKWe02rmNOGDTkAoYUw+bgfuO4Xc+b5MRILcH1x3zz46/4GzMcjiPNNL8Arnp8CLTjhtNoMgxI1fLdUJQ==;5:vdr18JeuFawc/uNCfbpj+CRRh8KABadhReRGIJ8y3myPU9Vz0YcSzPYMoEclooy8XiXNcbIRZZWA8Dn/Vr5KQGEC5T5tpgNu2md0BmXcxPwx9GxymvcFFKl+Jp18z+j+d+/Y6lDod9LZv2d6n3BRpcziwYj8H7pSagLhDestRqM=;7:Ax3+qsWC4zZhybHO6RBeLDkhqDsg1y5q3ad8BvjVTNVgmzEuBj9U/GhgRo2QjDKCIHfgcr3s2EOO6X/k2jGmHgarZyA3j6YF/ilRz5vfKbihSTyOAiRPmL8ilAiLqOnU3wv7PrjaSkn/8s2Bakcl2g==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 4020fb54-10f8-4b99-33c0-08d6616bd26b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5809;
x-ms-traffictypediagnostic: AM0PR04MB5809:
x-microsoft-antispam-prvs: <AM0PR04MB58096377A957181021D4CF4880A10@AM0PR04MB5809.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5809;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5809;
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(136003)(39850400004)(346002)(376002)(189003)(13464003)(199004)(54906003)(110136005)(93886005)(316002)(26005)(6436002)(86362001)(6506007)(4001150100001)(71190400001)(2906002)(99286004)(97736004)(2501003)(71200400001)(6116002)(3846002)(14454004)(256004)(14444005)(66066001)(229853002)(74316002)(25786009)(7736002)(8936002)(76176011)(305945005)(9686003)(44832011)(5660300001)(6306002)(478600001)(55016002)(106356001)(53936002)(81166006)(186003)(4326008)(8676002)(81156014)(966005)(33656002)(68736007)(486006)(102836004)(105586002)(446003)(7696005)(11346002)(476003)(6246003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5809;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: IyQUnfY4StqKPYaN/bfVhozEqlUaYdwjNCBQvFwqSlDotmh6RT5N1gcJr4YX8YpXBfPwIVAQjh7ZXopBvdwNV+rtVh/69WdIqEOOKcnluBDM2L/3QY5ENUnxJ84UApllh++wf9x5UDq8C3UfAybk4Kz55A+Wj88otdM3utbFPzEBxrmQHpEr/aw0HMN6uzXN7xbM5zP5Pk/Kjf3hSqZO8XmGiVcmOvVtnG/zIKJxJ7eMQn4LZtaWdUGags0m8cY/TLzbQ9FqBPJs+T3HnVD5WitGSYh2XmbTacbx0UcA86zeHID4Ih3WszJiN8cyCE13
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4020fb54-10f8-4b99-33c0-08d6616bd26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 02:28:23.8369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5809
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KWy4uLl0NCj4gUXVvdGluZyBBaXNoZW5nIERvbmcgKDIwMTgt
MTItMTMgMTc6NDQ6NTUpDQo+ID4gPiA+DQo+ID4gPiA+IEhvdyB3b3VsZCB5b3Ugc3VnZ2VzdCBm
b3IgdGhpcyBzaXR1YXRpb24/DQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gSSBzdWdnZXN0IHRoZSBk
ZWZpbmVzIGp1c3QgZ28gaW50byB0aGUgY2xrIGRyaXZlci4gSXMgdGhhdCBhDQo+ID4gPiB3b3Jr
YWJsZSBzb2x1dGlvbiBvciBkb2VzIHNvbWV0aGluZyBub3Qgd29yaz8NCj4gPg0KPiA+IEFyZSB5
b3Ugc3VnZ2VzdGluZyBtZSB0byBkb2luZyBpdCBub3c/DQo+ID4gQXMgdGhlIHBhdGNoIGlzIGFs
cmVhZHkgaW4gU2hhd24ncyB0cmVlLCBidXQgSSB0aGluayBJIGNhbiBkbyBpdCBhbmQNCj4gPiBj
bGVhbiB1cCB0aGUgZmlsZSBpbiBTaGF3bidzIHRyZWUgbGF0ZXIuDQo+ID4NCj4gPiBIb3dldmVy
LCBvbmx5IG1vdmluZyB0aGUgY2xrIHJlbGF0ZWQgZGVmaW5lcyBpbnRvIGNsayBkcml2ZXIgaXMg
bm90IGVub3VnaC4NCj4gPiBUaGUgZHJpdmVyIGNvbXBpbGluZyBzdGlsbCBkZXBlbmRzIG9uIHRo
ZSByZXNvdXJjZSBJRCBmaWxlIHdoaWNoIGlzDQo+ID4gc2hhcmVkIGJ5IHBvd2VyIGRvbWFpbiBk
cml2ZXIgYW5kIGNsayBkcml2ZXIgKGFuZCBwb3NzaWJsZSBtYW55IG90aGVycykuDQo+ID4gU28g
d2Ugc3RpbGwgaGF2ZSBkZXBlbmRlbmN5IGlzc3Vlcy4NCj4gPg0KPiANCj4gRG8gdGhlIHJlc291
cmNlcyBuZWVkIHRvIGJlIGRlZmluZWQgaW4gb25lIHBsYWNlIGVpdGhlcj8gT3IgY2FuIHRoZXkg
YmUgc3ByZWFkDQo+IHRvIGFsbCB0aGUgZHJpdmVycyB0aGF0IHVzZSB0aGVtPw0KDQpJIGd1ZXNz
IG5vLiBUaGV5J3JlIG1vc3RseSBzaGFyZWQgYW1vbmcgYSB2YXJpZXR5IG9mIGRyaXZlciwgcG93
ZXIgZG9tYWluLCBjbGsgYW5kDQpvdGhlciBwb3NzaWJsZSBjbGllbnRzLg0KZS5nLiBwb3dlciBk
b21haW4gdXNlIGFsbCBvZiB0aGVtIHRvIHNwZWNpZnkgZG9tYWluIGluIGRldmljZSB0cmVlLg0K
KwkJYWRtYV9scHVhcnQwOiBzZXJpYWxANWEwNjAwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNs
LGlteDhxeHAtbHB1YXJ0IiwgImZzbCxpbXg3dWxwLWxwdWFydCI7DQorCQkJcmVnID0gPDB4NWEw
NjAwMDAgMHgxMDAwPjsNCisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjI1IElSUV9UWVBFX0xF
VkVMX0hJR0g+Ow0KKwkJCWludGVycnVwdC1wYXJlbnQgPSA8JmdpYz47DQorCQkJY2xvY2tzID0g
PCZhZG1hX2xwY2cgSU1YOFFYUF9BRE1BX0xQQ0dfVUFSVDBfQkFVRF9DTEs+Ow0KKwkJCWNsb2Nr
LW5hbWVzID0gImlwZyI7DQorCQkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfVUFSVF8w
PjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsNCg0KaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMDY3NzMxMS8NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQo=
