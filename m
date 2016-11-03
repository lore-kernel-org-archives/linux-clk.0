Return-Path: <rnayak@codeaurora.org>
Message-ID: <581AF4CE.4050000@codeaurora.org>
Date: Thu, 03 Nov 2016 13:56:54 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 tdas@codeaurora.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/7] clk: qcom: Mark a few branch clocks with BRANCH_HALT_DELAY
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org> <1476876523-27378-2-git-send-email-rnayak@codeaurora.org> <20161102203950.GK16026@codeaurora.org>
In-Reply-To: <20161102203950.GK16026@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>


On 11/03/2016 02:09 AM, Stephen Boyd wrote:
> On 10/19, Rajendra Nayak wrote:
>> We seem to have a few branch clocks within gcc for msm8996 which do
>> have a valid halt bit but can't be used to check branch enable/disable
>> status as they rely on external clocks in some cases and in some 
>> others only toggle during an ongoing bus transaction.
>> Mark these with BRANCH_HALT_DELAY, so we just add a delay instead.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
> 
> Srini tells me that if the pcie pipe clocks are enabled after the
> phy is powered up things work fine and the halt bit checks work.
> So I don't think we need this patch. Probably the drivers are
> enabling all their clocks at probe instead of understanding that
> the phy is outputting a clock that goes into gcc to be gated and
> then back out into their controller and/or phy.

Sure, I will take a look to see if the usb and ufs clocks show the
same behavior, in which case we won't need this patch.

> 
> Also, note that these clocks have parents that should be
> populated by the phys, but so far we haven't done that. That
> should be fixed as well.
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
