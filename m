Return-Path: <daniel.lezcano@linaro.org>
Return-Path: <daniel.lezcano@linaro.org>
Date: Tue, 17 Apr 2018 10:50:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] ARM: timer-sp: Use of_clk_get_parent_count()
 instead of open coding
Message-ID: <20180417085020.GA7214@mai>
References: <1523364701-15383-1-git-send-email-geert+renesas@glider.be>
 <1523364701-15383-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1523364701-15383-3-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 10, 2018 at 02:51:38PM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "[PATCH v2 1/5] clk: Extract OF clock helpers in
> <linux/of_clk.h>".
> 
> v2:
>   - of_clk_get_parent_count() was moved to <linux/of_clk.h>,
>   - Dropped RFC, as a dummy is now available in the !CONFIG_COMMON_CLK
>     case.
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
