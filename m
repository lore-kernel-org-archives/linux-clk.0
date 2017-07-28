Return-Path: <sboyd@codeaurora.org>
Date: Fri, 28 Jul 2017 10:55:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, david.brown@linaro.org,
	rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 01/12] clk: qcom: support for register offsets from rcg2
 clock node
Message-ID: <20170728175522.GF2146@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-2-git-send-email-absahu@codeaurora.org>
 <4b660d7f-17ba-e5a6-3f48-13eeb1d9f02c@codeaurora.org>
 <115a73ba35bd764b4842060bac1050b4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <115a73ba35bd764b4842060bac1050b4@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/28, Abhishek Sahu wrote:
> On 2017-07-28 00:14, Stephen Boyd wrote:
> >
> >It looks like the two UBI clks that messed this up don't have an MN
> >counter, so instead of doing this maddness, just add a flag like
> 
>  I have given example for one of the RCG. IPQ8074 have more clocks for
>  which the offsets are not continuous and some of the clocks have
>  mn counter also (NSS Crypto and PCIE AUX)
> 
>  GCC_NSS_UBI0_CMD_RCGR 0x1868100
>  GCC_NSS_UBI0_CFG_RCGR 0x1868108
>  GCC_NSS_UBI1_CMD_RCGR 0x1868120
>  GCC_NSS_UBI1_CFG_RCGR 0x1868128
> 
>  GCC_NSS_CRYPTO_CMD_RCGR 0x1868140
>  GCC_NSS_CRYPTO_CFG_RCGR 0x1868148
>  GCC_NSS_CRYPTO_M 0x186814C
>  GCC_NSS_CRYPTO_N 0x1868150
>  GCC_NSS_CRYPTO_D 0x1868154
> 
>  GCC_PCIE0_AUX_CMD_RCGR	0x1875020
>  GCC_PCIE0_AUX_CFG_RCGR	0x1875028
>  GCC_PCIE0_AUX_M 0x187502C
>  GCC_PCIE0_AUX_N 0x1875030
>  GCC_PCIE0_AUX_D 0x1875034
> 
>  GCC_PCIE0_AXI_CMD_RCGR 0x1875050
>  GCC_PCIE0_AXI_CFG_RCGR 0x1875058
> 
>  Similarly for PCIE1 also.

Wow. This is awful. Please make sure this never happens again. I
will go yell at someone as well.

> 
> >m_is_cfg and then make a rcg2_crmd() function that checks this flag and
> >returns cmd_rcg + CFG_REG or cmd_rgcr + M_REG depending on the flag. We
> 
>  The original idea was to make this generic so in future for all the
> cases
>  it will work. If we can make function and since some clocks have MN
>  counter, so could we make function for CMD reg itself instead of
> CFG reg.

I understand the idea. We don't want it to happen again in the
future though, so let's not make it easy to support in the future
with some register map thing. Hardware people should follow the
rules and stop messing with the register layout!

>  For this, pass cmd_rcgr as + 4 from GCC driver and when this flag
> is set
>  then do minus 4 for all CMD_REG
> 

Ok. That's a good solution.

Just to be clear, let's have a flag like 'cmd_reg_is_wrong' (feel
free to think of a better name) and then have the places where we
access CMD_REG subtract that by 4, again with some special
macro/function, and then have the IPQ gcc driver specify the
cmd_rcgr as the real register + 4. Then the other hardcoded
offsets can all be the same and the few places that we access
CMD_REG we can subtract 4 to get the true location. And put all
that under an ifdef in some macro, so that we don't care about
this problem at all if we're not compiling this broken hardware
driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
