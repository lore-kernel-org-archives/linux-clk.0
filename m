Return-Path: <sboyd@codeaurora.org>
Date: Fri, 8 Dec 2017 16:16:39 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] Updates for QCOM Alpha PLL
Message-ID: <20171209001639.GA7997@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <20171207062331.GI4283@codeaurora.org>
 <0fc3e5cdf9d5778655f302868154aff6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <0fc3e5cdf9d5778655f302868154aff6@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/08, Abhishek Sahu wrote:
> On 2017-12-07 11:53, Stephen Boyd wrote:
> >On 09/28, Abhishek Sahu wrote:
> >>This patch series does the miscellaneous changes in QCOM Alpha PLL
> >>operation and structure to support other types of Alpha PLL’s.
> >>
> >>1. It adds the pll_type which will be used for determining all
> >>   the properties of Alpha PLL.
> >>2. It adds the support for Brammo and Huayra PLL’s for which
> >>   the support is not available in existing alpha PLL code.
> >>3. There won’t be any change in existing users of Alpha PLL’s
> >>   since all the newly added code will be under flag for the default
> >>   PLL operations.
> >>
> >
> >Ok. I took a long look at this today. I rewrote a bunch of stuff.
> 
>  Thanks Stephen for reviewing the changes and making the code
>  cleaner. I checked all the code changes and everything looks
>  good. It will work for all of our requirement. I will check
>  with other PLL users also once and then update the patch
>  series with all your suggested code changes after complete
>  testing.

Ok. Please don't resend. I've pushed out the branch to clk-next,
and it can be adjusted if needed, or dropped and rewritten if
something is totally busted.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
