Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 16:29:40 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Sudeep Holla <sudeep.holla@arm.com>, kernel-janitors@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>,
	Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 5/5] clk: scpi: add missing of_node_put
Message-ID: <20151201002939.GE21446@codeaurora.org>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
 <1445460100-26727-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445460100-26727-6-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/21, Julia Lawall wrote:
> for_each_available_child_of_node performs an of_node_get on each iteration,
> so a break out of the loop requires an of_node_put.
> 
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> @@
> 
>  for_each_available_child_of_node(root, child) {
>    ... when != of_node_put(child)
>        when != e = child
> (
>    return child;
> |
> +  of_node_put(child);
> ?  return ...;
> )
>    ...
>  }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
