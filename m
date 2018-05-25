Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 25 May 2018 11:18:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org,
	srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v2 1/3] clk: qcom: gdsc: Add support for ALWAYS_ON gdscs
Message-ID: <20180525181815.GE14924@minitux>
References: <20180323082616.10142-1-rnayak@codeaurora.org>
 <20180323082616.10142-2-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180323082616.10142-2-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri 23 Mar 01:26 PDT 2018, Rajendra Nayak wrote:

> Some GDSCs might have software control to turn them off, but we might
> want to keep them enabled always, in some cases because of lack of
> support in kernel to handle a graceful turning off/on of such GDSCs.
> Most common instances would be the GDCSs which power up the noc/bus
> fabrics, which need bus drivers to handle them and atleast support for
> which is missing on all qcom SoCs.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/gdsc.c | 8 ++++++++
>  drivers/clk/qcom/gdsc.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index a4f3580587b7..15f4bb5efd68 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -291,6 +291,14 @@ static int gdsc_init(struct gdsc *sc)
>  	if ((sc->flags & VOTABLE) && on)
>  		gdsc_enable(&sc->pd);
>  
> +	/* If ALWAYS_ON GDSCs are not ON, turn them ON */
> +	if (sc->flags & ALWAYS_ON) {
> +		if (!on)
> +			gdsc_enable(&sc->pd);
> +		on = true;
> +		sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
> +	}
> +
>  	if (on || (sc->pwrsts & PWRSTS_RET))
>  		gdsc_force_mem_on(sc);
>  	else
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 39648348e5ec..7fd78cec7e5b 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -53,6 +53,7 @@ struct gdsc {
>  #define VOTABLE		BIT(0)
>  #define CLAMP_IO	BIT(1)
>  #define HW_CTRL		BIT(2)
> +#define ALWAYS_ON	BIT(3)
>  	struct reset_controller_dev	*rcdev;
>  	unsigned int			*resets;
>  	unsigned int			reset_count;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
