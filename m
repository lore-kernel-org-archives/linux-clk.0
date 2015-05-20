Return-Path: <sboyd@codeaurora.org>
Date: Tue, 19 May 2015 18:19:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Tero Kristo <t-kristo@ti.com>
Cc: mturquette@linaro.org, tony@atomide.com, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org, paul@pwsan.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 01/27] ARM: OMAP2+: clock: export driver API to
 setup/get clock features
Message-ID: <20150520011901.GB31054@codeaurora.org>
References: <1431334493-24455-1-git-send-email-t-kristo@ti.com>
 <1431334493-24455-2-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1431334493-24455-2-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/11, Tero Kristo wrote:
> +
> +/**
> + * ti_clk_get_features - get clock driver features flags
> + *
> + * Get TI clock driver features description. Returns a pointer
> + * to the current feature setup.
> + */
> +struct ti_clk_features *ti_clk_get_features(void)

Should this return a const pointer?

> +{
> +	return &ti_clk_features;
> +}
>  #endif

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
