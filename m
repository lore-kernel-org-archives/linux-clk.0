Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <56A89457.2050501@rock-chips.com>
Date: Wed, 27 Jan 2016 17:56:39 +0800
From: Xing Zheng <zhengxing@rock-chips.com>
MIME-Version: 1.0
To: Shawn Lin <shawn.lin@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: fix wrong mmc phase shift for rk3228
References: <1453779018-30666-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1453779018-30666-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Shawn,
Reviewed-by: Xing Zheng <zhengxing@rock-chips.com>

Thanks.

On 2016年01月26日 11:30, Shawn Lin wrote:
> mmc sample shift is 0 for rk3228 refer to user manaul.
> So it's broken if we enable mmc tuning for rk3228.
>
> Fixes: 307a2e9ac ("clk: rockchip: add clock controller for rk3228")
> Cc: Xing Zheng<zhengxing@rock-chips.com>
> Cc: Jeffy Chen<jeffy.chen@rock-chips.com>
> Signed-off-by: Shawn Lin<shawn.lin@rock-chips.com>
> ---
>
>   drivers/clk/rockchip/clk-rk3228.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
> index 981a502..97f49aa 100644
> --- a/drivers/clk/rockchip/clk-rk3228.c
> +++ b/drivers/clk/rockchip/clk-rk3228.c
> @@ -605,13 +605,13 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
>
>   	/* PD_MMC */
>   	MMC(SCLK_SDMMC_DRV,    "sdmmc_drv",    "sclk_sdmmc", RK3228_SDMMC_CON0, 1),
> -	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "sclk_sdmmc", RK3228_SDMMC_CON1, 1),
> +	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "sclk_sdmmc", RK3228_SDMMC_CON1, 0),
>
>   	MMC(SCLK_SDIO_DRV,     "sdio_drv",     "sclk_sdio",  RK3228_SDIO_CON0,  1),
> -	MMC(SCLK_SDIO_SAMPLE,  "sdio_sample",  "sclk_sdio",  RK3228_SDIO_CON1,  1),
> +	MMC(SCLK_SDIO_SAMPLE,  "sdio_sample",  "sclk_sdio",  RK3228_SDIO_CON1,  0),
>
>   	MMC(SCLK_EMMC_DRV,     "emmc_drv",     "sclk_emmc",  RK3228_EMMC_CON0,  1),
> -	MMC(SCLK_EMMC_SAMPLE,  "emmc_sample",  "sclk_emmc",  RK3228_EMMC_CON1,  1),
> +	MMC(SCLK_EMMC_SAMPLE,  "emmc_sample",  "sclk_emmc",  RK3228_EMMC_CON1,  0),
>   };
>
>   static const char *const rk3228_critical_clocks[] __initconst = {
