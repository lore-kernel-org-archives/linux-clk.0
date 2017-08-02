Return-Path: <absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Wed, 02 Aug 2017 19:20:50 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, david.brown@linaro.org,
 rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC 06/12] Clk: qcom: support for dynamic updating the PLL
In-Reply-To: <20170801211237.GM2146@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-7-git-send-email-absahu@codeaurora.org>
 <20170728183428.GH2146@codeaurora.org>
 <660f193a457e47a290356d377ef30cd2@codeaurora.org>
 <20170801211237.GM2146@codeaurora.org>
Message-ID: <d5d68fc218a04e1bf427e63656a2bfcf@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2017-08-02 02:42, Stephen Boyd wrote:
> On 07/30, Abhishek Sahu wrote:
>> On 2017-07-29 00:04, Stephen Boyd wrote:
>> >On 07/27, Abhishek Sahu wrote:

>>  2. Following patch fixes different issue although flag name
>>     is common.
>> 
>>  https://patchwork.kernel.org/patch/9662917/
>> 
>>  Shall I include this patch in my patch series but not
>>  sure we can directly turn off the PLL inside the PLL
>>  set rate operation since it will turn the PLL off for
>>  all its users.
>> 
> 
> Hopefully the users of a PLL that doesn't support dynamic rate
> update can accept the fact that the clk will turn off while the
> rate is reprogrammed. At least that seems to be true for Taniya
> in that patch set. If it isn't true for your hardware, then don't
> specify the flag? Or is the problem that you may not have the
> flag set for certain PLLs that you're supporting?

  The turning off PLL will happen in case of flag is not set.
  The turning off PLL in set rate is unsafe. If this PLL
  is driving multiple RCG's and one of the RCG is changing the
  PLL frequency by its clk_set_rate with CLK_SET_RATE_PARENT,
  then all the RCG's clock will go off for some
  time and it may trigger crash/silent reboot.

  If the user is aware, then it can turn off the clock first,
  then do the set rate and then it can enable again. In
  PLL set_rate we can check if PLL is enabled and can
  return EBUSY error.
