Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 26 Jun 2017 14:40:58 -0500
From: Rob Herring <robh@kernel.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com,
	bjorn.andersson@linaro.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/3] mailbox: qcom: Add support for APCS clock
 controller
Message-ID: <20170626194058.43fttjvs23vxtuuu@rob-hp-laptop>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
 <20170623161533.20449-4-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170623161533.20449-4-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 23, 2017 at 07:15:33PM +0300, Georgi Djakov wrote:
> Add a driver for the APCS clock controller. It is part of the APCS
> hardware block, which among other things implements also a combined
> mux and half integer divider functionality. It can choose between a
> fixed-rate clock or the dedicated APCS (A53) PLL. The source and the
> divider can be set both at the same time.
> 
> This is required for enabling CPU frequency scaling on MSM8916-based
> platforms.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.txt     |   5 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mailbox/qcom-apcs-ipc-mailbox.c            | 122 +++++++++++++++++++++
>  2 files changed, 127 insertions(+)
