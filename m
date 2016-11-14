Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:35740 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933969AbcKNUBQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Nov 2016 15:01:16 -0500
Date: Mon, 14 Nov 2016 12:01:15 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, shawn.lin@rock-chips.com,
        andy.gross@linaro.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, david.brown@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        kdorfman@codeaurora.org, david.griego@linaro.org,
        stummala@codeaurora.org, venkatg@codeaurora.org,
        rnayak@codeaurora.org, pramod.gurav@linaro.org
Subject: Re: [PATCH v7 04/14] ARM: dts: Add xo_clock to sdhc nodes on qcom
 platforms
Message-ID: <20161114200115.GL5177@codeaurora.org>
References: <1479103248-9491-1-git-send-email-riteshh@codeaurora.org>
 <1479103248-9491-5-git-send-email-riteshh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479103248-9491-5-git-send-email-riteshh@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/14, Ritesh Harjani wrote:
> Add xo_clock to sdhc clock node on all qcom platforms.
> 
> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
> ---
>  arch/arm/boot/dts/qcom-apq8084.dtsi   | 14 ++++++++------
>  arch/arm/boot/dts/qcom-msm8974.dtsi   | 14 ++++++++------
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 10 ++++++----
>  arch/arm64/boot/dts/qcom/msm8996.dtsi |  9 +++++----
>  4 files changed, 27 insertions(+), 20 deletions(-)
> 

Is there an update to
Documentation/devicetree/bindings/mmc/sdhci-msm.txt as well?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
