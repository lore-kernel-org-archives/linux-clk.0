Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40122 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965235AbcKOFK6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2016 00:10:58 -0500
Subject: Re: [PATCH v7 04/14] ARM: dts: Add xo_clock to sdhc nodes on qcom
 platforms
To: Stephen Boyd <sboyd@codeaurora.org>, adrian.hunter@intel.com,
        andy.gross@linaro.org
References: <1479103248-9491-1-git-send-email-riteshh@codeaurora.org>
 <1479103248-9491-5-git-send-email-riteshh@codeaurora.org>
 <20161114200115.GL5177@codeaurora.org>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, david.brown@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        kdorfman@codeaurora.org, david.griego@linaro.org,
        stummala@codeaurora.org, venkatg@codeaurora.org,
        rnayak@codeaurora.org, pramod.gurav@linaro.org
From: Ritesh Harjani <riteshh@codeaurora.org>
Message-ID: <fb846f30-1f23-4470-eb4f-6add4e02d5b2@codeaurora.org>
Date: Tue, 15 Nov 2016 10:40:49 +0530
MIME-Version: 1.0
In-Reply-To: <20161114200115.GL5177@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


On 11/15/2016 1:31 AM, Stephen Boyd wrote:
> On 11/14, Ritesh Harjani wrote:
>> Add xo_clock to sdhc clock node on all qcom platforms.
>>
>> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
>> ---
>>  arch/arm/boot/dts/qcom-apq8084.dtsi   | 14 ++++++++------
>>  arch/arm/boot/dts/qcom-msm8974.dtsi   | 14 ++++++++------
>>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 10 ++++++----
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi |  9 +++++----
>>  4 files changed, 27 insertions(+), 20 deletions(-)
>>
>
> Is there an update to
> Documentation/devicetree/bindings/mmc/sdhci-msm.txt as well?
Sure, I will update.
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
