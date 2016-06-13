Return-Path: <daniel.lezcano@linaro.org>
Return-Path: <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/6] clk: Add missing clk_get_sys() stub
To: tglx@linutronix.de
References: <1464903697-3802-1-git-send-email-daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 "open list:CLK API" <linux-clk@vger.kernel.org>,
 Mike Turquette <mturquette@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <575E6C48.40605@linaro.org>
Date: Mon, 13 Jun 2016 10:18:16 +0200
MIME-Version: 1.0
In-Reply-To: <1464903697-3802-1-git-send-email-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/02/2016 11:41 PM, Daniel Lezcano wrote:
> When compiling with the COMPILE_TEST option set, the clps711x does not
> compile because of the clk_get_sys() noop stub missing.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

Hi,

is this patch fine ? Can I pick it through my tree ?

Thanks.

   -- Daniel


>   include/linux/clk.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 0df4a51..834179f 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -461,6 +461,10 @@ static inline struct clk *clk_get_parent(struct clk *clk)
>   	return NULL;
>   }
>
> +static inline struct clk *clk_get_sys(const char *dev_id, const char *con_id)
> +{
> +	return NULL;
> +}
>   #endif
>
>   /* clk_prepare_enable helps cases using clk_enable in non-atomic context. */
>


-- 
  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
