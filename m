Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9A3C43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 10:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E98DD20823
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 10:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="woeWSnf+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfBVKMa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 05:12:30 -0500
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:26421
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725895AbfBVKMa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 05:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zrq4vU4rsDXwacuQkSLDv+gAGnUmro+xtggXyESUo+M=;
 b=woeWSnf+Ui1Qs3lIJzk6IE18Aby4ozQBQpkuZE8MUmroAO7vy1JJoIBdNPLgHXbJqT1BPSZpfUnksB0+hx3p3v8o9b+JgicmWNPtlUF3MvwfToHi5JdTSafjhUpUH9b9Ne6tZ4dLfTTNY1WoiVHUPsn8zWfcdp6GPX8TRqJDpk0=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1836.jpnprd01.prod.outlook.com (52.133.164.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.15; Fri, 22 Feb 2019 10:12:24 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1643.014; Fri, 22 Feb 2019
 10:12:24 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
Thread-Topic: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
Thread-Index: AQHUyTar0aJjInAke0Kex+QMbpAYUqXqlYMAgAEEwMA=
Date:   Fri, 22 Feb 2019 10:12:23 +0000
Message-ID: <TY1PR01MB177050F5C00ED7DE89FB4318C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1550678960-1264-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdU=qGGi0jgaN=uvsPPK1XkJChLAdwKZJ+cf4_rJt+gNYQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU=qGGi0jgaN=uvsPPK1XkJChLAdwKZJ+cf4_rJt+gNYQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06abb428-1002-4fa6-4151-08d698ae3d5b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1836;
x-ms-traffictypediagnostic: TY1PR01MB1836:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1836;20:0cctzfI5dZ3+JBf3dgc/1E9/CmDHP1KERUEQceZGgcOnvZFxrDhkKPl4Ocw2lhmrCnSKVjILt3bJFkVUbJ4oXLe2dc+Cb8JH9HagPSqi7w3mDwjjaJQpEGtnY7cX6+oEaA9ezaRvB0fwklfgvQtU/QGZwvnV65u0CNuo231/0Co=
x-microsoft-antispam-prvs: <TY1PR01MB1836099CE1DE576DA5F61961C07F0@TY1PR01MB1836.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09565527D6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(53936002)(11346002)(446003)(478600001)(2906002)(44832011)(97736004)(476003)(7696005)(74316002)(229853002)(9686003)(6436002)(486006)(99286004)(105586002)(106356001)(7736002)(68736007)(305945005)(6916009)(33656002)(55016002)(102836004)(6506007)(53546011)(3846002)(6116002)(26005)(76176011)(54906003)(14444005)(81156014)(81166006)(5660300002)(4326008)(256004)(8676002)(107886003)(6246003)(25786009)(186003)(14454004)(316002)(66066001)(71190400001)(71200400001)(8936002)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1836;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IFJplsMyD5WeNY+KBcfsorDU9ep3BIBvj8SWyIj5mKQ8UBNiL+6Hx+bMbX4/hCCfoeraM6jUtZvFl+ZZXH4xm3R4I/X+DkaATVqXJWCi1NGyNCuhElDVgNFChnGE8SwNTUmZ51IEs+emiYZEGYJpnt5rbdpTMXOKZpnVmqn3sPjYNNFD6i9mWBvZUquhhPDUpL57OrndoWcFz+mSlnMgInqiDQgh/tCVGcbZdV/ICa1xHC5ZeD5UAt8wemoCa6tsMhyw66XLmAUmhuVsN4pDftZt9lptw4fDnHf04v0C7s6xMBpk5m/ARMsZr+rvO/c1gFT0pUxMM7N4s9xNkYGW7/bJ7MbGmLqevMN+Ef4vpBiKBv2hGYiiSLSejgJCYdbxZFRkKey17gzAc6TeSdCm3xooY/GtOqSikxuCWE8CTds=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06abb428-1002-4fa6-4151-08d698ae3d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2019 10:12:23.8304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1836
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNCj4gRnJvbTogbGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJu
ZWwub3JnIDxsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFs
ZiBPZiBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gU2VudDogMjEgRmVicnVhcnkgMjAxOSAxODozNA0K
PiBUbzogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGNsazogcmVuZXNhczogcjhhNzc0YzA6IEZpeCBMQVNUX0RU
X0NPUkVfQ0xLDQo+IA0KPiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCA1OjA5IFBNIEZhYnJpemlv
IENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBF
bnVtIExBU1RfRFRfQ09SRV9DTEsgbmVlZHMgdXBkYXRpbmcgYXMgUjhBNzc0QzBfQ0xLX0NBTkZE
DQo+ID4gd2FzIHJlY2VudGx5IGFkZGVkIGFuZCBpdCdzIHRoZSBjb3JlIGNsb2NrIHdpdGggdGhl
IGhpZ2hlc3QNCj4gPiBpbmRleC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENh
c3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gTmljZSBjYXRjaCEN
Cj4gWW91IG9ubHkgbm90aWNlIHRoaXMga2luZCBvZiBidWcgd2hlbiB5b3Ugc3RhcnQgcmVmZXJl
bmNpbmcgdGhlIGNsb2NrDQo+IGZyb20gRFQsIHJpZ2h0PyBBdCByZWdpc3RyYXRpb24gdGltZSwg
dGhlIGNsb2NrIG51bWJlciBzcGFjZSBpcyBzaGFyZWQgd2l0aA0KPiBpbnRlcm5hbCBjb3JlIGNs
b2Nrcywgc28gbm8gZXJyb3IgaXMgZGV0ZWN0ZWQuDQo+IENhbiB3ZSBpbXByb3ZlIHRoYXQ/DQoN
CkkgY2FuIGxvb2sgaW50byBpdA0KDQo+IA0KPiBGaXhlczogMmE2ZWZiYzZkYTVkMjQ4YyAoImNs
azogcmVuZXNhczogcjhhNzc0YzA6IEFkZCBtaXNzaW5nIENBTkZEIGNsb2NrIikNCg0KQ29tbWl0
IDJhNmVmYmM2ZGE1ZDI0OGMgaXMgbm90IGluIGEgcmVsZWFzZSBvciBpbiBhIHJjLCBpcyBpdCBv
ayB0byByZWZlciB0byBpdCB3aXRoIGEgZml4ZXMgdGFnPw0KDQo+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gTWlrZS9TdGVw
aGVuOiBjYW4geW91IHBsZWFzZSB0YWtlIHRoaXMgb25lIGRpcmVjdGx5LCBhcyBpdCBpcyBhIGZp
eCBmb3INCj4gY2xrLW5leHQ/DQo+IA0KPiBGYWJyaXppbzogTG9va3MgbGlrZSBSOEE3NzRBMSBo
YXMgdGhlIHNhbWUgYnVnLiBDYXJlIHRvIGZpeCB0aGF0IGFzIHdlbGw/DQoNCldpbGwgZG8NCg0K
VGhhbmtzLA0KRmFiDQoNCj4gDQo+IFRoYW5rcyENCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQo=
