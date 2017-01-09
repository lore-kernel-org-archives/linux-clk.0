Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH V2 1/2] clk: qcom: gdsc: Add support for gdscs with HW
 control
To: Sricharan R <sricharan@codeaurora.org>, sboyd@codeaurora.org,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 rnayak@codeaurora.org, stanimir.varbanov@linaro.org
References: <1479472107-18472-1-git-send-email-sricharan@codeaurora.org>
 <1479472107-18472-2-git-send-email-sricharan@codeaurora.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <a0fc11d9-49de-33d1-0cea-bed4e6b0765c@linaro.org>
Date: Mon, 9 Jan 2017 11:45:24 +0200
MIME-Version: 1.0
In-Reply-To: <1479472107-18472-2-git-send-email-sricharan@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi Sricharan,

On 11/18/2016 02:28 PM, Sricharan R wrote:
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> Some GDSCs might support a HW control mode, where in the power
> domain (gdsc) is brought in and out of low power state (while
> unsued) without any SW assistance, saving power.
> Such GDSCs can be configured in a HW control mode when powered on
> until they are explicitly requested to be powered off by software.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
> [V2] Fixed to take care of the return value of gdsc_hwctrl
> 
>  drivers/clk/qcom/gdsc.c | 19 +++++++++++++++++++
>  drivers/clk/qcom/gdsc.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index f12d7b2..57c7c1b 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -55,6 +55,13 @@ static int gdsc_is_enabled(struct gdsc *sc, unsigned int reg)
>  	return !!(val & PWR_ON_MASK);
>  }
>  
> +static int gdsc_hwctrl(struct gdsc *sc, bool en)
> +{
> +	u32 val = en ? HW_CONTROL_MASK : 0;
> +
> +	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
> +}
> +
>  static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>  {
>  	int ret;
> @@ -164,16 +171,28 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>  	 */
>  	udelay(1);
>  
> +	/* Turn on HW trigger mode if supported */
> +	if (sc->flags & HW_CTRL)
> +		return gdsc_hwctrl(sc, true);
> +
>  	return 0;
>  }
>  
>  static int gdsc_disable(struct generic_pm_domain *domain)
>  {
>  	struct gdsc *sc = domain_to_gdsc(domain);
> +	int ret;
>  
>  	if (sc->pwrsts == PWRSTS_ON)
>  		return gdsc_assert_reset(sc);
>  
> +	/* Turn off HW trigger mode if supported */
> +	if (sc->flags & HW_CTRL) {
> +		ret = gdsc_hwctrl(sc, false);

Looking in the downstream implementation the disabling of the hw control
bit shouldn't be enough.

After disabling hw control bit we must have a 1us delay and polling for
enabled PWR_ON bit with timeout of 100us, only then we should continue
with disabling the GDSC in software controlled mode.

-- 
regards,
Stan
