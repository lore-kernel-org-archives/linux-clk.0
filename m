Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1522665945-28147-3-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1522665945-28147-1-git-send-email-tdas@codeaurora.org>
 <1522665945-28147-3-git-send-email-tdas@codeaurora.org>
Message-ID: <152297065260.143116.4250583205921081457@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/3] clk: qcom: gdsc: Add support to poll for higher timeout value
Date: Thu, 05 Apr 2018 16:24:12 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-04-02 03:45:44)
> From: Amit Nischal <anischal@codeaurora.org>
> =

> For some gdscs, it might take longer time up to 500us for
> updating their status. So add support for the same by
> defining a new flag 'GDS_TIMEOUT' to mark such gdsc in
> order to poll their status for longer timeout value.
> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Let's just increase the timeout to 500 if it's required? This is a
timeout, so we're not really expecting to hit it anyway so optimizing
the uncommon case is not useful.
