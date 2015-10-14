Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Oct 2015 11:38:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Luis de Bethencourt <luisbg@osg.samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Allow drivers to build if COMPILE_TEST is enabled
Message-ID: <20151014183831.GH26883@codeaurora.org>
References: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/13, Javier Martinez Canillas wrote:
> diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
> index 1530c9352a76..fc50b6264bed 100644
> --- a/drivers/clk/versatile/Kconfig
> +++ b/drivers/clk/versatile/Kconfig
> @@ -1,6 +1,6 @@
>  config COMMON_CLK_VERSATILE
>  	bool "Clock driver for ARM Reference designs"
> -	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64
> +	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || COMPILE_TEST

Have you compiled these drivers on an architecture that doesn't
have IOMEM? Perhaps tile or um? I'm all for more build coverage,
but it's not always as simple as just sprinkling some
COMPILE_TEST around the Kconfigs.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
