Return-Path: <khilman@deeprootsystems.com>
Return-Path: <khilman@deeprootsystems.com>
From: Kevin Hilman <khilman@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,  linux-arm-msm@vger.kernel.org,  Simon Arlott <simon@fire.lp0.eu>,  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] clk: qcom: Specify LE device endianness
References: <1447108254-19864-1-git-send-email-sboyd@codeaurora.org>
Date: Wed, 18 Nov 2015 13:55:45 -0800
In-Reply-To: <1447108254-19864-1-git-send-email-sboyd@codeaurora.org> (Stephen
	Boyd's message of "Mon, 9 Nov 2015 14:30:54 -0800")
Message-ID: <7h610zx99a.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

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

Tested-by: Kevin Hilman <khilman@linaro.org>

Verified that this patch on top of next-20151118 gets my 2 8x94 boards
booting again with big-endian kernel.

Kevin
