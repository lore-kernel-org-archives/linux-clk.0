Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 8 May 2017 11:40:11 -0500
From: Rob Herring <robh@kernel.org>
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org,
	linus.walleij@linaro.org, andy.gross@linaro.org,
	david.brown@linaro.org, catalin.marinas@arm.com,
	will.deacon@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	absahu@codeaurora.org, sjaganat@codeaurora.org,
	sricharan@codeaurora.org
Subject: Re: [PATCH v2 3/5] clk: qcom: ipq8074: Add Global Clock Controller
 support
Message-ID: <20170508164010.aoajie2udehhzduz@rob-hp-laptop>
References: <1493898841-20583-1-git-send-email-varada@codeaurora.org>
 <1493898841-20583-4-git-send-email-varada@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1493898841-20583-4-git-send-email-varada@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 04, 2017 at 05:23:59PM +0530, Varadarajan Narayanan wrote:
> From: Abhishek Sahu <absahu@codeaurora.org>
> 
> This patch adds support for the global clock controller found on
> the IPQ8074 based devices. This includes UART, I2C, SPI etc.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
>  drivers/clk/qcom/Kconfig                           |    9 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/gcc-ipq8074.c                     | 1032 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h       |  152 +++

For the binding,

Acked-by: Rob Herring <robh@kernel.org>

>  5 files changed, 1195 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-ipq8074.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq8074.h
