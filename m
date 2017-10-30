Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20171013115917.9318-1-linus.walleij@linaro.org>
References: <20171013115917.9318-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Oct 2017 15:20:26 +0100
Message-ID: <CACRpkda+e+m7LqdAjtQdTi52ysxpo-9ZDnWvx1jM1+w7oTcM-g@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] clk: qcom: Update DT bindings for the
 MSM8660/APQ8060 RPMCC
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Oct 13, 2017 at 1:59 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> These compatible strings need to be added to extend support
> for the RPM CC to cover MSM8660/APQ8060. We also need to add
> enumberators to the include file for a few clocks that were
> missing.
>
> Cc: devicetree@vger.kernel.org
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Move PLL4 last, and do not provide an enumerator for the
>   "active" variant, we don't do that on PLL4.
> ChangeLog v1->v2:
> - Collect Rob's ACK

Gentle ping on this patch.

Yours,
Linus Walleij
