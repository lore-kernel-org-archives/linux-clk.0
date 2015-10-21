Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Oct 2015 16:15:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Shawn Guo <shawnguo@kernel.org>, kernel-janitors@vger.kernel.org,
	Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>,
	Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 3/5] clk: imx27: add missing of_node_put
Message-ID: <20151021231528.GJ19782@codeaurora.org>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
 <1445460100-26727-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445460100-26727-4-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/21, Julia Lawall wrote:
> for_each_compatible_node performs an of_node_get on each iteration, so a
> break out of the loop requires an of_node_put.
> 
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @@
> local idexpression n;
> expression e;
> @@
> 
>  for_each_compatible_node(n,...) {
>    ...
> (
>    of_node_put(n);
> |
>    e = n
> |
> +  of_node_put(n);
> ?  break;
> )
>    ...
>  }
> ... when != n
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
