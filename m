Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 28 Mar 2017 19:59:43 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: Elaborate on "active" clocks in the RPM
 clock bindings
Message-ID: <20170329005943.xqs6ouqbqwdzaayf@rob-hp-laptop>
References: <20170322081842.20495-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170322081842.20495-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 22, 2017 at 09:18:42AM +0100, Linus Walleij wrote:
> The concept of "active" clocks is just explained in a bried comment in the
> device driver, let's explain it a bit more in the device tree bindings
> so everyone understands this.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index d470a0187035..cf80a00b7ff2 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -18,6 +18,14 @@ Required properties :
>  
>  - #clock-cells : shall contain 1
>  
> +The clock enumerators are defined in <dt-bindings/clock/qcom,rpmcc.h>
> +and come in pairs: FOO_CLK followed by FOO_A_CLK. The latter clock
> +is an "active" clock, which means that the consumer only care that the
> +clock is available when the system is active, i.e. not suspended. If
> +it is important that the clock keeps running during system suspend,
> +you need to specify the non-active clock, the one not containing
> +*_A_* in the enumerator name.
> +

Sounds like abuse as the clock id is encoding policy into it. The number 
of clocks should be the number of inputs to a block. I wouldn't be 
opposed to some flags for clocks, but that should be a separate cell.

Rob
