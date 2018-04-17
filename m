Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1523263306-28665-3-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1523263306-28665-1-git-send-email-tdas@codeaurora.org>
 <1523263306-28665-3-git-send-email-tdas@codeaurora.org>
Message-ID: <152393841331.51482.3996291190437514316@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: gdsc: Add support to poll for higher timeout
 value
Date: Mon, 16 Apr 2018 21:13:33 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-04-09 01:41:45)
> From: Amit Nischal <anischal@codeaurora.org>
> =

> For some gdscs, it might take longer time up to 500us for updating their
> status. Update the timeout value for all GDSC polling status.
> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
