Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8431AC07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 06:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4775B20672
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 06:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="UKbDX5Gg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4775B20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbeLKGga (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 01:36:30 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3024 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbeLKGga (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 01:36:30 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0f5aeb0000>; Mon, 10 Dec 2018 22:36:27 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 10 Dec 2018 22:36:29 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 10 Dec 2018 22:36:29 -0800
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 11 Dec
 2018 06:36:28 +0000
Subject: Re: [PATCH 07/19] clk: tegra: dfll: support PWM regulator control
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-8-josephl@nvidia.com>
 <6cdab503-e463-ddbb-2ce9-035c81da7058@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <f737d9e2-2888-6255-2872-cfc9dc0a6aa1@nvidia.com>
Date:   Tue, 11 Dec 2018 14:36:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <6cdab503-e463-ddbb-2ce9-035c81da7058@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544510187; bh=MLOYi/41hjvgZB/WNx6gkLkG8vQw5cFd2knJ2erxad4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=UKbDX5GgIEV1CVZzNowdG+SlgSFXVejwmPkF5tq9G90eefZtns/L/xjv6vUIrVUDC
         G6DX7Um+a3ASVOtILtrmLHa3inYPY+1/Hx/+3mcNTjmvFNGfVHLyqFB71fKCqRy5k2
         1WcXA3mGhZ3FEapU34CDplzCifCDjZY2u7id8oH+zXqGJAcn8c2ZnkOaSSZjslEILg
         YvxXI7oVMiB+sKy6aZH8QU4dyfvdzfd/3qpnjY8olGZMc/GN0PDiksbykkYzoFCv2W
         3OAr8HZZ79j+kcEJrBu5qPcxVq/R+6F6y6sw9PKZ6kolshvvM+EusmiEFaI6FSJIGa
         aO2zrZEQlfbsQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/7/18 10:26 PM, Jon Hunter wrote:
> 
> On 04/12/2018 09:25, Joseph Lo wrote:
>> The DFLL hardware supports two modes (I2C and PWM) for voltage control
>> when requesting a frequency. In this patch, we introduce PWM mode support.
>>
>> To support that, we re-organize the LUT for unifying the table for both
>> cases of I2C and PWM mode. And generate that based on regulator info.
>> For the PWM-based regulator, we get this info from DT. And do the same as
>> the case of I2C LUT, which can help to map the PMIC voltage ID and voltages
>> that the regulator supported.
>>
>> The other parts are the support code for initializing the DFLL hardware
>> to support PWM mode. Also, the register debugfs file is slightly
>> reworked to only show the i2c registers when I2C mode is in use.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-dfll.c | 431 ++++++++++++++++++++++++++++++-----
>>   1 file changed, 368 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> index 609e363dabf8..c294a2989f31 100644
>> --- a/drivers/clk/tegra/clk-dfll.c
>> +++ b/drivers/clk/tegra/clk-dfll.c
>> @@ -1,7 +1,7 @@
>>   /*
>>    * clk-dfll.c - Tegra DFLL clock source common code
>>    *
>> - * Copyright (C) 2012-2014 NVIDIA Corporation. All rights reserved.
>> + * Copyright (C) 2012-2018 NVIDIA Corporation. All rights reserved.
>>    *
>>    * Aleksandr Frid <afrid@nvidia.com>
>>    * Paul Walmsley <pwalmsley@nvidia.com>
>> @@ -47,6 +47,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/pinctrl/consumer.h>
>>   #include <linux/pm_opp.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>> @@ -243,6 +244,12 @@ enum dfll_tune_range {
>>   	DFLL_TUNE_LOW = 1,
>>   };
>>   
>> +
>> +enum tegra_dfll_pmu_if {
>> +	TEGRA_DFLL_PMU_I2C = 0,
>> +	TEGRA_DFLL_PMU_PWM = 1,
>> +};
>> +
>>   /**
>>    * struct dfll_rate_req - target DFLL rate request data
>>    * @rate: target frequency, after the postscaling
>> @@ -294,16 +301,25 @@ struct tegra_dfll {
>>   	u32				ci;
>>   	u32				cg;
>>   	bool				cg_scale;
>> +	u32				reg_init_uV;
> 
> Doesn't this belong under PWM interface? Also being picky I dont' find
> init_uV very descriptive.

Yes, will move that to PWM interface section. Thanks.

> 
> Otherwise the change looks fine to me.
> 
> Cheers
> Jon
> 
