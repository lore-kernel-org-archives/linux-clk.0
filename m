Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1523254493-5313-4-git-send-email-anischal@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Nischal <anischal@codeaurora.org>
References: <1523254493-5313-1-git-send-email-anischal@codeaurora.org>
 <1523254493-5313-4-git-send-email-anischal@codeaurora.org>
Message-ID: <152393982109.51482.13041572239300086606@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 3/3] clk: qcom: Add Global Clock controller (GCC) driver for
 SDM845
Date: Mon, 16 Apr 2018 21:37:01 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-04-08 23:14:53)
> From: Taniya Das <tdas@codeaurora.org>
> =

> Add support for the global clock controller found on SDM845
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> ---

I think my review comments on v3 still apply to v4.
