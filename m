Return-Path: <absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Fri, 08 Dec 2017 21:25:07 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] Updates for QCOM Alpha PLL
In-Reply-To: <20171207062331.GI4283@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <20171207062331.GI4283@codeaurora.org>
Message-ID: <0fc3e5cdf9d5778655f302868154aff6@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2017-12-07 11:53, Stephen Boyd wrote:
> On 09/28, Abhishek Sahu wrote:
>> This patch series does the miscellaneous changes in QCOM Alpha PLL
>> operation and structure to support other types of Alpha PLL’s.
>> 
>> 1. It adds the pll_type which will be used for determining all
>>    the properties of Alpha PLL.
>> 2. It adds the support for Brammo and Huayra PLL’s for which
>>    the support is not available in existing alpha PLL code.
>> 3. There won’t be any change in existing users of Alpha PLL’s
>>    since all the newly added code will be under flag for the default
>>    PLL operations.
>> 
> 
> Ok. I took a long look at this today. I rewrote a bunch of stuff.

  Thanks Stephen for reviewing the changes and making the code
  cleaner. I checked all the code changes and everything looks
  good. It will work for all of our requirement. I will check
  with other PLL users also once and then update the patch
  series with all your suggested code changes after complete
  testing.

> Let me know if anything looks wrong. I'm not really interested in
> having a type template design that causes us to jump through one
> clk op to another set of them. I'd rather keep it flatter. I also
> kept around the macros for the offsets and had it use a register
> map in each struct instead. Yes, we have to go modify the PLL
> types to point to the right register offset, but really that's
> fine and I don't really care. We could have a default fallback
> when the reg pointer is NULL, but I'm not sure that is useful.

  The main reason for going with type template design is due to
  different register offsets. Now, if passing the register
  offsets from pll structure is ok, then we can get rid of this
  function indirection approach.

  Adding NULL check seems to be overhead in all our register macros
  since these PLL structure will be populated by QCOM clock drivers
  only and now, we are making this parameter mandatory.

> The alternative is to make a bunch of new ops structures that
> passes it down into the final functions but that seemed like more
> work for the handful of PLLs we have to worry about. You seem to
> agree here. All told, it got cut down by 100 lines so the patches
> got smaller.
> 

  Passing the ops into final function will be lead to again type
  template design for passing the register offsets. Since, now we
  have very few PLL's in current upstream code so adding register
  offsets will be more convenient and maintainable.

  Also, now the register offset is coming from our own array
  so always we can retrieve the PLL type from that. In future,
  if someone want to have code which requires PLL type then,
  it can be retrieved from diff of passed pll structure
  address and array base address.


  Thanks,
  Abhishek
