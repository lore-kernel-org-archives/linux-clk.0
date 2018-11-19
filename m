Return-Path: <SRS0=X/us=N6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366C8C43441
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 18:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F19652075B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 18:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="QDm/VFiU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19652075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbeKTFKE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 00:10:04 -0500
Received: from mail-eopbgr1410130.outbound.protection.outlook.com ([40.107.141.130]:1632
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726522AbeKTFKD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Nov 2018 00:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MauGU6h0pAy8lZYh59eQed7WLBJZW3CumPAvziW+F0Y=;
 b=QDm/VFiUp8KuqaceT4zLrQj+QLAqk4NZafKUN2XKxArmXoRO7e+ynvGBxyftH+NU40pfqok0c3QaYZK23IK9SEC0AauYSJyAYOG8Z59AaGXBvgXlDuXwV3DYGSIqZkTopbbwNLOo3UngSJVJMLfphQMEA4aVeF003yGnjVZgDPY=
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com (52.134.230.20) by
 OSAPR01MB2180.jpnprd01.prod.outlook.com (52.134.237.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.24; Mon, 19 Nov 2018 18:45:09 +0000
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d]) by OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d%2]) with mapi id 15.20.1294.045; Mon, 19 Nov 2018
 18:45:06 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Thread-Topic: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for
 R7S9210
Thread-Index: AQHUdsB7qg8ABCzTikOe1KM5ASkq46VPIjAAgAAFLfCAABUXgIAABASAgAFayYCAADKnsIAGEHaAgACgRbA=
Date:   Mon, 19 Nov 2018 18:45:06 +0000
Message-ID: <OSAPR01MB1553577EA2508275D59810808AD80@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB155323BF2746B075DA3E8F7D8ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293302E77DDCC330ABE3927D8D80@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293302E77DDCC330ABE3927D8D80@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSAPR01MB2180;20:98RWT94XZOmPBMFGpYaG3CaUur7gchY+TpdmPL0UNOKl6/a7c8tSXQS+snnhqpcqn/+uBoJtqdZP1JiHMv+OnR4vozXe1XUyGSE3eeQ/vxfF384cgtPp92OuCuJCrsvDDU9GbVme5b1KKEfzM69pTaPxA0bXvSSiSgzQuFfy67U=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(39860400002)(366004)(396003)(136003)(376002)(346002)(189003)(199004)(54094003)(53936002)(14444005)(256004)(14454004)(6246003)(6436002)(4326008)(71200400001)(71190400001)(66066001)(486006)(97736004)(6116002)(11346002)(3846002)(476003)(446003)(86362001)(8936002)(186003)(106356001)(316002)(6506007)(81166006)(102836004)(93886005)(54906003)(81156014)(229853002)(25786009)(2900100001)(26005)(478600001)(74316002)(9686003)(55016002)(68736007)(76176011)(305945005)(72206003)(2906002)(99286004)(110136005)(33656002)(8676002)(5660300001)(7696005)(105586002)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2180;H:OSAPR01MB1553.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-office365-filtering-correlation-id: 5c890e9d-5d24-4bd0-7926-08d64e4f2024
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSAPR01MB2180;
x-ms-traffictypediagnostic: OSAPR01MB2180:
x-microsoft-antispam-prvs: <OSAPR01MB2180D59FA07476C3D3C286EC8AD80@OSAPR01MB2180.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:OSAPR01MB2180;BCL:0;PCL:0;RULEID:;SRVR:OSAPR01MB2180;
x-forefront-prvs: 08617F610C
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: s9avo2u71s5rGcyM9Zoref50rrAXvR47enBs56Pa+I+jnhiIIVku7en7DrqyemHB/F+flBLMMNeLz4LhNbb/Iah/taEJ7WmsbKxRChdqTepMEU8kk085v2KvnMuQr7//AbjjrNDoCffLXkuibEktMw11GQ+wp3s3a8NxkE4PYaEeiINymltwBOy3GAfm9yapZyMZ+QrRmfruqXOttD5PXRexCxRld5cCGzmaSWgIo7EoT1jOvjZW5NUjdWKOK9XqHeYFIRkCVrycE2VwR+8z8AgzFZk3lysGom9QvpIzM9mR9b48VboNKQoW6MAIAeiPI5ZBAjkuOnQ+jlVSGUY+FY7Xa8mj9o7SNpbYe/Ch7Qk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c890e9d-5d24-4bd0-7926-08d64e4f2024
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2018 18:45:06.5856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shimoda=1B$B$5$s=1B(B

From: Yoshihiro Shimoda
Sent: Monday, November 19, 2018 3:58 AM
> And I read Figure 32.1 of the RZ/A2 documentation and I wonder if we need
> to release
> USBCTR.PLL_RST even if we use USB peripheral mode.

I will ask the RZ/A2 design team to confirm.

If this setting is required, I think we should use your suggestion:

From: Yoshihiro Shimoda
Sent: Thursday, November 15, 2018 4:20 AM
> So, I have an idea to set the default mode by using "dr_mode" property,
> instead of hardcoded. Since the driver already has such a function,
> we can reuse rcar_gen3_device_recognition() to set the default value.
> To achieve that, we need to modify the following though.
>  - Don't enable "is_otg_channel".
>  - Don't call rcar_gen3_enable_vbus_ctrl() to avoid ADPCTRL register
>    because RZ/A2 doesn't have it.
>  - Don't need to call rcar_gen3_set_linectrl to avoid LINECTRL1 register
>    because RZ/A2 doesn't seem to need the setting on host mode.


Chris

