Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 riku.voipio@linaro.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180312104945.3001-1-riku.voipio@linaro.org>
Cc: arnd@linaro.org, linux-arm-kernel@lists.infradead.org,
 Riku Voipio <riku.voipio@linaro.org>, John Stultz <john.stultz@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20180312104945.3001-1-riku.voipio@linaro.org>
Message-ID: <152149275385.242365.18026048344034278094@swboyd.mtv.corp.google.com>
Subject: Re: [RESEND PATCH] clk: enable hi655x common clk automatically
Date: Mon, 19 Mar 2018 13:52:33 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting riku.voipio@linaro.org (2018-03-12 03:49:45)
> From: Riku Voipio <riku.voipio@linaro.org>
> =

> Without COMMON_CLK_HI655X Wifi and bluetooth are non-functional on Hikey.
> As suggested by Arnd, enable the driver automatically when the parent
> driver is selected. With sensible defaults in place, we can leave other
> choices for EXPERT.
> =

> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Suggested-by: Arnd Bergmann <arnd@linaro.org>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---

Applied to clk-next
