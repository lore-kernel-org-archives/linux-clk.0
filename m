Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F60C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 11:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12F5B22419
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 11:18:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="NmuIk2V+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F5B22419
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732136AbeKNVUv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 16:20:51 -0500
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:13952
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727598AbeKNVUv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 16:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2TOT2q1AwCWPq3xUd5xucjixlSs+Lfwmab+92W4HSg=;
 b=NmuIk2V+PNGe4oj9cJdcBKdC/IVaus8bBvKUd/7dML7Sh3nR6nPcWMmn+H5ebBuY1SeyNVYU6QZXL/Wpp3+6WdRaa0R/M2X4XigAKoi+klW+SgoTODLI5FdTI++3XSX5vdRUOj0iJ8yF3y+boulBpjRbq1HhnHlKLOP2qjfmbgc=
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com (52.134.230.20) by
 OSAPR01MB3409.jpnprd01.prod.outlook.com (20.178.101.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.27; Wed, 14 Nov 2018 11:17:56 +0000
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d]) by OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d%2]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 11:17:52 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Thread-Topic: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for
 R7S9210
Thread-Index: AQHUdsB7qg8ABCzTikOe1KM5ASkq46VPIjAAgAAFLfA=
Date:   Wed, 14 Nov 2018 11:17:52 +0000
Message-ID: <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSAPR01MB3409;20:ft7wH9TEQbSJTGgEyCSZ+MvJ0tQtCtz6eyxBuC+lPUS2c/YGFnLDh5W2Op414JEO64j+V0XMVO0lEj7vMTaNBaI/juj1ID9naoYneNXGJ+n/ez9CRCTCcj44riayvOHJbu6CKGAuCvImnU+eeIfDuWCqbKJ7cqrmCxzsJ7aD/MM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(366004)(346002)(376002)(136003)(396003)(39860400002)(199004)(189003)(97736004)(99286004)(105586002)(2900100001)(106356001)(33656002)(102836004)(55016002)(6436002)(2906002)(7696005)(9686003)(3846002)(76176011)(256004)(6116002)(54906003)(305945005)(71190400001)(6246003)(71200400001)(6506007)(66066001)(53936002)(4326008)(229853002)(478600001)(72206003)(68736007)(486006)(81166006)(81156014)(8676002)(8936002)(26005)(86362001)(110136005)(14454004)(5660300001)(7736002)(186003)(74316002)(446003)(25786009)(11346002)(316002)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3409;H:OSAPR01MB1553.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 195fc426-08c6-45ed-55f2-08d64a22d1ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSAPR01MB3409;
x-ms-traffictypediagnostic: OSAPR01MB3409:
x-microsoft-antispam-prvs: <OSAPR01MB340963B0F0EBC78C673166808AC30@OSAPR01MB3409.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231410)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:OSAPR01MB3409;BCL:0;PCL:0;RULEID:;SRVR:OSAPR01MB3409;
x-forefront-prvs: 085634EFF4
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: mF3eLrgQLYLtQVLVORJex83H2nOHiyqVvAawYMLQwFCC8vQ7ipT5FXVKy0g57sOpS5vyWh3OJdQULgf+t35u+2K9Wy1BqT/jrf8G4MMgEM+d/YP+cNQhb1K/fv9G0L6K11+QODIGk9k1Z9LVnt1zkaMcv7CJ9VXYRlMh5fH4LpiV6ZYxBbmZowc1QtLv3yzMaLASlRyG/AG9+VOvfZNYrkzQcSLczggZbxDZAD2j/iFk65npUY0t4FIrOdFgEwuC/4JArrbuVxMuCm2u8TnK9y9YCkeyErDnt8u6YWDQMnQE3MEWdoL+nyqYv55xd+LgyTrn7L4I2DX5oSYF2tW0oWvA6UR8tTDQ5vXFB6axmMg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195fc426-08c6-45ed-55f2-08d64a22d1ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 11:17:52.4879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3409
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shimoda-san,

> From: Yoshihiro Shimoda
> Sent: Wednesday, November 14, 2018 5:50 AM
> >  config PHY_RCAR_GEN3_USB2
> >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> >  	depends on ARCH_RENESAS
> > -	depends on EXTCON
> > +	depends on EXTCON || ARCH_R7S9210
>=20
> Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3Dy?

EXTCON is not required for RZ/A2. So, I want to be able to leave EXTCON=20
un-selected (save flash space).


> >  	/* Initialize otg part */
> >  	if (channel->is_otg_channel)
> >  		rcar_gen3_init_otg(channel);
> > +	else
> > +		/* No otg, so default to host mode */
> > +		writel(0x00000000, usb2_base + USB2_COMMCTRL);
>=20
> This "else" code will run on R-Car H3 USB port1(host only) for instance.
> I think adding this code is possible, but I'd like to separate patch from
> this adding R7S9210 support. What do you think?

This code is required for RZ/A2.
The reason is the reset value for COMMCTRL in RZ/A2 is 0x80000000 (Peripher=
al mode).
The reset value in R-Car H3 is 0x00000000 (Host mode).

Without this code, RZ/A2 will not work.


Chris

