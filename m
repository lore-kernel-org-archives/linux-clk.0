Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 16:12:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Anders Berg <anders.berg@lsi.com>
Subject: Re: [PATCH 10/34] clk: axm5516: Migrate to clk_hw based OF and
 registration APIs
Message-ID: <20160824231232.GM19826@codeaurora.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org>
 <20160601231533.9354-11-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160601231533.9354-11-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/01, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs. Make thing simple by using the
> existing clk_hw array and implementing a custom DT clk provider
> get function to map the clk spec id to a clk_hw pointer.
> 
> Cc: Anders Berg <anders.berg@lsi.com>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
