Return-Path: <linux-pm-owner@vger.kernel.org>
From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Message-ID: <556DA21A.5090902@linaro.org>
Date: Tue, 02 Jun 2015 15:31:22 +0300
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
CC: linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] PM / clock_ops: Print acquired clock name in addition
 to con_id
References: <1432917331-3285-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1432917331-3285-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/29/2015 07:35 PM, Geert Uytterhoeven wrote:
> Currently the con_id of the acquired clock is printed for debugging
> purposes.  But in several cases, the con_id is NULL, which doesn't
> provide much debugging information when printed.  These cases are:
>    - When explicitly passing a NULL con_id (which means the first clock
>      tied to the device, if available),
>    - When not using pm_clk_add(), but pm_clk_add_clk() (which takes a
>      "struct clk *" directly).
>
> Hence print the actual clock name in addition to (and not instead of;
> thanks Grygorii Strashko!) the con_id.
>
> Note that the clock name is not available with legacy clock frameworks,
> and the hex pointer address will be printed instead.
>

Looks good for me.
Reviewed-by: Grygorii Strashko <grygorii.strashko@linaro.org>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is v2 of "PM / clock_ops: Print acquired clock name instead of
> con_id".
>
> v2:
>    - Print both clock and con_id, as suggested by Grygorii Strashko
>      <grygorii.strashko@linaro.org>.
> ---
>   drivers/base/power/clock_ops.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
> index 442ce010559bf531..acef9f9f759a2530 100644
> --- a/drivers/base/power/clock_ops.c
> +++ b/drivers/base/power/clock_ops.c
> @@ -68,7 +68,8 @@ static void pm_clk_acquire(struct device *dev, struct pm_clock_entry *ce)
>   	} else {
>   		clk_prepare(ce->clk);
>   		ce->status = PCE_STATUS_ACQUIRED;
> -		dev_dbg(dev, "Clock %s managed by runtime PM.\n", ce->con_id);
> +		dev_dbg(dev, "Clock %pC con_id %s managed by runtime PM.\n",
> +			ce->clk, ce->con_id);
>   	}
>   }
>
>


-- 
regards,
-grygorii
