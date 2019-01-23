Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95769C282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 12:19:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54E3A20861
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 12:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="dioPbIjD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfAWMT3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 07:19:29 -0500
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:17591
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726029AbfAWMT3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 07:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eJKNRGAi0lk9X+dkWYE6Nq8gzvXrGanY8v92OV8qh4=;
 b=dioPbIjD4bQ9VDKqPivoFKiTHVYqbsuG+TEdFe/jOlCw2LNQleOVV1p2Y//jppJt1iAnYmqz5lGbGimaQ8pPAAEKgNkxZ4LzL5LDiAKCj90bB6AMFw3YnO0UJFZRcIl/S76JNewplsPhpprIlUdX8vh1uXDgb5rbeuOaP7P9l1s=
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.168.140) by
 TYXPR01MB1582.jpnprd01.prod.outlook.com (52.133.166.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Wed, 23 Jan 2019 12:18:45 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::b5fe:6253:600a:4540]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::b5fe:6253:600a:4540%3]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 12:18:45 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Simon Horman <horms@verge.net.au>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN
 nodes
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to
 CAN nodes
Thread-Index: AQHUrnSRbgSqJocxwEKqLlOaQWLbRqW08aSAgAez2ICAAB3YAIAABKtQgAADo4CAAAIKsA==
Date:   Wed, 23 Jan 2019 12:18:45 +0000
Message-ID: <TYXPR01MB1775B75CED683E38B9171EA8C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190118121353.3mb44a7rmmp2ru5d@verge.net.au>
 <20190123095122.l3engeuwx6qr5lzc@verge.net.au>
 <20190123113812.e3nojtxjxywmg4gn@verge.net.au>
 <TYXPR01MB1775ABDCFD939F91F1053534C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <CAMuHMdVkFJ7Cy-+tNHsOcYaxDj82WjMynuFuPRXa4k=DH2fGCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVkFJ7Cy-+tNHsOcYaxDj82WjMynuFuPRXa4k=DH2fGCQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1582;20:5VU1Wt0oes/e1aSxPSlLWyNBXDbKcO6zeBKX4oIjv9jJ6LjfLZHi4KuyWaV4WaisjazXJ6o8OrFYioSVnlFPNQCwPtJeVuy+Vby4qi+rMIiGhwz+69l7hGBu47UvkwOMhGTGnIm0nMrH7YPDsmtIRaiSmiPTsRjZXj8wocV4cAQ=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 2eac52aa-1ba1-4dff-91dd-08d6812cebd6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1582;
x-ms-traffictypediagnostic: TYXPR01MB1582:
x-microsoft-antispam-prvs: <TYXPR01MB158211FD547F6A1988DD6D20C0990@TYXPR01MB1582.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(39840400004)(346002)(396003)(189003)(199004)(2906002)(71190400001)(71200400001)(6436002)(39060400002)(14454004)(305945005)(55016002)(25786009)(102836004)(4326008)(478600001)(7416002)(7736002)(81156014)(81166006)(8936002)(68736007)(33656002)(256004)(8676002)(66066001)(6916009)(105586002)(106356001)(93886005)(3846002)(74316002)(6116002)(99286004)(229853002)(345774005)(54906003)(86362001)(446003)(11346002)(186003)(476003)(6506007)(53546011)(6246003)(486006)(44832011)(26005)(316002)(97736004)(7696005)(76176011)(9686003)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1582;H:TYXPR01MB1775.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cb78DU13adTPicp3M9cXKRtqdGbIRedoElw1mD4XRh7cXbUsqhQuQmw0xa/V2cdZ+2mzqNhhuJymSkelUxf1oDtiDNzhvGbwsxgj0hdznjW+0U2JYEbSFVhj6idW9FHIEow1IPav3It2PypWWOpnjodjirqvda7QG31j+TTXAQj9UY6io1B4odkT5TgM8Ci48K8gddbeYueqPxcTiOcHQBVxtaNF0maOqehDlOx5lwplRT5IZd50NDviefjptIOtirLggWuPMN2wHCKG5Nr6k7KrYUC2+M0gZk8CNoQMrORclAyXxoXuQtAVHs8dxS5VLb+WiOsDn0Hb/sve1ZTSMwSY7NWBVGmHApuXfGGQZkEwEUvhNouK0rNtFHwu5z9SHl4ehRLUrvARNucgAvek/z4iOaUhHEN3q54Mo9A9gWU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eac52aa-1ba1-4dff-91dd-08d6812cebd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 12:18:45.0849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1582
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyMyBKYW51
YXJ5IDIwMTkgMTI6MDgNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHI4YTc3NGExOiBBZGQgY2xrcDIgY2xvY2sgdG8gQ0FOIG5vZGVzDQo+DQo+IEhpIEZh
YnJpemlvLA0KPg0KPiBPbiBXZWQsIEphbiAyMywgMjAxOSBhdCAxOjAxIFBNIEZhYnJpemlvIENh
c3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZy
b206IFNpbW9uIEhvcm1hbiA8aG9ybXNAdmVyZ2UubmV0LmF1Pg0KPiA+ID4gU2VudDogMjMgSmFu
dWFyeSAyMDE5IDExOjM4DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gYXJtNjQ6IGR0
czogcmVuZXNhczogcjhhNzc0YTE6IEFkZCBjbGtwMiBjbG9jayB0byBDQU4gbm9kZXMNCj4gPiA+
DQo+ID4gPiBPbiBXZWQsIEphbiAyMywgMjAxOSBhdCAxMDo1MToyM0FNICswMTAwLCBTaW1vbiBI
b3JtYW4gd3JvdGU6DQo+ID4gPiA+IE9uIEZyaSwgSmFuIDE4LCAyMDE5IGF0IDAxOjEzOjUzUE0g
KzAxMDAsIFNpbW9uIEhvcm1hbiB3cm90ZToNCj4gPiA+ID4gPiBPbiBUaHUsIEphbiAxNywgMjAx
OSBhdCAwMjo1NDoxNVBNICswMDAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+ID4gPiA+ID4g
PiBBY2NvcmRpbmcgdG8gdGhlIGxhdGVzdCBpbmZvcm1hdGlvbiwgY2xrcDIgaXMgYXZhaWxhYmxl
IG9uIFJaL0cyLg0KPiA+ID4gPiA+ID4gTW9kaWZ5IENBTjAgYW5kIENBTjEgbm9kZXMgYWNjb3Jk
aW5nbHkuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8g
Q2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiBSZXZp
ZXdlZC1ieTogQ2hyaXMgUGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNvbT4NCj4N
Cj4gPiA+ID4gVGhhbmtzIGFnYWluLCBhcHBsaWVkIGZvciB2NS4xLg0KPiA+ID4NCj4gPiA+IFNv
cnJ5LCBJIHdhcyBhIGxpdHRsZSBoYXN0eSB0aGVyZS4NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNo
IGRlcGVuZHMgb24gdGhlIHByZXNlbmNlIG9mIFI4QTc3NEExX0NMS19DQU5GRCB3aGljaA0KPiA+
ID4gKHJpZ2h0bHkpIGlzIGFkZGVkIGluIGEgZGlmZmVyZW50IHBhdGNoIGluIHRoaXMgc2VyaWVz
IHdoaWNoIGlzIHRvDQo+ID4gPiBnbyB1cHN0cmVhbSB2aWEgYSBkaWZmZXJlbnQgdHJlZS4NCj4g
PiA+DQo+ID4gPiBJIGhhdmUgZHJvcHBlZCB0aGlzIHBhdGNoIGZvciBub3cuIEkgdGhpbmsgdGhl
cmUgYXJlIHR3byBzb2x1dGlvbiB0byB0aGlzDQo+ID4gPiBwcm9ibGVtLg0KPiA+ID4NCj4gPiA+
IDEuIFByb3ZpZGUgYSB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggd2hpY2ggdXNlcyBhIG51bWVyaWMg
aW5kZXggaW5zdGVhZCBvZg0KPiA+ID4gICAgUjhBNzc0QTFfQ0xLX0NBTkZELiBBbmQgdGhlbiwg
b25jZSBSOEE3NzRBMV9DTEtfQ0FORkQgaXMgcHJlc2VudCBpbiBhbg0KPiA+ID4gICAgUkMgcmVs
ZWFzZSBwcm92aWRlIGEgcGF0Y2ggdG8gc3dpdGNoIHRvIHVzaW5nIFI4QTc3NEExX0NMS19DQU5G
RC4NCj4gPiA+DQo+ID4gPiAyLiBEZWZlciB0aGlzIHBhdGNoIHVudGlsIFI4QTc3NEExX0NMS19D
QU5GRCBpcyBwcmVzZW50IGluIGFuIFJDIHJlbGVhc2UuDQo+ID4NCj4gPiBZZWFoLCBteSBwZXJz
b25hbCBwcmVmZXJlbmNlIGlzIHNvbHV0aW9uIDIuDQo+DQo+IE5vdGUgdGhhdCBzb2x1dGlvbiAy
IHdpbGwgcHJvYmFibHkgZGVmZXIgdGhlIERUIHBhdGNoIHRvIHY1LjIuDQoNClllYWgsIG15IHVu
ZGVyc3RhbmRpbmcgaXMgdGhhdCBldmVuIGlmIHdlIGNob3NlIHNvbHV0aW9uIDEgd2Ugd291bGQg
c3RpbGwgbmVlZCB0byBiZQ0Kd2FpdGluZyBmb3IgdjUuMiBmb3IgdGhlIHBhdGNoIHRvIHN3aXRj
aCB0byB1c2luZyBSOEE3NzRBMV9DTEtfQ0FORkQgdG8gYXBwZWFyIGluDQphIHJjLCB0aGVyZWZv
cmUgSSB0aGluayBzb2x1dGlvbiAyIGlzIGZpbmUuDQoNClRoYW5rcywNCkZhYg0KDQo+DQo+IEdy
e29ldGplLGVldGluZ31zLA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPg0K
PiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQN
Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzDQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBM
dGQsIER1a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1z
aGlyZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJl
Z2lzdGVyZWQgTm8uIDA0NTg2NzA5Lg0K
