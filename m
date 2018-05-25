Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 25 May 2018 11:23:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org,
	srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v2 3/3] clk: qcom: mmcc-msm8996: leave all mmagic gdscs
 and clocks always enabled
Message-ID: <20180525182315.GG14924@minitux>
References: <20180323082616.10142-1-rnayak@codeaurora.org>
 <20180323082616.10142-4-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180323082616.10142-4-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri 23 Mar 01:26 PDT 2018, Rajendra Nayak wrote:

> There's no bus infrastructure today to handle all the mmagic bus
> clocks and GDSCs needed by all the multimedia blocks in msm8996, like
> mdss, video, camera and gpu. Mark all these clocks with a CLK_IS_CRITICAL
> and GDSCs with a ALWAYS_ON flag for now so they are left always enabled.
> This patch should be reverted at some point when we do have a bus driver
> to manage these clocks and GDSCs.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/gcc-msm8996.c  |  2 +-
>  drivers/clk/qcom/mmcc-msm8996.c | 22 +++++++++++-----------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index 5d7451209206..a414ffe906ec 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -3105,7 +3105,7 @@ static struct gdsc aggre0_noc_gdsc = {
>  		.name = "aggre0_noc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc hlos1_vote_aggre0_noc_gdsc = {
> diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
> index 66a2fa4ec93c..1a25ee4f3658 100644
> --- a/drivers/clk/qcom/mmcc-msm8996.c
> +++ b/drivers/clk/qcom/mmcc-msm8996.c
> @@ -1245,7 +1245,7 @@ static struct clk_branch mmss_mmagic_ahb_clk = {
>  			.name = "mmss_mmagic_ahb_clk",
>  			.parent_names = (const char *[]){ "ahb_clk_src" },
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -1260,7 +1260,7 @@ static struct clk_branch mmss_mmagic_cfg_ahb_clk = {
>  			.name = "mmss_mmagic_cfg_ahb_clk",
>  			.parent_names = (const char *[]){ "ahb_clk_src" },
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -1319,7 +1319,7 @@ static struct clk_branch mmagic_camss_axi_clk = {
>  			.name = "mmagic_camss_axi_clk",
>  			.parent_names = (const char *[]){ "axi_clk_src" },
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -1334,7 +1334,7 @@ static struct clk_branch mmagic_camss_noc_cfg_ahb_clk = {
>  			.name = "mmagic_camss_noc_cfg_ahb_clk",
>  			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -1439,7 +1439,7 @@ static struct clk_branch mmagic_mdss_axi_clk = {
>  			.name = "mmagic_mdss_axi_clk",
>  			.parent_names = (const char *[]){ "axi_clk_src" },
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -1454,7 +1454,7 @@ static struct clk_branch mmagic_mdss_noc_cfg_ahb_clk = {
>  			.name = "mmagic_mdss_noc_cfg_ahb_clk",
>  			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -1529,7 +1529,7 @@ static struct clk_branch mmagic_video_axi_clk = {
>  			.name = "mmagic_video_axi_clk",
>  			.parent_names = (const char *[]){ "axi_clk_src" },
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -1544,7 +1544,7 @@ static struct clk_branch mmagic_video_noc_cfg_ahb_clk = {
>  			.name = "mmagic_video_noc_cfg_ahb_clk",
>  			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -2919,7 +2919,7 @@ static struct gdsc mmagic_video_gdsc = {
>  		.name = "mmagic_video",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc mmagic_mdss_gdsc = {
> @@ -2929,7 +2929,7 @@ static struct gdsc mmagic_mdss_gdsc = {
>  		.name = "mmagic_mdss",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc mmagic_camss_gdsc = {
> @@ -2939,7 +2939,7 @@ static struct gdsc mmagic_camss_gdsc = {
>  		.name = "mmagic_camss",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc venus_gdsc = {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
