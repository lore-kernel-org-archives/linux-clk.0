Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: mediatek: enable MTK_TIMER
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>
References: <1443798319-45744-1-git-send-email-yingjoe.chen@mediatek.com>
 <1443798319-45744-3-git-send-email-yingjoe.chen@mediatek.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>,
 srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org,
 erin.lo@mediatek.com
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <561E5AD9.1000803@gmail.com>
Date: Wed, 14 Oct 2015 15:38:33 +0200
MIME-Version: 1.0
In-Reply-To: <1443798319-45744-3-git-send-email-yingjoe.chen@mediatek.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 02/10/15 17:05, Yingjoe Chen wrote:
> Enable MTK_TIMER for MediaTek plaform, which will be used as
> tick broadcast device and schedule clock.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---

I reapplied this on v4.4-next/soc

>   arch/arm64/Kconfig.platforms | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 23800a1..8176455 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -42,6 +42,7 @@ config ARCH_MEDIATEK
>   	bool "Mediatek MT65xx & MT81xx ARMv8 SoC"
>   	select ARM_GIC
>   	select PINCTRL
> +	select MTK_TIMER
>   	help
>   	  Support for Mediatek MT65xx & MT81xx ARMv8 SoCs
>
>
