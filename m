Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Add watchdog amd Security SubSystem
 to Exynos5410
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <1464774351-23604-1-git-send-email-k.kozlowski@samsung.com>
 <1464774351-23604-3-git-send-email-k.kozlowski@samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f7e99aad-f773-27c6-d554-ba30bc54b5f7@osg.samsung.com>
Date: Wed, 1 Jun 2016 11:16:58 -0400
MIME-Version: 1.0
In-Reply-To: <1464774351-23604-3-git-send-email-k.kozlowski@samsung.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Krzysztof,

On 06/01/2016 05:45 AM, Krzysztof Kozlowski wrote:
> Move watchdog and Security SubSystem nodes from exynos5420.dtsi to file
> shared with Exynos5410 and configure the clocks on the latter.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

[snip]

>  
> +&sss {
> +	clocks = <&clock CLK_SSS>;
> +	clock-names = "secss";
> +};
> +

[snip]

>  
> +&watchdog {
> +	clocks = <&clock CLK_WDT>;
> +	clock-names = "watchdog";
> +	samsung,syscon-phandle = <&pmu_system_controller>;
> +};
> +

Since you used the same ID than Exynos5420 for the SSS and WDT clocks,
I wonder if the clock and clock-names shouldn't be just defined in the
shared exynos54xx.dtsi as is the case for the interrupts that are also
the same?

The patch looks good to me though, so whatever you decide:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
