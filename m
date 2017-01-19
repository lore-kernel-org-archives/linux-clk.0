Return-Path: <cw00.choi@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Message-id: <5880836E.80006@samsung.com>
Date: Thu, 19 Jan 2017 18:14:22 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Valentin Rothberg <valentinrothberg@gmail.com>, krzk@kernel.org,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@baylibre.com,
 sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Valentin Rothberg <valetinrothberg@gmail.com>
Subject: Re: [PATCH] ARM: Exynos4415: remove dead build rule
In-reply-to: <20170119091153.8439-1-valentinrothberg@gmail.com>
References: 
 <CGME20170119091246epcas2p3b647c978e26c99baaa4cab3d757fd59d@epcas2p3.samsung.com>
 <20170119091153.8439-1-valentinrothberg@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 2017년 01월 19일 18:11, Valentin Rothberg wrote:
> Commit 22dfab102cfa ("ARM: EXYNOS: Remove Exynos4415 arch code (SoC not
> supported anymore)") removed the Kconfig option SOC_EXYNOS4415.  Thus,
> we are safe to remove the last reference in the Makefile.
> 
> Signed-off-by: Valentin Rothberg <valetinrothberg@gmail.com>
> ---
> Detected by using ./scripts/checkkconfigsymbols.py
> 
>  drivers/clk/samsung/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 57f4dc6dc447..7afc21dc374e 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -5,7 +5,6 @@
>  obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
>  obj-$(CONFIG_SOC_EXYNOS3250)	+= clk-exynos3250.o
>  obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4.o
> -obj-$(CONFIG_SOC_EXYNOS4415)	+= clk-exynos4415.o
>  obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5250.o
>  obj-$(CONFIG_SOC_EXYNOS5260)	+= clk-exynos5260.o
>  obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
