Return-Path: <hofrat@osadl.at>
Date: Mon, 14 Dec 2015 13:57:29 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: unchecked return of kmalloc_array
Message-ID: <20151214135729.GA22301@osadl.at>
References: <1450099015-23148-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450099015-23148-1-git-send-email-hofrat@osadl.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Dec 14, 2015 at 02:16:55PM +0100, Nicholas Mc Guire wrote:
> kmalloc_array return is unchecked - given how parent_names is being treated
> in case of allocation error it probably is ok to treat clock->parents the
> same way and simply return.
> 
> problem was located with coccinelle
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> patch was compile tested for shmobile_defconfig
> (implies CONFIG_ARCH_SHMOBILE_MULTI=y)
> 
> patch is against linux-next (localversion-next -next-20151214)
> 
>  drivers/clk/shmobile/clk-div6.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/shmobile/clk-div6.c b/drivers/clk/shmobile/clk-div6.c
> index b4c8d67..e6b7533 100644
> --- a/drivers/clk/shmobile/clk-div6.c
> +++ b/drivers/clk/shmobile/clk-div6.c
> @@ -196,6 +196,8 @@ static void __init cpg_div6_clock_init(struct device_node *np)
>  
>  	clock->parents = kmalloc_array(num_parents, sizeof(*clock->parents),
>  		GFP_KERNEL);
> +	if (!clock->parents)
> +		return;
>  	parent_names = kmalloc_array(num_parents, sizeof(*parent_names),
>

giving the callchain of kmalloc_array a look I guess there should be
some memset for parent_names and clock->parents - or is there a reason why
no memset would be needed here ?

thx!
hofrat
