Return-Path: <anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Thu, 12 Jul 2018 18:00:21 +0530
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk-owner@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: Add clk_rcg2_gfx3d_ops for SDM845
In-Reply-To: <153111693472.143105.11303543263643845656@swboyd.mtv.corp.google.com>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-3-git-send-email-anischal@codeaurora.org>
 <153111693472.143105.11303543263643845656@swboyd.mtv.corp.google.com>
Message-ID: <1e6d9fc284c3c118203728867f504ec6@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-07-09 11:45, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-06-06 04:41:46)
>> To turn on the gpu_gx_gdsc, there is a hardware requirement to
>> turn on the root clock (GFX3D RCG) first which would be the turn
>> on signal for the gdsc along with the SW_COLLAPSE. As per the
>> current implementation of clk_rcg2_shared_ops, it clears the
>> root_enable bit in the enable() and set_rate() clock ops. But due
>> to the above said requirement for GFX3D shared RCG, root_enable bit
>> would be already set by gdsc driver and rcg2_shared_ops should not 
>> clear
>> the root unless the disable is called.
>> 
> 
> It sounds like the GDSC enable is ANDed with the RCG's root enable
> bit?

Here, the root clock (GFX3D RCG) needs to be enabled first before
writing to SW_COLLAPSE bit of the GDSC. RCG's CLK_ON signal would
power up the GDSC.

> Does the RCG need to be clocking for the GDSC to actually turn on?
> Or is it purely that the enable bit is logically combined that way so
> that if the RCG is parented to a PLL that's off the GDSC will still 
> turn
> on?
> 

Yes, the RCG needs to be clocking for the GPU_GX GDSC to actually turn 
on.

>> Add support for the same by reusing the existing clk_rcg2_shared_ops
>> and deriving "clk_rcg2_gfx3d_ops" clk_ops for GFX3D clock to
>> take care of the root set/clear requirement.
> 
> Anyway, this patch will probably significantly change given that the 
> RCG
> is a glorified div-2 that muxes between a safe CXO speed and a
> configurable PLL frequency. A lot of the logic can probably just be
> hardcoded then.
> 

Thanks for the suggestion.
We are planning to introduce the "clk_rcg2_gfx3d_determine_rate" op 
which will
always return the best parent as ‘GPU_CC_PLL0_OUT_EVEN’ and best_parent
rate equal to twice of the requested rate. With this approach frequency 
table
for rcg2 structure would not be required as all the supported 
frequencies would
be derived from the GPU_CC_PLL0_OUT_EVEN src with a divider of 2.

Also, we will add support to check the requested rate if falls within 
allowed
set_rate range. This will make sure that the source PLL would not go out 
of
the supported range. set_rate_range would be set by the GPUCC driver 
with min/max
value by calling below API.

clk_hw_set_rate_range(&gpu_cc_gx_gfx3d_clk_src.clkr.hw, 180000000, 
710000000)

>> 
>> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> 
> Patch looks sane.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
