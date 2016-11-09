Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 9 Nov 2016 12:26:34 -0600
From: Rob Herring <robh@kernel.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	mark.rutland@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 2/3] clk: qcom: Add support for RPM Clocks
Message-ID: <20161109182634.4ugdtcn26qrjrbqt@rob-hp-laptop>
References: <20161102155658.32203-1-georgi.djakov@linaro.org>
 <20161102155658.32203-3-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161102155658.32203-3-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Nov 02, 2016 at 05:56:57PM +0200, Georgi Djakov wrote:
> This adds initial support for clocks controlled by the Resource
> Power Manager (RPM) processor on some Qualcomm SoCs, which use
> the qcom_rpm driver to communicate with RPM.
> Such platforms are apq8064 and msm8960.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |   1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/Kconfig                           |  13 +
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/clk-rpm.c                         | 489 +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h             |  24 +
>  5 files changed, 528 insertions(+)
>  create mode 100644 drivers/clk/qcom/clk-rpm.c
