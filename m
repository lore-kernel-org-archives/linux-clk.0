Return-Path: <s.nawrocki@samsung.com>
Message-id: <55C31653.7070000@samsung.com>
Date: Thu, 06 Aug 2015 10:09:55 +0200
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
MIME-version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Chao Xie <chao.xie@marvell.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 =?UTF-8?B?RW1pbGlvIEzDsw==?= =?UTF-8?B?cGV6?= <emilio@elopez.com.ar>,
 Tero Kristo <t-kristo@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 02/26] clk: Replace __clk_get_num_parents with
 clk_hw_get_num_parents()
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
In-reply-to: <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
Content-type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 31/07/15 19:03, Stephen Boyd wrote:
> diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
> index 665cb6794639..8653e555c920 100644
> --- a/drivers/clk/mmp/clk-mix.c
> +++ b/drivers/clk/mmp/clk-mix.c
> @@ -63,7 +63,7 @@ static unsigned int _get_div(struct mmp_clk_mix *mix, unsigned int val)
>  
>  static unsigned int _get_mux(struct mmp_clk_mix *mix, unsigned int val)
>  {
> -	int num_parents = __clk_get_num_parents(mix->hw.clk);
> +	int num_parents = clk_hw_get_num_parents(hw);

Shouldn't this be:
	int num_parents = clk_hw_get_num_parents(&mix->hw);

?
>  	int i;
>  
>  	if (mix->mux_flags & CLK_MUX_INDEX_BIT)

With the above fixed

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
