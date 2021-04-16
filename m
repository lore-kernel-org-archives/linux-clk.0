Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7986C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 15:01:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88F9E61166
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 15:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244655AbhDPPBi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 11:01:38 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:32944 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236384AbhDPPBi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Apr 2021 11:01:38 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13GEpu1R025450;
        Fri, 16 Apr 2021 17:01:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6AUnVrpvOPJEKP8Wjxj3PCgFiX8LUBfqNHDWK87Q9UA=;
 b=MtiKnWMwIrc2zmI2OBYt/Jx+D7IdOKILnCEiAaubDS1rxyKOfajSAfCOeZGbPXNtbUuf
 BVf7Lhc/DmaYfvvQIQQS8399D9ckXH2M1PA0zKZO++m1ll6llyNBm/NxFCGLVF1PT+h/
 LDdL0w8pEz20oCyOY9cpa4Ra2j7WRrgQpEIAX8VMwRkoxQZEA7cd9QjLFoYu1e3UKcGx
 7EeT7su20hUBiVTfR0Ct2ke3rI0PPyCSXDZGE0HlWE7bpxrqmA2FlRhudh2LR0H6yrE6
 SDE3mpMeqBYrzGfwRHDnalUsxWwblF2IE9t4zi/5kKyxVOl4ie4ejym/+TLFFYyk/sMX hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37xm4jr5tu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Apr 2021 17:01:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C74D10002A;
        Fri, 16 Apr 2021 17:01:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B48E242DFE;
        Fri, 16 Apr 2021 17:01:02 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 17:01:01 +0200
Subject: Re: [PATCH 2/7] clk: stm32mp1: The dev is always NULL, replace it
 with np
To:     Marek Vasut <marex@denx.de>,
        "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>,
        <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-3-marex@denx.de>
 <a1768f19-fd80-abd7-03ee-8e47c124a271@foss.st.com>
 <362315e2-1398-4d11-e179-0ab7ca64e591@denx.de>
 <ffcd327e-c5b7-089c-1009-cfc97219495b@foss.st.com>
 <4fc3589d-8602-6567-9800-71f2fd21e450@denx.de>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <230f1d58-6f26-fbba-b39b-6a569a40cc3d@foss.st.com>
Date:   Fri, 16 Apr 2021 17:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4fc3589d-8602-6567-9800-71f2fd21e450@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-16_08:2021-04-16,2021-04-16 signatures=0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 4/16/21 4:54 PM, Marek Vasut wrote:
> On 4/16/21 4:39 PM, Alexandre TORGUE wrote:
>> Hi Marek
> 
> Hello Alexandre,
> 
>> On 4/16/21 3:39 PM, Marek Vasut wrote:
>>> On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
>>>> Hi Marek,
>>>
>>> Hello Gabriel,
>>>
>>>> I have a patch-set in progress using $dev (convertion into module 
>>>> driver).
>>>>
>>>> https://patchwork.kernel.org/project/linux-clk/list/?series=421767
>>>>
>>>> Then rebase of your patch, [PATCH 4/7] clk: stm32mp1: Add 
>>>> parent_data to ETHRX clock, can be done easily.
>>>
>>> I suspect the aforementioned patchset will have to be reworked, since 
>>> the current approach to push SCMI onto every system and renumerate 
>>> the clock has been rejected, because it caused DT ABI break and boot 
>>> problems on many systems.
>>
>> SCMI patches for clock drivers will be pushed (and merged one day :)). 
>> We only drop the DT part which will be done through dtbo in 
>> uboot/tfa/optee.
> If the result works for both options (without SCMI and opt-in with 
> SCMI), then that's fine. Does the aforementioned patchset already 
> implement that ?

yes it will work with basic boot. You can have a try with on your DH board.

> 
> If so (or if there is a rebase + repost of the above patchset which 
> does), then I am happy to rebase this one on top.
> 

thanks
