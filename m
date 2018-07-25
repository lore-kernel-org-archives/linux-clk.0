Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1e6d9fc284c3c118203728867f504ec6@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk-owner@vger.kernel.org
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-3-git-send-email-anischal@codeaurora.org>
 <153111693472.143105.11303543263643845656@swboyd.mtv.corp.google.com>
 <1e6d9fc284c3c118203728867f504ec6@codeaurora.org>
Message-ID: <153250192252.48062.9210075387954345932@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/4] clk: qcom: Add clk_rcg2_gfx3d_ops for SDM845
Date: Tue, 24 Jul 2018 23:58:42 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-07-12 05:30:21)
> On 2018-07-09 11:45, Stephen Boyd wrote:
> > Quoting Amit Nischal (2018-06-06 04:41:46)
> >> To turn on the gpu_gx_gdsc, there is a hardware requirement to
> >> turn on the root clock (GFX3D RCG) first which would be the turn
> >> on signal for the gdsc along with the SW_COLLAPSE. As per the
> >> current implementation of clk_rcg2_shared_ops, it clears the
> >> root_enable bit in the enable() and set_rate() clock ops. But due
> >> to the above said requirement for GFX3D shared RCG, root_enable bit
> >> would be already set by gdsc driver and rcg2_shared_ops should not =

> >> clear
> >> the root unless the disable is called.
> >> =

> > =

> > It sounds like the GDSC enable is ANDed with the RCG's root enable
> > bit?
> =

> Here, the root clock (GFX3D RCG) needs to be enabled first before
> writing to SW_COLLAPSE bit of the GDSC. RCG's CLK_ON signal would
> power up the GDSC.
> =

> > Does the RCG need to be clocking for the GDSC to actually turn on?
> > Or is it purely that the enable bit is logically combined that way so
> > that if the RCG is parented to a PLL that's off the GDSC will still =

> > turn
> > on?
> > =

> =

> Yes, the RCG needs to be clocking for the GPU_GX GDSC to actually turn =

> on.

Cool, please add these details to the commit text.

> =

> >> Add support for the same by reusing the existing clk_rcg2_shared_ops
> >> and deriving "clk_rcg2_gfx3d_ops" clk_ops for GFX3D clock to
> >> take care of the root set/clear requirement.
> > =

> > Anyway, this patch will probably significantly change given that the =

> > RCG
> > is a glorified div-2 that muxes between a safe CXO speed and a
> > configurable PLL frequency. A lot of the logic can probably just be
> > hardcoded then.
> > =

> =

> Thanks for the suggestion.
> We are planning to introduce the "clk_rcg2_gfx3d_determine_rate" op =

> which will
> always return the best parent as =E2=80=98GPU_CC_PLL0_OUT_EVEN=E2=80=99 a=
nd best_parent
> rate equal to twice of the requested rate. With this approach frequency =

> table
> for rcg2 structure would not be required as all the supported =

> frequencies would
> be derived from the GPU_CC_PLL0_OUT_EVEN src with a divider of 2.
> =

> Also, we will add support to check the requested rate if falls within =

> allowed
> set_rate range. This will make sure that the source PLL would not go out =

> of
> the supported range. set_rate_range would be set by the GPUCC driver =

> with min/max
> value by calling below API.
> =

> clk_hw_set_rate_range(&gpu_cc_gx_gfx3d_clk_src.clkr.hw, 180000000, =

> 710000000)

Ok. Sounds good! Is the rate range call really needed? It can't be
determined in the PLL code with some table or avoided by making sure GPU
uses OPP table with only approved frequencies?
