Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Apr 2017 12:45:06 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: add clk_possible_parents debugfs file
Message-ID: <20170407194506.GF7065@codeaurora.org>
References: <1490102432-21314-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490102432-21314-1-git-send-email-pdeschrijver@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/21, Peter De Schrijver wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f5f2bcd..2fa2fb8 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2128,6 +2128,34 @@ static int clk_dump_open(struct inode *inode, struct file *file)
>  	.release	= single_release,
>  };
>  
> +static int possible_parents_dump(struct seq_file *s, void *data)
> +{
> +	struct clk_core *core;
> +	int i;
> +
> +	core = (struct clk_core *)s->private;

Useless cast from void.

> +
> +	for (i = 0; i < core->num_parents - 1; i++)
> +		seq_printf(s, "%s ", core->parent_names[i]);

I hope we don't have spaces in clk names! I don't think we do.

> +
> +	seq_printf(s, "%s\n", core->parent_names[i]);
> +
> +	return 0;
> +}
> +
> +static int possible_parents_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, possible_parents_dump, inode->i_private);
> +}
> +
> +

Double newline.

I fixed both when applying to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
