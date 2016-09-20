Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Sep 2016 10:36:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: imx31: properly init clocks for machines with DT
Message-ID: <20160920173646.GC8319@codeaurora.org>
References: <1474252939-12579-1-git-send-email-vz@mleia.com>
 <1474252939-12579-3-git-send-email-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474252939-12579-3-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/19, Vladimir Zapolskiy wrote:
> @@ -222,22 +215,31 @@ int __init mx31_clocks_init(unsigned long fref)
>  	return 0;
>  }
>  
> -int __init mx31_clocks_init_dt(void)
> +static void __init mx31_clocks_init_dt(struct device_node *np)

Alternatively we can leave mx31_clocks_init_dt() around as an
exported API, but make it return 0 immediately in the same patch
to the clk driver here. Then after rc1 we can delete the "unused"
function in the clk tree assuming the last caller has been
deleted through arm-soc.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
