Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Dec 2016 15:34:14 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jun Nie <jun.nie@linaro.org>, Baoyou Xie <xie.baoyou@zte.com.cn>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 3/3] clk: zte: add audio clocks for zx296718
Message-ID: <20161221233414.GF8288@codeaurora.org>
References: <1481873207-22929-1-git-send-email-shawnguo@kernel.org>
 <1481873207-22929-4-git-send-email-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1481873207-22929-4-git-send-email-shawnguo@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/16, Shawn Guo wrote:
> From: Jun Nie <jun.nie@linaro.org>
> 
> The audio related clock support is missing from the existing zx296718
> clock driver.  Let's add it, so that the upstream ZX SPDIF driver can
> work for HDMI audio support.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next + I added static to some more structures.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
