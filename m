Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:18:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org, stanimir.varbanov@linaro.org
Subject: Re: [PATCH 1/3] clk: qcom: gdsc: Add support for gdscs with HW
 control
Message-ID: <20161102001834.GB16026@codeaurora.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
 <1477304297-5248-2-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477304297-5248-2-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/24, Sricharan R wrote:
> @@ -164,6 +171,10 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>  	 */
>  	udelay(1);
>  
> +	/* Turn on HW trigger mode if supported */
> +	if (sc->flags & HW_CTRL)
> +		gdsc_hwctrl(sc, true);
> +

It sounds like this will cause glitches if the hardware isn't
asserting their hw control bit by default? This has me concerned
that we can't just throw the hw control enable part into here,
because that bit doesn't live in the clock controller, instead it
lives in the hw block that is powered by the power domain?

Or does the power on reset value of that hw control signal
asserted? If that's true then we should be ok to force it into hw
control mode by default.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
