Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1532343275-7027-2-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1532343275-7027-1-git-send-email-tdas@codeaurora.org>
 <1532343275-7027-2-git-send-email-tdas@codeaurora.org>
Message-ID: <153264274182.48062.5474788613503562604@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5] clk: qcom: Add display clock controller driver for SDM845
Date: Thu, 26 Jul 2018 15:05:41 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-07-23 03:54:35)
> Add support for the display clock controller found on SDM845
> based devices. This would allow display drivers to probe and
> control their clocks.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

This is fine to merge as long as you're ok with removing the no rate
cache flag. I can do that myself so you don't have to resend.
