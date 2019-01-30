Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F122C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:43:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 686822087F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="o5xAQkF+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbfA3Jnf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:43:35 -0500
Received: from mail-eopbgr1410117.outbound.protection.outlook.com ([40.107.141.117]:17521
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727586AbfA3Jnf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jan 2019 04:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MWADIXK6c76I1KPv8Wt7J5z9lChSmr5C0rCwziw20I=;
 b=o5xAQkF+d0ipzmQpnzFK2a06srhjHtRspGqg2XYmqusvNkxOoz268YL45aV7W3ES4C7ymwrEhuagurkU8wC0FcW5sOLNe43ln9/QSp09GgsEu1ONTYMlXZZHXQvw3xjWKSkJqS3aGC0DV7JGTWt83jibOfLjsh7y5PpQZQghM7M=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB2166.jpnprd01.prod.outlook.com (52.134.241.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.18; Wed, 30 Jan 2019 09:43:31 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852%2]) with mapi id 15.20.1558.025; Wed, 30 Jan 2019
 09:43:31 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH/RFT v2 5/6] clk: renesas: rcar-gen3: Support r8a7745 Z2
 clock divider
Thread-Topic: [PATCH/RFT v2 5/6] clk: renesas: rcar-gen3: Support r8a7745 Z2
 clock divider
Thread-Index: AQHUuH/mzxvmApCniEmPinEIPUUjj6XHjgwg
Date:   Wed, 30 Jan 2019 09:43:31 +0000
Message-ID: <OSBPR01MB21036AEED543FE6DD9001E0CB8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
 <20190130094029.9604-6-horms+renesas@verge.net.au>
In-Reply-To: <20190130094029.9604-6-horms+renesas@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB2166;20:h/YasxC1t/L0NpKdJpWUQmEfk5wTeBX7s6PXgmKOZlbYpbin1l06ofkJSbcG4YlbqgY6WxcdafFVpMbBosXMvhwKUAmfcoJV6yB8MRF8uhpNmgFh3GD+p/GNfVmZMRL/WXT3RLrBdjwj3bCksOYyjeTjgdqYoXGrjLqqW/SwP4w=
x-ms-office365-filtering-correlation-id: 863fb4b9-8bed-4be4-9449-08d68697653e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2166;
x-ms-traffictypediagnostic: OSBPR01MB2166:
x-microsoft-antispam-prvs: <OSBPR01MB2166FACF1CA9D7E66FC61723B8900@OSBPR01MB2166.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(189003)(51914003)(66066001)(4326008)(33656002)(6506007)(71200400001)(2906002)(86362001)(71190400001)(256004)(102836004)(97736004)(486006)(110136005)(55016002)(54906003)(305945005)(7736002)(44832011)(7696005)(6436002)(9686003)(105586002)(76176011)(68736007)(186003)(476003)(81156014)(107886003)(316002)(229853002)(8676002)(14454004)(6246003)(478600001)(39060400002)(6116002)(74316002)(99286004)(446003)(3846002)(8936002)(106356001)(11346002)(53936002)(25786009)(26005)(81166006)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2166;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3RQJSIzdNjLXJamXTaEPKjqDuCq1Vw5Gm+BH4werTEV6ZCnbLB0PovB0bLMFbeJIvtWJ5K2SNWrpayQ6gFoO2u7p/SSTJ+dkQNXk6cSDVnzoic47wb3Ea93SCxjlldP8YS2eGXX4mNVcZrUtBOwvykYP2xR7IHQfRKge5fr0ypQuUI0ijj3yv8+Vc73g5o8xNTHS4FZZfEayBEoNjoFK7Soxc5eDKrqp0hVNIHyBoMahtcFfM+2/NY2EVKXS6Sno6mAzOuvTmjuikqjR5J1Xee8zGgNXDgcPv7MBX87Ai1BNO+901qbUmDpzhOYbeDvjMlSs4ghKGv5xzeGQP0kvTEMHu5rOF00VkZROy0GBAmQjBpPPpduOHduhBuUUj4Y8No9PRWBsx4OqKC3MXsIkpK01Ewmt22AZXzBLSw9QtIs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863fb4b9-8bed-4be4-9449-08d68697653e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 09:43:31.4412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2166
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU2ltb24sDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoDQoNCj4gU3ViamVjdDogW1BBVENIL1JG
VCB2MiA1LzZdIGNsazogcmVuZXNhczogcmNhci1nZW4zOiBTdXBwb3J0IHI4YTc3NDUgWjIgY2xv
Y2sNCj4gZGl2aWRlcg0KPg0KPiBPbiB0aGUgUlovRzJFIChyOGE3NzQ1KSBTb0MgdGhlIFoyRkMg
Yml0cyBvZiB0aGUgUkZRQ1JDIHJlZ2lzdGVyLCB3aGljaA0KPiBjb250cm9sIHRoZSBmcmVxdWVu
Y3kgZGl2aXNpb24gcmF0aW8gZm9yIHRoZSBaMs+GIGNsb2NrIGFyZSBsb2NhdGVkIGF0IGJpdFsx
Mjo4XQ0KPiByYXRoZXIgdGhhbiB0aGUgbW9yZSBjb21tb24gbG9jYXRpb24gYml0WzQ6MF0uDQo+
DQo+IFRoaXMgY2hhbmdlIGlzIG1hZGUgd2l0aCByZWZlcmVuY2UgdG8gdGhlIFVzZXIncyBNYW51
YWwgdjAuNjEuDQo+DQo+IEZpeGVzOiA5MTI3ZDU0YmI4OTQgKCJjbGs6IHJlbmVzYXM6IGNwZy1t
c3NyOiBBZGQgUjhBNzc0NSBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gSG9ybWFu
IDxob3JtcytyZW5lc2FzQHZlcmdlLm5ldC5hdT4NCj4gLS0tDQo+ICBkcml2ZXJzL2Nsay9yZW5l
c2FzL3JjYXItZ2VuMy1jcGcuYyB8IDQgKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yY2FyLWdlbjMt
Y3BnLmMgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3JjYXItDQo+IGdlbjMtY3BnLmMNCj4gaW5kZXgg
ZDIxZmRlYjUyMGUxLi5kZmQyYjljYWVhZjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcmNhci1nZW4zLWNwZy5jDQo+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmNhci1n
ZW4zLWNwZy5jDQo+IEBAIC00NTAsNiArNDUwLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29j
X2RldmljZV9hdHRyaWJ1dGUNCj4gY3BnX3F1aXJrc19tYXRjaFtdIF9faW5pdGNvbnN0ID0gew0K
PiAgLnNvY19pZCA9ICJyOGE3Nzk5MCIsDQo+ICAuZGF0YSA9ICh2b2lkICopWjJGQ19CSVRfTUFT
S19TRlRfOCwNCj4gIH0sDQo+ICt7DQo+ICsuc29jX2lkID0gInI4YTc3NDUiLA0KPiArLmRhdGEg
PSAodm9pZCAqKVoyRkNfQklUX01BU0tfU0ZUXzgsDQo+ICt9LA0KPiAgeyAvKiBzZW50aW5lbCAq
LyB9DQo+ICB9Ow0KDQoNClJaL0cyRSAgU29DIGlkIGlzIHI4YTc3NGMwLg0KDQpSZWdhcmRzLA0K
QmlqdQ0KDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3cs
IE1pbGxib2FyZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVL
LiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4
NjcwOS4NCg==
