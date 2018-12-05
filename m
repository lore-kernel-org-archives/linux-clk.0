Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45885C04EB8
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 03:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2F072084C
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 03:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="iINiaOVc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F072084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbeLEDZs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 22:25:48 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15135 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbeLEDZs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 22:25:48 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c07453a0000>; Tue, 04 Dec 2018 19:25:46 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 19:25:47 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 19:25:47 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 5 Dec
 2018 03:25:45 +0000
Subject: Re: [PATCH 12/19] cpufreq: tegra124: extend to support Tegra210
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        <linux-pm@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-13-josephl@nvidia.com>
 <c4f34e85-052b-f3a3-a6ea-715d1971335c@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <58e13709-79e6-66cc-2858-a51b393da05a@nvidia.com>
Date:   Wed, 5 Dec 2018 11:25:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <c4f34e85-052b-f3a3-a6ea-715d1971335c@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543980346; bh=Zu/iOZ55KNBSOn8UjTX4Y5yu+c+BGbMZ2a/Y0Y1AXs8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=iINiaOVcWjGz2J766u3HCfb4Xwx3Dc1FYzCdMZZFTlVtQ7m/tl/J0HU1mDl31MKem
         3tUo6EVKj0Z+qQAABV3IP4IfVGusA+DgN8x5Sy8y0BI6bK5z7InoTKjlqHH2OvSdqn
         OF0oC3Qkb7jf2dZxsiin3hSxnH22E9moZXMR+jOk21/71JXTnX0xQrrWnLuj2P1fDW
         ILVisrklQedm1p4kq2q5i02EJcpxiaSDFpgh4J861e4tA77gB68b6T2/0bHkqRDNhJ
         gblOQdrDVGzkT56qmRJ/PFb8saX3ZayytMzHx6TNzJCkhc9+xasvpWzy9UUfzKDZ5y
         QXk3gLCwjMgOA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/4/18 7:22 PM, Dmitry Osipenko wrote:
> On 04.12.2018 12:25, Joseph Lo wrote:
>> Tegra210 uses the same methodology as Tegra124 for CPUFreq controlling
>> that based on DFLL clock. So extending this driver to support Tegra210.
>>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: linux-pm@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   drivers/cpufreq/tegra124-cpufreq.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
>> index 448d00763d00..1af955fb715c 100644
>> --- a/drivers/cpufreq/tegra124-cpufreq.c
>> +++ b/drivers/cpufreq/tegra124-cpufreq.c
>> @@ -159,7 +159,8 @@ static int __init tegra_cpufreq_init(void)
>>   	int ret;
>>   	struct platform_device *pdev;
>>   
>> -	if (!of_machine_is_compatible("nvidia,tegra124"))
>> +	if (!(of_machine_is_compatible("nvidia,tegra124") ||
>> +		of_machine_is_compatible("nvidia,tegra210")))
>>   		return -ENODEV;
>>   
>>   	/*
>>
> 
> Seems that's not enough, you also need to blacklist "nvidia,tegra210" in the drivers/cpufreq/cpufreq-dt-platdev.c

Hi Dmitry,

Thanks for reviewing. Actually it's "just" enough, I did check that 
driver for creating device data for cpufreq-dt driver. It needs to have 
both OPP v2 property and blacklist to create device data.

Because we don't use OPP v2, it will never be true. So it will "just" 
work in this case.

But you are right, add that to blacklist is more clear. I can add one 
more patch for that in next series.

Thanks,
Joseph
