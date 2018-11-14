Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6E2C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 11:29:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46DA22243E
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 11:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="PS5WBY5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46DA22243E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbeKNVcJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 16:32:09 -0500
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:16672
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727598AbeKNVcJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 16:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQb0TDflO8WI9G02wh4l7bthV90lc74wBB4sGlhVrdo=;
 b=PS5WBY5JaumDmcv9IC4VD5WJbyywjoDDnSYip9I37N1TwIlJ3VX25s2Ddfl4zf41vSpar2fs/oqZ7ELsXHxN9O94mvU/9lqFIRPrXH7b8nYtfckNm8CHVk/yCkxkAFjkQy4NWdIamrtUShUcoYc2gjIotYz5Ln8GWD4EROU5aPU=
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com (52.134.230.20) by
 OSAPR01MB1475.jpnprd01.prod.outlook.com (52.134.229.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.21; Wed, 14 Nov 2018 11:29:13 +0000
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d]) by OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d%2]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 11:29:12 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Thread-Topic: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Thread-Index: AQHUdsB8Gg9e2S+tzkm3Ee2mYi39PaVPJZMAgAAGBjA=
Date:   Wed, 14 Nov 2018 11:29:12 +0000
Message-ID: <OSAPR01MB155309C400BF3C256635DD168AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-4-chris.brandt@renesas.com>
 <CAMuHMdX7_bk4b7WTmxDuLPR=-WZYdbt=7P2e-gs4ZOT=-EzL-g@mail.gmail.com>
In-Reply-To: <CAMuHMdX7_bk4b7WTmxDuLPR=-WZYdbt=7P2e-gs4ZOT=-EzL-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSAPR01MB1475;20:Fi5I2WGe3SlQ6Xgqud3N2gWczW/nrzaiDHyjKOXwcKJfqOhVGc7Q/aqufKj1sne9JTgCz5QwbBE4rMQX72/TIYWzEqgckkP6cWNoUXZFQQKBl1pzs2ThroIfu8Qcuw1zE0dPGjz0RHtAbbddcsOhxaaVQEiap6JsjZK5dYDrmmc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(346002)(396003)(39860400002)(376002)(366004)(136003)(189003)(199004)(86362001)(486006)(74316002)(14444005)(305945005)(8676002)(186003)(6916009)(7736002)(97736004)(256004)(102836004)(54906003)(316002)(105586002)(55016002)(25786009)(476003)(81166006)(81156014)(106356001)(11346002)(66066001)(2900100001)(446003)(9686003)(26005)(229853002)(6506007)(4326008)(2906002)(53936002)(76176011)(6436002)(8936002)(6246003)(72206003)(478600001)(33656002)(7696005)(99286004)(71200400001)(68736007)(7416002)(5660300001)(14454004)(71190400001)(3846002)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB1475;H:OSAPR01MB1553.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-office365-filtering-correlation-id: 99fe3c8d-84e6-4fb2-abfc-08d64a2466ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSAPR01MB1475;
x-ms-traffictypediagnostic: OSAPR01MB1475:
x-microsoft-antispam-prvs: <OSAPR01MB147557C83CE207C8AFC9C2928AC30@OSAPR01MB1475.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(944501410)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:OSAPR01MB1475;BCL:0;PCL:0;RULEID:;SRVR:OSAPR01MB1475;
x-forefront-prvs: 085634EFF4
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: LBSt18AxF+Wjapdv5nbwmEoCT21d3rbB7McyZz1UqGp9Uq6qmDITPSIPF0LYQZY+Rv46Ov3Qdmtq8LvA0M+voNTOxRkGfyPiiAlP2b3neBKAXHsw0zzJJNHLhufsdiCcR1YPt2UJo2atVeTfXIu2LFNaSomkqolaXpt14mdEkPbZfApCyCqx70RPyIsKjTO8+F35CFCyUu3SHLZV3gLjWNNRsXculWOW5CjxgW8pRnxWCX+/9/vcEH3TdP3ngshAmoNcfz2ldXV7IjRmVC6K07nP0NPoZQv56+qpuOSwqUoY1L+uZJr22eb0u+GaKttPvNigiKtKwsd4ugzHr+0BJfsPFTR6NDMrjeEO3nBylHQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fe3c8d-84e6-4fb2-abfc-08d64a2466ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 11:29:12.3786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1475
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZG5lc2RheSwgTm92ZW1iZXIgMTQsIDIwMTgsIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToNCj4gPiAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAtLSBjb21wYXRp
YmxlOiAicmVuZXNhcyx1c2IyLXBoeS1yOGE3NzRhMSIgaWYgdGhlIGRldmljZSBpcyBhIHBhcnQg
b2YgYW4NCj4gUjhBNzc0QTENCj4gPiArLSBjb21wYXRpYmxlOiAicmVuZXNhcyx1c2IyLXBoeS1y
N3M5MjEwIiBpZiB0aGUgZGV2aWNlIGlzIGEgcGFydCBvZiBhbg0KPiBSN1M5MjEwDQo+ID4gKyAg
ICAgICAgICAgICBTb0MuDQo+ID4gKyAgICAgICAgICAgICAicmVuZXNhcyx1c2IyLXBoeS1yOGE3
NzRhMSIgaWYgdGhlIGRldmljZSBpcyBhIHBhcnQgb2YgYW4NCj4gUjhBNzc0QTENCj4gPiAgICAg
ICAgICAgICAgIFNvQy4NCj4gPiAgICAgICAgICAgICAgICJyZW5lc2FzLHVzYjItcGh5LXI4YTc3
OTUiIGlmIHRoZSBkZXZpY2UgaXMgYSBwYXJ0IG9mIGFuDQo+IFI4QTc3OTUNCj4gPiAgICAgICAg
ICAgICAgIFNvQy4NCj4gPiBAQCAtMTYsOCArMTgsOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
PiA+ICAgICAgICAgICAgICAgUjhBNzc5OTAgU29DLg0KPiA+ICAgICAgICAgICAgICAgInJlbmVz
YXMsdXNiMi1waHktcjhhNzc5OTUiIGlmIHRoZSBkZXZpY2UgaXMgYSBwYXJ0IG9mIGFuDQo+ID4g
ICAgICAgICAgICAgICBSOEE3Nzk5NSBTb0MuDQo+ID4gLSAgICAgICAgICAgICAicmVuZXNhcyxy
Y2FyLWdlbjMtdXNiMi1waHkiIGZvciBhIGdlbmVyaWMgUi1DYXIgR2VuMyBvcg0KPiBSWi9HMg0K
PiA+IC0gICAgICAgICAgICAgY29tcGF0aWJsZSBkZXZpY2UuDQo+ID4gKyAgICAgICAgICAgICAi
cmVuZXNhcyxyY2FyLWdlbjMtdXNiMi1waHkiIGZvciBhIGdlbmVyaWMgUi1DYXIgR2VuMywNCj4g
UlovRzIgb3INCj4gPiArICAgICAgICAgICAgIFJaL0EyIGNvbXBhdGlibGUgZGV2aWNlLg0KPiAN
Cj4gSXMgaXQgYSBnb29kIGlkZWEgdG8gZGVjbGFyZSBSWi9BMiBjb21wYXRpYmxlIHRvIFItQ2Fy
IEdlbjM/DQo+IFVzdWFsbHkgd2UgZG9uJ3QgZG8gdGhhdCBmb3IgUmVuZXNhcyBJUCBjb3JlcyB1
c2VkIGluIGRpZmZlcmVudA0KPiBmYW1pbGllc1sqXS4NCj4gT2YgY291cnNlLCBJIGtub3cgeW91
IGRvIGhhdmUgYSBnb29kIHJlbGF0aW9uc2hpcCB3aXRoIHRoZSBhY3R1YWwgUlovQTINCj4gaGFy
ZHdhcmUgZGVzaWduZXJzIDstKQ0KPiANCj4gSW4gbGlnaHQgb2YgU2hpbW9kYS1zYW4ncyBjb21t
ZW50IHcuci50LiBSLUNhciBIMyBVU0IgcG9ydDEgaW4gdGhlIGRyaXZlcg0KPiBjb2RlLCBwZXJo
YXBzICJyZW5lc2FzLHJjYXItZ2VuMy11c2IyLXBoeSIgc2hvdWxkIG5vdCBiZSB1c2VkPw0KDQpX
ZWxsLCBJIHRoaW5rIHRoZSBJUCBibG9jayBzZWVtcyB0aGUgc2FtZS4uLi5ob3dldmVyLi4uDQpJ
IGRpZCBwb2ludCBvdXQgdGhhdCB0aGUgQ09NTUNUUkwgcmVnaXN0ZXIgZGVmYXVsdHMgdG8gYSBk
aWZmZXJlbnQgDQp2YWx1ZS4gTm8gaWRlYSB3aHkgdGhhdCBpcy4gSG9uZXN0bHksIEkgZGlkIG5v
dCBnbyBhbmQgY2hlY2sgYWxsIHRoZSBvdGhlciANCnJlZ2lzdGVycyBiaXRzLiBTbyBJIGd1ZXNz
IEkgd29uZGVyIHdoYXQgImNvbXBhdGlibGUiIHJlYWxseSBtZWFuczoNCg0KIkNvbXBhdGlibGU6
IERpZmZlcmVudCwgYnV0IGNsb3NlIGVub3VnaCB0aGF0IGl0IHdpbGwgd29yayIgPz8/DQoNCkNo
cmlzDQo=
