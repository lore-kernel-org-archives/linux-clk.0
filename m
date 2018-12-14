Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA42C67839
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 07:43:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A43320811
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 07:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="XPYzD7Uc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A43320811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbeLNHnd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 02:43:33 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2164 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbeLNHnc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Dec 2018 02:43:32 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c135f1e0001>; Thu, 13 Dec 2018 23:43:26 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 23:43:32 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 23:43:32 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 14 Dec
 2018 07:43:30 +0000
Subject: Re: [PATCH V2 10/21] clk: tegra: dfll: add CVB tables for Tegra210
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-11-josephl@nvidia.com>
 <8fda3564-ab10-bb24-6d2a-6bd26358fe88@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <9f0d08e3-a87a-2e85-e0d2-49ab25afc109@nvidia.com>
Date:   Fri, 14 Dec 2018 15:43:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <8fda3564-ab10-bb24-6d2a-6bd26358fe88@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544773406; bh=5wYnr7yEhYR4g6GmiiEkncHydhAlqpHLiDLTCGqIwfg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=XPYzD7UcEiEy+m8ipS2Iah9DUl+b1vdFYPrhpAsYnK7iwb9PAURGNA+7cd1vom41k
         VtatzybBSbEVc3m2e8BOWJ5xhKSjDtxRzvdkRKF+tQmK8Y/erjf8nUHPbMSjrlks2t
         vwhYVujGuD9RnL4WRsPWHdtyMsKz+/qRfe6a/TP3LMRNDRwwTUneuqlupvuqyJKFwK
         gqy6MJdPBMx4SVVb7pNFPnFpjEfgjLgsYig8MflUtcZ40Qbs9zDqh0C5rDtSPw8PZW
         AK8DfT4jswF6JtldzsYTYc8BY79gD16KuiyWsSlZ6bXDrTHrY0nl2+F+PfY0DPNT8r
         NRm4oxbY6RLwA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/13/18 8:50 PM, Jon Hunter wrote:
> 
> On 13/12/2018 09:34, Joseph Lo wrote:
>> Add CVB tables with different chip characterization, so that we can
>> generate the customize OPP table that suitable for different chips with
>> different SKUs.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> 
> ...
> 
>> diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
>> index bcf15a089b93..91a1941c21ef 100644
>> --- a/drivers/clk/tegra/cvb.h
>> +++ b/drivers/clk/tegra/cvb.h
>> @@ -41,6 +41,7 @@ struct cvb_cpu_dfll_data {
>>   	u32 tune0_low;
>>   	u32 tune0_high;
>>   	u32 tune1;
>> +	unsigned int tune_high_min_millivolts;
>>   };
> 
> Sorry, I forgot to respond to this on the previous version. I think that
> it is OK to add now, but please add a comment in the changelog to
> reflect that this is not currently used, but we have plans to use it and
> so we are adding all the data now.

Okay, will do. Thanks.

> 
> Cheers
> Jon
> 
