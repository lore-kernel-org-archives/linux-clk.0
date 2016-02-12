Return-Path: <robh@kernel.org>
Date: Fri, 12 Feb 2016 10:52:21 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: sunxi: Add support for A80 APBS clock
Message-ID: <20160212165221.GA14697@rob-hp-laptop>
References: <1455269475-8180-1-git-send-email-wens@csie.org>
 <1455269475-8180-2-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455269475-8180-2-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Feb 12, 2016 at 05:31:14PM +0800, Chen-Yu Tsai wrote:
> A80's APBS clock is not the same as the APB0 clock on A23. The A80's
> is a zero-based divider, while the A23's is a power-of-two divider.
> 
> Replace the CLK_OF_DECLARE version of sun8i-a23-apb0. This also extends
> the common setup function to take div clk flags.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi/clk-sun8i-apb0.c                | 23 ++++++++---------------
>  2 files changed, 9 insertions(+), 15 deletions(-)
