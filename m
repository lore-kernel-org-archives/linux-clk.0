Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5752AC07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 07:34:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0906320811
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 07:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="WLS4IsIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0906320811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbeLKHea (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 02:34:30 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13671 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbeLKHea (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 02:34:30 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0f68820000>; Mon, 10 Dec 2018 23:34:26 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Dec 2018 23:34:29 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Dec 2018 23:34:29 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 11 Dec
 2018 07:34:28 +0000
Subject: Re: [PATCH 09/19] clk: tegra: dfll: add CVB tables for Tegra210
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-10-josephl@nvidia.com>
 <61658127-d299-013a-d745-47a648f7a4cf@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <dcd13c46-423c-f03a-5df2-70316c5d21c9@nvidia.com>
Date:   Tue, 11 Dec 2018 15:34:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <61658127-d299-013a-d745-47a648f7a4cf@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544513666; bh=DhaqXg0IOhKzcg7WyHQ+l5cF1HbQychcErzd3myxPHM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=WLS4IsIH8k0xY9kRmIWGtsX8y5ra/XMmQcec2N415MAYUHyQvGAc/AuscMssIITrZ
         Dpau8PkSWLuvSrd9T1wB9yzlXyeh5Y9w4/teP++ejQ9jrJYCUyee15EpIGS3wIo4oG
         ONDWTpe0m1NBu+iXlg7yohnL94HgHgXnM1wNzVwpZMpqc+RhijMD+XPNWmZm2ZqoNt
         +Iok16g95G/SbpzrZXn5mGHIlPSviYJXUMVs+9IqWfNo/EyfoUWQvQ7TiTgaSMP+C4
         RT+8I6a8XAJRXKBAElxggGRw4rDuEsKk5lxzPdEh9tBiTFXXvdOyFaA6bq326rTUPj
         i7vjLb9RKfiWg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/7/18 10:39 PM, Jon Hunter wrote:
> 
> On 04/12/2018 09:25, Joseph Lo wrote:
>> Add CVB tables with different chip characterization, so that we can
>> generate the customize OPP table that suitable for different chips with
>> different SKUs.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 426 +++++++++++++++++++++
>>   drivers/clk/tegra/cvb.h                    |   1 +
>>   2 files changed, 427 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>> index 071a5c674832..bc1358d8084b 100644
>> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>> @@ -88,6 +88,421 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
>>   	},
>>   };
>>   
snip.
>>   
>> diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
>> index bcf15a089b93..91a1941c21ef 100644
>> --- a/drivers/clk/tegra/cvb.h
>> +++ b/drivers/clk/tegra/cvb.h
>> @@ -41,6 +41,7 @@ struct cvb_cpu_dfll_data {
>>   	u32 tune0_low;
>>   	u32 tune0_high;
>>   	u32 tune1;
>> +	unsigned int tune_high_min_millivolts;
> 
> Where is this actually used?

It's just part of the initial CVB table. We don't have the dynamic 
tunning support yet that will use this tune parameter for output freq 
tunning. It's on my plan of the next series for DFLL enhancement.

Should I remove that from the table?

Thanks,
Joseph


