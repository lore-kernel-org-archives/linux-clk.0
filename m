Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <07e0321116993d27d6585bd1a186328d@codeaurora.org>
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
 <153250192252.48062.9210075387954345932@swboyd.mtv.corp.google.com>
 <07e0321116993d27d6585bd1a186328d@codeaurora.org>
Message-ID: <153324986956.10763.5124619734269160725@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/4] clk: qcom: Add clk_rcg2_gfx3d_ops for SDM845
Date: Thu, 02 Aug 2018 15:44:29 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-07-30 04:28:56)
> On 2018-07-25 12:28, Stephen Boyd wrote:
> > =

> > Ok. Sounds good! Is the rate range call really needed? It can't be
> > determined in the PLL code with some table or avoided by making sure =

> > GPU
> > uses OPP table with only approved frequencies?
> > =

> =

> Currently fabia PLL code does not have any table to check this and =

> intention
> was to avoid relying on the client to call set_rate with only approved
> frequencies so we have added the set_rate_range() call in the GPUCC =

> driver
> in order to set the rate range.
> =


But GPU will use OPP so it doesn't seem like it really buys us anything
here. And it really doesn't matter when the clk driver implementation
doesn't use the min/max to clamp the values of the round_rate() call. Is
that being done here? I need to double check. I would be more convinced
if the implementation was looking at min/max to constrain the rate
requested.
