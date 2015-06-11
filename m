Return-Path: <gabriel.fernandez@st.com>
Message-ID: <55793ABB.5050302@st.com>
Date: Thu, 11 Jun 2015 09:37:31 +0200
From: Gabriel Fernandez <gabriel.fernandez@st.com>
MIME-Version: 1.0
To: <dinguyen@opensource.altera.com>, <sboyd@codeaurora.org>,
        <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 4/6] clk: st: make use of of_clk_parent_fill helper function
References: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com> <1433972965-24974-5-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1433972965-24974-5-git-send-email-dinguyen@opensource.altera.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi

Tested-by Gabriel Fernandez <gabriel.fernandez@st.com>

Best Regards.

On 06/10/2015 11:49 PM, dinguyen@opensource.altera.com wrote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>
> Use of_clk_parent_fill to fill in the parent clock names' array.
>
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
> ---
>   drivers/clk/st/clk-flexgen.c | 6 ++----
>   drivers/clk/st/clkgen-mux.c  | 7 ++-----
>   2 files changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
> index 657ca14..ed0696c 100644
> --- a/drivers/clk/st/clk-flexgen.c
> +++ b/drivers/clk/st/clk-flexgen.c
> @@ -243,7 +243,7 @@ static const char ** __init flexgen_get_parents(struct device_node *np,
>   						       int *num_parents)
>   {
>   	const char **parents;
> -	int nparents, i;
> +	int nparents;
>   
>   	nparents = of_clk_get_parent_count(np);
>   	if (WARN_ON(nparents <= 0))
> @@ -253,10 +253,8 @@ static const char ** __init flexgen_get_parents(struct device_node *np,
>   	if (!parents)
>   		return NULL;
>   
> -	for (i = 0; i < nparents; i++)
> -		parents[i] = of_clk_get_parent_name(np, i);
> +	*num_parents = of_clk_parent_fill(np, parents, nparents);
>   
> -	*num_parents = nparents;
>   	return parents;
>   }
>   
> diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
> index 4fbe6e0..b83654a 100644
> --- a/drivers/clk/st/clkgen-mux.c
> +++ b/drivers/clk/st/clkgen-mux.c
> @@ -24,7 +24,7 @@ static const char ** __init clkgen_mux_get_parents(struct device_node *np,
>   						       int *num_parents)
>   {
>   	const char **parents;
> -	int nparents, i;
> +	int nparents;
>   
>   	nparents = of_clk_get_parent_count(np);
>   	if (WARN_ON(nparents <= 0))
> @@ -34,10 +34,7 @@ static const char ** __init clkgen_mux_get_parents(struct device_node *np,
>   	if (!parents)
>   		return ERR_PTR(-ENOMEM);
>   
> -	for (i = 0; i < nparents; i++)
> -		parents[i] = of_clk_get_parent_name(np, i);
> -
> -	*num_parents = nparents;
> +	*num_parents = of_clk_parent_fill(np, parents, nparents);
>   	return parents;
>   }
>   
