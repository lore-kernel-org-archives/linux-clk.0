Return-Path: <absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 11 Dec 2017 11:56:56 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] Updates for QCOM Alpha PLL
In-Reply-To: <20171209001639.GA7997@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <20171207062331.GI4283@codeaurora.org>
 <0fc3e5cdf9d5778655f302868154aff6@codeaurora.org>
 <20171209001639.GA7997@codeaurora.org>
Message-ID: <7d231505ed928e7e377b854ebff2b40f@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2017-12-09 05:46, Stephen Boyd wrote:
> On 12/08, Abhishek Sahu wrote:
>> On 2017-12-07 11:53, Stephen Boyd wrote:
>> >On 09/28, Abhishek Sahu wrote:
>> >>This patch series does the miscellaneous changes in QCOM Alpha PLL
>> >>operation and structure to support other types of Alpha PLL’s.
>> >>
>> >>1. It adds the pll_type which will be used for determining all
>> >>   the properties of Alpha PLL.
>> >>2. It adds the support for Brammo and Huayra PLL’s for which
>> >>   the support is not available in existing alpha PLL code.
>> >>3. There won’t be any change in existing users of Alpha PLL’s
>> >>   since all the newly added code will be under flag for the default
>> >>   PLL operations.
>> >>
>> >
>> >Ok. I took a long look at this today. I rewrote a bunch of stuff.
>> 
>>  Thanks Stephen for reviewing the changes and making the code
>>  cleaner. I checked all the code changes and everything looks
>>  good. It will work for all of our requirement. I will check
>>  with other PLL users also once and then update the patch
>>  series with all your suggested code changes after complete
>>  testing.
> 
> Ok. Please don't resend. I've pushed out the branch to clk-next,
> and it can be adjusted if needed, or dropped and rewritten if
> something is totally busted.

  Thanks Stephen for your great help and support.
  It seems, we are getting the error in the following error with these
  patches because of missing EXPORT_SYMBOL_GPL for
  clk_alpha_pll_regs and clk_hw_is_enabled.


ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/mmcc-msm8996.ko] 
undefined!

ERROR: "clk_hw_is_enabled" [drivers/clk/qcom/clk-qcom.ko] undefined!

Caused by commits

   d1506b749e92 ("clk: qcom: support for alpha pll properties")
   e66a4d6d0081 ("clk: qcom: support for dynamic updating the PLL")
   301803e6013b ("clk: qcom: support Huayra type Alpha PLL")
