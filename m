Return-Path: <sboyd@codeaurora.org>
Date: Tue, 26 Dec 2017 17:38:58 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFC PATCH V1 1/2] clk: use atomic runtime pm api in
 clk_core_is_enabled
Message-ID: <20171227013858.GW7997@codeaurora.org>
References: <1513935965-12909-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1513935965-12909-1-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/22, Dong Aisheng wrote:
> Current clk_pm_runtime_put is using pm_runtime_put_sync which
> is not safe to be called in clk_core_is_enabled as it should
> be able to run in atomic context.
> 
> Thus use pm_runtime_put instead which is atomic safe.
> 
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: 9a34b45397e5 ("clk: Add support for runtime PM")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
