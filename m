Return-Path: <oss@buserror.net>
Message-ID: <1471278722.25630.268.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: yuantian.tang@nxp.com, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 scott.wood@nxp.com
Date: Mon, 15 Aug 2016 11:32:02 -0500
In-Reply-To: <1471246100-40713-1-git-send-email-yuantian.tang@nxp.com>
References: <1471246100-40713-1-git-send-email-yuantian.tang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Subject: Re: [PATCH] clk: qoriq: fix a register offset error
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2016-08-15 at 15:28 +0800, yuantian.tang@nxp.com wrote:
> From: Tang Yuantian <Yuantian.Tang@nxp.com>
> 
> The offset of Core Cluster clock control/status register
> on cluster group V3 version is different from others, and
> should be plus 0x70000.
> 
> Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
> ---
>  drivers/clk/clk-qoriq.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
> index f4c455a..05e416c 100644
> --- a/drivers/clk/clk-qoriq.c
> +++ b/drivers/clk/clk-qoriq.c
> @@ -774,7 +774,11 @@ static struct clk * __init create_one_cmux(struct
> clockgen *cg, int idx)
>  	if (!hwc)
>  		return NULL;
>  
> -	hwc->reg = cg->regs + 0x20 * idx;
> +	if (cg->info.flags & CG_VER3)
> +		hwc->reg = cg->regs + 0x70000 + 0x20 * idx;
> +	else
> +		hwc->reg = cg->regs + 0x20 * idx;
> +
>  	hwc->info = cg->info.cmux_groups[cg->info.cmux_to_group[idx]];

Reviewed-by: Scott Wood <oss@buserror.net>

-Scott
