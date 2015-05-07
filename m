Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Thu, 7 May 2015 08:40:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Sangbeom Kim <sbkim73@samsung.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Extend Samsung MFD drivers entry and add
 myself
Message-ID: <20150507074016.GD12484@x1>
References: <1430889576-7779-1-git-send-email-k.kozlowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1430889576-7779-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, 06 May 2015, Krzysztof Kozlowski wrote:

> Extend the entry for Samsung MFD drivers for PMIC devices (Power
> Management Integrated Circuit) with bindings documentation, clock
> (clk-s2mps11.c) and RTC drivers (rtc-s5m.c).
> 
> These PMIC devices are used on many Exynos-based boards like Arndale
> Octa (S2MPS11), Gear 2 (S2MPS14).
> 
> Add myself as a supporter for reviewing them.
> I am not the author of these drivers. However I have recently
> contributed to most of them and I have access to datasheets and hardware.
> 
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> CC: Mike Turquette <mturquette@linaro.org>
> CC: Stephen Boyd <sboyd@codeaurora.org>
> CC: Alessandro Zummo <a.zummo@towertech.it>
> CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> CC: Lee Jones <lee.jones@linaro.org>
> CC: Liam Girdwood <lgirdwood@gmail.com>
> CC: Mark Brown <broonie@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  MAINTAINERS | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

I can't see anyone having an issue with this.

Applied, thanks.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index e278814388f7..fc01dc9f96af 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8533,14 +8533,20 @@ L:	linux-fbdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/video/fbdev/s3c-fb.c
>  
> -SAMSUNG MULTIFUNCTION DEVICE DRIVERS
> +SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
>  M:	Sangbeom Kim <sbkim73@samsung.com>
> +M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
>  L:	linux-kernel@vger.kernel.org
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Supported
>  F:	drivers/mfd/sec*.c
>  F:	drivers/regulator/s2m*.c
>  F:	drivers/regulator/s5m*.c
> +F:	drivers/clk/clk-s2mps11.c
> +F:	drivers/rtc/rtc-s5m.c
>  F:	include/linux/mfd/samsung/
> +F:	Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
> +F:	Documentation/devicetree/bindings/mfd/s2mp*.txt
>  
>  SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
>  M:	Kyungmin Park <kyungmin.park@samsung.com>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
