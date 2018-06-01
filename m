Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rajendra Nayak <rnayak@codeaurora.org>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180323082616.10142-3-rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org,
 srinivas.kandagatla@linaro.org, Rajendra Nayak <rnayak@codeaurora.org>
References: <20180323082616.10142-1-rnayak@codeaurora.org>
 <20180323082616.10142-3-rnayak@codeaurora.org>
Message-ID: <152787639459.144038.8092997958450465845@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: Register the gdscs before the clocks
Date: Fri, 01 Jun 2018 11:06:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Rajendra Nayak (2018-03-23 01:26:15)
> We have atleast some instances of ALWAYS_ON gdscs, which need to
> be turned ON *before* some clocks within the gdsc domain marked
> with a CLK_IS_CRITICAL can be turned ON.
> To facilitate this sequence, register the GDCSs (and hence handle
> the ALWAYS_ON gdscs) before we register clocks (and handle the
> clocks marked as CLK_IS_CRITICAL)
> =

> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next
