Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B30C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 12:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F40A7208E7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 12:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="o3f4j+Rt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F40A7208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbeKNWJN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 17:09:13 -0500
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:20736
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727758AbeKNWJN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 17:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvJpnE8Uat3TJn87cJPh266twGHpDKducrqWUOBSVCk=;
 b=o3f4j+RtNoG47gmUFvEr1dpA7yevzMfptWLt2kWnsfVJpTMgNZGS8HWGgI6/GBxtpJhR8I9V55G4Wwha0/QfZk7HCkEmjH2rHU3e7bUvbAE8KMUhZbmRXlTD/Z589uiMdVBk0DKlTadpQsyU4OPQ9AOwTs5x0jNqs6yRLKrlCJw=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB2504.jpnprd01.prod.outlook.com (52.134.252.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.21; Wed, 14 Nov 2018 12:05:57 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130%2]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 12:05:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Thread-Topic: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Thread-Index: AQHUdsB8A8qnyoFwi0GXtHxvfBiuE6VPJZMAgAAPzcA=
Date:   Wed, 14 Nov 2018 12:05:56 +0000
Message-ID: <OSBPR01MB2293042419890D6EECA0C9A2D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-4-chris.brandt@renesas.com>
 <CAMuHMdX7_bk4b7WTmxDuLPR=-WZYdbt=7P2e-gs4ZOT=-EzL-g@mail.gmail.com>
In-Reply-To: <CAMuHMdX7_bk4b7WTmxDuLPR=-WZYdbt=7P2e-gs4ZOT=-EzL-g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB2504;20:OZfC0Z367ZBaUbqu/ahhrmv19hibV6mRMV45MKuMjp5gXBlTdqtxHWiCzsYrQReVQYGYqoB6VHd4ySJPlHKHgYZahZ810vD/CtezO4KelGuwl/VnMwvQySNbCq7BPtZifilFqDC1yRDVA+cUNgCMhXiYlZiCV4ZFMvx3wD31/QU=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(39860400002)(136003)(366004)(396003)(346002)(376002)(189003)(199004)(6116002)(71200400001)(71190400001)(2900100001)(3846002)(186003)(8676002)(81156014)(81166006)(76176011)(7416002)(68736007)(8936002)(7696005)(6436002)(102836004)(74316002)(99286004)(97736004)(55016002)(105586002)(256004)(305945005)(106356001)(53546011)(6506007)(5660300001)(7736002)(26005)(11346002)(486006)(478600001)(476003)(25786009)(66066001)(446003)(86362001)(6246003)(2906002)(14454004)(316002)(33656002)(6636002)(53936002)(9686003)(110136005)(229853002)(4326008)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2504;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-office365-filtering-correlation-id: 40a7ad6f-8e27-4eb5-64a0-08d64a29888f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2504;
x-ms-traffictypediagnostic: OSBPR01MB2504:
x-microsoft-antispam-prvs: <OSBPR01MB2504E4907BA4A63A2F167D22D8C30@OSBPR01MB2504.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231410)(944501410)(52105112)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB2504;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB2504;
x-forefront-prvs: 085634EFF4
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: UjbgmYeAoq1LZKooukbsuAmutMJwaO8cPxZGo8TuUbF5xwD00N1UVLYjkoeicQ8uxuIieQTZJSWQ7/bnTJyelyRyrLMIVET25Lnd9YrQFsL/jUbAPkuh5Bb6TkwfvKaeM55lASmGYHlbKcStFbvQJcCvmwpnMjeCnf94bIFvgdO6gP12DJY4DEIUYc5j04F/21z87ej90orl9ZU0BaDH+LIE4NlR9czFUeJ/6NRKppbrTCnhE2vSy9c1mZdg9EjOlLVGnrnynhYPVVlzwvFfrxl1aI/hRd9sO3ZyrFwjfof8LydzrU8IgrlBEEc5szJPqnm8lpbNx7SsMdWdrk2hMe7WdNmqCTHYRCNFpBKMzH8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a7ad6f-8e27-4eb5-64a0-08d64a29888f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 12:05:56.2775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2504
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBOb3ZlbWJlciAxNCwgMjAxOCA4OjAzIFBNDQo+IA0KPiBIaSBDaHJpcywNCj4gDQo+IE9u
IFdlZCwgTm92IDcsIDIwMTggYXQgNjozNiBQTSBDaHJpcyBCcmFuZHQgPGNocmlzLmJyYW5kdEBy
ZW5lc2FzLmNvbT4gd3JvdGU6DQo8c25pcD4NCj4gPiBAQCAtMTYsOCArMTgsOCBAQCBSZXF1aXJl
ZCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgICAgUjhBNzc5OTAgU29DLg0KPiA+ICAgICAg
ICAgICAgICAgInJlbmVzYXMsdXNiMi1waHktcjhhNzc5OTUiIGlmIHRoZSBkZXZpY2UgaXMgYSBw
YXJ0IG9mIGFuDQo+ID4gICAgICAgICAgICAgICBSOEE3Nzk5NSBTb0MuDQo+ID4gLSAgICAgICAg
ICAgICAicmVuZXNhcyxyY2FyLWdlbjMtdXNiMi1waHkiIGZvciBhIGdlbmVyaWMgUi1DYXIgR2Vu
MyBvciBSWi9HMg0KPiA+IC0gICAgICAgICAgICAgY29tcGF0aWJsZSBkZXZpY2UuDQo+ID4gKyAg
ICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjMtdXNiMi1waHkiIGZvciBhIGdlbmVyaWMgUi1D
YXIgR2VuMywgUlovRzIgb3INCj4gPiArICAgICAgICAgICAgIFJaL0EyIGNvbXBhdGlibGUgZGV2
aWNlLg0KPiANCj4gSXMgaXQgYSBnb29kIGlkZWEgdG8gZGVjbGFyZSBSWi9BMiBjb21wYXRpYmxl
IHRvIFItQ2FyIEdlbjM/DQo+IFVzdWFsbHkgd2UgZG9uJ3QgZG8gdGhhdCBmb3IgUmVuZXNhcyBJ
UCBjb3JlcyB1c2VkIGluIGRpZmZlcmVudCBmYW1pbGllc1sqXS4NCj4gT2YgY291cnNlLCBJIGtu
b3cgeW91IGRvIGhhdmUgYSBnb29kIHJlbGF0aW9uc2hpcCB3aXRoIHRoZSBhY3R1YWwgUlovQTIN
Cj4gaGFyZHdhcmUgZGVzaWduZXJzIDstKQ0KPiANCj4gSW4gbGlnaHQgb2YgU2hpbW9kYS1zYW4n
cyBjb21tZW50IHcuci50LiBSLUNhciBIMyBVU0IgcG9ydDEgaW4gdGhlIGRyaXZlcg0KPiBjb2Rl
LCBwZXJoYXBzICJyZW5lc2FzLHJjYXItZ2VuMy11c2IyLXBoeSIgc2hvdWxkIG5vdCBiZSB1c2Vk
Pw0KDQpTb3JyeSBmb3IgbGFjayBleHBsYW5hdGlvbi4gDQogLSBUaGUgZGVmYXVsdCB2YWx1ZSBv
ZiBDT01NQ1RSTCBvbiBlYWNoIHBvcnQgb2YgUi1DYXIgR2VuMyBpcyB0aGUgc2FtZSAoMHg4MDAw
MDAwMCkuDQogLSBIb3dldmVyLCBSLUNhciBIMyBVU0IgcG9ydDEgc2VlbXMgdG8gaWdub3JlIHRo
aXMgdmFsdWUgYmVjYXVzZQ0KICAgdGhlIHBvcnQgYWx3YXlzIGFjdHMgYXMgaG9zdC4gSWYgSSBj
aGFuZ2VkIHRoZSByZWdpc3RlciB0byAwIG9uIFItQ2FyIEgzIEVTMy4wLA0KICAgdGhlIHBvcnQx
IGNhbiB3b3JrIGFzIGhvc3QuDQoNClNvLCBJIG1lYW50IGFsbCAicmVuZXNhcyxyY2FyLWdlbjMt
dXNiMi1waHkiIGRldmljZXMgd2l0aG91dCAiaXNfb3RnX2NoYW5uZWwiDQpjYW4gc2V0IHRoZSBD
T01NQ1RSTCByZWdpc3RlciB0byAwLg0KDQpPZiBjb3Vyc2UsIGFkZGluZyBhIG5ldyBSWi9BMiBm
YW1pbHkgY29tcGF0aWJsZSBpcyBPSyB0byBtZS4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJv
IFNoaW1vZGENCg0KPiBbKl0gU29sZSBleGNlcHRpb25zIEknbSBhd2FyZSBvZiBhcmU6DQo+ICAg
ICAgIC0gInJlbmVzYXMscm1vYmlsZS1paWMiLCBpbiBhZGRpdGlvbiB0byAicmVuZXNhcyxyY2Fy
LWdlbjItaWljIiBvcg0KPiAgICAgICAgICJyZW5lc2FzLHJjYXItZ2VuMy1paWMiIG9uIFItQ2Fy
IEdlbjIvMywNCj4gICAgICAgLSAicmVuZXNhcyxyY2FyLWdlbjItY210MSIgYW5kICJyZW5lc2Fz
LHJjYXItdGhlcm1hbCIgb24gUi1Nb2JpbGUgQVBFNi4NCj4gDQo+IEdye29ldGplLGVldGluZ31z
LA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzDQo=
