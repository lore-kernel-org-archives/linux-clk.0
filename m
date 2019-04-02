Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3585C4360F
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 14:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E7BB20693
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 14:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WsrDFSQd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729289AbfDBOrM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:47:12 -0400
Received: from mail-eopbgr130077.outbound.protection.outlook.com ([40.107.13.77]:58756
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729265AbfDBOrL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Apr 2019 10:47:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8dbd8jGvsPZfWTaJjn9wuIOmhXYCefMW3K36euDXP8=;
 b=WsrDFSQdHfQsW506UTaX8PwnmoF+EV5o/l4UxispVhEILSoW3ks8PbintJ4xvr+6PIO7G7K8JjPey4O5MsW27O6cHKyugmUqgUY6g5e7RZl3GGOPoPFzpFKhyY6ogyl6r4mOjt7RjVIfenNOmIW7MQWPLiJPRMdz+1kVxK0qNM0=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5715.eurprd04.prod.outlook.com (20.178.118.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.17; Tue, 2 Apr 2019 14:47:02 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::4514:91e2:16b7:ee2b]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::4514:91e2:16b7:ee2b%4]) with mapi id 15.20.1750.014; Tue, 2 Apr 2019
 14:47:02 +0000
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
Thread-Index: AQHUyg/ILVDNycVxtkiL1Tyb3hPiwaYeILeAgAEa7/CACfTzMA==
Date:   Tue, 2 Apr 2019 14:47:02 +0000
Message-ID: <AM0PR04MB42110B130C04C49F8EF68DBE80560@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-2-git-send-email-aisheng.dong@nxp.com>
 <20190326134715.GA4055@bogus>
 <AM0PR04MB42110F1F251243A165DB9EC680580@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42110F1F251243A165DB9EC680580@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dee92f4-dade-43a2-f7df-08d6b77a1153
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM0PR04MB5715;
x-ms-traffictypediagnostic: AM0PR04MB5715:
x-microsoft-antispam-prvs: <AM0PR04MB5715160E6ACA7FD23687D57B80560@AM0PR04MB5715.eurprd04.prod.outlook.com>
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(51914003)(7696005)(86362001)(97736004)(6506007)(44832011)(305945005)(7736002)(14454004)(5660300002)(105586002)(8936002)(8676002)(76176011)(71200400001)(71190400001)(25786009)(478600001)(74316002)(6246003)(106356001)(53936002)(229853002)(33656002)(316002)(81156014)(66066001)(256004)(4326008)(68736007)(54906003)(446003)(55016002)(11346002)(486006)(9686003)(26005)(99286004)(2906002)(102836004)(81166006)(476003)(186003)(52536014)(3846002)(6916009)(6116002)(14444005)(6436002)(93886005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5715;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vXzbO6F8Nl4Ts43v/Eb3QikA7NQiYsLauRAO1BSYqGtNzaHL5mrQCAwcVtLJkhsUPnzcRSkkl/TscnMblbI3fXleQMfotQLerqxunXK5828TaxAGUr3gyhD+LHLUj1nGbnu7UCRQihaQTd5dmwJZ8+mrCyedi3xNVIJYQM/0d7e39YANX+xazikcyyq941P8/d9pZYHerVC3rrsriyejq3AQUJje5COwUlqnWCT5yhU9FNzNk25DoC58W/k48QH/DuqdJiwkWlADNMEEEFHr6MxQ/q+CCXj4IR5KOwO4HGP1HgRDLVhdDZpkg6MrIyAI8CcqdM8Q2zRz1U9x2o9nu+YYVvqeHSfdKsfkJ3+4TwNjUGxTs9SoJTmwWUKUjcf0I5APQQlVJJMTxJFe2Eww2TQe9bhHQTmaZ3eq1/5e2fk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dee92f4-dade-43a2-f7df-08d6b77a1153
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2019 14:47:02.2691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5715
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

> From: Aisheng Dong
> Sent: Wednesday, March 27, 2019 10:35 PM
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Tuesday, March 26, 2019 9:47 PM
> > On Thu, Feb 21, 2019 at 06:03:43PM +0000, Aisheng Dong wrote:
> > > There's a few limitations on one cell clock binding (#clock-cells =3D
> > > <1>) that we have to define all clock IDs for device tree to referenc=
e.
> > > This may cause troubles if we want to use common clock IDs for multi
> > > platforms support when the clock of those platforms are mostly the sa=
me.
> > > e.g. Current clock IDs name are defined with SS prefix. However the
> > > device may reside in different SS across CPUs, that means the SS
> > > prefix may not valid anymore for a new SoC. Furthermore, the device
> > > availability of those clocks may also vary a bit.
> > >
> > > For such situation, We formerly planned to add all new IDs for each
> > > SS and dynamically check availability for different SoC in driver.
> > > That can be done but that may involve a lot effort and may result in
> > > more changes and duplicated code in driver, also make device tree
> > > upstreaming hard which depends on Clock IDs.
> > >
> > > To relief this situation, we want to move the clock definition into
> > > device tree which can fully decouple the dependency of Clock ID
> > > definition from device tree. And no frequent changes required in
> > > clock driver
> > any more.
> > >
> > > Then we can use the existence of clock nodes in device tree to
> > > address the device and clock availability differences across differen=
t SoCs.
> > >
> > > For SCU clocks, only two params required, thus two new property creat=
ed:
> > > rsrc-id =3D <IMX_SC_R_UART_0>;
> > > clk-type =3D <IMX_SC_PM_CLK_PER>;
> > >
> > > And as we want to support clock set parent function, 'clocks'
> > > property is also used to pass all the possible input parents.
> > >
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 29
> > ++++++++++++++++------
> > >  include/dt-bindings/firmware/imx/rsrc.h            | 17
> > +++++++++++++
> > >  2 files changed, 38 insertions(+), 8 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > index 72d481c..2816789 100644
> > > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > @@ -78,6 +78,19 @@ Required properties:
> > >  			  "fsl,imx8qm-clock"
> > >  			  "fsl,imx8qxp-clock"
> > >  			followed by "fsl,scu-clk"
> > > +- #clock-cells:		Should be 0.
> > > +- rsrc-id:		Resource ID associated with this clock
> > > +- clk-type:		Type of this clock.
> > > +			Refer to <include/dt-bindings/firmware/imx/rsrc.h> for
> > > +			available clock types supported by SCU.
> >
> > Can't you just make these 2 values clock cells? I'm all for getting
> > rid of made up clock numbers.
> >
>=20
> Thanks for the agreement to remove clock IDs.
>=20
> The 2 values clock cell seems not the best approach for i.MX because it s=
till
> needs to define all clocks in the driver which is exactly we want to avoi=
d now
> due to some special HW characteristic:
> 1. clock resources may be allocated to different SW execution partition b=
y
> firmware and A core may not have access rights for those clocks not belon=
g to
> its partition.
> So we want to describe them in DT according to the partition configuratio=
n.
>=20
> 2. Each clock is associated with a different power domain which is better=
 to be
> described in device tree. And clock state will be lost and need restore a=
fter
> power cycle of the domain.
>=20
> Based on above requirements, do you think we can do as below?
>=20

Would you help check if this is okay to you?

Regards
Dong Aisheng

> //LSIO SS
> lsio_scu_clk: lsio-scu-clock-controller {
>         compatible =3D "fsl,imx8qxp-clock", "fsl,scu-clk";
>=20
>         fspi0_clk: clock-fspi0{
>                 #clock-cells =3D <0>;
>                 rsrc-id =3D <IMX_SC_R_FSPI_0>;
>                 clk-type =3D <IMX_SC_PM_CLK_PER>;
>                 power-domains =3D <&pd IMX_SC_R_FSPI_0>;
>         };
>=20
> 		fspi1_clk: clock-fspi1{
> 			...
> 		};
>         ...
> };
>=20
> /* LPCG clocks */
> lsio_lpcg_clk: lsio-lpcg-clock-controller {
>         compatible =3D "fsl,imx8qxp-lpcg";
>=20
>         pwm0_lpcg: clock-controller@5d400000 {
>                 reg =3D <0x5d400000 0x10000>;
>                 #clock-cells =3D <1>;
>                 clocks =3D <&pwm0_clk>, <&pwm0_clk>, <&pwm0_clk>,
>                          <&lsio_bus_clk>, <&pwm0_clk>;
>                 bit-offset =3D <0 4 16 20 24>;
>                 clock-output-names =3D "pwm0_lpcg_ipg_clk",
>                                      "pwm0_lpcg_ipg_hf_clk",
>                                      "pwm0_lpcg_ipg_s_clk",
>                                      "pwm0_lpcg_ipg_slv_clk",
>                                      "pwm0_lpcg_ipg_mstr_clk";
>                 power-domains =3D <&pd IMX_SC_R_PWM_0>;
>                 status =3D "disabled";
>         };
>=20
> 		pwm1_lpcg: clock-controller@5d410000 {
> 				...
> 		}
>         ...
> };
>=20
> And for users, it could simply be:
> usdhc1: mmc@5b010000 {
>         clocks =3D <&sdhc0_lpcg 1>,
>                  <&sdhc0_lpcg 0>,
>                  <&sdhc0_lpcg 2>;
>         clock-names =3D "ipg", "per", "ahb";
>         assigned-clocks =3D <&sdhc0_clk>;
>         assigned-clock-rates =3D <200000000>;
> 		....
> };
>=20
> Regards
> Dong Aisheng
>=20
> > > +- clock-output-names:	Shall be the corresponding names of the output=
s.
> > > +
> > > +Optional properties:
> > > +- clocks:		Shall be the input parent clock(s) phandle for the clock.
> > > +			For multiplexed clocks, the list order must match the hardware
> > > +			programming order.
> > > +
> > > +Legacy Clock binding (DEPRECATED):
> > >  - #clock-cells:		Should be 1. Contains the Clock ID value.
> > >  - clocks:		List of clock specifiers, must contain an entry for
> > >  			each required entry in clock-names @@ -129,6 +142,13
> @@
> > lsio_mu1:
> > > mailbox@5d1c0000 {
> > >  	#mbox-cells =3D <2>;
> > >  };
> > >
> > > +uart0_clk: uart0-clock-controller {
> > > +	compatible =3D "fsl,imx8qxp-scu-pd", "fsl,scu-clk";
> > > +	#clock-cells =3D <0>;
> > > +	rsrc-id =3D <IMX_SC_R_UART_0>;
> > > +	clk-type =3D <IMX_SC_PM_CLK_PER>;
> > > +};
> > > +
> > >  firmware {
> > >  	scu {
> > >  		compatible =3D "fsl,imx-scu";
> > > @@ -143,11 +163,6 @@ firmware {
> > >  			  &lsio_mu1 1 2
> > >  			  &lsio_mu1 1 3>;
> > >
> > > -		clk: clk {
> > > -			compatible =3D "fsl,imx8qxp-clk", "fsl,scu-clk";
> > > -			#clock-cells =3D <1>;
> > > -		};
> > > -
> > >  		iomuxc {
> > >  			compatible =3D "fsl,imx8qxp-iomuxc";
> > >
> > > @@ -175,8 +190,6 @@ serial@5a060000 {
> > >  	...
> > >  	pinctrl-names =3D "default";
> > >  	pinctrl-0 =3D <&pinctrl_lpuart0>;
> > > -	clocks =3D <&clk IMX8QXP_UART0_CLK>,
> > > -		 <&clk IMX8QXP_UART0_IPG_CLK>;
> > > -	clock-names =3D "per", "ipg";
> > > +	clocks =3D <&uart0_clk>;
> > >  	power-domains =3D <&pd IMX_SC_R_UART_0>;  }; diff --git
> > > a/include/dt-bindings/firmware/imx/rsrc.h
> > > b/include/dt-bindings/firmware/imx/rsrc.h
> > > index 4481f2d..f650fc3 100644
> > > --- a/include/dt-bindings/firmware/imx/rsrc.h
> > > +++ b/include/dt-bindings/firmware/imx/rsrc.h
> > > @@ -556,4 +556,21 @@
> > >  #define IMX_SC_R_VPU			540
> > >  #define IMX_SC_R_LAST			541
> > >
> > > +/*
> > > + * Defines for SC PM CLK
> > > + */
> > > +#define IMX_SC_PM_CLK_SLV_BUS		0	/* Slave bus clock */
> > > +#define IMX_SC_PM_CLK_MST_BUS		1	/* Master bus clock */
> > > +#define IMX_SC_PM_CLK_PER		2	/* Peripheral clock */
> > > +#define IMX_SC_PM_CLK_PHY		3	/* Phy clock */
> > > +#define IMX_SC_PM_CLK_MISC		4	/* Misc clock */
> > > +#define IMX_SC_PM_CLK_MISC0		0	/* Misc 0 clock */
> > > +#define IMX_SC_PM_CLK_MISC1		1	/* Misc 1 clock */
> > > +#define IMX_SC_PM_CLK_MISC2		2	/* Misc 2 clock */
> > > +#define IMX_SC_PM_CLK_MISC3		3	/* Misc 3 clock */
> > > +#define IMX_SC_PM_CLK_MISC4		4	/* Misc 4 clock */
> > > +#define IMX_SC_PM_CLK_CPU		2	/* CPU clock */
> > > +#define IMX_SC_PM_CLK_PLL		4	/* PLL */
> > > +#define IMX_SC_PM_CLK_BYPASS		4	/* Bypass clock */
> > > +
> > >  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> > > --
> > > 2.7.4
> > >
