Return-Path: <sboyd@codeaurora.org>
Date: Fri, 24 Feb 2017 12:44:39 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: core: Copy connection id
Message-ID: <20170224204439.GD25384@codeaurora.org>
References: <60d115f6c11bc51cd8bc10c64cd222c3cdb43cc7.1487596492.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <60d115f6c11bc51cd8bc10c64cd222c3cdb43cc7.1487596492.git.leonard.crestez@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/20, Leonard Crestez wrote:
> Some drivers use sprintf to build clk connection id names but the clk
> core will save those strings and occasionally print them back. Duplicate
> the con_id strings instead of fixing all the users.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
>  drivers/clk/clk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Some examples of using sprintf for con_id include:
> drivers/mfd/omap-usb-host.c
> drivers/tty/serial/samsung.c
> sound/soc/fsl/fsl_asrc.c
> 
> There are lots more. They are difficult to find and "fixing" them on the
> consumer side requires nasty code to keep track of the allocated clkname.

Good catch. What about dev_id though? That could also have the
same problem if some device is removed and we're still holding a
reference to the kobject's name. This is probably more rare than
what is happening here, but still seems possible that we might
trip over that later.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
