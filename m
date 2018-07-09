Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <288770be-a763-b287-f62a-72ab7616efdb@codeaurora.org>
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
 <153112184177.143105.15452587215679149679@swboyd.mtv.corp.google.com>
 <288770be-a763-b287-f62a-72ab7616efdb@codeaurora.org>
Message-ID: <153114876561.143105.465317097490450694@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add display clock controller driver for SDM845
Date: Mon, 09 Jul 2018 08:06:05 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-07-09 02:34:07)
> =

> =

> On 7/9/2018 1:07 PM, Stephen Boyd wrote:
> > Quoting Taniya Das (2018-07-09 00:07:21)
> >>
> >>
> >> On 7/9/2018 11:46 AM, Stephen Boyd wrote:
> >>>>
> >>>>    > Why is the nocache flag needed? Applies to all clks in this fil=
e.
> >>>>    >
> >>>>
> >>>> This flag is required for all RCGs whose PLLs are controlled outside=
 the
> >>>> clock controller. The display code would require the recalculated ra=
te
> >>>> always.
> >>>
> >>> Right. Why is the PLL controlled outside of the clock controller? The
> >>> rate should propagate upward to the PLL from here, so who's going
> >>> outside of that?
> >>>
> >> The DSI0/1 PLL are not part of the display clock controller, but in the
> >> display subsystem which are managed by the DRM drivers. When DRM drive=
rs
> >> query for the rate clock driver should always return the non cached ra=
tes.
> > =

> > Why? Is the DSI PLL changing rate all the time, randomly, without going
> > through the clk APIs to do so?
> >
> =

> Hmm, I am afraid I do not have an answer for this, but this was the =

> requirement to always return the non cached rates from the clock driver.
> =


Ok. Who knows about this requirement? Can we add someone from the
display driver to understand more?
