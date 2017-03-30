Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 30 Mar 2017 17:31:13 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Update DT bindings for MSM8660 LCC
Message-ID: <20170330223113.adnvw62boi5xtpu2@rob-hp-laptop>
References: <20170324082424.6143-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170324082424.6143-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Mar 24, 2017 at 09:24:24AM +0100, Linus Walleij wrote:
> This adds the right compatible string and header for the
> MSM8660 LCC and some new defines to the dt-bindings header.
> 
> Take this opportunity to spell out the acronym LPASS for
> Low-power Audio Subsystem.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,lcc.txt         |  5 +--
>  include/dt-bindings/clock/qcom,lcc-msm8660.h       | 40 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h

Acked-by: Rob Herring <robh@kernel.org>
