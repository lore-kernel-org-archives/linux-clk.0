Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1436571223-10959-28-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
	<1436571223-10959-28-git-send-email-sboyd@codeaurora.org>
Date: Mon, 20 Jul 2015 13:21:11 +0200
Message-ID: <CAPDyKFpz3dKvsajG0-yVC0aoE_afwzzaK-e+Kptu+ViQ+vmvrg@mail.gmail.com>
Subject: Re: [PATCH 27/45] clk: ux500: Remove clk.h and clkdev.h includes
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11 July 2015 at 01:33, Stephen Boyd <sboyd@codeaurora.org> wrote:
> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Remove the include here because this is a
> provider driver. Also remove clkdev.h in files that aren't using
> it.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/ux500/abx500-clk.c   | 1 -
>  drivers/clk/ux500/clk.h          | 3 ++-
>  drivers/clk/ux500/u8500_clk.c    | 1 -
>  drivers/clk/ux500/u8500_of_clk.c | 2 --
>  drivers/clk/ux500/u8540_clk.c    | 1 -
>  drivers/clk/ux500/u9540_clk.c    | 2 --
>  6 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/ux500/abx500-clk.c b/drivers/clk/ux500/abx500-clk.c
> index 3e5e05101302..222425d08ab6 100644
> --- a/drivers/clk/ux500/abx500-clk.c
> +++ b/drivers/clk/ux500/abx500-clk.c
> @@ -13,7 +13,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/mfd/abx500/ab8500.h>
>  #include <linux/mfd/abx500/ab8500-sysctrl.h>
> -#include <linux/clk.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/dbx500-prcmu.h>
> diff --git a/drivers/clk/ux500/clk.h b/drivers/clk/ux500/clk.h
> index a2bb92d85ee0..b42485da704e 100644
> --- a/drivers/clk/ux500/clk.h
> +++ b/drivers/clk/ux500/clk.h
> @@ -10,10 +10,11 @@
>  #ifndef __UX500_CLK_H
>  #define __UX500_CLK_H
>
> -#include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/types.h>
>
> +struct clk;
> +
>  struct clk *clk_reg_prcc_pclk(const char *name,
>                               const char *parent_name,
>                               resource_size_t phy_base,
> diff --git a/drivers/clk/ux500/u8500_clk.c b/drivers/clk/ux500/u8500_clk.c
> index 4626b97b7d83..1c7b639d9222 100644
> --- a/drivers/clk/ux500/u8500_clk.c
> +++ b/drivers/clk/ux500/u8500_clk.c
> @@ -7,7 +7,6 @@
>   * License terms: GNU General Public License (GPL) version 2
>   */
>
> -#include <linux/clk.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/dbx500-prcmu.h>
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
> index e319ef912dc6..c3e3b20e4b43 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -8,8 +8,6 @@
>   */
>
>  #include <linux/of.h>
> -#include <linux/clk.h>
> -#include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/dbx500-prcmu.h>
>  #include <linux/platform_data/clk-ux500.h>
> diff --git a/drivers/clk/ux500/u8540_clk.c b/drivers/clk/ux500/u8540_clk.c
> index 20c8add90d11..d0de335ea1e9 100644
> --- a/drivers/clk/ux500/u8540_clk.c
> +++ b/drivers/clk/ux500/u8540_clk.c
> @@ -7,7 +7,6 @@
>   * License terms: GNU General Public License (GPL) version 2
>   */
>
> -#include <linux/clk.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/dbx500-prcmu.h>
> diff --git a/drivers/clk/ux500/u9540_clk.c b/drivers/clk/ux500/u9540_clk.c
> index 44794782e7e0..179bd3871b34 100644
> --- a/drivers/clk/ux500/u9540_clk.c
> +++ b/drivers/clk/ux500/u9540_clk.c
> @@ -7,8 +7,6 @@
>   * License terms: GNU General Public License (GPL) version 2
>   */
>
> -#include <linux/clk.h>
> -#include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/dbx500-prcmu.h>
>  #include <linux/platform_data/clk-ux500.h>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
