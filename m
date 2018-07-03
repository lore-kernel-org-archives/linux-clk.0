Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1528699095-17930-1-git-send-email-anischal@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Nischal <anischal@codeaurora.org>
References: <1528699095-17930-1-git-send-email-anischal@codeaurora.org>
Message-ID: <153063789182.143105.16360820917715643212@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3] clk: qcom: Enable clocks which needs to be always on for
 SDM845
Date: Tue, 03 Jul 2018 10:11:31 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-06-10 23:38:15)
> There are certain clocks which needs to be always enabled for system
> operation. Add support for the same by adding 'CLK_IS_CRITICAL' flag
> for such clocks.
> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> ---

Applied to clk-next
