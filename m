Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:33130 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753094AbbJNNjH (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2015 09:39:07 -0400
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8173: add timer node
To: Yingjoe Chen <yingjoe.chen@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>
References: <1443798319-45744-1-git-send-email-yingjoe.chen@mediatek.com>
 <1443798319-45744-4-git-send-email-yingjoe.chen@mediatek.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Sascha Hauer <kernel@pengutronix.de>,
	Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org,
	erin.lo@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <561E5AF5.5020902@gmail.com>
Date: Wed, 14 Oct 2015 15:39:01 +0200
MIME-Version: 1.0
In-Reply-To: <1443798319-45744-4-git-send-email-yingjoe.chen@mediatek.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 02/10/15 17:05, Yingjoe Chen wrote:
> From: Daniel Kurtz <djkurtz@chromium.org>
>
> Add device node to enable GPT timer.
>
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---

I reapplied this on v4.4-next/arm64


>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index d18ee42..d763803 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -238,6 +238,15 @@
>   			reg = <0 0x10007000 0 0x100>;
>   		};
>
> +		timer: timer@10008000 {
> +			compatible = "mediatek,mt8173-timer",
> +				     "mediatek,mt6577-timer";
> +			reg = <0 0x10008000 0 0x1000>;
> +			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&infracfg CLK_INFRA_CLK_13M>,
> +				 <&topckgen CLK_TOP_RTC_SEL>;
> +		};
> +
>   		pwrap: pwrap@1000d000 {
>   			compatible = "mediatek,mt8173-pwrap";
>   			reg = <0 0x1000d000 0 0x1000>;
>
