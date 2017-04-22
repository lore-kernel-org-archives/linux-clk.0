Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:03:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: mturquette@baylibre.com, lee.jones@linaro.org, xuwei5@hisilicon.com,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V3 1/2] clk: hi6220: Add the hi655x's pmic clock
Message-ID: <20170422020345.GB7065@codeaurora.org>
References: <1492449567-31399-1-git-send-email-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1492449567-31399-1-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 04/17, Daniel Lezcano wrote:
> The hi655x multi function device is a PMIC providing regulators.
> 
> The PMIC also provides a clock for the WiFi and the Bluetooth, let's implement
> this clock in order to add it in the hi655x MFD and allow proper wireless
> initialization.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
