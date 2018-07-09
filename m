Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <436cc6a3-7406-c695-7879-3b9d042262cc@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1529763567-13131-1-git-send-email-tdas@codeaurora.org>
 <1529763567-13131-4-git-send-email-tdas@codeaurora.org>
 <153109408562.143105.15954380130353645468@swboyd.mtv.corp.google.com>
 <10f87216-caa2-d523-e134-6cf3acd268a7@codeaurora.org>
 <153111701079.143105.13387458941681113476@swboyd.mtv.corp.google.com>
 <436cc6a3-7406-c695-7879-3b9d042262cc@codeaurora.org>
Message-ID: <153112184177.143105.15452587215679149679@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add display clock controller driver for SDM845
Date: Mon, 09 Jul 2018 00:37:21 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-07-09 00:07:21)
> =

> =

> On 7/9/2018 11:46 AM, Stephen Boyd wrote:
> >>
> >>   > Why is the nocache flag needed? Applies to all clks in this file.
> >>   >
> >>
> >> This flag is required for all RCGs whose PLLs are controlled outside t=
he
> >> clock controller. The display code would require the recalculated rate
> >> always.
> > =

> > Right. Why is the PLL controlled outside of the clock controller? The
> > rate should propagate upward to the PLL from here, so who's going
> > outside of that?
> > =

> The DSI0/1 PLL are not part of the display clock controller, but in the =

> display subsystem which are managed by the DRM drivers. When DRM drivers
> query for the rate clock driver should always return the non cached rates.

Why? Is the DSI PLL changing rate all the time, randomly, without going
through the clk APIs to do so?
