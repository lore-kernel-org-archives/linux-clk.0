Return-Path: <robh@kernel.org>
Date: Mon, 1 Feb 2016 08:50:05 -0600
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
Subject: Re: [PATCH 05/14] clk: sunxi: Add APB1 clock for A83T
Message-ID: <20160201145005.GA29776@rob-hp-laptop>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-6-git-send-email-vishnupatekar0510@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1454203266-4450-6-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jan 31, 2016 at 09:20:57AM +0800, Vishnu Patekar wrote:
> APB1 is similar to sun4i-a10-apb0-clk, except different dividers.
> 
> This adds support for apb1 on A83T.
> 
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi/clk-sunxi.c                     | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
