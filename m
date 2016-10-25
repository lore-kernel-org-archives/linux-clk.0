Return-Path: <sboyd@codeaurora.org>
Date: Tue, 25 Oct 2016 13:35:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: walter harms <wharms@bfs.de>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, lars@metafoo.de,
	dan.carpenter@oracle.com, ssantosh@kernel.org,
	mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: keystone: Fix missing iounmap calls in an error
 handling path
Message-ID: <20161025203526.GA26139@codeaurora.org>
References: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
 <7ed7c1abf1666f1e6eda240bb705940bc14bd186.1477339880.git.christophe.jaillet@wanadoo.fr>
 <580F04D9.108@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <580F04D9.108@bfs.de>
List-ID: <linux-clk.vger.kernel.org>

On 10/25, walter harms wrote:
> Am 24.10.2016 22:43, schrieb Christophe JAILLET:
> > @@ -220,6 +218,12 @@ static void __init _of_pll_clk_init(struct device_node *node, bool pllctrl)
> >  
> >  out:
> >  	pr_err("%s: error initializing pll %s\n", __func__, node->name);
> > +	if (pll_data->pllm)
> > +		iounmap(pll_data->pllm);
> > +	if (pll_data->pll_ctl0)
> > +		iounmap(pll_data->pll_ctl0);
> > +	if (pll_data->pllod)
> > +		iounmap(pll_data->pllod);
> >  	kfree(pll_data);
> >  }
> >  
> 
> IMHO calles the iounmap() need no check for NULL.
> 

ARM doesn't seem to check for NULL there though. So that would be
a bug.

It would be nice to remove the checks though. Perhaps someone
could do that by unifying ionumap into asm-generic with the NULL
check and then have architecture specific functions for the rest
of it?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
