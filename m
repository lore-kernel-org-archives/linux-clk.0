Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752148AbeBXDMr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Feb 2018 22:12:47 -0500
Date: Sat, 24 Feb 2018 11:12:33 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Bai Ping <ping.bai@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: sboyd@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de,
        aisheng.dong@nxp.com, linux-imx@nxp.com, jacky.baip@gmail.com,
        fabio.estevam@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] driver: clk: imx: add new gate/gate2 wrapper
 funtion
Message-ID: <20180224031232.GW3217@dragon>
References: <1517968819-12869-1-git-send-email-ping.bai@nxp.com>
 <1517968819-12869-2-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1517968819-12869-2-git-send-email-ping.bai@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

+ Lucas

On Wed, Feb 07, 2018 at 10:00:17AM +0800, Bai Ping wrote:
> Add new gate/gate2 wrapper function to register clocks with optional flags.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  drivers/clk/imx/clk.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index d69c4bb..8076ec0 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -123,6 +123,13 @@ static inline struct clk *imx_clk_gate(const char *name, const char *parent,
>  			shift, 0, &imx_ccm_lock);
>  }
>  
> +static inline struct clk *imx_clk_gate_flags(const char *name, const char *parent,
> +		void __iomem *reg, u8 shift, unsigned long flags)
> +{
> +	return clk_register_gate(NULL, name, parent, flags | CLK_SET_RATE_PARENT, reg,
> +			shift, 0, &imx_ccm_lock);
> +}
> +
>  static inline struct clk *imx_clk_gate_dis(const char *name, const char *parent,
>  		void __iomem *reg, u8 shift)
>  {
> @@ -137,6 +144,13 @@ static inline struct clk *imx_clk_gate2(const char *name, const char *parent,
>  			shift, 0x3, 0, &imx_ccm_lock, NULL);
>  }
>  
> +static inline struct clk *imx_clk_gate2_flags(const char *name, const char *parent,
> +		void __iomem *reg, u8 shift, unsigned long flags)
> +{
> +	return clk_register_gate2(NULL, name, parent, flags | CLK_SET_RATE_PARENT, reg,
> +			shift, 0x3, 0, &imx_ccm_lock, NULL);
> +}
> +

Lucas' patch 'clk: imx: add clock driver for i.MX8MQ CCM' [1] adds an
imx_clk_gate2_flags() as well, but with different implementation.  Can
you guys talk to each other to sort it out?

Shawn

[1] https://patchwork.kernel.org/patch/10195759/

>  static inline struct clk *imx_clk_gate2_shared(const char *name,
>  		const char *parent, void __iomem *reg, u8 shift,
>  		unsigned int *share_count)
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
