Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1516618880.7870.1.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: axg: fix the od shift of the sys_pll
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman
	 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Jan 2018 12:01:20 +0100
In-Reply-To: <20180119020926.246887-1-yixun.lan@amlogic.com>
References: <20180119020926.246887-1-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-01-19 at 10:09 +0800, Yixun Lan wrote:
> According to datasheet, the od shift of sys_pll is 16,
> fix the typo which introduced at previous commit.
> 
> Fixes: 78b4af312f91 ('clk: meson-axg: add clock controller drivers')
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  drivers/clk/meson/axg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 7988dc8506b0..04a231eaf648 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -64,7 +64,7 @@ static struct meson_clk_pll axg_sys_pll = {
>  	},
>  	.od = {
>  		.reg_off = HHI_SYS_PLL_CNTL,
> -		.shift   = 10,
> +		.shift   = 16,
>  		.width   = 2,
>  	},
>  	.lock = &meson_clk_lock,

Looks good. Thx
I'll take it when the rc1 is released

Jerome
