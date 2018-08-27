Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <153504874119.28926.4197673432816461627@swboyd.mtv.corp.google.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1533952436-17221-1-git-send-email-tdas@codeaurora.org>
 <153455835372.28926.7641705907931269497@swboyd.mtv.corp.google.com>
 <693d9cf4-4a6f-feb5-0c3f-ded842bbdf0a@codeaurora.org>
 <2db97037-b5f1-9234-862c-fa483b8aeb62@codeaurora.org>
 <153486545785.28926.5289007760649251969@swboyd.mtv.corp.google.com>
 <4cda3c7e-3ac3-af97-6d9f-24dd5a4efa28@codeaurora.org>
 <153504874119.28926.4197673432816461627@swboyd.mtv.corp.google.com>
Message-ID: <153540388675.129321.14679244317392825384@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 0/2] clk: qcom: Add support for RCG to register for DFS
Date: Mon, 27 Aug 2018 14:04:46 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Stephen Boyd (2018-08-23 11:25:41)
> Quoting Taniya Das (2018-08-22 03:28:31)
> > =

> > > =

> > > Hmmmm. Ok. That won't work then. recalc_rate() better not try to
> > > populate the frequency table then or it will not work. So I suppose it
> > > needs to fallback to reading the registers and assuming the parent_ra=
te
> > > coming in is the actual frequency of it's parent until the frequency
> > > table pointer is non-NULL. Would that work?
> > > =

> > Yes that would work.
> =

> Ok.
> =

> > =

> > > BTW, does DFS switch parents without software knowing about it? =

> > DFS would not switch until a HW request is sent, but SW would be unware =

> > of the switch except the current_perf_state being updated with the =

> > requested level.
> > =

> > What
> > > happens in that case? Does the QUP driver make sure that the new pare=
nt
> > > of this RCG is properly enabled so that it can switch to it when need=
ed?
> > =

> > I am not sure if they poll for any of their QUP HW state to make sure =

> > the switch is complete.
> > =

> > > I'm still trying to understand this whole design. Who takes care of t=
he
> > > voltage requirements in this case? The QUP driver as well?
> > > =

> > =

> > When the QUP driver requires to switch to new performance level, the =

> > first request would be to set_rate()(QUP driver would get the list of =

> > supported frequencies using the clk_round_rate()) which in QCOM clock =

> > driver would take care of setting the required voltage for the new =

> > parent switch.
> =

> It would also make sure that the new parent is enabled if the QUP clk is
> enabled. That's another concern. Does the PLL turn on automatically when
> the RCG switches to it?
> =

> > Then the QUP driver would request the HW for a new perf switch which =

> > would result to a DFS switch for the QUP clocks.
> =

> It sounds like the QUP driver does half of the work via the clk APIs and
> then the other half through the DFS register. Maybe the QUP driver
> should be registering a clk as well for its DFS register so it can all
> be clk API calls here. Something to consider. Anyway, that's not
> important to this patch so here's the updated patch.

I've squashed this in and applied the patches.
