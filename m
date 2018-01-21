Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Sun, 21 Jan 2018 12:03:19 +0100
From: Rask Ingemann Lambertsen <rask@formelder.dk>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [RFC PATCH 8/9] ARM: dts: suniv: add initial DTSI file for suniv
 and F1C100s
Message-ID: <20180121110319.GD3421@localhost>
References: <20180119231735.61504-1-icenowy@aosc.io>
 <20180119231735.61504-9-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20180119231735.61504-9-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jan 20, 2018 at 07:17:34AM +0800, Icenowy Zheng wrote:
> As we have the support for suniv pin controller and CCU now, add a
> initial DTSI for it.
> 
> F1C100s is one product with the suniv die, which has a 32MiB co-packaged
> DDR1 DRAM chip. As there's nothing special for it, add a dummy DTSI file
> for it.
[...]
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d0381e9caf21..b877e0bf1823 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -972,6 +972,8 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
>  	sun9i-a80-cubieboard4.dtb
> +dtb-$(CONFIG_MACH_SUNIV) += \
> +	suniv-f1c100s-licheepi-nano.dtb
>  dtb-$(CONFIG_ARCH_TANGO) += \
>  	tango4-vantage-1172.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \

The hunk above should go with your patch
"[RFC PATCH 9/9] ARM: suniv: f1c100s: add device tree for Lichee Pi Nano"
instead.

-- 
Rask Ingemann Lambertsen

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
