Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166B2C4151A
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 14:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D98E62086C
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 14:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="v96Go2X6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfBAOCs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 09:02:48 -0500
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:56320
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726428AbfBAOCr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 1 Feb 2019 09:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfRJifqIgy1JuefBq9AHYqfb+pkY/UANfMpT1mRrwvs=;
 b=v96Go2X6+7EJqLHhIZgvkByJ0NVFyvWtIjVNLo6Vop9J/QTKfgWJoaF0zoC6HtWvjUAcAFeDaoiV1NPRChgQuP2h7RvXSvO5hOoqoHZwoxiiDXtSrOZLDqujGxPxPKahF56HOl70uM4UAFdeR5dIyciPyi+sXuOqdkm4RaFcm/k=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB2231.jpnprd01.prod.outlook.com (52.134.242.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.18; Fri, 1 Feb 2019 14:02:40 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852%2]) with mapi id 15.20.1558.026; Fri, 1 Feb 2019
 14:02:40 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/5] clk: renesas: r8a774c0: Add TMU clock
Thread-Topic: [PATCH 3/5] clk: renesas: r8a774c0: Add TMU clock
Thread-Index: AQHUuhchdS9DNtajvU2Fs3aPifuWQ6XK9qsAgAAAv6A=
Date:   Fri, 1 Feb 2019 14:02:40 +0000
Message-ID: <OSBPR01MB21034B18C8F3C490511DF7E9B8920@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com>
 <1549015841-33536-4-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdXDuTTy5Ko2bgSBceN1QZ+uhVTFWFJksyWX4GpMomny8w@mail.gmail.com>
In-Reply-To: <CAMuHMdXDuTTy5Ko2bgSBceN1QZ+uhVTFWFJksyWX4GpMomny8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB2231;20:TuXD8vcBhvNU600vjGSJcs5OhgJVRM13LzRAZPJfiwuLdyiSqxUJHnb3DOu4dhnLD++QJTpk1ar8N90SVSbh+1P7j2UtALggLtJ8X32G4oCeLCmJlh/DPCCSnumYHEOuzk+CgbpTk/KDQ1l94vkv+PJR6K+zlWzqyoDqPb0WEbQ=
x-ms-office365-filtering-correlation-id: f05453b9-618f-4082-479e-08d6884dedd7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2231;
x-ms-traffictypediagnostic: OSBPR01MB2231:
x-microsoft-antispam-prvs: <OSBPR01MB2231952D463C4B49C79A9A80B8920@OSBPR01MB2231.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09352FD734
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(366004)(376002)(39860400002)(199004)(189003)(51914003)(7696005)(26005)(6116002)(107886003)(97736004)(6246003)(3846002)(186003)(66066001)(53936002)(14454004)(74316002)(305945005)(53546011)(316002)(25786009)(4326008)(7736002)(33656002)(106356001)(478600001)(105586002)(76176011)(6506007)(102836004)(8936002)(6916009)(99286004)(476003)(81156014)(229853002)(44832011)(54906003)(6436002)(81166006)(86362001)(256004)(9686003)(14444005)(11346002)(486006)(71190400001)(446003)(68736007)(2906002)(8676002)(71200400001)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2231;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g9c3buWnkI1hYE/4mPTdac7kBaUTIcXAPK2UIwK/vTlij4yPH/bbHTUPBWiAs2sFv9vNWPuLi7HZKuDnGy7tCtU+mANtvQz8vmWdvbj7/N/JapWR1hHKmw5p3FojmcXsfs0Em7tJKutz3JC6ffgqSH2SWZIrsv3D9rv7O4TYszocQhF/V02ct5JGZFRGmgqP33UXTMAnq2QZIF+1QM0I8sK9nAZ68xqpA23LuDvfaKOPIzlBHdfhExMYUriYPAWYXHKWncKOLP2uUiq/M1a+dcpOeZjq486NhwC9E22ZfG3UhtxS3rwB/aV0mY+Cws9mfQAaCyOSVPxf6sqTdc/WOPu1lzg5lAkGDXPmzDdgyQiME2dLFAz8Om//FH98V04EpaobPPPss+BimsI9noJYUZ1cO7BccMUihv3U0/FPJMI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05453b9-618f-4082-479e-08d6884dedd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2019 14:02:40.1796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2231
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQpSZWdhcmRzLA0KQmlqdQ0K
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy81XSBjbGs6IHJlbmVzYXM6IHI4YTc3NGMwOiBBZGQg
VE1VIGNsb2NrDQo+DQo+IEhpIEJpanUsDQo+DQo+IE9uIEZyaSwgRmViIDEsIDIwMTkgYXQgMTE6
MTYgQU0gQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGlz
IHBhdGNoIGFkZHMgVE1VIGNsb2NrIHRvIHRoZSBSOEE3NzRDMCBTb0MuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+DQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4NCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3
NGMwLWNwZy1tc3NyLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3NGMwLWNw
Zy1tc3NyLmMNCj4gPiBAQCAtMTE5LDYgKzExOSwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNw
Z19jb3JlX2Nsaw0KPiA+IHI4YTc3NGMwX2NvcmVfY2xrc1tdIF9faW5pdGNvbnN0ID0geyAgfTsN
Cj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1zc3JfbW9kX2NsayByOGE3NzRjMF9tb2Rf
Y2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ICsgICAgICAgREVGX01PRCgidG11NCIsICAgICAg
ICAgICAgICAgICAgMTIxLCAgIFI4QTc3NEMwX0NMS19TMEQ2KSwNCj4NCj4gUlovRzIgSGFyZHdh
cmUgVXNlcidzIE1hbnVhbCByZXYuIDAuNjEgc2F5cyBTMEQ2Qz8NCj4NClllcyB5b3UgYXJlIGNv
cnJlY3QsIEkgbWlzc2VkICBpdC4NCj4gPiArICAgICAgIERFRl9NT0QoInRtdTMiLCAgICAgICAg
ICAgICAgICAgIDEyMiwgICBSOEE3NzRDMF9DTEtfUzNEMiksDQo+ID4gKyAgICAgICBERUZfTU9E
KCJ0bXUyIiwgICAgICAgICAgICAgICAgICAxMjMsICAgUjhBNzc0QzBfQ0xLX1MzRDIpLA0KPiA+
ICsgICAgICAgREVGX01PRCgidG11MSIsICAgICAgICAgICAgICAgICAgMTI0LCAgIFI4QTc3NEMw
X0NMS19TM0QyKSwNCj4NCj4gUzNEMkM/IChhbGwgdGhyZWUpDQoNClllcyB5b3UgYXJlIGNvcnJl
Y3QuIFdpbGwgc2VuZCB2Mi4NCg0KPiBTaW5jZSB0aGVzZSBhcmUgdGltZXJzLCBpdCBzaG91bGQg
YmUgZWFzeSB0byB2ZXJpZnkgdGhlIGFjdHVhbCBwYXJlbnQgY2xvY2sNCj4gcmF0ZXMuDQoNCldp
bGwgY2hlY2suDQoNCj4gPiArICAgICAgIERFRl9NT0QoInRtdTAiLCAgICAgICAgICAgICAgICAg
IDEyNSwgICBSOEE3NzRDMF9DTEtfQ1ApLA0KPiA+ICAgICAgICAgREVGX01PRCgic2NpZjUiLCAg
ICAgICAgICAgICAgICAgMjAyLCAgIFI4QTc3NEMwX0NMS19TM0Q0QyksDQo+ID4gICAgICAgICBE
RUZfTU9EKCJzY2lmNCIsICAgICAgICAgICAgICAgICAyMDMsICAgUjhBNzc0QzBfQ0xLX1MzRDRD
KSwNCj4gPiAgICAgICAgIERFRl9NT0QoInNjaWYzIiwgICAgICAgICAgICAgICAgIDIwNCwgICBS
OEE3NzRDMF9DTEtfUzNENEMpLA0KDQpSZWdhcmRzLA0KQmlqdQ0KDQoNCg0KUmVuZXNhcyBFbGVj
dHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3csIE1pbGxib2FyZCBSb2FkLCBCb3VybmUg
RW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVLLiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQg
JiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4NjcwOS4NCg==
