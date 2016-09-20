Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, geert+renesas@glider.be, horms+renesas@verge.net.au, ulf.hansson@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: clk-mstp: Free memory and Unmap region obtained by kzalloc and of_iomap
Date: Tue, 20 Sep 2016 15:49:03 +0300
Message-ID: <21075147.gpvqaLID3A@avalon>
In-Reply-To: <1474375159-16568-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1474375159-16568-1-git-send-email-arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

HI Arvind,

Thank you for the patch.

On Tuesday 20 Sep 2016 18:09:19 Arvind Yadav wrote:
> From: Arvind Yadav <arvind.yadav.cs@gmail.com>
> 
> Free memory and memory mapping , if cpg_mstp_clocks_init is not successful.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/clk/renesas/clk-mstp.c |   14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
> index 5093a25..19e73c8 100644
> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -179,14 +179,20 @@ static void __init cpg_mstp_clocks_init(struct
> device_node *np) group->data.clks = clks;
> 
>  	group->smstpcr = of_iomap(np, 0);
> -	group->mstpsr = of_iomap(np, 1);
> -
>  	if (group->smstpcr == NULL) {
>  		pr_err("%s: failed to remap SMSTPCR\n", __func__);
>  		kfree(group);
>  		kfree(clks);
>  		return;
>  	}
> +	group->mstpsr = of_iomap(np, 1);
> +	if (group->mstpsr == NULL) {
> +		pr_err("%s: failed to remap MSTPCR\n", __func__);
> +		iounmap(group->smstpcr);
> +		kfree(group);
> +		kfree(clks);
> +		return;

If you really want to do this (and I don't think that's worth it, an error 
here will render the system completely unbootable anyway, I'd rather remove 
the kfree() calls), you can test both group->smstpcr and group->mstpsr in a 
single go, with a single error path. You can then call iounmap() on both 
variables in the error path, either unconditionally if iounmap() is safe to be 
called on NULL pointers (to be checked, I haven't verified that personally), 
or conditionally based on the pointer value.

> +	}
> 
>  	for (i = 0; i < MSTP_MAX_CLOCKS; ++i)
>  		clks[i] = ERR_PTR(-ENOENT);
> @@ -236,6 +242,10 @@ static void __init cpg_mstp_clocks_init(struct
> device_node *np) } else {
>  			pr_err("%s: failed to register %s %s clock (%ld)\n",
>  			       __func__, np->name, name, 
PTR_ERR(clks[clkidx]));
> +			iounmap(group->smstpcr);
> +			iounmap(group->mstpsr);
> +			kfree(group);
> +			kfree(clks);

This is wrong, a single clock failing to be registered is not a fatal error, 
and should not free resources used by all other clocks in the group.

>  		}
>  	}

-- 
Regards,

Laurent Pinchart
