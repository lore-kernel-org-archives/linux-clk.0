Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Aug 2017 14:12:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, david.brown@linaro.org,
	rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 06/12] Clk: qcom: support for dynamic updating the PLL
Message-ID: <20170801211237.GM2146@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-7-git-send-email-absahu@codeaurora.org>
 <20170728183428.GH2146@codeaurora.org>
 <660f193a457e47a290356d377ef30cd2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <660f193a457e47a290356d377ef30cd2@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/30, Abhishek Sahu wrote:
> On 2017-07-29 00:04, Stephen Boyd wrote:
> >On 07/27, Abhishek Sahu wrote:
> >>Some of the Alpha PLL’s support dynamic update in which the
> >>frequency can be changed dynamically without turning off the PLL.
> >>
> >>This dynamic update requires the following sequence
> >>
> >>1. Write the desired values to pll_l_val and pll_alpha_val.
> >>2. Toggle pll_latch_input from low to high.
> >>3. Wait for pll_ack_latch to transition from low to high.
> >>   The new L and alpha values have been latched. It make
> >>   take some time for the PLL to fully settle with these
> >>   new values.
> >>4. Pull pll_latch_input low.
> >>
> >>Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >
> >I think Rajendra has a similar patch that was sent. Is this the
> >same? Can you please look on the list and find it and compare?
> 
>  Checked the list. Rajendra has two patches
> 
>  1. https://www.spinics.net/lists/linux-arm-msm/msg23349.html
> 
>  Yes my patch does the same thing with minor diffs.
>  My patch checks PLL_UPDATE_BYPASS and handles both
>  the cases. We can merge both the patches. I will check
>  with Rajendra and will work on this merge.

Ok.

> 
>  2. Following patch fixes different issue although flag name
>     is common.
> 
>  https://patchwork.kernel.org/patch/9662917/
> 
>  Shall I include this patch in my patch series but not
>  sure we can directly turn off the PLL inside the PLL
>  set rate operation since it will turn the PLL off for
>  all its users.
> 

Hopefully the users of a PLL that doesn't support dynamic rate
update can accept the fact that the clk will turn off while the
rate is reprogrammed. At least that seems to be true for Taniya
in that patch set. If it isn't true for your hardware, then don't
specify the flag? Or is the problem that you may not have the
flag set for certain PLLs that you're supporting?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
