Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55C8AB87.3040107@st.com>
Date: Mon, 10 Aug 2015 15:47:51 +0200
From: Maxime Coquelin <maxime.coquelin@st.com>
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC: <sboyd@codeaurora.org>, <lee.jones@linaro.org>,
	<maxime.ripard@free-electrons.com>, <s.hauer@pengutronix.de>,
	<geert@linux-m68k.org>
Subject: Re: [PATCH RFC RFT 1/3] clk: per-user clk prepare & enable ref counts
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com> <1438974570-20812-2-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1438974570-20812-2-git-send-email-mturquette@baylibre.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

On 08/07/2015 09:09 PM, Michael Turquette wrote:
> This patch adds prepare and enable reference counts for the per-user
> handles that clock consumers have for a clock node. This patch warns if
> an imbalance occurs while trying to disable or unprepare a clock and
> aborts, leaving the hardware unaffected.
>
> Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> ---
>   drivers/clk/clk.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 898052e..72feee9 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -84,6 +84,8 @@ struct clk {
>   	unsigned long min_rate;
>   	unsigned long max_rate;
>   	struct hlist_node clks_node;
> +	unsigned int enable_count;
> +	unsigned int prepare_count;
>   };
>   
>   /***           locking             ***/
> @@ -600,6 +602,9 @@ void clk_unprepare(struct clk *clk)
>   		return;
>   
>   	clk_prepare_lock();
> +	if (WARN_ON(clk->prepare_count == 0))
Isn't clk_prepare_unlock()call missing here before return?
> +		return;
> +	clk->prepare_count--;
>   	clk_core_unprepare(clk->core);
>   	clk_prepare_unlock();
>   }
> @@ -657,6 +662,7 @@ int clk_prepare(struct clk *clk)
>   		return 0;
>   
>   	clk_prepare_lock();
> +	clk->prepare_count++;
>   	ret = clk_core_prepare(clk->core);
>   	clk_prepare_unlock();
>   
> @@ -707,6 +713,9 @@ void clk_disable(struct clk *clk)
>   		return;
>   
>   	flags = clk_enable_lock();
> +	if (WARN_ON(clk->enable_count == 0))
Ditto.
> +		return;
> +	clk->enable_count--;
>   	clk_core_disable(clk->core);
>   	clk_enable_unlock(flags);
>   }

Regards,
Maxime
