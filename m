Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:43123 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750947AbeATDFK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jan 2018 22:05:10 -0500
MIME-Version: 1.0
In-Reply-To: <20180119231735.61504-2-icenowy@aosc.io>
References: <20180119231735.61504-1-icenowy@aosc.io> <20180119231735.61504-2-icenowy@aosc.io>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sat, 20 Jan 2018 14:04:48 +1100
Message-ID: <CAGRGNgU+CZg3TzwzqoGQ1jykGZ1D-=S-DEzE9vU4=1rdVcfgLA@mail.gmail.com>
Subject: Re: [linux-sunxi] [RFC PATCH 1/9] ARM: add CONFIG_ARCH_SUNXI_V7 for
 differentiate ARMv5/v7 Allwinner SoCs
To: icenowy@aosc.io
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        "Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Icenowy,

On Sat, Jan 20, 2018 at 10:17 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
> Allwinner also has some ARMv5 SoCs.
>
> In order to add support for them, add a CONFIG_ARCH_SUNXI_V7 option that
> is selectable when ARMv7 is selceted, and make CONFIG_ARCH_SUNXI a
> common bool config which is selected by both V7 and V5 sunxi option.
>
> The ARMv7 defconfigs are modified to have the new CONFIG_ARCH_SUNXI_V7
> option.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm/configs/multi_v7_defconfig |  2 +-
>  arch/arm/configs/sunxi_defconfig    |  2 +-
>  arch/arm/mach-sunxi/Kconfig         | 14 ++++++++++++--
>  arch/arm/mach-sunxi/Makefile        |  2 +-
>  4 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 58153cdf025b..65509a35935f 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -1,6 +1,16 @@
> -menuconfig ARCH_SUNXI
> +config ARCH_SUNXI
> +       bool
> +       select ARCH_HAS_RESET_CONTROLLER
> +       select CLKSRC_MMIO
> +       select GENERIC_IRQ_CHIP
> +       select GPIOLIB
> +       select PINCTRL
> +       select RESET_CONTROLLER
> +
> +menuconfig ARCH_SUNXI_V7
>         bool "Allwinner SoCs"
>         depends on ARCH_MULTI_V7
> +       select ARCH_SUNXI
>         select ARCH_HAS_RESET_CONTROLLER
>         select CLKSRC_MMIO
>         select GENERIC_IRQ_CHIP

Shouldn't you remove all the common ARCH_SUNXI selects from ARCH_SUNXI_v7?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
