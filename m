Return-Path: <SRS0=4wXd=SL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA124C282DA
	for <linux-clk@archiver.kernel.org>; Tue,  9 Apr 2019 14:04:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D36520883
	for <linux-clk@archiver.kernel.org>; Tue,  9 Apr 2019 14:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z2h6bL8y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbfDIOEU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Apr 2019 10:04:20 -0400
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:48476
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726456AbfDIOET (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Apr 2019 10:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOgHNGOhpJPZZSUimeFG18uDJbZtBDz4jwlrSGW7AGg=;
 b=Z2h6bL8yfm29RbP54gJDsUD98OsRtDZD6PMoMAZnUBqnIzDPKKrp+WWPABa2nYCKHbLIEQkNUZ6npitK+sifcGNwtuRWhOjqrGOQOa1Q0STnyQVkcCMMeZEQ+ssvBLhowKrI9EXbZrg5lqBCxZE092jZEGC3FYUVzvlpZUJXiEE=
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (52.134.31.21) by
 VI1PR04MB4717.eurprd04.prod.outlook.com (20.177.48.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Tue, 9 Apr 2019 14:04:07 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3ce1:a774:786:8593]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3ce1:a774:786:8593%2]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 14:04:07 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/4] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
Thread-Topic: [PATCH 1/4] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
Thread-Index: AQHUyg/ILVDNycVxtkiL1Tyb3hPiwaYeILeAgAEa7/CACfTzMIAK9MYw
Date:   Tue, 9 Apr 2019 14:04:07 +0000
Message-ID: <VI1PR04MB42222B91038C28C7EC2B4D5E802D0@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-2-git-send-email-aisheng.dong@nxp.com>
 <20190326134715.GA4055@bogus>
 <AM0PR04MB42110F1F251243A165DB9EC680580@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <AM0PR04MB42110B130C04C49F8EF68DBE80560@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42110B130C04C49F8EF68DBE80560@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ce43b33-8b05-4ef3-c837-08d6bcf43b7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4717;
x-ms-traffictypediagnostic: VI1PR04MB4717:
x-microsoft-antispam-prvs: <VI1PR04MB4717D0D1EC4E0670302C40AE802D0@VI1PR04MB4717.eurprd04.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(366004)(136003)(346002)(39860400002)(51914003)(189003)(199004)(6246003)(76176011)(8936002)(71200400001)(71190400001)(6916009)(53936002)(478600001)(66066001)(97736004)(81156014)(93886005)(55016002)(9686003)(8676002)(316002)(68736007)(7696005)(54906003)(86362001)(81166006)(6506007)(4326008)(99286004)(25786009)(26005)(14454004)(229853002)(186003)(446003)(33656002)(102836004)(11346002)(6436002)(486006)(52536014)(74316002)(5660300002)(2906002)(106356001)(6116002)(3846002)(105586002)(14444005)(305945005)(7736002)(476003)(256004)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4717;H:VI1PR04MB4222.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oDKOgSZmYJxsBAMaIC45W5u2D9U+hCtAgHnoXLcRPmo/RCMBICPDf9FYZpWApl4Ifo0jtNVln5vRGpdRMhNyUQ7Qlzof7eVEFFzeEy4cTMSQLg0dNfe0dI+4mgQn+35Q1tdzygO/MCQhjayFVqJtOpeo8uvjiIw8wA908bi0B1IWfeBMYWvp2A/+oO5a8dwgiG551LIqNH4piP+h5EJEHiflwTdNOBlinMIU/izZdioSdtscXf8dJm6W9YAQTr+rhi3pvvBNri+9bFI8Ew+9Wkzwu3NFbAwHQfAzESu41OtaEMiFUI+LUaIEBmqwC3uhBcuH16CcsWdPJhFB4ppUeJZu/YZ/WvTYuUlGPt7MseNk1rnptfE7bXSuWY29Z3QD10QeB9HeyxNRzsUso5m+GpPJioeRNmLlkuLXrT48sQQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce43b33-8b05-4ef3-c837-08d6bcf43b7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 14:04:07.4764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4717
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

Could you maybe shed a little light on this?

We're blocking here for the further work.

Regards
Dong Aisheng

> From: Aisheng Dong
> Sent: Tuesday, April 2, 2019 10:47 PM
>=20
> Hi Rob,
>=20
> > From: Aisheng Dong
> > Sent: Wednesday, March 27, 2019 10:35 PM
> > > From: Rob Herring [mailto:robh@kernel.org]
> > > Sent: Tuesday, March 26, 2019 9:47 PM On Thu, Feb 21, 2019 at
> > > 06:03:43PM +0000, Aisheng Dong wrote:
> > > > There's a few limitations on one cell clock binding (#clock-cells
> > > > =3D
> > > > <1>) that we have to define all clock IDs for device tree to refere=
nce.
> > > > This may cause troubles if we want to use common clock IDs for
> > > > multi platforms support when the clock of those platforms are mostl=
y the
> same.
> > > > e.g. Current clock IDs name are defined with SS prefix. However
> > > > the device may reside in different SS across CPUs, that means the
> > > > SS prefix may not valid anymore for a new SoC. Furthermore, the
> > > > device availability of those clocks may also vary a bit.
> > > >
> > > > For such situation, We formerly planned to add all new IDs for
> > > > each SS and dynamically check availability for different SoC in dri=
ver.
> > > > That can be done but that may involve a lot effort and may result
> > > > in more changes and duplicated code in driver, also make device
> > > > tree upstreaming hard which depends on Clock IDs.
> > > >
> > > > To relief this situation, we want to move the clock definition
> > > > into device tree which can fully decouple the dependency of Clock
> > > > ID definition from device tree. And no frequent changes required
> > > > in clock driver
> > > any more.
> > > >
> > > > Then we can use the existence of clock nodes in device tree to
> > > > address the device and clock availability differences across differ=
ent SoCs.
> > > >
> > > > For SCU clocks, only two params required, thus two new property
> created:
> > > > rsrc-id =3D <IMX_SC_R_UART_0>;
> > > > clk-type =3D <IMX_SC_PM_CLK_PER>;
> > > >
> > > > And as we want to support clock set parent function, 'clocks'
> > > > property is also used to pass all the possible input parents.
> > > >
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > > Cc: devicetree@vger.kernel.org
> > > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 29
> > > ++++++++++++++++------
> > > >  include/dt-bindings/firmware/imx/rsrc.h            | 17
> > > +++++++++++++
> > > >  2 files changed, 38 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > > b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > > index 72d481c..2816789 100644
> > > > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > > @@ -78,6 +78,19 @@ Required properties:
> > > >  			  "fsl,imx8qm-clock"
> > > >  			  "fsl,imx8qxp-clock"
> > > >  			followed by "fsl,scu-clk"
> > > > +- #clock-cells:		Should be 0.
> > > > +- rsrc-id:		Resource ID associated with this clock
> > > > +- clk-type:		Type of this clock.
> > > > +			Refer to <include/dt-bindings/firmware/imx/rsrc.h> for
> > > > +			available clock types supported by SCU.
> > >
> > > Can't you just make these 2 values clock cells? I'm all for getting
> > > rid of made up clock numbers.
> > >
> >
> > Thanks for the agreement to remove clock IDs.
> >
> > The 2 values clock cell seems not the best approach for i.MX because
> > it still needs to define all clocks in the driver which is exactly we
> > want to avoid now due to some special HW characteristic:
> > 1. clock resources may be allocated to different SW execution
> > partition by firmware and A core may not have access rights for those
> > clocks not belong to its partition.
> > So we want to describe them in DT according to the partition configurat=
ion.
> >
> > 2. Each clock is associated with a different power domain which is
> > better to be described in device tree. And clock state will be lost
> > and need restore after power cycle of the domain.
> >
> > Based on above requirements, do you think we can do as below?
> >
>=20
> Would you help check if this is okay to you?
>=20
> Regards
> Dong Aisheng
>=20
> > //LSIO SS
> > lsio_scu_clk: lsio-scu-clock-controller {
> >         compatible =3D "fsl,imx8qxp-clock", "fsl,scu-clk";
> >
> >         fspi0_clk: clock-fspi0{
> >                 #clock-cells =3D <0>;
> >                 rsrc-id =3D <IMX_SC_R_FSPI_0>;
> >                 clk-type =3D <IMX_SC_PM_CLK_PER>;
> >                 power-domains =3D <&pd IMX_SC_R_FSPI_0>;
> >         };
> >
> > 		fspi1_clk: clock-fspi1{
> > 			...
> > 		};
> >         ...
> > };
> >
> > /* LPCG clocks */
> > lsio_lpcg_clk: lsio-lpcg-clock-controller {
> >         compatible =3D "fsl,imx8qxp-lpcg";
> >
> >         pwm0_lpcg: clock-controller@5d400000 {
> >                 reg =3D <0x5d400000 0x10000>;
> >                 #clock-cells =3D <1>;
> >                 clocks =3D <&pwm0_clk>, <&pwm0_clk>, <&pwm0_clk>,
> >                          <&lsio_bus_clk>, <&pwm0_clk>;
> >                 bit-offset =3D <0 4 16 20 24>;
> >                 clock-output-names =3D "pwm0_lpcg_ipg_clk",
> >                                      "pwm0_lpcg_ipg_hf_clk",
> >                                      "pwm0_lpcg_ipg_s_clk",
> >                                      "pwm0_lpcg_ipg_slv_clk",
> >                                      "pwm0_lpcg_ipg_mstr_clk";
> >                 power-domains =3D <&pd IMX_SC_R_PWM_0>;
> >                 status =3D "disabled";
> >         };
> >
> > 		pwm1_lpcg: clock-controller@5d410000 {
> > 				...
> > 		}
> >         ...
> > };
> >
> > And for users, it could simply be:
> > usdhc1: mmc@5b010000 {
> >         clocks =3D <&sdhc0_lpcg 1>,
> >                  <&sdhc0_lpcg 0>,
> >                  <&sdhc0_lpcg 2>;
> >         clock-names =3D "ipg", "per", "ahb";
> >         assigned-clocks =3D <&sdhc0_clk>;
> >         assigned-clock-rates =3D <200000000>;
> > 		....
> > };
> >
> > Regards
> > Dong Aisheng
> >
> > > > +- clock-output-names:	Shall be the corresponding names of the outp=
uts.
> > > > +
> > > > +Optional properties:
> > > > +- clocks:		Shall be the input parent clock(s) phandle for the cloc=
k.
> > > > +			For multiplexed clocks, the list order must match the
> hardware
> > > > +			programming order.
> > > > +
> > > > +Legacy Clock binding (DEPRECATED):
> > > >  - #clock-cells:		Should be 1. Contains the Clock ID value.
> > > >  - clocks:		List of clock specifiers, must contain an entry for
> > > >  			each required entry in clock-names @@ -129,6 +142,13
> > @@
> > > lsio_mu1:
> > > > mailbox@5d1c0000 {
> > > >  	#mbox-cells =3D <2>;
> > > >  };
> > > >
> > > > +uart0_clk: uart0-clock-controller {
> > > > +	compatible =3D "fsl,imx8qxp-scu-pd", "fsl,scu-clk";
> > > > +	#clock-cells =3D <0>;
> > > > +	rsrc-id =3D <IMX_SC_R_UART_0>;
> > > > +	clk-type =3D <IMX_SC_PM_CLK_PER>;
> > > > +};
> > > > +
> > > >  firmware {
> > > >  	scu {
> > > >  		compatible =3D "fsl,imx-scu";
> > > > @@ -143,11 +163,6 @@ firmware {
> > > >  			  &lsio_mu1 1 2
> > > >  			  &lsio_mu1 1 3>;
> > > >
> > > > -		clk: clk {
> > > > -			compatible =3D "fsl,imx8qxp-clk", "fsl,scu-clk";
> > > > -			#clock-cells =3D <1>;
> > > > -		};
> > > > -
> > > >  		iomuxc {
> > > >  			compatible =3D "fsl,imx8qxp-iomuxc";
> > > >
> > > > @@ -175,8 +190,6 @@ serial@5a060000 {
> > > >  	...
> > > >  	pinctrl-names =3D "default";
> > > >  	pinctrl-0 =3D <&pinctrl_lpuart0>;
> > > > -	clocks =3D <&clk IMX8QXP_UART0_CLK>,
> > > > -		 <&clk IMX8QXP_UART0_IPG_CLK>;
> > > > -	clock-names =3D "per", "ipg";
> > > > +	clocks =3D <&uart0_clk>;
> > > >  	power-domains =3D <&pd IMX_SC_R_UART_0>;  }; diff --git
> > > > a/include/dt-bindings/firmware/imx/rsrc.h
> > > > b/include/dt-bindings/firmware/imx/rsrc.h
> > > > index 4481f2d..f650fc3 100644
> > > > --- a/include/dt-bindings/firmware/imx/rsrc.h
> > > > +++ b/include/dt-bindings/firmware/imx/rsrc.h
> > > > @@ -556,4 +556,21 @@
> > > >  #define IMX_SC_R_VPU			540
> > > >  #define IMX_SC_R_LAST			541
> > > >
> > > > +/*
> > > > + * Defines for SC PM CLK
> > > > + */
> > > > +#define IMX_SC_PM_CLK_SLV_BUS		0	/* Slave bus clock */
> > > > +#define IMX_SC_PM_CLK_MST_BUS		1	/* Master bus clock */
> > > > +#define IMX_SC_PM_CLK_PER		2	/* Peripheral clock */
> > > > +#define IMX_SC_PM_CLK_PHY		3	/* Phy clock */
> > > > +#define IMX_SC_PM_CLK_MISC		4	/* Misc clock */
> > > > +#define IMX_SC_PM_CLK_MISC0		0	/* Misc 0 clock */
> > > > +#define IMX_SC_PM_CLK_MISC1		1	/* Misc 1 clock */
> > > > +#define IMX_SC_PM_CLK_MISC2		2	/* Misc 2 clock */
> > > > +#define IMX_SC_PM_CLK_MISC3		3	/* Misc 3 clock */
> > > > +#define IMX_SC_PM_CLK_MISC4		4	/* Misc 4 clock */
> > > > +#define IMX_SC_PM_CLK_CPU		2	/* CPU clock */
> > > > +#define IMX_SC_PM_CLK_PLL		4	/* PLL */
> > > > +#define IMX_SC_PM_CLK_BYPASS		4	/* Bypass clock */
> > > > +
> > > >  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> > > > --
> > > > 2.7.4
> > > >
