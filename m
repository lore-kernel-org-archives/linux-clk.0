Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 23 Aug 2016 13:09:37 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/3 v2] clk: versatile add DT bindings for the ICST CM
 variants
Message-ID: <20160823180937.GA4325@rob-hp-laptop>
References: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 22, 2016 at 11:19:32AM +0200, Linus Walleij wrote:
> The Integrator/AP and Integrator/CP core modules have special
> versions of the ICST525 interface hardcoding some bits. Create
> special compatible strings to identify these variants, also
> explain a bit what is going on.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix spelling mistakes.
> - Try to be less specific and more general about the ARM system
>   controllers so we do not need to edit the text again for the
>   next variant we discover.
> ---
>  .../devicetree/bindings/clock/arm-syscon-icst.txt  | 34 ++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
