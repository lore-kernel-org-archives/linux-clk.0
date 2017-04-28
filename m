Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 28 Apr 2017 08:35:53 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5 v2] clk: qcom: Elaborate on "active" clocks in the
 RPM clock bindings
Message-ID: <20170428133553.pcyireh6atw7rlrw@rob-hp-laptop>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170419091326.11226-2-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 19, 2017 at 11:13:23AM +0200, Linus Walleij wrote:
> The concept of "active" clocks is just explained in a bried comment in the
> device driver, let's explain it a bit more in the device tree bindings
> so everyone understands this.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Reword slighty in accordance with Stephens feedback.
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

Despite my objections, you're just documenting what is already there.

Acked-by: Rob Herring <robh@kernel.org>
