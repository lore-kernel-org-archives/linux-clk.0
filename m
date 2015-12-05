Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <1446713979-32693-1-git-send-email-yamada.masahiro@socionext.com>
References: <1446713979-32693-1-git-send-email-yamada.masahiro@socionext.com>
Date: Sat, 5 Dec 2015 14:15:06 +0900
Message-ID: <CAK7LNAQK6CrcmBOKQ9EKjH+S-jxP-dS9Zt_u4E=8MaudJn7EoQ@mail.gmail.com>
Subject: Re: [PATCH] clk: fix codying style of if ... else blocks
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

No value for this patch, or just you missed this?


2015-11-05 17:59 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This code is unreadable due to the blank line between if and else
> blocks.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  drivers/clk/clk-mux.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
> index 7129c86..5ed03c8 100644
> --- a/drivers/clk/clk-mux.c
> +++ b/drivers/clk/clk-mux.c
> @@ -71,10 +71,9 @@ static int clk_mux_set_parent(struct clk_hw *hw, u8 index)
>         u32 val;
>         unsigned long flags = 0;
>
> -       if (mux->table)
> +       if (mux->table) {
>                 index = mux->table[index];
> -
> -       else {
> +       } else {
>                 if (mux->flags & CLK_MUX_INDEX_BIT)
>                         index = 1 << index;
>
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
