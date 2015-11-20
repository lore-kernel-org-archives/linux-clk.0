Return-Path: <tyler.baker@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1447108254-19864-1-git-send-email-sboyd@codeaurora.org>
References: <1447108254-19864-1-git-send-email-sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 12:18:06 -0800
Message-ID: <CANMBJr7BugBZH189O51bfWc1v9jipp6onkZSMijD3Gv_idf7Pg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Specify LE device endianness
From: Tyler Baker <tyler.baker@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Simon Arlott <simon@fire.lp0.eu>,
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 9 November 2015 at 14:30, Stephen Boyd <sboyd@codeaurora.org> wrote:
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

Tested-by: Tyler Baker <tyler.baker@linaro.org>

The kernelci.org bot also reported boot failures[1] for the
apq8016-sbc in next-20151120 with CONFIG_CPU_BIG_ENDIAN=y enabled.
I've bisected the failure down to the same offending remap-mmio patch
listed above. I've confirmed this patch applied on top of
next-20151120 fixes the boot issue for the apq8016-sbc as well.

Any updates or comments on this patch? I'd like to see this fix in
linux-next, as it has been broken for over a week and could be masking
new issues.

Cheers,

Tyler

[1] http://kernelci.org/boot/all/job/next/kernel/next-20151120/
