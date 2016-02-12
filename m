Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] Revert "clk: qcom: Specify LE device endianness"
References: <1455298060-15199-1-git-send-email-sboyd@codeaurora.org>
Date: Fri, 12 Feb 2016 14:21:12 -0800
In-Reply-To: <1455298060-15199-1-git-send-email-sboyd@codeaurora.org> (Stephen
	Boyd's message of "Fri, 12 Feb 2016 09:27:40 -0800")
Message-ID: <7hsi0xzi1z.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> This reverts commit 329cabcecf94d8d7821e729dda284ba9dec44c87.
>
> The commit that caused us to specify LE device endianness here,
> 29bb45f25ff3 (regmap-mmio: Use native endianness for read/write,
> 2015-10-29), has been reverted in mainline so now when we specify
> LE it actively breaks big endian kernels because the byte
> swapping in regmap-mmio is incorrect. Let's revert this change
> because it will 1) fix the big endian kernels and 2) be redundant
> to specify LE because that will become the default soon.
>
> Cc: Kevin Hilman <khilman@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Tested-by: Kevin Hilman <khilman@baylibre.com>

I verified that this gets apq8016-sbc booting again with mainline.

Kevin
