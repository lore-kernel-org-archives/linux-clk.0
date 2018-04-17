Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1523263306-28665-2-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1523263306-28665-1-git-send-email-tdas@codeaurora.org>
 <1523263306-28665-2-git-send-email-tdas@codeaurora.org>
Message-ID: <152393840823.51482.16945634901639853060@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 1/3] clk: qcom: gdsc: Add support to reset AON and block reset
 logic
Date: Mon, 16 Apr 2018 21:13:28 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-04-09 01:41:44)
> From: Amit Nischal <anischal@codeaurora.org>
> =

> For some of the gdsc power domains, there could be need to reset the
> AON logic or assert/deassert the block control reset before removing
> the clamp_io. Add support for the same by introducing new flags
> SW_RESET and AON_RESET. Both SW reset and AON reset requires to be
> asserted for at least 1us before being de-asserted.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> ---

Applied to clk-next
