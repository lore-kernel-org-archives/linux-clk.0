Return-Path: <SRS0=O/eU=PY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220CAC43387
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 19:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC96920866
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 19:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="gkyObXBO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730837AbfAPTZE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jan 2019 14:25:04 -0500
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:20829
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730165AbfAPTZE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Jan 2019 14:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3/I6WQpgyVdKtBABL51nPtck5hbqobjSLto6GNk4QM=;
 b=gkyObXBO5+hxXtkpqQk5bWvO7JVBLdrahTwbmSZo6kubpYC/fgcEiUyr4V0oK+Jd6EOdjyGpJMj9k9AMekoWWRalI6nFwlKqYdFcQsLaiTDV0RAIr6uOaW9aT+JvDfTje7uURh0jN786/3UKImwKNvoUVwOR/A22aazFOdnVdac=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1440.jpnprd01.prod.outlook.com (10.174.228.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Wed, 16 Jan 2019 19:24:54 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122%5]) with mapi id 15.20.1537.018; Wed, 16 Jan 2019
 19:24:54 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Lukasz Majewski <lukma@denx.de>,
        Michal Simek <monstr@monstr.eu>,
        =?utf-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ben Whitten <ben.whitten@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH 08/11] clk: renesas: r8a774c0: Add missing CANFD clock
Thread-Topic: [PATCH 08/11] clk: renesas: r8a774c0: Add missing CANFD clock
Thread-Index: AQHUrcrDVzofMNoB5UmjOYS78Hd4iaWyQVGAgAABcfA=
Date:   Wed, 16 Jan 2019 19:24:54 +0000
Message-ID: <TY1PR01MB17704CFDBA8A1C2D920B763DC0820@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-9-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWG6m11eAjvPeFXjsu3jhYnfsxN-EUXw5_SQZ6qMrebYw@mail.gmail.com>
In-Reply-To: <CAMuHMdWG6m11eAjvPeFXjsu3jhYnfsxN-EUXw5_SQZ6qMrebYw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1440;20:XE6+fWkL3wAMNp50bCHmAwhfU2N3hLygWlVN0zUrfGzPdIcobieTL9sFaTmp5thGSL0kMV0zwVMr7sXJIiZl41YhUsGZfU+Unbdg1pWjwmv9Q2Ap+Fz3UBdPo6ZH3eLkno2PpzKUCREHLKutMGex2xqhxVHwZ+ftmuxcuYeiNWs=
x-ms-office365-filtering-correlation-id: 61ae394f-a98a-4902-062a-08d67be84b79
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1440;
x-ms-traffictypediagnostic: TY1PR01MB1440:
x-microsoft-antispam-prvs: <TY1PR01MB1440179FCEAB3C1E08D054E1C0820@TY1PR01MB1440.jpnprd01.prod.outlook.com>
x-forefront-prvs: 091949432C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(366004)(346002)(376002)(136003)(189003)(199004)(229853002)(106356001)(105586002)(54906003)(7696005)(44832011)(7416002)(76176011)(5660300001)(25786009)(6916009)(26005)(2906002)(68736007)(478600001)(6436002)(11346002)(486006)(99286004)(446003)(476003)(186003)(97736004)(345774005)(71190400001)(71200400001)(305945005)(53546011)(39060400002)(256004)(74316002)(8936002)(14454004)(4326008)(81156014)(9686003)(6506007)(66066001)(7736002)(33656002)(102836004)(316002)(55016002)(6246003)(81166006)(8676002)(6116002)(3846002)(86362001)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1440;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7R6Zgo1x5pAW7q0156x+YQ3+Cka40oTEG7j+gUJZ6qu5EI/GuJMYlAV1rslNcecPQd4wdTf+/jJHSsbjTShwAptxijQP3QGGhIt08cT10yrjF6bKYrWc4Y4K6RqYZYJ148XQ7JrIFbyuMRwYEtddalTIwG7fkaEXHe/ggfGTWHxUibjjMYc0uZ1S2sIKK9dqhNGTJwtSHoOYoxL43pLNJFHEbiXiNkj/PJsTD5a9U+dwEF+hYs+9qC9acblIdPAp43CoqmuXwMPMonrPG/z4QOihuVDljOmfFXJAyf353LfqGUzYq6E5yo8ZzbTnIHSaiqYUwe+SCVmGo1YdG5N+F+AkyuXytOW4kt7cPGscc0jWlujLcfUcJrH+JsS+Z5MtVrXzq/N6UEsqWLMdL3k5WMGzhRB+cBSLVslUcVAHjZg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ae394f-a98a-4902-062a-08d67be84b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2019 19:24:54.5603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1440
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxNiBKYW51YXJ5
IDIwMTkgMTk6MDYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOC8xMV0gY2xrOiByZW5lc2FzOiBy
OGE3NzRjMDogQWRkIG1pc3NpbmcgQ0FORkQgY2xvY2sNCj4NCj4gSGkgRmFicml6aW8sDQo+DQo+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4NCj4gT24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgNzoz
OSBQTSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBhZGRzIHRoZSBtaXNzaW5nIENBTkZEIGNsb2NrIHRvIHRo
ZSByOGE3NzRjMCBzcGVjaWZpYw0KPiA+IGNsb2NrIGRyaXZlci4NCj4NCj4gQXJlIHlvdSBzdXJl
IHRoZSBDQU5GRCBjbG9jayBleGlzdHMgb24gUlovRzJFPw0KDQpJIHlldCBoYXZlIHRvIHJ1biB0
ZXN0cyBvbiB0aGUgYm9hcmQgc3BlY2lmaWMgdG8gQ0FORkQsIGJ1dCB3ZSBrbm93IGZvciBzdXJl
IHRoYXQncw0KZ29pbmcgdG8gYXBwZWFyIG9uIHRoZSBSWi9HMkUgKGlmIGl0J3Mgbm90IGluIHRo
ZSByZXZpc2lvbiBvZiB0aGUgU29DIHdlIGhhdmUgYWxyZWFkeSkuDQpKYXBhbiBoYXZlIGNvbmZp
cm1lZCB0aGF0IGV2ZXJ5dGhpbmcgQ0FORkQtd2lzZSBzaG91bGQgYmUgdGhlIHNhbWUgYXMgcGVy
IHRoZQ0KY29ycmVzcG9uZGluZyBHZW4zIHBhcnRzLCBhbmQgdGhhdCdzIHdoeSBhcmUgcHVzaGlu
ZyB0aGlzIHBhdGNoIChhbmQgc2hvcnRseQ0Kc29tZXRoaW5nIHNpbWlsYXIgZm9yIHRoZSByOGE3
NzRhMSkgZm9yIGl0IGFzIGl0J3Mgb24gb3VyIGNyaXRpY2FsIHBhdGguIEFueXdheXMsIHRoZQ0K
SFcgb2YgdGhlIEVLODc0IHNob3VsZCBzdXBwb3J0IENBTkZEIHByb3Blcmx5LCB0aGVyZWZvcmUg
SSBhbSBnb2luZyB0byB0cnkgYW5kDQpydW4gc29tZSB0ZXN0cyAoYXMgc29vbiBhcyBJIHNvcnQg
b3V0IHRoZSBjYWJsZXMpLCBzbyB0aGF0IHdlIGNsZWFyIGFueSBkb3VidHMuDQoNCldvdWxkIHlv
dSByYXRoZXIgd2UgaGVsZCBiYWNrIGFsbCBvZiB0aGUgQ0FOIHJlbGF0ZWQgY2hhbmdlcyBmb3Ig
bm93Pw0KDQo+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5j
YXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IENocmlzIFBhdGVyc29uIDxD
aHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+DQo+DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yOGE3NzRjMC1jcGctbXNzci5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9y
OGE3NzRjMC1jcGctbXNzci5jDQo+DQo+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9j
ay9yOGE3NzRjMC1jcGctbXNzci5oDQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9j
ay9yOGE3NzRjMC1jcGctbXNzci5oDQo+ID4gQEAgLTQ4LDEzICs0OCwxNCBAQA0KPiA+ICAjZGVm
aW5lIFI4QTc3NEMwX0NMS19aQTIgICAgICAgICAgICAgICAzNw0KPiA+ICAjZGVmaW5lIFI4QTc3
NEMwX0NMS19aQTggICAgICAgICAgICAgICAzOA0KPiA+ICAjZGVmaW5lIFI4QTc3NEMwX0NMS19a
MkQgICAgICAgICAgICAgICAzOQ0KPiA+IC0jZGVmaW5lIFI4QTc3NEMwX0NMS19NU08gICAgICAg
ICAgICAgICA0MA0KPiA+IC0jZGVmaW5lIFI4QTc3NEMwX0NMS19SICAgICAgICAgICAgICAgICA0
MQ0KPiA+IC0jZGVmaW5lIFI4QTc3NEMwX0NMS19PU0MgICAgICAgICAgICAgICA0Mg0KPiA+IC0j
ZGVmaW5lIFI4QTc3NEMwX0NMS19MVjAgICAgICAgICAgICAgICA0Mw0KPiA+IC0jZGVmaW5lIFI4
QTc3NEMwX0NMS19MVjEgICAgICAgICAgICAgICA0NA0KPiA+IC0jZGVmaW5lIFI4QTc3NEMwX0NM
S19DU0kwICAgICAgICAgICAgICA0NQ0KPiA+IC0jZGVmaW5lIFI4QTc3NEMwX0NMS19DUCAgICAg
ICAgICAgICAgICAgICAgICAgIDQ2DQo+ID4gLSNkZWZpbmUgUjhBNzc0QzBfQ0xLX0NQRVggICAg
ICAgICAgICAgIDQ3DQo+ID4gKyNkZWZpbmUgUjhBNzc0QzBfQ0xLX0NBTkZEICAgICAgICAgICAg
IDQwDQo+ID4gKyNkZWZpbmUgUjhBNzc0QzBfQ0xLX01TTyAgICAgICAgICAgICAgIDQxDQo+ID4g
KyNkZWZpbmUgUjhBNzc0QzBfQ0xLX1IgICAgICAgICAgICAgICAgIDQyDQo+ID4gKyNkZWZpbmUg
UjhBNzc0QzBfQ0xLX09TQyAgICAgICAgICAgICAgIDQzDQo+ID4gKyNkZWZpbmUgUjhBNzc0QzBf
Q0xLX0xWMCAgICAgICAgICAgICAgIDQ0DQo+ID4gKyNkZWZpbmUgUjhBNzc0QzBfQ0xLX0xWMSAg
ICAgICAgICAgICAgIDQ1DQo+ID4gKyNkZWZpbmUgUjhBNzc0QzBfQ0xLX0NTSTAgICAgICAgICAg
ICAgIDQ2DQo+ID4gKyNkZWZpbmUgUjhBNzc0QzBfQ0xLX0NQICAgICAgICAgICAgICAgICAgICAg
ICAgNDcNCj4gPiArI2RlZmluZSBSOEE3NzRDMF9DTEtfQ1BFWCAgICAgICAgICAgICAgNDgNCj4N
Cj4gVGhpcyBmaWxlIGlzIHBhcnQgb2YgdGhlIERUIEFCSSwgaGVuY2UgbGlzdCBvZiBkZWZpbml0
aW9ucyBpcyBhcHBlbmQtb25seS4NCg0KV2lsbCBmaXggdGhpcyB3aXRoIGEgdjINCg0KVGhhbmtz
LA0KRmFiDQoNCj4NCj4gUGxlYXNlIGFkZCBSOEE3NzRDMF9DTEtfQ0FORkQgYXQgdGhlIGVuZCwg
aS5lLg0KPg0KPiAgICAgI2RlZmluZSBSOEE3NzRDMF9DTEtfQ0FORkQgICAgICAgICAgICAgIDQ4
DQo+DQo+IEdye29ldGplLGVldGluZ31zLA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPg0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNz
IEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1
Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVz
IHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2NzA5Lg0K
