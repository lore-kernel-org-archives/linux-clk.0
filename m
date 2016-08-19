Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Aug 2016 17:16:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Erin Lo <erin.lo@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Hauer <kernel@pengutronix.de>,
	Daniel Kurtz <djkurtz@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>,
	Shunli Wang <shunli.wang@mediatek.com>
Subject: Re: [PATCH v10 2/9] clk: mediatek: Refine the makefile to support
 multiple clock drivers
Message-ID: <20160819001624.GQ361@codeaurora.org>
References: <1471332629-15722-1-git-send-email-erin.lo@mediatek.com>
 <1471332629-15722-3-git-send-email-erin.lo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471332629-15722-3-git-send-email-erin.lo@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/16, Erin Lo wrote:
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> new file mode 100644
> index 0000000..dc224e6
> --- /dev/null
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -0,0 +1,23 @@
> +#
> +# MediaTek SoC drivers
> +#
> +config COMMON_CLK_MEDIATEK
> +	bool
> +	---help---
> +	  Mediatek SoCs' clock support.
> +
> +config COMMON_CLK_MT8135
> +	bool "Clock driver for Mediatek MT8135"
> +	depends on COMMON_CLK

This still has depends on COMMON_CLK. Were review comments
missed?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
