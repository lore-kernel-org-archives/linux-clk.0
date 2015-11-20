Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 11:17:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jiri Kosina <trivial@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] [trivial] clk: Spelling s/derefing/dereferencing/
Message-ID: <20151120191752.GZ32672@codeaurora.org>
References: <1446148500-20480-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1446148500-20480-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 10/29, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next....

>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index a5202df30bb27598..77835e408fe67049 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1981,7 +1981,7 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
>  	if (p == q)
>  		return true;
>  
> -	/* true if clk->core pointers match. Avoid derefing garbage */
> +	/* true if clk->core pointers match. Avoid dereferencing garbage */

derefing isn't a word? :)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
