Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1B2C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 10:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98256214F1
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 10:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="IU6RROBL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98256214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbeKNUxP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 15:53:15 -0500
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:36192
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726823AbeKNUxP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 15:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kd0qX7uW+FFZfkJ3ssRkZEC+KEwxnChPQ7ePSKC6QAE=;
 b=IU6RROBLASiTbK/ZdosOV5v8Oe4ojeLM2C67yhGysgnYvN9rNncs8YXXpHsBL6kTipBg+sjwpf8dIsv7kHOD7lnfetg/Y8psqpdR2EI/KSEBTdhheylUQ6f1Q1lFXY/Q62mdRg/m36dOb/kulct2QCWpGQk6vouMAi3GvaokYvs=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB1863.jpnprd01.prod.outlook.com (52.134.225.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Wed, 14 Nov 2018 10:50:25 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130%2]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 10:50:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Thread-Topic: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for
 R7S9210
Thread-Index: AQHUdsB7Gubstzkg+U+v4TwD1Y24U6VPFiwg
Date:   Wed, 14 Nov 2018 10:50:24 +0000
Message-ID: <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-3-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB1863;20:qIkZe3WcGgz0RftPtSwodSBwztmi9+fVb6tIipSl2j66qM+aLgsKCgeIGnZOPTGJQqjtDZchd88s/CABH1Oqqx2D1znbQWRpXxQmtFPQfjp+/+ryIujn0qUTQd7tRIUSAYZn2aiDWYz05y8l1+UJ5/Mt/vQgR5DRwBnNxaO1AOc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(39860400002)(366004)(396003)(376002)(346002)(136003)(199004)(189003)(105586002)(8936002)(106356001)(71200400001)(71190400001)(25786009)(9686003)(66066001)(4326008)(478600001)(68736007)(6436002)(53936002)(86362001)(2906002)(6246003)(97736004)(81156014)(55016002)(81166006)(107886003)(575784001)(8676002)(33656002)(110136005)(54906003)(7696005)(6506007)(76176011)(345774005)(316002)(5660300001)(14454004)(26005)(102836004)(3846002)(6116002)(446003)(11346002)(186003)(476003)(2900100001)(486006)(229853002)(14444005)(256004)(99286004)(7736002)(305945005)(74316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1863;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 28b842f6-cba5-47d6-70e9-08d64a1efb43
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB1863;
x-ms-traffictypediagnostic: OSBPR01MB1863:
x-microsoft-antispam-prvs: <OSBPR01MB1863DC9814781D803C57FC71D8C30@OSBPR01MB1863.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231410)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB1863;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB1863;
x-forefront-prvs: 085634EFF4
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Kwy7i1uoQDhDpsq+zAdppj8lAPiaQfzXb4qcB7/hoCxjrsISXsxcl7+WZk+AYNxzwqSI6cNYlyHuJ/bFuLisQxmbhw8Yjq9+FHq2vITfJymYXXmulFxm8oZz2mp7d2AOGiE+4LS3ifqHy2yW2wa+lAFh2o2IzYf7g/730cnxbILW/obInYJlPeOJe2bnK7ZQgUI6ZXoJMFwEuXxVYbUedaBfBiPu6YuETkL97tKO1hQJUrpAxbRe0zcXFda145p1KmPDJkEzI/aXXCLX4yJgW2g4e46AVC18vY4oKe7HZxdXnk43frZmVQ+sD94RDbz9pX0UL9Etp0QP9KkgA4lM9N6aVoJRChCJ4F8eZiukNXI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b842f6-cba5-47d6-70e9-08d64a1efb43
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 10:50:24.2437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1863
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris-san,

Thank you for the patch!

> From: Chris Brandt, Sent: Thursday, November 8, 2018 2:36 AM
>=20
> The RZ/A2 has the same USB2 host controller as R-Car Gen3 with only some
> minor differences.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/phy/renesas/Kconfig              |  2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index e340a925bbb1..beebeba31e84 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE
>  config PHY_RCAR_GEN3_USB2
>  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>  	depends on ARCH_RENESAS
> -	depends on EXTCON
> +	depends on EXTCON || ARCH_R7S9210

Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3Dy?

>  	depends on USB_SUPPORT
>  	select GENERIC_PHY
>  	select USB_COMMON
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index d0f412c25981..96ac75ba40ea 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -34,6 +34,7 @@
>  #define USB2_VBCTRL		0x60c
>  #define USB2_LINECTRL1		0x610
>  #define USB2_ADPCTRL		0x630
> +#define USB2_PHYCLK_CTRL	0x644
>=20
>  /* INT_ENABLE */
>  #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
> @@ -88,6 +89,7 @@ struct rcar_gen3_chan {
>  	bool extcon_host;
>  	bool is_otg_channel;
>  	bool uses_otg_pins;
> +	bool uses_usb_x1;
>  };
>=20
>  /*
> @@ -326,6 +328,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  	struct rcar_gen3_chan *channel =3D phy_get_drvdata(p);
>  	void __iomem *usb2_base =3D channel->base;
>=20
> +	if (channel->uses_usb_x1)
> +		writel(0x00000001, usb2_base + USB2_PHYCLK_CTRL);
> +
>  	/* Initialize USB2 part */
>  	writel(USB2_INT_ENABLE_INIT, usb2_base + USB2_INT_ENABLE);
>  	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
> @@ -334,6 +339,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  	/* Initialize otg part */
>  	if (channel->is_otg_channel)
>  		rcar_gen3_init_otg(channel);
> +	else
> +		/* No otg, so default to host mode */
> +		writel(0x00000000, usb2_base + USB2_COMMCTRL);

This "else" code will run on R-Car H3 USB port1(host only) for instance.
I think adding this code is possible, but I'd like to separate patch from
this adding R7S9210 support. What do you think?

>  	return 0;
>  }
> @@ -406,6 +414,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, vo=
id *_ch)
>  }
>=20
>  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] =3D {
> +	{ .compatible =3D "renesas,usb2-phy-r7s9210" },

According to the PATCH 3/3, R7S9210 will use "renesas,rcar-gen3-usb2-phy".
So, you can remove this line.

>  	{ .compatible =3D "renesas,usb2-phy-r8a7795" },
>  	{ .compatible =3D "renesas,usb2-phy-r8a7796" },
>  	{ .compatible =3D "renesas,usb2-phy-r8a77965" },
> @@ -471,6 +480,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  		}
>  	}
>=20
> +	if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
> +		channel->uses_usb_x1 =3D true;
> +

I'll reply the PATCH 3/3 though, we have to describe the new property into =
the dt-bindings doc.

Best regards,
Yoshihiro Shimoda

>  	/*
>  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>  	 * And then, phy-core will manage runtime pm for this device.
> --
> 2.16.1

