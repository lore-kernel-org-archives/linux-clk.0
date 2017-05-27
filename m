Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 27 May 2017 13:00:08 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5 v2] clk: qcom: Implement RPM clocks for
 MSM8660/APQ8060
Message-ID: <20170527200008.GM12920@tuxbook>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170419091326.11226-3-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed 19 Apr 02:13 PDT 2017, Linus Walleij wrote:

> The RPM clocks were missing for MSM8660/APQ8060. For this to be
> completed we need to add a special fixed rate RPM clock that is used
> for the PLL4 on these SoCs. The rest of the clocks are pretty
> similar to the other supported platforms.
> 
> The "active" clock pattern is mirrored in all the clocks. I guess
> that the PLL4 that clocks the LPASS is actually never used as
> "active only" since the low-power audio subsystem should be left
> on when the system suspends, so it can be used as a stand-alone
> MP3 player type of device.
> 
> As we do not have firmware for the LPASS we will probably only use
> this clock when the system is up and running (not suspended) for now,
> so that will be using the "active" clock.
> 

Note that "active" vs "sleep" is not related to the Linux suspend state,
but rather the CPU idle state; at the bottom of the CPU idle path the
RPM will react and reconfigure resources to their sleep state (if one is
configured) and then reconfigured based on the active state before
returning from the idle.

The PLL4 seems to be enabled only on behalf of the booting LPASS Hexagon
- which will cast its own vote once its booted - and as such we only
configure the active state (meaning both states will have same
configuration).  The result is that PLL4 will be on from prepare() to
unprepare() regardless of what the application CPU does.

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Add the small hunk to the clk_rpm_handoff() function that just
>   skip over this for the fixed PLL4 clock. This accidentally
>   ended up in another patch.
> ---
>  drivers/clk/qcom/clk-rpm.c | 106 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> index df3e5fe8442a..61c67e93bea3 100644
> --- a/drivers/clk/qcom/clk-rpm.c
> +++ b/drivers/clk/qcom/clk-rpm.c
> @@ -56,6 +56,30 @@
>  		},							      \
>  	}
>  
> +#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)	      \

Is there a reason why you don't use DEFINE_CLK_RPM_PXO_BRANCH() for
PLL4?

Looking at the downstream code PLL4 is explicitly handled differently
and is only exposing one state. So if you're seeing issues with reusing
the PXO_BRANCH() I think you should slim this down further and only
register a single clk_rpm from this.

> +	static struct clk_rpm _platform##_##_name = {			      \
> +		.rpm_clk_id = (r_id),					      \
> +		.rate = (r),						      \
> +		.hw.init = &(struct clk_init_data){			      \
> +			.ops = &clk_rpm_fixed_ops,			      \
> +			.name = #_name,					      \
> +			.parent_names = (const char *[]){ "pxo_board" },      \
> +			.num_parents = 1,				      \
> +		},							      \
> +	};								      \
> +	static struct clk_rpm _platform##_##_active = {			      \
> +		.rpm_clk_id = (r_id),					      \
> +		.peer = &_platform##_##_name,				      \
> +		.active_only = true,					      \
> +		.rate = (r),						      \
> +		.hw.init = &(struct clk_init_data){			      \
> +			.ops = &clk_rpm_fixed_ops,			      \
> +			.name = #_active,				      \
> +			.parent_names = (const char *[]){ "pxo_board" },      \
> +			.num_parents = 1,				      \
> +		},							      \
> +	}
> +
[..]
> @@ -348,6 +412,46 @@ static const struct clk_ops clk_rpm_branch_ops = {
>  	.recalc_rate	= clk_rpm_recalc_rate,
>  };
>  
> +/* MSM8660/APQ8060 */
> +DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);

My OCD wants this at the bottom of the list...

> +DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> +DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> +DEFINE_CLK_RPM(msm8660, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> +DEFINE_CLK_RPM(msm8660, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> +DEFINE_CLK_RPM(msm8660, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> +DEFINE_CLK_RPM(msm8660, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> +DEFINE_CLK_RPM(msm8660, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> +DEFINE_CLK_RPM(msm8660, smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
> +DEFINE_CLK_RPM(msm8660, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);

Regards,
Bjorn
