Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E83C67839
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 07:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4422020811
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 07:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="gvkDC5Ax"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4422020811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbeLNHmt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 02:42:49 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6249 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbeLNHmt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Dec 2018 02:42:49 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c135ef50000>; Thu, 13 Dec 2018 23:42:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 23:42:48 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 23:42:48 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 14 Dec
 2018 07:42:47 +0000
Subject: Re: [PATCH V2 09/21] clk: tegra: dfll: add protection for
 find_vdd_map APIs
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-10-josephl@nvidia.com>
 <a56194ce-ce96-8b3a-99e8-b4348db39f42@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <acaf37e4-e581-597f-fdcf-5f627e396b88@nvidia.com>
Date:   Fri, 14 Dec 2018 15:42:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a56194ce-ce96-8b3a-99e8-b4348db39f42@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544773365; bh=OrQUM3be3WcahHbDG/ZNOWjAsJ+aRcov11+lbOsMCCg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=gvkDC5Ax/CYc1QS61wB17ySRavM49apV8AfQ2gj3TFOrz6B/+9VgeB0huTOFwawLM
         CwmkfdJL2X8c2F+AlrkTj6wCPOyXdG1F4LaWjDMFgqbjw7hXaoUED/pIQERcpa5ZTn
         2bdERgPsQKQNPFoMEIJbDxY+uHCTw5ZPxbaz3RuSDYwf4etppORDck6a68+5k0327/
         6Yqqd/ENVaYf7s75TKK156Pd158Oy7WdKtXI8cSSNKkdzNF4cbL8KCbQiYq6i2Hsk3
         /o2qmwOpqyW6HOdPkb4Vas1g2ilFg5D3HHxQYuJi+9gMheKFTVk7Y/LYYv0hXPNxxN
         EIKdHTmGD8Wyg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/13/18 8:46 PM, Jon Hunter wrote:
> 
> On 13/12/2018 09:34, Joseph Lo wrote:
>> The DFLL hardware supports both I2C and PWM based regulator. SW driver
>> only touches I2C regulator when generating LUT. And shouldn't touch it
>> anymore once the DFLL is enabled.
> 
> I am not sure that the last two sentences are above are relevant and
> confused me a little at first. I would be tempted to drop them.

Indeed, they are irrelevant. Just want to describe that once we created 
LUT table, it means we cached the regulator output table in driver. Then 
we don't need to query voltage data from regulator again. This is 
specific to the I2C mode only and happens in driver initialization time. 
Which means the two APIs we add the WARN here maybe not really 
necessary. Because this is suggested by Peter.

Hi Peter,

Just want to double confirm again, do we really need to add a WARN here? 
Since we don't and shouldn't access these two APIs once the driver is 
working, all the voltage query should be via LUT. So I think add WARN 
here is not really necessary.

Thanks,
Joseph

> 
>> This patch adds the protection for the APIs that only work with I2C mode
>> to avoid they could be called accidentally.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> 
> Furthermore, I would be tempted to squash this into patch #7. I am not
> sure another patch is warranted here.
> 
> Cheers
> Jon
> 
