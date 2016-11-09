Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40194 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751157AbcKILzi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Nov 2016 06:55:38 -0500
Subject: Re: [PATCH v6 04/14] mmc: sdhci-msm: Change poor style writel/readl
 of registers
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1478517877-23733-1-git-send-email-riteshh@codeaurora.org>
 <1478517877-23733-5-git-send-email-riteshh@codeaurora.org>
 <20161108230724.GO16026@codeaurora.org>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, shawn.lin@rock-chips.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        david.brown@linaro.org, andy.gross@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        kdorfman@codeaurora.org, david.griego@linaro.org,
        stummala@codeaurora.org, venkatg@codeaurora.org,
        rnayak@codeaurora.org, pramod.gurav@linaro.org
From: Ritesh Harjani <riteshh@codeaurora.org>
Message-ID: <4f889254-9c5b-b459-7566-1b8b1ff5cbd0@codeaurora.org>
Date: Wed, 9 Nov 2016 17:25:28 +0530
MIME-Version: 1.0
In-Reply-To: <20161108230724.GO16026@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 11/9/2016 4:37 AM, Stephen Boyd wrote:
> On 11/07, Ritesh Harjani wrote:
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 8ef44a2a..42f42aa 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -137,8 +137,9 @@ static int msm_config_cm_dll_phase(struct sdhci_host *host, u8 phase)
>>  	writel_relaxed(config, host->ioaddr + CORE_DLL_CONFIG);
>>
>>  	/* Set CK_OUT_EN bit of DLL_CONFIG register to 1. */
>> -	writel_relaxed((readl_relaxed(host->ioaddr + CORE_DLL_CONFIG)
>> -			| CORE_CK_OUT_EN), host->ioaddr + CORE_DLL_CONFIG);
>> +	config = readl_relaxed(host->ioaddr + CORE_DLL_CONFIG);
>> +	config |= CORE_CK_OUT_EN;
>> +	writel_relaxed(config, host->ioaddr + CORE_DLL_CONFIG);
>>
>>  	/* Wait until CK_OUT_EN bit of DLL_CONFIG register becomes '1' */
>>  	rc = msm_dll_poll_ck_out_en(host, 1);
>> @@ -305,6 +306,7 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>>  	struct mmc_host *mmc = host->mmc;
>>  	int wait_cnt = 50;
>>  	unsigned long flags;
>> +	u32 config = 0;
>
> It needs to be initialized?
No, will make it uninitialized.

>
>>
>>  	spin_lock_irqsave(&host->lock, flags);
>>
>> @@ -313,33 +315,40 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>>  	 * tuning is in progress. Keeping PWRSAVE ON may
>>  	 * turn off the clock.
>>  	 */
>> -	writel_relaxed((readl_relaxed(host->ioaddr + CORE_VENDOR_SPEC)
>> -			& ~CORE_CLK_PWRSAVE), host->ioaddr + CORE_VENDOR_SPEC);
>> +	config = readl_relaxed(host->ioaddr + CORE_VENDOR_SPEC);
>
> It's written here unconditionally though?
>
>> +	config &= ~CORE_CLK_PWRSAVE;
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
