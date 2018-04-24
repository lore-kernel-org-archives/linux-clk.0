Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 24 Apr 2018 09:31:52 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Add some missing gcc clks for msm8996
Message-ID: <20180424143152.kwnxzt7jyvga5hbi@rob-hp-laptop>
References: <20180418000926.4998-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180418000926.4998-1-bjorn.andersson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 17, 2018 at 05:09:26PM -0700, Bjorn Andersson wrote:
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> Add a few missing gcc clks for msm8996
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> [bjorn: omit aggre0_noc_qosgen_extref_clk]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> This patch was accompanied by one that allows the udelay to be defined per
> branch clock, used by the aggre0_noc_qosgen_extref_clk. I dropped this clock
> and the accompanying path in hope that we can get these clock in place.
> 
> Several of these clocks are needed by the MSS remoteproc driver.
> 
>  drivers/clk/qcom/gcc-msm8996.c               | 186 +++++++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8996.h |   9 ++
>  2 files changed, 195 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
