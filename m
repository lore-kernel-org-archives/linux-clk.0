Return-Path: <sboyd@codeaurora.org>
Date: Tue, 14 Nov 2017 15:49:22 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Johan Hovold <johan@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Tero Kristo <t-kristo@ti.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: fix legacy board-clock
 registration
Message-ID: <20171114234922.GE11955@codeaurora.org>
References: <20171111162929.11722-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171111162929.11722-1-johan@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/11, Johan Hovold wrote:
> Make sure to search only the child nodes of "/clocks", rather than the
> whole device-tree depth-first starting at "/clocks" when determining
> whether to register a fixed clock in the legacy board-clock registration
> helper.
> 
> Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
