Return-Path: <linux-pm-owner@vger.kernel.org>
From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Message-ID: <5568423A.4080200@linaro.org>
Date: Fri, 29 May 2015 13:40:58 +0300
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
CC: linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] PM / clock_ops: Print acquired clock name instead of
 con_id
References: <1432839849-1432-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1432839849-1432-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/28/2015 10:04 PM, Geert Uytterhoeven wrote:
> Currently the con_id of the acquired clock is printed for debugging
> purposes.  But in several cases, the con_id is NULL, which doesn't
> provide much debugging information when printed.  These cases are:
>    - When explicitly passing a NULL con_id (which means the first clock
>      tied to the device, if available),
>    - When not using pm_clk_add(), but pm_clk_add_clk() (which takes a
>      "struct clk *" directly).
> 
> Hence print the actual clock name instead of the con_id.
> 
> As the clock name is not available with legacy clock frameworks, and a
> (non-NULL) con_id is more useful than a hex address, keep printing the
> con_id if the Common Clock Framework is not enabled.

overall:
Reviewed-by: Grygorii Strashko <grygorii.strashko@linaro.org>

But, It seems case !CONFIG_COMMON_CLK is handled by vsprintf, may we can assume
that printk will handle invalid input parameters values correctly:

like
 dev_dbg(dev, "Clock %pC con_id:%s managed by runtime PM.\n", ce->clk, ce->con_id);

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/base/power/clock_ops.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
> index 442ce010559bf531..6d56577903bd01e1 100644
> --- a/drivers/base/power/clock_ops.c
> +++ b/drivers/base/power/clock_ops.c
> @@ -68,7 +68,11 @@ static void pm_clk_acquire(struct device *dev, struct pm_clock_entry *ce)
>   	} else {
>   		clk_prepare(ce->clk);
>   		ce->status = PCE_STATUS_ACQUIRED;
> +#ifdef CONFIG_COMMON_CLK
> +		dev_dbg(dev, "Clock %pC managed by runtime PM.\n", ce->clk);
> +#else
>   		dev_dbg(dev, "Clock %s managed by runtime PM.\n", ce->con_id);
> +#endif
>   	}
>   }
>   
> 


-- 
regards,
-grygorii
