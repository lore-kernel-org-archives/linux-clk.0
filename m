Return-Path: <sboyd@codeaurora.org>
Date: Tue, 23 Aug 2016 23:31:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v2 07/10] clk: qcom: Add support to enable FSM mode for
 votable alpha PLLs
Message-ID: <20160824063152.GY6502@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
 <1470904858-11930-8-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470904858-11930-8-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/11, Rajendra Nayak wrote:
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index f7c226a..6bf5abd 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -25,6 +25,14 @@
>  #include "reset.h"
>  #include "gdsc.h"
>  
> +#define PLL_LOCK_COUNT_SHIFT	8
> +#define PLL_LOCK_COUNT_MASK	0x3f
> +#define PLL_BIAS_COUNT_SHIFT	14
> +#define PLL_BIAS_COUNT_MASK	0x3f
> +#define PLL_VOTE_FSM_ENA	BIT(20)
> +#define PLL_DYN_FSM_ENA		BIT(20)
> +#define PLL_VOTE_FSM_RESET	BIT(21)

These appear but aren't deleted from anywhere else so I suspect
now we have two copies of these defines somewhere? Perhaps this
should go into common.h as well?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
