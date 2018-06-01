Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Andy Gross <andy.gross@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Brown <david.brown@linaro.org>, Manu Gautam <mgautam@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180524213735.12121-1-bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180524213735.12121-1-bjorn.andersson@linaro.org>
Message-ID: <152788092933.225090.134215386081948476@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: qcom: gcc-msm8996: Disable halt check on UFS clocks
Date: Fri, 01 Jun 2018 12:22:09 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Bjorn Andersson (2018-05-24 14:37:35)
> The halt check of the UFS symbol clocks always fails, as such probing
> UFS after clk_disable_unused always fails. This makes it impossible to
> boot a system with the UFS phy or UFS HCD drivers compiled as modules.
> =

> Follow SDM845 and disable the halt check on these clocks.
> =

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
