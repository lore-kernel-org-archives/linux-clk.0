Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:37732 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750974AbeATDHC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jan 2018 22:07:02 -0500
MIME-Version: 1.0
In-Reply-To: <20180119231735.61504-3-icenowy@aosc.io>
References: <20180119231735.61504-1-icenowy@aosc.io> <20180119231735.61504-3-icenowy@aosc.io>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sat, 20 Jan 2018 14:06:40 +1100
Message-ID: <CAGRGNgUjvvzseAtUuiy5xCaZrLw2Jq4+A_dPXR9r_Xs-yYL1cw@mail.gmail.com>
Subject: Re: [linux-sunxi] [RFC PATCH 2/9] ARM: sunxi: add Allwinner ARMv5 SoCs
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
> Add option for Allwinner ARMv5 SoCs and a SoC suniv (which is a die used
> for many new F-series products, including F1C100A, F1C100s, F1C200s,
> F1C500, F1C600).
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm/mach-sunxi/Kconfig    | 13 +++++++++++++
>  arch/arm/mach-sunxi/Makefile   |  1 +
>  arch/arm/mach-sunxi/sunxi_v5.c | 22 ++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 arch/arm/mach-sunxi/sunxi_v5.c
>
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 65509a35935f..78ac9ce70641 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -59,3 +59,16 @@ config MACH_SUN9I
>         select ARM_GIC
>
>  endif
> +
> +menuconfig ARCH_SUNXI_V5
> +       bool "Allwinner SoCs"

That name seems a little too generic. Maybe "Allwinner ARMv5 SoCs"?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
