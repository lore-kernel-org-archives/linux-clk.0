Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C43C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A3612084D
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="lI4cX3dr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfBYJtl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:49:41 -0500
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:5190
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726493AbfBYJtl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Feb 2019 04:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrdoQaBGOBu5tV02WWD1O6w2tafgBWP9AFtAeMKQMGo=;
 b=lI4cX3drM5y0J2en4/jylryqCgLQEBNXQFFdXrDq5Ta2zlN27zNpDPfAALJJqRMzbyERf3tR69EW9am8tOukACK1M/LB3nqOwSHnqX0s0ZVYBu8+/31j2nuS8MoU4DSFVO5Z1yvfCQwdleCoD9MGTw0/RHZo524+AfcZUzHPEfs=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1516.jpnprd01.prod.outlook.com (52.133.161.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.21; Mon, 25 Feb 2019 09:49:36 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1643.019; Mon, 25 Feb 2019
 09:49:36 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
Thread-Topic: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
Thread-Index: AQHUyqYgtONDUUQKMUK/Mf0Ogtgn0qXrt1qAgASL6ACAAACqgIAABQiAgAAAZ4A=
Date:   Mon, 25 Feb 2019 09:49:36 +0000
Message-ID: <TY1PR01MB17702EBF61A0063B7CCE162FC07A0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB2285B3DDEA95F441338DF14AB77F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
 <20190225092708.cwormmuqdm3g4umy@verge.net.au>
 <TY1PR01MB177027370EE55C92347CC576C07A0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUyf56_CnTS=b5UWxh8rWp9YF8sNR-BOThuB5Tpzf7BRQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUyf56_CnTS=b5UWxh8rWp9YF8sNR-BOThuB5Tpzf7BRQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 177ea6f2-04b2-46c5-6c45-08d69b068d8a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1516;
x-ms-traffictypediagnostic: TY1PR01MB1516:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1516;20:bP+bnVdB0+yMeR1UsO8C3L/DYxob4IZfApqOJtfXFpYC9+UYon0C7s/mFfz7CBsAB2qL2fV2Ywc76zyKF4q0B8B24camE2E5QeHogXvEsp0DD350rdX9L32f+jgDwKDefJXURvtSYPZWzzQlvZmE82WiGHcq3V4uNyGITcDbWlI=
x-microsoft-antispam-prvs: <TY1PR01MB1516C26570905F754C20CAC5C07A0@TY1PR01MB1516.jpnprd01.prod.outlook.com>
x-forefront-prvs: 095972DF2F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(396003)(39860400002)(366004)(199004)(189003)(305945005)(105586002)(7736002)(8936002)(446003)(8676002)(68736007)(74316002)(3846002)(6116002)(186003)(106356001)(4326008)(107886003)(229853002)(33656002)(53546011)(6506007)(102836004)(81156014)(6916009)(256004)(76176011)(86362001)(7696005)(55016002)(478600001)(6436002)(6246003)(2906002)(14454004)(71190400001)(486006)(93886005)(6346003)(97736004)(54906003)(71200400001)(316002)(26005)(5660300002)(476003)(25786009)(66066001)(81166006)(11346002)(53936002)(9686003)(44832011)(99286004)(52536013);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1516;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7rB11q/+MxqJe/xqFK7yjEyKUDflemJ4UxOkv/+5lp+VF1AlubCnAktaDsrU3MAg5YQ1jPJmmW20WxQJa5t+vd2Jp0ddSEVFiZsK8/jDYa4cuw9lo2sxmCbu39CKHvRwNTRhMuTMNA5WmDXw//9JDGL91T6UrpSsxPprh19PEBBoEC96fkRezzZvioXRj2OBG/kI4UXlTAlg715Rs8myMvsabq8yb9+7XwCqYTxZ3fYA+LJQJEFBakYwyWvksIcXYZ/T6gWznCgejpptCh7rUztx8rTYO2w+X4jrYmzdE0YvlaroXnUIC5lXJ3J882SDFvU3Qd5RGcXWqUfwKo+QBWbdKypbdbtHuWlomW3O0e8j2OY09QNpnFtZg70igflOynzqrBwIz45bO5UuUc7y8QJFrO+XqyOQJP65n4OB1As=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177ea6f2-04b2-46c5-6c45-08d69b068d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2019 09:49:36.3960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1516
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNCj4gRnJvbTogbGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJu
ZWwub3JnIDxsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFs
ZiBPZiBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gU2VudDogMjUgRmVicnVhcnkgMjAxOSAwOTo0OA0K
PiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IHJlbmVzYXM6IHI4YTc3NGExOiBGaXggTEFTVF9E
VF9DT1JFX0NMSw0KPiANCj4gSGkgRmFicml6aW8sDQo+IA0KPiBPbiBNb24sIEZlYiAyNSwgMjAx
OSBhdCAxMDo0NCBBTSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBTaW1vbiBIb3JtYW4gPGhvcm1zQHZlcmdlLm5l
dC5hdT4NCj4gPiA+IFNlbnQ6IDI1IEZlYnJ1YXJ5IDIwMTkgMDk6MjcNCj4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGNsazogcmVuZXNhczogcjhhNzc0YTE6IEZpeCBMQVNUX0RUX0NPUkVfQ0xL
DQo+ID4gPg0KPiA+ID4gT24gRnJpLCBGZWIgMjIsIDIwMTkgYXQgMTI6MDE6MjFQTSArMDAwMCwg
Q2hyaXMgUGF0ZXJzb24gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+ID4gRnJvbTogRmFicml6aW8g
Q2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gU2VudDog
MjIgRmVicnVhcnkgMjAxOSAxMjowMA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRW51bSBMQVNUX0RU
X0NPUkVfQ0xLIG5lZWRzIHVwZGF0aW5nIGFzIFI4QTc3NEExX0NMS19DQU5GRA0KPiA+ID4gPiA+
IHdhcyByZWNlbnRseSBhZGRlZCBhbmQgaXQncyB0aGUgY29yZSBjbG9jayB3aXRoIHRoZSBoaWdo
ZXN0DQo+ID4gPiA+ID4gaW5kZXguDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPiA+
ID4gUmV2aWV3ZWQtYnk6IENocmlzIFBhdGVyc29uIDxjaHJpcy5wYXRlcnNvbjJAcmVuZXNhcy5j
b20+DQo+ID4gPg0KPiA+ID4gSSB0aGluayB0aGlzIG5lZWRzOg0KPiA+ID4NCj4gPiA+IEZpeGVz
OiA5ZDAzNGUxNTFiNDAgKCJjbGs6IHJlbmVzYXM6IHI4YTc3NGExOiBBZGQgbWlzc2luZyBDQU5G
RCBjbG9jayIpDQo+ID4NCj4gPiBJIG5haXZlbHkgdGhvdWdodCBJIGNvdWxkIG9ubHkgcmVmZXIg
dG8gY29tbWl0cyBmcm9tIFRvcnZhbGQncywgd2hpY2ggaXMgY2xlYXJseSB3cm9uZywNCj4gPiB0
aGVyZWZvcmUgdGhhbmsgeW91IGZvciBmaXhpbmcuDQo+IA0KPiBGVFI6IFlvdSBjYW4gcmVmZXIg
dG8gYW55IGNvbW1pdHMgaW4gbGludXgtbmV4dCB0aGF0IGFyZSBjb25zaWRlcmVkIHN0YWJsZSwN
Cj4gaS5lLiBvbiBicmFuY2hlcyB0aGF0IGFyZSBuZXZlciByZWJhc2VkLg0KPiBUaGlzIGluY2x1
ZGVzIGFsbCBmb3ItbmV4dCBicmFuY2hlcyBvZiBtYWludGFpbmVycyB3aG8gYWNjZXB0IHB1bGwg
cmVxdWVzdHMuDQoNCkkgc2VlLCB0aGFuayB5b3UgZm9yIHRoZSBleHBsYW5hdGlvbiENCg0KQ2hl
ZXJzLA0KRmFiDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4g
DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
