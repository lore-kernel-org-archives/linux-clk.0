Return-Path: <marc.zyngier@arm.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add mt6797 support
To: Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Erin Lo <erin.lo@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>
References: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
 <1473331794-27542-4-git-send-email-mars.cheng@mediatek.com>
Cc: linux-clk@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang
 <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com
From: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <57D16470.6050100@arm.com>
Date: Thu, 8 Sep 2016 14:15:28 +0100
MIME-Version: 1.0
In-Reply-To: <1473331794-27542-4-git-send-email-mars.cheng@mediatek.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/09/16 11:49, Mars Cheng wrote:
> This adds basic chip support for MT6797 SoC.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |    1 +
>  arch/arm64/boot/dts/mediatek/mt6797-evb.dts |   36 +++++
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi    |  193 +++++++++++++++++++++++++++
>  3 files changed, 230 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 9fbfd32..015eb07 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -1,5 +1,6 @@
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
>  
>  always		:= $(dtb-y)

[...]

> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> new file mode 100644
> index 0000000..66f6442
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -0,0 +1,193 @@

[...]

> +	gic: interrupt-controller@19000000 {
> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		reg = <0 0x19000000 0 0x10000>,    /* GICD */
> +		      <0 0x19200000 0 0x200000>,   /* GICR */
> +		      <0 0x10240000 0 0x2000>;     /* GICC */

Where are the GICV and GICH regions? No ITS?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
