Return-Path: <sudeep.holla@arm.com>
Subject: Re: [PATCH 5/5] clk: scpi: add missing of_node_put
To: Julia Lawall <Julia.Lawall@lip6.fr>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
 <1445460100-26727-6-git-send-email-Julia.Lawall@lip6.fr>
Cc: Sudeep Holla <sudeep.holla@arm.com>, kernel-janitors@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Cooper <jason@lakedaemon.net>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <5628AA99.1000000@arm.com>
Date: Thu, 22 Oct 2015 10:21:29 +0100
MIME-Version: 1.0
In-Reply-To: <1445460100-26727-6-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 21/10/15 21:41, Julia Lawall wrote:
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
>   for_each_available_child_of_node(root, child) {
>     ... when != of_node_put(child)
>         when != e = child
> (
>     return child;
> |
> +  of_node_put(child);
> ?  return ...;
> )
>     ...
>   }
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks for the fix.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

PS: Since this driver is queued via arm-soc, it needs to go via them or
wait for v4.4-rc1 and then queue via clk tree.

-- 
Regards,
Sudeep
