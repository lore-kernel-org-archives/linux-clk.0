Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11B0C43610
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 09:20:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFC36223CB
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 09:20:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="CcOTh3NX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFC36223CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732702AbeKOT1G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 14:27:06 -0500
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:27904
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728719AbeKOT1G (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 14:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ56JTgV50yHbIgpLux6HB+aeRCPhpD9iEZYEBoDo4E=;
 b=CcOTh3NXokAT37Te7KJv61wEfbgZVrjTQjAjpNTlZHnjeo/631/Q9Id8e+mXBmH4532sy8ffBh/+HmLBJDED6FH/nqE0qDmsuU/kHTiW/OHQztR+VIta2nKpx4q1xkZDjVN4OpjQ1d4CKphiLQ8nhusGSMZWeeaIu22YeNMMPq0=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB2709.jpnprd01.prod.outlook.com (20.176.240.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.21; Thu, 15 Nov 2018 09:20:00 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130%2]) with mapi id 15.20.1294.045; Thu, 15 Nov 2018
 09:19:59 +0000
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
Thread-Index: AQHUdsB7Gubstzkg+U+v4TwD1Y24U6VPFiwggAATsACAAA2fQIAAD6sAgAFK9AA=
Date:   Thu, 15 Nov 2018 09:19:59 +0000
Message-ID: <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB2709;20:jzX1ExPtDi2BwAmsaRGvj8TfkPFOdX23f1U2ZJLbvvri2uf9EleIof3KNuesrB42DDq7IqUB992T4HC0PS/Bj56r2SSZl8Se3awEkhC8XrVEveUF+aSrI8cxd+apvkoU5tkEMrAxgLd774sQNoHpDywxyAIbSAlxsh/qQLJwto4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(4326008)(316002)(6116002)(3846002)(106356001)(6506007)(8936002)(7696005)(102836004)(486006)(86362001)(54906003)(478600001)(110136005)(105586002)(446003)(66066001)(76176011)(81166006)(476003)(8676002)(5660300001)(93886005)(81156014)(6246003)(26005)(71200400001)(229853002)(71190400001)(6436002)(33656002)(2900100001)(11346002)(14454004)(256004)(14444005)(68736007)(53936002)(9686003)(186003)(7736002)(2906002)(97736004)(99286004)(25786009)(305945005)(74316002)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2709;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 0d7714ed-7a58-41f4-72d8-08d64adb8441
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2709;
x-ms-traffictypediagnostic: OSBPR01MB2709:
x-microsoft-antispam-prvs: <OSBPR01MB27091AAF8BC97CEE92CF8339D8DC0@OSBPR01MB2709.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231415)(944501410)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB2709;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB2709;
x-forefront-prvs: 08572BD77F
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: H4TB4Jd2z3dE+O+KBGsbmxWI2oOxf+wdDBoGqeHDGMpMjKrM3p6+L98infJyfkYpu6JxvJolE7MgRCRnMq9z9XYuk7YdbcOpSPx39YQLZ9qaE/roQAlET9eR7ia/FEuRq/Tijq6Dx8AQkZk7VV7j34kUI/aRvNC3DkTRp20oBd0r6czwqsuTSL+F2it3fr0x6RKUsOeM+LU41xY8WYEnXuvV4cgNvw8yHS35pj5Z3kEghiCfWArvaYapxZLN070eZVOBkwadzwtsMVpRGj/u0e+99ANNj5LD2vLbsdVsb+4MxGlIIaFojqNw/HPZ/v2Fm4uXgIHRLrGdpskcg+kwaeNQzgAYs2cdSjv/jYP4Rp0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7714ed-7a58-41f4-72d8-08d64adb8441
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 09:19:59.5387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2709
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Wednesday, November 14, 2018 10:03 PM
>=20
> Hi Shimoda-san,
>=20
> > From: Yoshihiro Shimoda
> > Sent: Wednesday, November 14, 2018 7:24 AM
> > > > >  config PHY_RCAR_GEN3_USB2
> > > > >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> > > > >  	depends on ARCH_RENESAS
> > > > > -	depends on EXTCON
> > > > > +	depends on EXTCON || ARCH_R7S9210
> > > >
> > > > Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3D=
y?
> > >
> > > EXTCON is not required for RZ/A2. So, I want to be able to leave EXTC=
ON
> > > un-selected (save flash space).
> >
> > I got it.
> > I added the depend on EXTCON, but R-Car Gen3 environment can build
> > EXTCON=3Dn.
> > However, I realized that build error happens if EXTCON=3Dm.
> > So, I think we have to revise this line as following at first:
> >
> >  "depends on EXTCON || !EXTCON # if EXTCON=3Dm, this cannot be built-in=
"
> > like drivers/phy/qualcomm/Kconfig.
>=20
> OK. I will change it.
>=20
>    (should this be a separate patch?)

Yes, this should be a separate patch.

> > > Without this code, RZ/A2 will not work.
> >
> > I'd like to clarify this. Does this mean RZ/A2 will not work as host mo=
de?
>=20
> Correct. If I remove 'else' code, RZ/A2 host mode does not work.
> I just tested again now.
>=20
> Host works:
> 	else
> 		/* No otg, so default to host mode */
> 		writel(0x00000000, usb2_base + USB2_COMMCTRL);
>=20
> Host does NOT work:
> 	//else
> 	//	/* No otg, so default to host mode */
> 	//	writel(0x00000000, usb2_base + USB2_COMMCTRL);

I got it. However, I have a concern how to set the mode to peripheral on RZ=
/A2
if we applied this code. If someone would like to use the USB as peripheral
on his board, this code is not suitable.

So, I have an idea to set the default mode by using "dr_mode" property,
instead of hardcoded. Since the driver already has such a function,
we can reuse rcar_gen3_device_recognition() to set the default value.
To achieve that, we need to modify the following though.
 - Don't enable "is_otg_channel".
 - Don't call rcar_gen3_enable_vbus_ctrl() to avoid ADPCTRL register
   because RZ/A2 doesn't have it.
 - Don't need to call rcar_gen3_set_linectrl to avoid LINECTRL1 register
   because RZ/A2 doesn't seem to need the setting on host mode.

What do you think?

> > (In other words, if we use the port as peripheral with the reset value
> > 0x80000000, does it work?)
>=20
> We have not been able to get USB peripheral working on RZ/A2 yet.
> For peripheral, RZ/A2 has HS-USB.
> After plugging into the PC, HS-USB goes to Suspended state (DVSQ =3D "011=
0").
> It should go to Configured state (DVSQ =3D "0011")

I guess we need to modify ./drivers/usb/renesas_usbhs/rza.c for RZ/A2
because RZ/A2's HS-USB has SYSCFG.CNEN, but doesn't have SYSCFG.UPLLE?

> According to the RZ/A2 Hardware Manual, COMMCTRL should be 0x80000000 whe=
n
> using HS-USB.
>=20
> There are 2 channels of USB on RZ/A2 (host x 2, HS_USB x 2)

I got it. So, I guess someone wants to use 1 host and 1 peripheral :)

Best regards,
Yoshihiro Shimoda

> Chris

