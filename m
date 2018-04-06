Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180327152518.31021-1-bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Imran Khan <kimran@codeaurora.org>,
 Joonwoo Park <joonwoop@codeaurora.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
References: <20180327152518.31021-1-bjorn.andersson@linaro.org>
Message-ID: <152304634949.94378.7962656957799041629@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: qcom: Add MSM8998 Global Clock Control (GCC) driver
Date: Fri, 06 Apr 2018 13:25:49 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Bjorn Andersson (2018-03-27 08:25:18)
> From: Joonwoo Park <joonwoop@codeaurora.org>
> =

> Add support for the global clock controller found on MSM8998
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> =

> Signed-off-by: Joonwoo Park <joonwoop@codeaurora.org>
> Signed-off-by: Imran Khan <kimran@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> [bjorn: Specify regs for alpha_plls, fix white spaces and add binding]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

The patch looks fine to me. I will apply it for v4.17+ though.
