Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E80EC282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 18:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D884F2184D
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 18:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="TsLNF4uG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbfA3SvJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 13:51:09 -0500
Received: from mail-eopbgr1400120.outbound.protection.outlook.com ([40.107.140.120]:11968
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725786AbfA3SvI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jan 2019 13:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNmkpQnNByJOAH5+sQPYsNPYkUMLgYHq+c9qY+UwZKk=;
 b=TsLNF4uGI4OsqmWZRmx7ef/9zvOx7l/WPbuPBYEt127DaZ39c19b/E1AnkHsdl2KmG5laRTgjBbnsDjQoPIaDjeCcClk0JlarSGl+tq0yu+tVjNESSlWlg6EUve1WU5bk1YD9C7a1UH77APSfcHD60JQ2O4femNWbLqBFk6Rkdk=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1818.jpnprd01.prod.outlook.com (52.133.163.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.17; Wed, 30 Jan 2019 18:51:04 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1580.017; Wed, 30 Jan 2019
 18:51:04 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH/RFT v2 5/6] clk: renesas: rcar-gen3: Support r8a7745 Z2
 clock divider
Thread-Topic: [PATCH/RFT v2 5/6] clk: renesas: rcar-gen3: Support r8a7745 Z2
 clock divider
Thread-Index: AQHUuH/mESzbax8xEU6gaSZefz2RNqXHj4WAgACY2WA=
Date:   Wed, 30 Jan 2019 18:51:04 +0000
Message-ID: <TY1PR01MB1770BD098B6920ECF1B067DAC0900@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
 <20190130094029.9604-6-horms+renesas@verge.net.au>
 <OSBPR01MB21036AEED543FE6DD9001E0CB8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21036AEED543FE6DD9001E0CB8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1818;20:yyzTW7zXd3IqvAiLLUaSWAxVrkYDVFD8a6mzpT26aGdrvpnE+r1+tCkYOVwjrbQ+fh5O6lQ4Mac40KA7RL+pPYMY+HtybXCymkJf5q4gvmUca8c+MqSi9555OldOSxZAbOqiZdJR602yqkEJgOvBn3ltdvg9v/AtrveGN66CTN0=
x-ms-office365-filtering-correlation-id: a1fe16f5-ceab-402e-5741-08d686e3e336
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1818;
x-ms-traffictypediagnostic: TY1PR01MB1818:
x-microsoft-antispam-prvs: <TY1PR01MB1818CCE723CC7D6B8AF076AAC0900@TY1PR01MB1818.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(376002)(366004)(346002)(136003)(51914003)(189003)(199004)(486006)(186003)(2906002)(99286004)(446003)(476003)(8676002)(81166006)(9686003)(97736004)(81156014)(4326008)(53936002)(25786009)(11346002)(26005)(6246003)(256004)(110136005)(53546011)(54906003)(6506007)(316002)(6436002)(8936002)(55016002)(102836004)(229853002)(66066001)(33656002)(39060400002)(71200400001)(3846002)(7696005)(106356001)(71190400001)(76176011)(105586002)(74316002)(478600001)(68736007)(14454004)(86362001)(7736002)(305945005)(44832011)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1818;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: frcbLXeZfd5/9ncs0WSzWsJRrwSJc4pHfYi68L7QWnFDTLqg+dOrS1R5qh/3xVjfN+Y/FvBrIgJPGcOB3mgfPjO+sKk3Bbsou9Hb4mip7E97XRQTSng8hSWGgNyg9Gh/LNyA2CVVV2pdCmAfzTJ8AiaR5F7gTJfqX3zvxrAk+Z5JKlSInlyRKEVNxDS2J74J6O6gGauku3AhmWMmQx4u04BZk0rMB+GEAI1lSvdNzwmTStYKu4MKpLnkCbY7tM264GdFEweVrPTK5YyLCxkrXIziXy3MaWmRjK+IOo9788pZ4Et8CjUI/2VVcb1BYMpr8+4JSkkYfU8o3M9RNzL2pEL/qrqNjzgbqIOGNFX7y3bPfh4d+h8kIGtQql/iNbCdSLVpe8tjCdm9+j1A1kOoo/5jlAitATo5ei8y1saSz1w=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fe16f5-ceab-402e-5741-08d686e3e336
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 18:51:04.4659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1818
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGVsbG8gU2ltb24sDQoNCj4gRnJvbTogQmlqdSBEYXMNCj4gU2VudDogMzAgSmFudWFyeSAyMDE5
IDA5OjQ0DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0gvUkZUIHYyIDUvNl0gY2xrOiByZW5lc2FzOiBy
Y2FyLWdlbjM6IFN1cHBvcnQgcjhhNzc0NSBaMiBjbG9jayBkaXZpZGVyDQo+DQo+IEhpIFNpbW9u
LA0KPg0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaA0KPg0KPiA+IFN1YmplY3Q6IFtQQVRDSC9SRlQg
djIgNS82XSBjbGs6IHJlbmVzYXM6IHJjYXItZ2VuMzogU3VwcG9ydCByOGE3NzQ1IFoyIGNsb2Nr
DQo+ID4gZGl2aWRlcg0KPiA+DQo+ID4gT24gdGhlIFJaL0cyRSAocjhhNzc0NSkgU29DIHRoZSBa
MkZDIGJpdHMgb2YgdGhlIFJGUUNSQyByZWdpc3Rlciwgd2hpY2gNCj4gPiBjb250cm9sIHRoZSBm
cmVxdWVuY3kgZGl2aXNpb24gcmF0aW8gZm9yIHRoZSBaMs+GIGNsb2NrIGFyZSBsb2NhdGVkIGF0
IGJpdFsxMjo4XQ0KPiA+IHJhdGhlciB0aGFuIHRoZSBtb3JlIGNvbW1vbiBsb2NhdGlvbiBiaXRb
NDowXS4NCj4gPg0KPiA+IFRoaXMgY2hhbmdlIGlzIG1hZGUgd2l0aCByZWZlcmVuY2UgdG8gdGhl
IFVzZXIncyBNYW51YWwgdjAuNjEuDQo+ID4NCj4gPiBGaXhlczogOTEyN2Q1NGJiODk0ICgiY2xr
OiByZW5lc2FzOiBjcGctbXNzcjogQWRkIFI4QTc3NDUgc3VwcG9ydCIpDQo+ID4gU2lnbmVkLW9m
Zi1ieTogU2ltb24gSG9ybWFuIDxob3JtcytyZW5lc2FzQHZlcmdlLm5ldC5hdT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9jbGsvcmVuZXNhcy9yY2FyLWdlbjMtY3BnLmMgfCA0ICsrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL3JlbmVzYXMvcmNhci1nZW4zLWNwZy5jIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9y
Y2FyLQ0KPiA+IGdlbjMtY3BnLmMNCj4gPiBpbmRleCBkMjFmZGViNTIwZTEuLmRmZDJiOWNhZWFm
NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3JjYXItZ2VuMy1jcGcuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmNhci1nZW4zLWNwZy5jDQo+ID4gQEAgLTQ1
MCw2ICs0NTAsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJpYnV0ZQ0K
PiA+IGNwZ19xdWlya3NfbWF0Y2hbXSBfX2luaXRjb25zdCA9IHsNCj4gPiAgLnNvY19pZCA9ICJy
OGE3Nzk5MCIsDQo+ID4gIC5kYXRhID0gKHZvaWQgKilaMkZDX0JJVF9NQVNLX1NGVF84LA0KPiA+
ICB9LA0KPiA+ICt7DQo+ID4gKy5zb2NfaWQgPSAicjhhNzc0NSIsDQo+ID4gKy5kYXRhID0gKHZv
aWQgKilaMkZDX0JJVF9NQVNLX1NGVF84LA0KPiA+ICt9LA0KPiA+ICB7IC8qIHNlbnRpbmVsICov
IH0NCj4gPiAgfTsNCj4NCj4NCj4gUlovRzJFICBTb0MgaWQgaXMgcjhhNzc0YzAuDQoNCisxDQoN
CkNoZWVycywNCkZhYg0KDQo+DQo+IFJlZ2FyZHMsDQo+IEJpanUNCg0KDQoNClJlbmVzYXMgRWxl
Y3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5l
IEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5k
ICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
