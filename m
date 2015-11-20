Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 13:14:52 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Simon Arlott <simon@fire.lp0.eu>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] clk: qcom: Specify LE device endianness
Message-ID: <20151120211452.GB9555@codeaurora.org>
References: <1447108254-19864-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447108254-19864-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/09, Stephen Boyd wrote:
> All these clock controllers are little endian devices, but so far
> we've been relying on the regmap mmio bus handling this for us
> without explicitly stating that fact. After commit 4a98da2164cf
> (regmap-mmio: Use native endianness for read/write, 2015-10-29),
> the regmap mmio bus will read/write with the __raw_*() IO
> accessors, instead of using the readl/writel() APIs that do
> proper byte swapping for little endian devices.
> 
> So if we're running on a big endian processor and haven't
> specified the endianness explicitly in the regmap config or in
> DT, we're going to switch from doing little endian byte swapping
> to big endian accesses without byte swapping, leading to some
> confusing results. On my apq8074 dragonboard, this causes the
> device to fail to boot as we access the clock controller with
> big endian IO accesses even though the device is little endian.
> 
> Specify the endianness explicitly so that the regmap core
> properly byte swaps the accesses for us.
> 
> Reported-by: Kevin Hilman <khilman@linaro.org>
> Cc: Simon Arlott <simon@fire.lp0.eu>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
