Return-Path: <julia.lawall@lip6.fr>
Date: Thu, 22 Oct 2015 07:52:29 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Stephen Boyd <sboyd@codeaurora.org>
cc: Michael Turquette <mturquette@baylibre.com>,
    kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Russell King - ARM Linux <linux@arm.linux.org.uk>,
    Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
    Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>,
    Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 1/5] clk: add missing of_node_put
In-Reply-To: <20151021231243.GH19782@codeaurora.org>
Message-ID: <alpine.DEB.2.02.1510220752060.2246@localhost6.localdomain6>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr> <1445460100-26727-2-git-send-email-Julia.Lawall@lip6.fr> <20151021231243.GH19782@codeaurora.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>



On Wed, 21 Oct 2015, Stephen Boyd wrote:

> On 10/21, Julia Lawall wrote:
> > for_each_matching_node_and_match performs an of_node_get on each iteration,
> > so a break out of the loop requires an of_node_put.
> > 
> > A simplified version of the semantic patch that fixes this problem is as
> > follows (http://coccinelle.lip6.fr):
> > 
> > // <smpl>
> > @@
> > expression e1,e2,e;
> > local idexpression np;
> > @@
> > 
> >  for_each_matching_node_and_match(np, e1, e2) {
> >    ... when != of_node_put(np)
> >        when != e = np
> > (
> >    return np;
> > |
> > +  of_node_put(np);
> > ?  return ...;
> > )
> >    ...
> >  }
> > // </smpl>
> > 
> > Besides the problem identified by the semantic patch, this patch adds an
> > of_node_get in front of saving np in a field of parent, to account for the
> > fact that this value will be put on going on to the next element in the
> > iteration, and then adds of_node_puts in the two loops where the parent
> > pointer can be freed.
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> > 
> > ---
> 
> Applied to clk-next, except I collapsed the of_node_get() into
> the assignment.
> 
> ---8<---
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d366bfb66c58..2eae76f21d6f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3205,8 +3205,7 @@ void __init of_clk_init(const struct of_device_id *matches)
>  		}
>  
>  		parent->clk_init_cb = match->data;
> -		of_node_get(np);
> -		parent->np = np;
> +		parent->np = of_node_get(np);

Thanks!

julia

>  		list_add_tail(&parent->node, &clk_provider_list);
>  	}
>  
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
