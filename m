Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE930C433ED
	for <linux-clk@archiver.kernel.org>; Tue, 13 Apr 2021 07:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C476B60238
	for <linux-clk@archiver.kernel.org>; Tue, 13 Apr 2021 07:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239097AbhDMHsp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Apr 2021 03:48:45 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:49844 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237224AbhDMHsn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Apr 2021 03:48:43 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13D7kK66004778;
        Tue, 13 Apr 2021 09:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ScwxoI9yGOHOYLA1E0c1jakVAFuAFJxEnP0S/4GDUk8=;
 b=Cj9Bd5KD/HT8osPfvrFqEfHzKpG9kkZzMtQ+cWwqhrAZerYzrmRwzptdY+eUAn36pO3K
 MMruzQXg3dIchbt4QFHtsvQRnbYdHM7kc6pldNqwePRmViyH0uFLT0KXPhQAe5ujtGAb
 kO9WvNyzuxRG6W6dfYRU3SiZHLDd5NVq8VLNZ7Wcfp0YOHllgPFoeJCa9U70MsH15Kx8
 R7A9I7DQ/QxcLSq5qpuDeO5cVc+z9TP7oZDSYIJ+9Cr4ZBIsKfol3vb0DrWCMCsGk4uf
 Dv2ax8oKHj3Ez5IbLcfMnS4HwWYxGq2LT/W1MNHAFongA4/8kUtrVPF5+KT4HHVN5ajl 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37vrp5c0jc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 09:48:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C30510002A;
        Tue, 13 Apr 2021 09:48:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D1D721EAAC;
        Tue, 13 Apr 2021 09:48:12 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr
 2021 09:48:11 +0200
Subject: Re: [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX clock parent from
 ETHCK_K to MCO2 on DHCOM SoM
To:     Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC:     Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>,
        <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20210408185731.135511-1-marex@denx.de>
 <b81d6a69-713f-eda7-0837-d6e80d691c6a@foss.st.com>
 <2c410c1b-2a1d-b291-a128-c5d5979be1ef@denx.de>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <340d32f1-3afb-2159-fa94-70a45aecd88c@foss.st.com>
Date:   Tue, 13 Apr 2021 09:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2c410c1b-2a1d-b291-a128-c5d5979be1ef@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-13_03:2021-04-13,2021-04-13 signatures=0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek

On 4/12/21 8:44 PM, Marek Vasut wrote:
> On 4/12/21 10:09 AM, Alexandre TORGUE wrote:
>> Hi Marek
> 
> Hello Alex,
> 
> [...]
> 
>>> All the above still only discusses the clock part of the problem. 
>>> Even if
>>> the clock cyclic dependencies could be solved, it would be necessary to
>>> resolve legacy dwmac st,eth-clk-sel and st,eth-ref-clk-sel DT properties
>>> and avoid DT ABI break.
>>
>> Thanks for those clear explanations and for this series. As discussed, 
>> this approach looks good to me as it doesn't break our current 
>> strategy for dwmac clock integration. I don't know if those cyclic 
>> redundancies will be fixed one day but we can have a look on dwmac DT 
>> properties (the gain to change them, the effort to keep the backward 
>> compatibility, code readability, ...).
>>
>> Your DT patches looks good. I'll merge them soon.
> +CC Stephen ; the DT patches depend on the clock driver changes. Would 
> it make sense to pick the clock patches through the same tree or how 
> should that be handled ?

In this situation, I prefer to wait that Stephen takes clock patches in 
his tree. Then I'll take DT ones in mine. (I assume that taking only 
clock patches will not break mp1 boot or Ethernet usage).

Regards
Alex


> 
> [...]
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
