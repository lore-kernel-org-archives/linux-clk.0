Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Jun 2017 18:02:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Baoyou Xie <xie.baoyou@sanechips.com.cn>,
	Xin Zhou <zhou.xin8@sanechips.com.cn>, Jun Nie <jun.nie@linaro.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] clk: zx296718: export I2S mux clocks
Message-ID: <20170620010258.GJ20170@codeaurora.org>
References: <1497709265-22944-1-git-send-email-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1497709265-22944-1-git-send-email-shawnguo@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/17, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> Export I2S mux clocks, so that device tree can refer to them for setting
> a better parent clock for I2S work clock.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
