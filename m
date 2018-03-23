Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <1521781901-20466-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1521781901-20466-1-git-send-email-hayashi.kunihiko@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 23 Mar 2018 19:16:46 +0900
Message-ID: <CAK7LNARPD5_9xWLkWZyFQHN2WwtyBtQsnZYggbvyWEg+qtXCWg@mail.gmail.com>
Subject: Re: [PATCH] clk: uniphier: add ethernet clock control support for PXs3
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

2018-03-23 14:11 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>:
> Add clock control for ethernet controller on PXs3 SoC.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  drivers/clk/uniphier/clk-uniphier-sys.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/uniphier/clk-uniphier-sys.c b/drivers/clk/uniphier/clk-uniphier-sys.c
> index d244e72..faadd9b 100644
> --- a/drivers/clk/uniphier/clk-uniphier-sys.c
> +++ b/drivers/clk/uniphier/clk-uniphier-sys.c
> @@ -233,6 +233,8 @@ const struct uniphier_clk_data uniphier_pxs3_sys_clk_data[] = {
>         UNIPHIER_LD20_SYS_CLK_SD,
>         UNIPHIER_LD11_SYS_CLK_NAND(2),
>         UNIPHIER_LD11_SYS_CLK_EMMC(4),
> +       UNIPHIER_CLK_GATE("ether0", 6, NULL, 0x210c, 9),
> +       UNIPHIER_CLK_GATE("ether1", 7, NULL, 0x210c, 10),
>         UNIPHIER_CLK_GATE("usb30", 12, NULL, 0x210c, 4),        /* =GIO0 */
>         UNIPHIER_CLK_GATE("usb31-0", 13, NULL, 0x210c, 5),      /* =GIO1 */
>         UNIPHIER_CLK_GATE("usb31-1", 14, NULL, 0x210c, 6),      /* =GIO1-1 */
> --


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
