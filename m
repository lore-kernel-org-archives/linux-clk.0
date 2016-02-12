Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Feb 2016 16:37:57 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 0/2] Add initial support for RPM clocks
Message-ID: <20160212003757.GD4847@codeaurora.org>
References: <1450182602-6996-1-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450182602-6996-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/15, Georgi Djakov wrote:
> 
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |   37 ++
>  drivers/clk/qcom/Kconfig                           |   29 ++
>  drivers/clk/qcom/Makefile                          |    2 +
>  drivers/clk/qcom/clk-rpm.c                         |  290 +++++++++++++
>  drivers/clk/qcom/clk-rpm.h                         |   71 ++++

Do we need this header file?

>  drivers/clk/qcom/clk-smd-rpm.c                     |  433 ++++++++++++++++++++
>  drivers/clk/qcom/clk-smd-rpm.h                     |  142 +++++++

And this one too?

>From what I can tell they're only going to be included by the
clk-rpm and clk-smd-rpm C files. We can also avoid exporting the
RPM ops then if we're going to make the C files into full blown
platform drivers.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
