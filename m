Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from plaes.org ([188.166.43.21]:58531 "EHLO plaes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753870AbcCPRUs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 16 Mar 2016 13:20:48 -0400
Message-ID: <1458148822.4849.1.camel@plaes.org>
Subject: Re: [linux-sunxi] [PATCH v4 13/13] ARM: sunxi: Add Kconfig for
 sunxi clocks
From: Priit Laes <plaes@plaes.org>
To: vishnupatekar0510@gmail.com, robh+dt@kernel.org, corbet@lwn.net,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	maxime.ripard@free-electrons.com, linux@arm.linux.org.uk,
	emilio@elopez.com.ar
Cc: jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	patchesrdh@mveas.com, linux-clk@vger.kernel.org
Date: Wed, 16 Mar 2016 19:20:22 +0200
In-Reply-To: <1458144276-31108-14-git-send-email-vishnupatekar0510@gmail.com>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
	 <1458144276-31108-14-git-send-email-vishnupatekar0510@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2016-03-17 at 00:04 +0800, Vishnu Patekar wrote:
> This patch adds Kconfig for sunxi clocks.
> Currently, only sun8i-apb0 and sun9i-cpus clocks are added.
> It'll help to use common clocks across different SOCs.
> We can switch to kconfig for other clocks in future.
> 
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  drivers/clk/Kconfig        | 1 +
>  drivers/clk/sunxi/Kconfig  | 5 +++++
>  drivers/clk/sunxi/Makefile | 4 ++--
>  3 files changed, 8 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/sunxi/Kconfig
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index eca8e01..f9f42e6 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -210,3 +210,4 @@ source "drivers/clk/mvebu/Kconfig"
>  
>  source "drivers/clk/samsung/Kconfig"
>  source "drivers/clk/tegra/Kconfig"
> +source "drivers/clk/sunxi/Kconfig"

Should be in alphabetic order?

> diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> new file mode 100644
> index 0000000..3e8ede4
> --- /dev/null
> +++ b/drivers/clk/sunxi/Kconfig
> @@ -0,0 +1,5 @@
> +config CLK_SUN8I_APB0
> +	def_bool MACH_SUN9I || MACH_SUN8I
> +
> +config CLK_SUN9I_CPUS
> +	def_bool MACH_SUN9I || MACH_SUN8I
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 3fd7901..38dfca8 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -17,8 +17,8 @@ obj-y += clk-sun9i-core.o
>  obj-y += clk-sun9i-mmc.o
>  obj-y += clk-usb.o
>  
> -obj-$(CONFIG_MACH_SUN9I) += clk-sun8i-apb0.o
> -obj-$(CONFIG_MACH_SUN9I) += clk-sun9i-cpus.o
> +obj-$(CONFIG_CLK_SUN8I_APB0) += clk-sun8i-apb0.o
> +obj-$(CONFIG_CLK_SUN9I_CPUS) += clk-sun9i-cpus.o
>  
>  obj-$(CONFIG_MFD_SUN6I_PRCM) += \
>  	clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
> -- 
> 1.9.1
> 
