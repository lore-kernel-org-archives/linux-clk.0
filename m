Return-Path: <tirupath@codeaurora.org>
Subject: Re: [PATCH V7 0/2] clk: qcom: spmi_pmic clock divider support
To: sboyd@codeaurora.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org,
 david.brown@linaro.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
References: <1511255465-3984-1-git-send-email-tirupath@codeaurora.org>
From: Tirupathi Reddy T <tirupath@codeaurora.org>
Message-ID: <5f23c889-da66-65da-a9ad-7d667e18e519@codeaurora.org>
Date: Mon, 4 Dec 2017 16:18:47 +0530
MIME-Version: 1.0
In-Reply-To: <1511255465-3984-1-git-send-email-tirupath@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

I have addressed the comments given on previous patch versions. Could 
you please review the patch series ?

Thanks

Tirupathi


On 11/21/2017 2:41 PM, Tirupathi Reddy wrote:
> The SPMI_PMIC clock divider driver configures the clkdiv modules present
> on Qualcomm Technologies, Inc. SPMI PMIC. This driver provides a clock
> interface for each clkdiv module and allows clock operations such as enable,
> disable, set_rate, recalc_rate and round_rate.
>
> Tirupathi Reddy (2):
>    clk: qcom: Add spmi_pmic clock divider support
>    dt-bindings: Add qcom spmi_pmic clock divider bindings
>
>   .../bindings/clock/qcom,spmi-pmic-div.txt          |  59 ++++
>   drivers/clk/qcom/Kconfig                           |   9 +
>   drivers/clk/qcom/Makefile                          |   1 +
>   drivers/clk/qcom/clk-spmi-pmic-div.c               | 302 +++++++++++++++++++++
>   4 files changed, 371 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,spmi-pmic-div.txt
>   create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c
>
