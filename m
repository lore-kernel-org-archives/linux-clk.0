Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
To: jassisinghbrar@gmail.com
Cc: sboyd@codeaurora.org, bjorn.andersson@linaro.org,
 mturquette@baylibre.com, robh@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <0c933015-158f-e4fc-a37c-195f7cbc8fad@linaro.org>
Date: Fri, 26 Jan 2018 16:30:32 +0200
MIME-Version: 1.0
In-Reply-To: <20171205154701.27730-1-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 12/05/2017 05:46 PM, Georgi Djakov wrote:
> This patchset adds support for the A53 CPU clock on MSM8916 platforms
> and allows scaling of the CPU frequency on msm8916 based platforms.
> 
> Changes since v10 (https://lkml.org/lkml/2017/12/1/577)
> * Addressed Bjorn's comments on APCS clock driver.
> * Picked Acks from Rob and Bjorn.
> 
[..]
> 
> Georgi Djakov (6):
>   mailbox: qcom: Convert APCS IPC driver to use regmap
>   mailbox: qcom: Create APCS child device for clock controller
>   clk: qcom: Add A53 PLL support
>   clk: qcom: Add regmap mux-div clocks support
>   dt-bindings: mailbox: qcom: Document the APCS clock binding
>   clk: qcom: Add APCS clock controller support
> 

Hi Jassi,

Do you want me to re-send the pending mailbox patches?

Thanks,
Georgi
