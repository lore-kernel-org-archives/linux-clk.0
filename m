Return-Path: <anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Mon, 30 Jul 2018 16:44:12 +0530
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk-owner@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: gdsc: Add support to enable/disable the
 clocks with GDSC
In-Reply-To: <153250153971.48062.18053635476867512394@swboyd.mtv.corp.google.com>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-2-git-send-email-anischal@codeaurora.org>
 <153111447519.143105.17241493270191899078@swboyd.mtv.corp.google.com>
 <6e53b7934af72e40e99a3d6afe54174f@codeaurora.org>
 <153250153971.48062.18053635476867512394@swboyd.mtv.corp.google.com>
Message-ID: <e881fd1f970d32d96a9780e8b6812e86@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-07-25 12:22, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-07-12 05:23:48)
>> On 2018-07-09 11:04, Stephen Boyd wrote:
>> > Quoting Amit Nischal (2018-06-06 04:41:45)
>> >> For some of the GDSCs, there is a requirement to enable/disable the
>> >> few clocks before turning on/off the gdsc power domain. Add support
>> >
>> > Why is there a requirement? Do the clks need to be in hw control mode
>> > or
>> > they can't be turned off when the GDSC is off? It's hard for me to
>> > understand with these vague statements.
>> >
>> 
>> This requirement is primarily to turn on the GPU GX GDSC and these
>> clocks
>> do not need to be in HW control mode and clock disable is not related
>> with the GDSC.
> 
> Ok that's good to know.
> 
>> 
>> To turn on the GX GDSC, root clock (GFX3D RCG) needs to be enabled 
>> first
>> before writing to SW_COLLAPSE bit of the GDSC. The CLK_ON signal from
>> RCG
>> would power up the GPU GX GDSC.
> 
> Can you please put this specific information in the commit text instead
> of making a vague statement about GDSC hardware configurations?
> 
> Does anything go wrong if the GDSC is enabled from genpd but doesn't
> actually turn on until the GFX3D RCG root bit is enabled or disabled by
> the clk enable call? I suppose we won't know if the GDSC is enabled or
> not until the clk is enabled? Maybe we should make the clk enable of 
> the
> RCG for GPU go check the GDSC status bit as well to make sure it's
> toggling on or off?

As per the current design, before turning on the GDSC(writing to the 
GDSCR
register) we are setting the ROOT_EN bit of RCG and GDSC's status will 
be
still off without clk_enable call to RCG even though we enable the GDSC.
clk_enable for RCG is CLK_ON signal for the GPU_GX_GDSC.

> 
> Also, does the RCG turn on when the GX GDSC is off? I think we may be
> able to rely on the GPU driver to "do the right thing" and enable the
> GPU CX GDSC first, then the RCG and branch for the GFX3D clk, and then
> the GPU GX GDSC for the core GPU logic. Then we don't need to do
> anything special in the GDSC code for this.

Its a GPU_GX_GDSC requirement to enable the RCG first and then GX_GDSC.
We want all of this sequence to be done by the GDSC driver so that 
client
only call for clk_apis for the clock branch. For clients, It will be
extra overhead to follow the below sequence.
GPU_CX_GDSC enable -> Enable RCG -> Enable GPU_GX_GDSC -> Enable Branch.
