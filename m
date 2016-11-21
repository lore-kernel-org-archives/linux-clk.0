Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 21 Nov 2016 10:18:08 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2] clk: qcom: smd-rpmcc: Add msm8974 clocks
Message-ID: <20161121161808.5kebw6r5lxnepqau@rob-hp-laptop>
References: <1479486805-21853-1-git-send-email-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479486805-21853-1-git-send-email-bjorn.andersson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Nov 18, 2016 at 08:33:25AM -0800, Bjorn Andersson wrote:
> This adds all RPM based clocks for msm8974, except cxo and
> gfx3d_clk_src.
> 
> Tested-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Fixed the screwed up indentation
> 
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/clk-smd-rpm.c                     | 71 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h             | 40 +++++++++++-
>  3 files changed, 110 insertions(+), 2 deletions(-)
