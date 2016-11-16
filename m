Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 16 Nov 2016 07:36:07 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: smd-rpm: Add msm8974 clocks
Message-ID: <20161116133607.p6w4qodal2rfoous@rob-hp-laptop>
References: <1479192844-1281-1-git-send-email-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479192844-1281-1-git-send-email-bjorn.andersson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 14, 2016 at 10:54:04PM -0800, Bjorn Andersson wrote:
> This adds all RPM based clocks for msm8974 except cxo and gfx3d_clk_src.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +
>  drivers/clk/qcom/clk-smd-rpm.c                     | 71 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h             | 40 +++++++++++-
>  3 files changed, 110 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
