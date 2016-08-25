Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 17:40:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH] clk: h8300: Migrate to clk_hw based registration APIs
Message-ID: <20160825004022.GJ19826@codeaurora.org>
References: <20160816223757.726-1-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160816223757.726-1-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/16, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: <uclinux-h8-devel@lists.sourceforge.jp>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
