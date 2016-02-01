Return-Path: <robh@kernel.org>
Date: Mon, 1 Feb 2016 09:02:18 -0600
From: Rob Herring <robh@kernel.org>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	maxime.ripard@free-electrons.com, linux@arm.linux.org.uk,
	emilio@elopez.com.ar, jenskuske@gmail.com, hdegoede@redhat.com,
	wens@csie.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, patchesrdh@mveas.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/14] clk: sunxi: Add apb0 gates for A83T
Message-ID: <20160201150218.GA4290@rob-hp-laptop>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-3-git-send-email-vishnupatekar0510@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1454203266-4450-3-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jan 31, 2016 at 09:20:54AM +0800, Vishnu Patekar wrote:
> APB0 is part of PRCM, and is compatible with earlier SOCs.
> apb0 gates controls R_PIO, R_UART, R_RSB, etc clocks.
> This patch adds support for APB0 gates for A83T.
> 
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt | 1 +
>  drivers/clk/sunxi/clk-simple-gates.c              | 2 ++
>  2 files changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
