Return-Path: <sboyd@codeaurora.org>
Date: Fri, 28 Jul 2017 09:42:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v2 1/5] arm64: qcom: Select PM_GENERIC_DOMAINS
Message-ID: <20170728164259.GD2146@codeaurora.org>
References: <1500526099-9935-1-git-send-email-rnayak@codeaurora.org>
 <1500526099-9935-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1500526099-9935-2-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/20, Rajendra Nayak wrote:
> Enable PM_GENERIC_DOMAINS for 64-bit qualcomm platforms. This is required
> to ensure devices which are dependent on some gdscs (powerdomains) to be
> powered on before they can be probed, work as expected.
> 
> CC: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Maybe Andy can ack this? It's ARCH_QCOM specific anyway.

>  arch/arm64/Kconfig.platforms | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index f5f0c81..e3de82d 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -133,6 +133,8 @@ config ARCH_QCOM
>  	bool "Qualcomm Platforms"
>  	select GPIOLIB
>  	select PINCTRL
> +	select PM
> +	select PM_GENERIC_DOMAINS
>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
>  

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
