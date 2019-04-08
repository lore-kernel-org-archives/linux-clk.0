Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD3DC282CE
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 09:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E741720883
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 09:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Rf0rlXn6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfDHJTT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:19:19 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15756 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfDHJTT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 05:19:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cab11f80004>; Mon, 08 Apr 2019 02:18:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 08 Apr 2019 02:19:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 08 Apr 2019 02:19:03 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Apr
 2019 07:52:40 +0000
Subject: Re: [PATCH 2/8] clk: tegra: clock changes for emc scaling support on
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-3-josephl@nvidia.com> <20190403092250.GG5238@ulmo>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <104f44ba-cd61-44a5-6c31-2b0af91c7b44@nvidia.com>
Date:   Mon, 8 Apr 2019 15:52:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190403092250.GG5238@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1554715143; bh=pq2jwFDgmKhZyPfpio6iOrVYAHUNMFhddU6plIV4Fok=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Rf0rlXn6G50CHv6ekvavJy/zaS2jpdJYDZyftIpLZHFKv0vxdJIMeOjMSEmNm+nqN
         9VjI/sCjkp0qLqR6ShuNPhBkT8dkHGsY7zCh7EqfF8agISVMl4+3xPUStgToPX4t+T
         X6fKxfX9arIfgNqoY4KkXli3UaUQQUBUFpldlAeXW60OVrbDWnoLM2fRQZ3kemSbXS
         JGAC2Pe/AJ0vXrnFYzgIaSFxsV5Nzh/t+KEgKhepTvA/l4Z4a0e2gDkDJw8Oj1TbY8
         7lqnCWHFIPpf5NfJ2c26rWtqXD2TvmzfZ0VnHpDj4dD9LRI3DVWC8qfEDKxmRbKu6L
         tLBoJndE/XHGQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/3/19 5:22 PM, Thierry Reding wrote:
> On Mon, Mar 25, 2019 at 03:45:17PM +0800, Joseph Lo wrote:
>> 1) Introduce low jitter paths for pllp and pll_mb used by the EMC driver.
>> 2) Remove the old emc_mux clock and don't use the common EMC clock
>>     definition. This will be replaced by a new clock defined in the EMC
>>     driver.
>> 3) Export functions to allow accessing the CAR register required for EMC
>>     clock scaling. These functions will be used to access the CAR register
>>     as part of the scaling sequence.
> 
> The fact that you can enumerate 3 logical changes made by this commit
> indicates that it should be split up into smaller patches.

Okay, will do.

> 
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra210.c         | 112 +++++++++++++++++++----
>>   include/dt-bindings/clock/tegra210-car.h |   4 +-
>>   include/linux/clk/tegra.h                |   5 +
>>   3 files changed, 103 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>> index 7545af763d7a..e17b5279ea69 100644
>> --- a/drivers/clk/tegra/clk-tegra210.c
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -47,6 +47,7 @@
>>   #define CLK_SOURCE_LA 0x1f8
>>   #define CLK_SOURCE_SDMMC2 0x154
>>   #define CLK_SOURCE_SDMMC4 0x164
>> +#define CLK_SOURCE_EMC_DLL 0x664
>>   
>>   #define PLLC_BASE 0x80
>>   #define PLLC_OUT 0x84
>> @@ -234,6 +235,10 @@
>>   #define RST_DFLL_DVCO 0x2f4
>>   #define DVFS_DFLL_RESET_SHIFT 0
>>   
>> +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
>> +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
>> +#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
>> +
>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>   
>> @@ -319,12 +324,6 @@ static unsigned long tegra210_input_freq[] = {
>>   	[8] = 12000000,
>>   };
>>   
>> -static const char *mux_pllmcp_clkm[] = {
>> -	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
>> -	"pll_p",
>> -};
>> -#define mux_pllmcp_clkm_idx NULL
>> -
>>   #define PLL_ENABLE			(1 << 30)
>>   
>>   #define PLLCX_MISC1_IDDQ		(1 << 27)
>> @@ -2310,7 +2309,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
>>   	[tegra_clk_i2c2] = { .dt_id = TEGRA210_CLK_I2C2, .present = true },
>>   	[tegra_clk_uartc_8] = { .dt_id = TEGRA210_CLK_UARTC, .present = true },
>>   	[tegra_clk_mipi_cal] = { .dt_id = TEGRA210_CLK_MIPI_CAL, .present = true },
>> -	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = true },
>> +	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = false },
>>   	[tegra_clk_usb2] = { .dt_id = TEGRA210_CLK_USB2, .present = true },
>>   	[tegra_clk_bsev] = { .dt_id = TEGRA210_CLK_BSEV, .present = true },
>>   	[tegra_clk_uartd_8] = { .dt_id = TEGRA210_CLK_UARTD, .present = true },
>> @@ -2921,6 +2920,82 @@ static int tegra210_init_pllu(void)
>>   	return 0;
>>   }
>>   
>> +void tegra210_clk_emc_dll_enable(bool flag)
>> +{
>> +	unsigned long flags = 0;
>> +	u32 offset = flag ? CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET :
>> +		     CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR;
>> +
>> +	spin_lock_irqsave(&emc_lock, flags);
>> +
>> +	writel_relaxed(CLK_OUT_ENB_X_CLK_ENB_EMC_DLL, clk_base + offset);
>> +	readl(clk_base + offset);
>> +
>> +	spin_unlock_irqrestore(&emc_lock, flags);
>> +}
>> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_enable);
>> +
>> +void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value)
> 
> Do we really want to pass the whole register value through this
> function? The register has three fields, so perhaps it's safer to pass
> the fields individually? Or perhaps we only need to modify a subset of
> the fields and can reduce the number of parameters we pass? Letting a
> different driver pass any arbitrary value here takes away any means of
> checking for validity.

The emc table has a property for this register. So the scaling sequence 
will update the register with the value in the table.

> 
>> +{
>> +	unsigned long flags = 0;
>> +
>> +	spin_lock_irqsave(&emc_lock, flags);
>> +
>> +	writel_relaxed(emc_dll_src_value, clk_base + CLK_SOURCE_EMC_DLL);
>> +	readl(clk_base + CLK_SOURCE_EMC_DLL);
> 
> Could we not just use a writel() here and do away with the flushing
> readl()?
Will try that.

> 
> Also, it doesn't look like that spinlock actually protects anything.
> You're just writing a value. If anyone else is holding that lock they
> will either overwrite our value after we release the lock, or we
> overwrite their value when they release the lock.

Yeah, agreed. Will remove.

Thanks,
Joseph

> 
>> +
>> +	spin_unlock_irqrestore(&emc_lock, flags);
>> +}
>> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_update_setting);
>> +
>> +void tegra210_clk_emc_update_setting(u32 emc_src_value)
>> +{
>> +	unsigned long flags = 0;
>> +
>> +	spin_lock_irqsave(&emc_lock, flags);
>> +
>> +	writel_relaxed(emc_src_value, clk_base + CLK_SOURCE_EMC);
>> +	readl(clk_base + CLK_SOURCE_EMC);
>> +
>> +	spin_unlock_irqrestore(&emc_lock, flags);
>> +}
>> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
> 
> Same comments as above.
> 
>> +
>> +u32 tegra210_clk_emc_get_setting(void)
>> +{
>> +	unsigned long flags = 0;
>> +	u32 val;
>> +
>> +	spin_lock_irqsave(&emc_lock, flags);
>> +
>> +	val = readl_relaxed(clk_base + CLK_SOURCE_EMC);
>> +
>> +	spin_unlock_irqrestore(&emc_lock, flags);
> 
> Similar to the above, the spinlock doesn't protect anything here.
> 
> Thierry
> 
