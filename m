Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-eopbgr40047.outbound.protection.outlook.com ([40.107.4.47]:4896
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755343AbeCSHqX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Mar 2018 03:46:23 -0400
From: Jacky Bai <ping.bai@nxp.com>
To: "A.s. Dong" <aisheng.dong@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC: Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "jacky.baip@gmail.com" <jacky.baip@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH v5 2/4] clk: imx: add new gate/gate2 wrapper funtion
Date: Mon, 19 Mar 2018 07:46:17 +0000
Message-ID: <HE1PR04MB311383FB9988727A63ED3A3587D40@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <1520846957-22348-1-git-send-email-ping.bai@nxp.com>
 <1520846957-22348-2-git-send-email-ping.bai@nxp.com>
 <AM3PR04MB3065CB215B6264649D64C9B80D70@AM3PR04MB306.eurprd04.prod.outlook.com>
In-Reply-To: <AM3PR04MB3065CB215B6264649D64C9B80D70@AM3PR04MB306.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> > Subject: [PATCH v5 2/4] clk: imx: add new gate/gate2 wrapper funtion
> >
> > Add new gate/gate2 wrapper function to register clocks with optional fl=
ags.
> >
> > Signed-off-by: Bai Ping <ping.bai@nxp.com>
>=20
> AFAIK Stephen requested to switch to clk_hw based APIs when reviewing my
> mx7ulp clk driver. We may need some comments from Stephen here.
>=20
> Hi Stefen,
>=20
> Do you have any comments about this?
>=20

I think we need to just keep it as we did on other imx6 platform.=20
In the clk driver, we need to do 'clk_set_rate/clk_set_parent' for clks tha=
t need
special init sequence('assigned-clocks' in dts is not applicable for such f=
low) .
If the we register with clk_hw_xxx API, it seems not easy to handle such th=
ings.

Additionally, if we switch to clk_hw based driver for imx6sll, all the old =
imx6 platform
need to be changed accordingly. Too many efforts.

Jacky

> Regards
> Dong Aisheng
>=20
> > ---
> >  change from v3->v4:
> >  - no
> >  change from v4->5:
> >  - optimize commit subject
> > ---
> >  drivers/clk/imx/clk.h | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h index
> > d69c4bb..8076ec0 100644
> > --- a/drivers/clk/imx/clk.h
> > +++ b/drivers/clk/imx/clk.h
> > @@ -123,6 +123,13 @@ static inline struct clk *imx_clk_gate(const char
> > *name, const char *parent,
> >  			shift, 0, &imx_ccm_lock);
> >  }
> >
> > +static inline struct clk *imx_clk_gate_flags(const char *name, const
> > +char
> > *parent,
> > +		void __iomem *reg, u8 shift, unsigned long flags) {
> > +	return clk_register_gate(NULL, name, parent, flags |
> > CLK_SET_RATE_PARENT, reg,
> > +			shift, 0, &imx_ccm_lock);
> > +}
> > +
> >  static inline struct clk *imx_clk_gate_dis(const char *name, const
> > char *parent,
> >  		void __iomem *reg, u8 shift)
> >  {
> > @@ -137,6 +144,13 @@ static inline struct clk *imx_clk_gate2(const
> > char *name, const char *parent,
> >  			shift, 0x3, 0, &imx_ccm_lock, NULL);  }
> >
> > +static inline struct clk *imx_clk_gate2_flags(const char *name, const
> > +char
> > *parent,
> > +		void __iomem *reg, u8 shift, unsigned long flags) {
> > +	return clk_register_gate2(NULL, name, parent, flags |
> > CLK_SET_RATE_PARENT, reg,
> > +			shift, 0x3, 0, &imx_ccm_lock, NULL); }
> > +
> >  static inline struct clk *imx_clk_gate2_shared(const char *name,
> >  		const char *parent, void __iomem *reg, u8 shift,
> >  		unsigned int *share_count)
> > --
> > 1.9.1

