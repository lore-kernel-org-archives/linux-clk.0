Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6316FC43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 12:34:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 059FB2089D
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 12:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Fq7bCQNk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 059FB2089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbeIZSrH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 14:47:07 -0400
Received: from relmlor4.renesas.com ([210.160.252.174]:52444 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726768AbeIZSrH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 14:47:07 -0400
Received: from unknown (HELO relmlir1.idc.renesas.com) ([10.200.68.151])
  by relmlie3.idc.renesas.com with ESMTP; 26 Sep 2018 21:34:18 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id 9DF057FD93;
        Wed, 26 Sep 2018 21:34:18 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,306,1534777200"; 
   d="scan'208";a="293548087"
Received: from mail-os2jpn01lp0146.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([23.103.139.146])
  by relmlii2.idc.renesas.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2018 21:34:17 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFowcnBXnWJQcuNHC4qjQTapaKYBJ05Uy4gpm4YvZFg=;
 b=Fq7bCQNkL0IhBdyDqier4/U6y42DDVDrVFLMShZRhDfB6TdA5XvJ+f+QrpP5WoD6NWMYBOcH09NMoANH+jUNYOndejmDS0ZsTykBKt1r3SnMusdCWL3LnZ6YJhC56cVZwdsJ5ubgRf26uAGh/qF+9fAKbQjvGsNYkjj4JL0FCX4=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1806.jpnprd01.prod.outlook.com (52.133.168.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Wed, 26 Sep 2018 12:34:16 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::4c54:35d0:3b29:3ec2]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::4c54:35d0:3b29:3ec2%3]) with mapi id 15.20.1164.024; Wed, 26 Sep 2018
 12:34:16 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: RE: [PATCH v2 3/3] clk: renesas: r7s9210: Move table update to
 separate function
Thread-Topic: [PATCH v2 3/3] clk: renesas: r7s9210: Move table update to
 separate function
Thread-Index: AQHUVCasyfVl2MsNikKg4YCNccqZh6UCTeEAgAAzRRA=
Date:   Wed, 26 Sep 2018 12:34:16 +0000
Message-ID:
 <TYXPR01MB1568A4A2196EEFB785E4505C8A150@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20180924164937.36536-1-chris.brandt@renesas.com>
 <20180924164937.36536-4-chris.brandt@renesas.com>
 <CAMuHMdXRWRvxNb12GPDi-agEFhLg3_Cnukm6LwapFdaT8Fpddg@mail.gmail.com>
In-Reply-To: <CAMuHMdXRWRvxNb12GPDi-agEFhLg3_Cnukm6LwapFdaT8Fpddg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1806;20:uZ4fGZTpHXjEJLvynoA4aJZjKC7TGP4hfpEA9UOhIcE6W6AOUqUFrj7+ELClPwIyo/VuPubvCLkcP6RKSloe3oVzQJSpguZS+2x37kab1R+LPp7y2sPJm67aiUE3NHsvsFYQ+XeZAsmcSYXb6fWba9/2/xjHCc+DwdIRQgd37rw=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: bcc635eb-2610-4fdc-2c0c-08d623ac5f97
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1806;
x-ms-traffictypediagnostic: TYXPR01MB1806:
x-microsoft-antispam-prvs: <TYXPR01MB1806F444A7ABFD8370FCE29C8A150@TYXPR01MB1806.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231355)(944501410)(52105095)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(201708071742011)(7699051);SRVR:TYXPR01MB1806;BCL:0;PCL:0;RULEID:;SRVR:TYXPR01MB1806;
x-forefront-prvs: 08076ABC99
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(366004)(376002)(136003)(396003)(189003)(199004)(72206003)(71200400001)(71190400001)(478600001)(14454004)(66066001)(2900100001)(229853002)(316002)(14444005)(256004)(7736002)(34290500001)(74316002)(99286004)(6916009)(7696005)(33656002)(305945005)(106356001)(105586002)(54906003)(5660300001)(76176011)(6506007)(25786009)(2906002)(97736004)(5250100002)(8936002)(81156014)(81166006)(8676002)(486006)(68736007)(86362001)(26005)(102836004)(6116002)(3846002)(446003)(11346002)(476003)(6246003)(53936002)(186003)(4326008)(55016002)(6436002)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1806;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: YksH1IikVzHi1ekiYjbs8ytixT3KDTadVHtHGK0FlgFJFwngFIi42nondR44Q2r9gwDpbUFaXuYZBLSi2zr44XDuezRN0qSVvj/NiHED+9MWz5BjZt6UOQhl+d9qJ2Bau9VOuiQJQQWBgXreqUDfmJE77Sn8FzOKObI8TFRS4ddsr6B5wy8yalOLx0wPZwEiiSkUZHuYewsrxGgbD0JQbK6joH5XvAbWCCr1dJvLeKfo/o5K7NDt8NITYqN3aTnKnm2S7NH2c+blaWnkDDzX55dluRwRHWy/PBN6RKJJmaIH4mQaqQFVyyETHH0cAVlzUzEPe4QOqPVIiMETEOWopKHK2O0tw1/Xq9a9ypVccNs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc635eb-2610-4fdc-2c0c-08d623ac5f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2018 12:34:16.3187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1806
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926123416.Mu2kJbIO3An2HBhsOZJO0qdgetL50nl-_oikoA11qU4@z>

SGkgR2VlcnQsDQoNCk9uIFdlZG5lc2RheSwgU2VwdGVtYmVyIDI2LCAyMDE4LCBHZWVydCBVeXR0
ZXJob2V2ZW4gd3JvdGU6DQo+ID4gKy8qIFRoZSBjbG9jayBkaXZpZGVycyBpbiB0aGUgdGFibGUg
dmFyeSBiYXNlZCBvbiBEVCBhbmQgcmVnaXN0ZXINCj4gc2V0dGluZ3MgKi8NCj4gPiArc3RhdGlj
IHZvaWQgcjdzOTIxMF91cGRhdGVfY2xrX3RhYmxlKHN0cnVjdCBjbGsgKmV4dGFsX2Nsaywgdm9p
ZA0KPiBfX2lvbWVtICpiYXNlKQ0KPiANCj4gQ2FuIGJlIF9faW5pdC4NCj4gDQo+IFJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiBpLmUu
IHdpbGwgcXVldWUgaW4gY2xrLXJlbmVzYXMtZm9yLXY0LjIwLCB3aXRoIHRoZSBhYm92ZSBmaXhl
ZC4NCg0KT0ssIHRoYW5rIHlvdSENCg0KQ2hyaXMNCg0K
