Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <559E68A9.2020809@linaro.org>
Date: Thu, 09 Jul 2015 13:27:21 +0100
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
To: Georgi Djakov <georgi.djakov@linaro.org>, sboyd@codeaurora.org
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Add support for RPM Clocks
References: <1436444310-15108-1-git-send-email-georgi.djakov@linaro.org> <1436444310-15108-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1436444310-15108-2-git-send-email-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 09/07/15 13:18, Georgi Djakov wrote:
> This patch adds initial support for clocks controlled by the RPM
> (Resource Power Manager) processor found on some Qualcomm SoCs.
>
> The RPM is a dedicated hardware engine for managing the shared
> SoC resources in order to keep the lowest power profile. It
> communicates with other hardware subsystems via shared memory
> and accepts clock requests, aggregates the requests and turns
> the clocks on/off or scales them on demand.
>
> This work is based on the codeaurora.org driver:
> https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-rpm.c
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>   drivers/clk/qcom/Makefile  |    1 +
>   drivers/clk/qcom/clk-rpm.c |  164 ++++++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/qcom/clk-rpm.h |  137 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 302 insertions(+)
>   create mode 100644 drivers/clk/qcom/clk-rpm.c
>   create mode 100644 drivers/clk/qcom/clk-rpm.h
>
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 50b337a24a87..4d14a73ee4ed 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -8,6 +8,7 @@ clk-qcom-y += clk-rcg2.o
>   clk-qcom-y += clk-branch.o
>   clk-qcom-y += clk-regmap-divider.o
>   clk-qcom-y += clk-regmap-mux.o
> +clk-qcom-y += clk-rpm.o

Is this generic enough to be built by default. It will break builds on A 
family whose rpm clocks are not based on SMD.

IMO, this should be either renamed to clk-rpm-smd.* or only built with 
SOC's which support rpm-clks based on SMD.


>   clk-qcom-y += reset.o
>

