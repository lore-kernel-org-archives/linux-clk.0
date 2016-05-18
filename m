Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:42963 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169AbcERH01 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2016 03:26:27 -0400
Subject: Re: [PATCH 1/2] Revert "clk: rockchip: reset init state before mmc
 card initialization"
To: Douglas Anderson <dianders@chromium.org>,
	Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com,
	sboyd@codeaurora.org
References: <1463076197-15900-1-git-send-email-dianders@chromium.org>
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
	zhengxing@rock-chips.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <573C18D8.5050508@rock-chips.com>
Date: Wed, 18 May 2016 15:25:12 +0800
MIME-Version: 1.0
In-Reply-To: <1463076197-15900-1-git-send-email-dianders@chromium.org>
Content-Type: text/plain; charset=gbk; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2016-5-13 2:03, Douglas Anderson wrote:
> This reverts commit 7a03fe6f48f3 ("clk: rockchip: reset init state
> before mmc card initialization").
>
> Though not totally obvious from the commit message nor from the source
> code, that commit appears to be trying to reset the "_drv" MMC clocks to
> 90 degrees (note that the "_sample" MMC clocks have a shift of 0 so are
> not touched).
>
> The major problem here is that it doesn't properly reset things.  The
> phase is a two bit field and the commit only touches one of the two
> bits.  Thus the commit had the following affect:
> - phase   0  => phase  90
> - phase  90  => phase  90
> - phase 180  => phase 270
> - phase 270  => phase 270
>
> Things get even weirder if you happen to have a bootloader that was
> actually using delay elements (should be no reason to, but you never
> know), since those are additional bits that weren't touched by the
> original patch.
>
> This is unlikely to be what we actually want.  Checking on rk3288-veyron
> devices, I can see that the bootloader leaves these clocks as:
> - emmc:  phase 180
> - sdmmc: phase 90
> - sdio0: phase 90
>
> Thus on rk3288-veyron devices the commit we're reverting had the effect
> of changing the eMMC clock to phase 270.  This probably explains the
> scattered reports I've heard of eMMC devices not working on some veyron
> devices when using the upstream kernel.
>
> The original commit was presumably made because previously the kernel
> didn't touch the "_drv" phase at all and relied on whatever value was
> there when the kernel started.  If someone was using a bootloader that
> touched the "_drv" phase then, indeed, we should have code in the kernel
> to fix that.  ...and also, to get ideal timings, we should also have the
> kernel change the phase depending on the speed mode.  In fact, that's
> the subject of a recent patch I posted at
> <https://patchwork.kernel.org/patch/9075141/>.
>
> Ideally, we should take both the patch posted to dw_mmc and this
> revert.  Since those will likely go through different trees, here I
> describe behavior with the combos:
>
> 1. Just this revert: likely will fix rk3288-veyron eMMC on some devices
>     + other cases; might break someone with a strange bootloader that
>     sets the phase to 0 or one that uses delay elements (pretty
>     unpredicable what would happen in that case).
> 2. Just dw_mmc patch: fixes everyone.  Effectly the dw_mmc patch will
>     totally override the broken patch and fix everything.
> 3. Both patches: fixes everyone.  Once dw_mmc is initting properly then
>     any defaults from the clock code doesn't mattery.
>
> Fixes: 7a03fe6f48f3 ("clk: rockchip: reset init state before mmc card initialization")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for this fix.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> ---
>   drivers/clk/rockchip/clk-mmc-phase.c | 11 -----------
>   1 file changed, 11 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
> index bc856f21f6b2..5b18265c2306 100644
> --- a/drivers/clk/rockchip/clk-mmc-phase.c
> +++ b/drivers/clk/rockchip/clk-mmc-phase.c
> @@ -41,8 +41,6 @@ static unsigned long rockchip_mmc_recalc(struct clk_hw *hw,
>   #define ROCKCHIP_MMC_DEGREE_MASK 0x3
>   #define ROCKCHIP_MMC_DELAYNUM_OFFSET 2
>   #define ROCKCHIP_MMC_DELAYNUM_MASK (0xff << ROCKCHIP_MMC_DELAYNUM_OFFSET)
> -#define ROCKCHIP_MMC_INIT_STATE_RESET 0x1
> -#define ROCKCHIP_MMC_INIT_STATE_SHIFT 1
>
>   #define PSECS_PER_SEC 1000000000000LL
>
> @@ -162,15 +160,6 @@ struct clk *rockchip_clk_register_mmc(const char *name,
>   	mmc_clock->reg = reg;
>   	mmc_clock->shift = shift;
>
> -	/*
> -	 * Assert init_state to soft reset the CLKGEN
> -	 * for mmc tuning phase and degree
> -	 */
> -	if (mmc_clock->shift == ROCKCHIP_MMC_INIT_STATE_SHIFT)
> -		writel(HIWORD_UPDATE(ROCKCHIP_MMC_INIT_STATE_RESET,
> -				     ROCKCHIP_MMC_INIT_STATE_RESET,
> -				     mmc_clock->shift), mmc_clock->reg);
> -
>   	clk = clk_register(NULL, &mmc_clock->hw);
>   	if (IS_ERR(clk))
>   		kfree(mmc_clock);
>

