Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2CFC43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 12:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B575C2086A
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 12:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="OJpAZTHJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B575C2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbeKNW1g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 17:27:36 -0500
Received: from mail-eopbgr1410118.outbound.protection.outlook.com ([40.107.141.118]:54880
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727663AbeKNW1g (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 17:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm/Jy3g9ZIsUzZEw1uMRhm24xgOeFutXmXlwYrIUWpI=;
 b=OJpAZTHJ1jcBgoEDsHpvV79EyKKLV7sYPLuCPn3fEW070WKxUyBmh+ShncQ+2CszNjITFlN8MysTG3FsYmc+AyPqVlkEIIYx1XX8AmknSkTXvqYoa1v+qOGMJ/dPlm86z9XffhWAog3ehwo+1HbLBhNuDpmmy4Tlplhsag8m9bc=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB1767.jpnprd01.prod.outlook.com (52.134.227.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Wed, 14 Nov 2018 12:24:27 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130%2]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 12:24:26 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
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
Thread-Index: AQHUdsB7Gubstzkg+U+v4TwD1Y24U6VPFiwggAATsACAAA2fQA==
Date:   Wed, 14 Nov 2018 12:24:25 +0000
Message-ID: <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB1767;20:3WSqR9ynMKChbAiqCaz16DS9+z+/cPcfLrvG5PET/mZRt1lL+jqBnXr/XuHLWUiulWYn3xKyI70ZOswT6pGjeAJg5V1npgmPnrjut3BMoTRfWT8JUx/1E8OLsfeSSlEdZgDrXONI2DvafXg0RlhLcFPPIZFeyKf/rbgVLo82cwk=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(376002)(136003)(346002)(199004)(189003)(76176011)(53936002)(7696005)(74316002)(9686003)(93886005)(6246003)(71200400001)(71190400001)(8936002)(99286004)(256004)(97736004)(6506007)(305945005)(81166006)(81156014)(102836004)(316002)(26005)(446003)(2906002)(68736007)(476003)(11346002)(486006)(7736002)(110136005)(25786009)(54906003)(86362001)(3846002)(6436002)(105586002)(478600001)(5660300001)(66066001)(33656002)(6116002)(106356001)(14454004)(55016002)(2900100001)(186003)(8676002)(229853002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1767;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 26eb226f-6a9a-4876-7925-08d64a2c1e00
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB1767;
x-ms-traffictypediagnostic: OSBPR01MB1767:
x-microsoft-antispam-prvs: <OSBPR01MB17671710EDAF3E93E0D87E79D8C30@OSBPR01MB1767.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231410)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB1767;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB1767;
x-forefront-prvs: 085634EFF4
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: d9jXNJh8F9t531jEQ9pnkOcJ6LWI46XiTsOi8CM6Mn4Q6PptLrdv8559KMtYKUztx30EM5jG3ZfBE8FapipDyrYsGbW3K1079Y8W02pYd8Pi7MyLnkoc6JHDPQ2/tLV/4k/dIcXKhtWTSXmChFMe6Ppn9VOeay4yRdqwyxB7a8fhS5ViV3zls/xOJaij6hX/+MSR/fNdIsl60Ad8uc0vgodIxXXEBMXO4kQ8nXjPYJoRXeEP8rPjVGx3WanxjWG9Mh2V7hEH6v5XBzLKOL+5b8YciViQ4XAooPH3IHIjdYhJSLyQyuQ3ArUIr6ty7f4LfCB8fCd1wj/lBmConfqRgih1+mGBY8LFK2QK5B/xQVk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26eb226f-6a9a-4876-7925-08d64a2c1e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 12:24:25.9235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1767
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Wednesday, November 14, 2018 8:18 PM
>=20
> Hi Shimoda-san,
>=20
> > From: Yoshihiro Shimoda
> > Sent: Wednesday, November 14, 2018 5:50 AM
> > >  config PHY_RCAR_GEN3_USB2
> > >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> > >  	depends on ARCH_RENESAS
> > > -	depends on EXTCON
> > > +	depends on EXTCON || ARCH_R7S9210
> >
> > Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3Dy?
>=20
> EXTCON is not required for RZ/A2. So, I want to be able to leave EXTCON
> un-selected (save flash space).

I got it.
I added the depend on EXTCON, but R-Car Gen3 environment can build EXTCON=
=3Dn.
However, I realized that build error happens if EXTCON=3Dm.
So, I think we have to revise this line as following at first:

 "depends on EXTCON || !EXTCON # if EXTCON=3Dm, this cannot be built-in"
like drivers/phy/qualcomm/Kconfig.

> > >  	/* Initialize otg part */
> > >  	if (channel->is_otg_channel)
> > >  		rcar_gen3_init_otg(channel);
> > > +	else
> > > +		/* No otg, so default to host mode */
> > > +		writel(0x00000000, usb2_base + USB2_COMMCTRL);
> >
> > This "else" code will run on R-Car H3 USB port1(host only) for instance=
.
> > I think adding this code is possible, but I'd like to separate patch fr=
om
> > this adding R7S9210 support. What do you think?
>=20
> This code is required for RZ/A2.
> The reason is the reset value for COMMCTRL in RZ/A2 is 0x80000000 (Periph=
eral mode).

This value is the same as all R-Car Gen3 hardware.
However, host only ports don't seem to use this value...

> The reset value in R-Car H3 is 0x00000000 (Host mode).

No. R-Car H3's reset value is also 0x80000000 (Peripheral mode).
# Note that R-Car H3 can select the mode by HS-USB / UGCTRL2 register thoug=
h...

> Without this code, RZ/A2 will not work.

I'd like to clarify this. Does this mean RZ/A2 will not work as host mode?
(In other words, if we use the port as peripheral with the reset value 0x80=
000000, does it work?)

Best regards,
Yoshihiro Shimoda

>=20
> Chris

