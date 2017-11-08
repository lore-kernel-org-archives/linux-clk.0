Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:23147 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752376AbdKHNYE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Nov 2017 08:24:04 -0500
MIME-Version: 1.0
In-Reply-To: <1507170779-26688-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507170779-26688-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 8 Nov 2017 22:23:16 +0900
Message-ID: <CAK7LNARFsmaV=+OFnxRCJpYxmC8nuRQa6UhfdOMqgAOs_jWqVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: uniphier: fix DAPLL2 clock rate of Pro5
To: linux-clk <linux-clk@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

Could you pick this up, please?


You sent a pull request last week.
So, queuing this for -next is fine for me.



2017-10-05 11:32 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The parent of DAPLL2 should be DAPLL1.  Fix the clock connection.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  drivers/clk/uniphier/clk-uniphier-sys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/uniphier/clk-uniphier-sys.c b/drivers/clk/uniphier/clk-uniphier-sys.c
> index 0e396f3..bffe095 100644
> --- a/drivers/clk/uniphier/clk-uniphier-sys.c
> +++ b/drivers/clk/uniphier/clk-uniphier-sys.c
> @@ -123,7 +123,7 @@ const struct uniphier_clk_data uniphier_sld8_sys_clk_data[] = {
>  const struct uniphier_clk_data uniphier_pro5_sys_clk_data[] = {
>         UNIPHIER_CLK_FACTOR("spll", -1, "ref", 120, 1),         /* 2400 MHz */
>         UNIPHIER_CLK_FACTOR("dapll1", -1, "ref", 128, 1),       /* 2560 MHz */
> -       UNIPHIER_CLK_FACTOR("dapll2", -1, "ref", 144, 125),     /* 2949.12 MHz */
> +       UNIPHIER_CLK_FACTOR("dapll2", -1, "dapll1", 144, 125),  /* 2949.12 MHz */
>         UNIPHIER_CLK_FACTOR("uart", 0, "dapll2", 1, 40),
>         UNIPHIER_CLK_FACTOR("i2c", 1, "spll", 1, 48),
>         UNIPHIER_PRO5_SYS_CLK_NAND(2),
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
