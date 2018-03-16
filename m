Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-he1eur01on0042.outbound.protection.outlook.com ([104.47.0.42]:14944
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750826AbeCPGaQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Mar 2018 02:30:16 -0400
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: "sboyd@kernel.org" <sboyd@kernel.org>
CC: Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "jacky.baip@gmail.com" <jacky.baip@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v5 2/4] clk: imx: add new gate/gate2 wrapper funtion
Date: Fri, 16 Mar 2018 06:30:13 +0000
Message-ID: <AM3PR04MB3065CB215B6264649D64C9B80D70@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1520846957-22348-1-git-send-email-ping.bai@nxp.com>
 <1520846957-22348-2-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1520846957-22348-2-git-send-email-ping.bai@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> -----Original Message-----
> From: Jacky Bai
> Sent: Monday, March 12, 2018 5:29 PM
> To: sboyd@kernel.org; robh+dt@kernel.org; shawnguo@kernel.org;
> kernel@pengutronix.de
> Cc: Fabio Estevam <fabio.estevam@nxp.com>; linux-clk@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>;
> A.s. Dong <aisheng.dong@nxp.com>; jacky.baip@gmail.com
> Subject: [PATCH v5 2/4] clk: imx: add new gate/gate2 wrapper funtion
>=20
> Add new gate/gate2 wrapper function to register clocks with optional flag=
s.
>=20
> Signed-off-by: Bai Ping <ping.bai@nxp.com>

AFAIK Stephen requested to switch to clk_hw based APIs when reviewing my
mx7ulp clk driver. We may need some comments from Stephen here.

Hi Stefen,

Do you have any comments about this?

Regards
Dong Aisheng

> ---
>  change from v3->v4:
>  - no
>  change from v4->5:
>  - optimize commit subject
> ---
>  drivers/clk/imx/clk.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h index
> d69c4bb..8076ec0 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -123,6 +123,13 @@ static inline struct clk *imx_clk_gate(const char
> *name, const char *parent,
>  			shift, 0, &imx_ccm_lock);
>  }
>=20
> +static inline struct clk *imx_clk_gate_flags(const char *name, const cha=
r
> *parent,
> +		void __iomem *reg, u8 shift, unsigned long flags) {
> +	return clk_register_gate(NULL, name, parent, flags |
> CLK_SET_RATE_PARENT, reg,
> +			shift, 0, &imx_ccm_lock);
> +}
> +
>  static inline struct clk *imx_clk_gate_dis(const char *name, const char
> *parent,
>  		void __iomem *reg, u8 shift)
>  {
> @@ -137,6 +144,13 @@ static inline struct clk *imx_clk_gate2(const char
> *name, const char *parent,
>  			shift, 0x3, 0, &imx_ccm_lock, NULL);  }
>=20
> +static inline struct clk *imx_clk_gate2_flags(const char *name, const ch=
ar
> *parent,
> +		void __iomem *reg, u8 shift, unsigned long flags) {
> +	return clk_register_gate2(NULL, name, parent, flags |
> CLK_SET_RATE_PARENT, reg,
> +			shift, 0x3, 0, &imx_ccm_lock, NULL); }
> +
>  static inline struct clk *imx_clk_gate2_shared(const char *name,
>  		const char *parent, void __iomem *reg, u8 shift,
>  		unsigned int *share_count)
> --
> 1.9.1

