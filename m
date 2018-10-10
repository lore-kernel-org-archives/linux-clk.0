Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4835FC43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 14:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03896214FF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 14:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="V1V+i+j6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03896214FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbeJJWWU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 18:22:20 -0400
Received: from relmlor4.renesas.com ([210.160.252.174]:7121 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726791AbeJJWWU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 18:22:20 -0400
Received: from unknown (HELO relmlir4.idc.renesas.com) ([10.200.68.154])
  by relmlie3.idc.renesas.com with ESMTP; 10 Oct 2018 23:59:45 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir4.idc.renesas.com (Postfix) with ESMTP id C8EC186633;
        Wed, 10 Oct 2018 23:59:44 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,364,1534777200"; 
   d="scan'208";a="294779253"
Received: from mail-os2jpn01lp0147.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([23.103.139.147])
  by relmlii2.idc.renesas.com with ESMTP/TLS/AES256-SHA256; 10 Oct 2018 23:59:44 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVoeMYhwGvkDG4pjla4eLkJrQlBcwv0g+jRpVZXEaO4=;
 b=V1V+i+j6MkJWdZ9oomTHq/o63Mt02KKBV3qHvrL8p/gpNF0qiIkX7I1SCPVmk/R+qV0n0ZTkECr454BnLQ4GH8uB/IPQdnfLOfLyt0G8pgmOS70M9xSlSmLdHL8SbMx84QIOKEMtvA2DpCnruu3WM5lo77Wk4TFOFXcn7/YrKvo=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1328.jpnprd01.prod.outlook.com (10.174.227.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1207.25; Wed, 10 Oct 2018 14:59:41 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::1c53:5c22:c972:dfd4]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::1c53:5c22:c972:dfd4%5]) with mapi id 15.20.1207.029; Wed, 10 Oct 2018
 14:59:41 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
Thread-Topic: [PATCH v2 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
Thread-Index: AQHUYJYFOyYEJlAz1Uy2/QTSxgtzcKUYkD0AgAAB9EA=
Date:   Wed, 10 Oct 2018 14:59:40 +0000
Message-ID: <TY1PR01MB1562E1843DBD11A40F0544958AE00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181010123713.67541-1-chris.brandt@renesas.com>
 <20181010123713.67541-3-chris.brandt@renesas.com>
 <fbb500df-239b-4c67-98ed-3aa606c9cc57@cogentembedded.com>
In-Reply-To: <fbb500df-239b-4c67-98ed-3aa606c9cc57@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1328;20:Lo2IhHs09SbE03PCIQQl7cFp2Uf+RS6XU/61qME8VfEYB9u2SmV4lWhTZBO3t1cBnYzKvL0xkAdWlhU9uu9HZBMdsufRJ6IkiLIjrKJzKIgGbJZWXSi1QSfaZlBAbENKhZ+yxdzmZ76vT1l4Uoa//U+rhXvWXOYbWeJYPYTujOU=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 7a12c833-2e92-433a-373d-08d62ec101a2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1328;
x-ms-traffictypediagnostic: TY1PR01MB1328:
x-microsoft-antispam-prvs: <TY1PR01MB132842D1F6F619FB44A9D7928AE00@TY1PR01MB1328.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231355)(944501410)(52105095)(10201501046)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991055);SRVR:TY1PR01MB1328;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1328;
x-forefront-prvs: 08213D42D3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(8676002)(6246003)(81166006)(81156014)(66066001)(5250100002)(68736007)(53936002)(55016002)(9686003)(6346003)(7696005)(6506007)(54906003)(74316002)(102836004)(86362001)(26005)(110136005)(33656002)(76176011)(99286004)(7416002)(7736002)(305945005)(25786009)(97736004)(2900100001)(8936002)(186003)(316002)(4326008)(105586002)(486006)(71200400001)(71190400001)(5660300001)(476003)(446003)(11346002)(229853002)(106356001)(72206003)(6436002)(478600001)(3846002)(2906002)(6116002)(14454004)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1328;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-microsoft-antispam-message-info: 1k0d6Ji/GwIyDaC5OBmbS3SBRZYQEVkSJjEfeoFvvECdVxUm+ZNE73fSRDcxomI+Xg71+UxcgafjFmCgj1yl0HMqknyQC/uWO42bCS9pHO2ROO30wFwaw5aVoCVHYWVaeUvfR1lJW4TywR/igwUBserlOT1DyWWkwGwGcLMOr2B2GzIOafc2F/eh24a3lcRJoCkw2S/6XvH6kWqXCoe1+8MY9Dy0owmFklTqiTOsR/YrAgjpmbVVZOsq1LV9a7zixnhmva7IrE3jj5aVtEqh/d6pd2NYoAI+UKDBTHdPvb4HPC28x2PUjQ4FxbhoxtTGY/HHE2SP3agdaErMxfrmEhC+0B+zuk5VQJ1K3dN2WCI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a12c833-2e92-433a-373d-08d62ec101a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2018 14:59:40.8006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1328
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gV2VkbmVzZGF5LCBPY3RvYmVyIDEwLCAyMDE4IDEsIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToN
Cj4gPiAgY29uZmlnIE1NQ19TREhJX0lOVEVSTkFMX0RNQUMNCj4gPiAgCXRyaXN0YXRlICJETUEg
Zm9yIFNESEkgU0QvU0RJTyBjb250cm9sbGVycyB1c2luZyBvbi1jaGlwIGJ1cw0KPiBtYXN0ZXJp
bmciDQo+ID4gLQlkZXBlbmRzIG9uIEFSTTY0IHx8IENPTVBJTEVfVEVTVA0KPiA+ICsJZGVwZW5k
cyBvbiBBUk02NCB8fCAgQVJDSF9SN1M5MjEwIHx8IENPTVBJTEVfVEVTVA0KPiANCj4gICAgRG91
YmxlIHNwYWNlIGhhcmRseSBuZWVkZWQgaGVyZS4uLg0KDQoNCkdvb2QgZXllIQ0KSSBtaXNzZWQg
dGhhdCBvbmUuDQoNClRoYW5rcywNCkNocmlzDQoNCg==
