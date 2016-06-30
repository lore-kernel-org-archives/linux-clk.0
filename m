Return-Path: <sboyd@codeaurora.org>
Date: Thu, 30 Jun 2016 12:27:39 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	Simran Rai <ssimran@broadcom.com>
Subject: Re: [PATCH 05/34] clk: bcm: iproc: Migrate to clk_hw based
 registration and OF APIs
Message-ID: <20160630192739.GR1521@codeaurora.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org>
 <20160601231533.9354-6-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160601231533.9354-6-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/01, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
> 
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> Cc: Simran Rai <ssimran@broadcom.com>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
