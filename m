Return-Path: <slash.tmp@free.fr>
Subject: Re: [PATCH] clk: sunxi: Remove use of VLAIS
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20160226194830.GA21652@lukather>
 <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
From: Mason <slash.tmp@free.fr>
Message-ID: <56DEC4F6.1090107@free.fr>
Date: Tue, 8 Mar 2016 13:26:30 +0100
MIME-Version: 1.0
In-Reply-To: <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On 02/03/2016 01:20, Stephen Boyd wrote:

> Using an array allocated on the stack may lead to stack overflows
> and other problems. Furthermore, VLAIS doesn't work well with
> LLVM compilers, so move the allocation to the heap and avoid the
> use of VLAIS here.

What are the symptoms of LLVM's incomplete support?

> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/sunxi/clk-sun8i-mbus.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sunxi/clk-sun8i-mbus.c b/drivers/clk/sunxi/clk-sun8i-mbus.c
> index 3aaa9cbef791..8e7128e69823 100644
> --- a/drivers/clk/sunxi/clk-sun8i-mbus.c
> +++ b/drivers/clk/sunxi/clk-sun8i-mbus.c
> @@ -33,7 +33,7 @@ static DEFINE_SPINLOCK(sun8i_a23_mbus_lock);
>  static void __init sun8i_a23_mbus_setup(struct device_node *node)
>  {
>  	int num_parents = of_clk_get_parent_count(node);
> -	const char *parents[num_parents];
> +	const char **parents;

Is num_parents ever greater than 8?

Dynamically allocating such a small array seems wasteful.

  const char *parents[8]; /* 32 bytes on Cortex A7 */
  if (num_parents >= 8) return EINVAL;

  ... rest of the code unchanged ...

Regards.
