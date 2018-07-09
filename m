Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1528285308-25477-3-git-send-email-anischal@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Nischal <anischal@codeaurora.org>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-3-git-send-email-anischal@codeaurora.org>
Message-ID: <153111693472.143105.11303543263643845656@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/4] clk: qcom: Add clk_rcg2_gfx3d_ops for SDM845
Date: Sun, 08 Jul 2018 23:15:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-06-06 04:41:46)
> To turn on the gpu_gx_gdsc, there is a hardware requirement to
> turn on the root clock (GFX3D RCG) first which would be the turn
> on signal for the gdsc along with the SW_COLLAPSE. As per the
> current implementation of clk_rcg2_shared_ops, it clears the
> root_enable bit in the enable() and set_rate() clock ops. But due
> to the above said requirement for GFX3D shared RCG, root_enable bit
> would be already set by gdsc driver and rcg2_shared_ops should not clear
> the root unless the disable is called.
> =


It sounds like the GDSC enable is ANDed with the RCG's root enable
bit? Does the RCG need to be clocking for the GDSC to actually turn on?
Or is it purely that the enable bit is logically combined that way so
that if the RCG is parented to a PLL that's off the GDSC will still turn
on?

> Add support for the same by reusing the existing clk_rcg2_shared_ops
> and deriving "clk_rcg2_gfx3d_ops" clk_ops for GFX3D clock to
> take care of the root set/clear requirement.

Anyway, this patch will probably significantly change given that the RCG
is a glorified div-2 that muxes between a safe CXO speed and a
configurable PLL frequency. A lot of the logic can probably just be
hardcoded then.

> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>

Patch looks sane.
