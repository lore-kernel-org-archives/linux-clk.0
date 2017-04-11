Return-Path: <pdeschrijver@nvidia.com>
Date: Tue, 11 Apr 2017 16:47:06 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Michael Turquette <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: add clk_possible_parents debugfs file
Message-ID: <20170411134706.GG30730@tbergstrom-lnx.Nvidia.com>
References: <1490102432-21314-1-git-send-email-pdeschrijver@nvidia.com>
 <20170407194506.GF7065@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20170407194506.GF7065@codeaurora.org>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 07, 2017 at 12:45:06PM -0700, Stephen Boyd wrote:
> On 03/21, Peter De Schrijver wrote:
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index f5f2bcd..2fa2fb8 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2128,6 +2128,34 @@ static int clk_dump_open(struct inode *inode, struct file *file)
> >  	.release	= single_release,
> >  };
> >  
> > +static int possible_parents_dump(struct seq_file *s, void *data)
> > +{
> > +	struct clk_core *core;
> > +	int i;
> > +
> > +	core = (struct clk_core *)s->private;
> 
> Useless cast from void.
> 
> > +
> > +	for (i = 0; i < core->num_parents - 1; i++)
> > +		seq_printf(s, "%s ", core->parent_names[i]);
> 
> I hope we don't have spaces in clk names! I don't think we do.
> 

I don't think we do either, at least I've never seen a clk name with a space.

Peter.
