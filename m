Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58173C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 15:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 308986108E
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 15:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235503AbhDPPXu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 11:23:50 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:38406 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236062AbhDPPXr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Apr 2021 11:23:47 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13GFHtkL009472;
        Fri, 16 Apr 2021 17:23:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SRX50N81IlAeTymmL103QV/nd+qvtEy6AcdtlmCoSQ4=;
 b=r1nbn9oLRZNI+S0ICud6wK4RpYY6OWjYrDGE8tXj4sKIlfnUpGqcfRPb6yT5Ro2HJmZ0
 PIJseN9kZJKXEadx9X3Xdrv8xNtUTjCD3a7RaZL6GDDSXdG37wlvVg8E/KkAMvpHLGIL
 sEuC4j/P/7oC9sGy2WW23Q9VWqk3vT4qKeOytBdKXaJaTopgvz6aDuNZ5H4qEydGtfQf
 GCCvH4qooAc7meLAP76U4eLGvdI6GKxr+kWSQKdtPUBS0SCAsMt4JyE4JKoGnnFxXtML
 O/AqQUVE1uvQr3szxXGIjYH9RyJI81ubghvq0LJ2gnIl2jZmr2B5iyqh3vMhIE+HkwT/ lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37xm4jr992-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Apr 2021 17:23:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C567A10002A;
        Fri, 16 Apr 2021 17:23:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5790245F0E;
        Fri, 16 Apr 2021 17:23:07 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 17:23:06 +0200
Subject: Re: [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
To:     Marek Vasut <marex@denx.de>,
        "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>,
        <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-2-marex@denx.de>
 <2b10f5d9-54cb-ce83-b7aa-f4ec8e67c001@foss.st.com>
 <92dd5798-8f5a-66e4-06bc-e3beb16690f5@denx.de>
 <d168aed8-aebd-1bee-aa72-3a3601718cad@foss.st.com>
 <e27dbccd-518f-7718-8cf7-cc9c8adb8a56@denx.de>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <6416577a-ea06-a014-543a-9ef86aae603d@foss.st.com>
Date:   Fri, 16 Apr 2021 17:23:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e27dbccd-518f-7718-8cf7-cc9c8adb8a56@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-16_08:2021-04-16,2021-04-16 signatures=0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 4/16/21 3:47 PM, Marek Vasut wrote:
> On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
>> Hi Marek
> 
> Hello Gabriel,
> 
>> On 4/14/21 4:04 PM, Marek Vasut wrote:
>>> On 4/14/21 3:03 PM, gabriel.fernandez@foss.st.com wrote:
>>>> Hi Marek,
>>>
>>> Hello Gabriel,
>>>
>>>> Thanks for the patchset
>>>>
>>>> On 4/8/21 8:57 PM, Marek Vasut wrote:
>>>>> The ETHCK_K are modeled as composite clock of MUX and GATE, however 
>>>>> per
>>>>> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. 
>>>>> Peripheral
>>>>> clock distribution for Ethernet, ETHPTPDIV divider is attached past 
>>>>> the
>>>>> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN 
>>>>> gate.
>>>>> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
>>>>> in use, ETHCKEN gate can be turned off. Current driver does not permit
>>>>> that, fix it.
>>>>
>>>> I don"t understand, it's already the case.
>>>>
>>>> ETHCK_K it's a composite with a MUX and a GATE.
>>>
>>> But ETHCK_K is _not_ a composite clock, look at the Figure 83 in the 
>>> datasheet again and schematic below.
>>>
>>>> ETHPTP_K (ETHPTPDIV) it's a composite with the same MUX and a DIV 
>>>> (no gate)
>>>
>>> But ETHPTP_K shouldn't control any mux, it is only a divider.
>>>
>>>> If you use only ETHPTPDIV,  ETHCKEN gate can be turned off.
>>>
>>> Look, this is what you have today:
>>>
>>>             .------------ ETHCK_K -----------.
>>>             |_______               _______   |
>>> pll4_p_ck--|M_ETHCK\             |G_ETHCK\  |
>>>             | MUX    |------+-----| GATE   |-------------[x] ETH_CLK
>>> pll3_q_ck--|_______/       |     |_______/                  eth_clk_fb
>>>             |               |
>>>             |               '--(ETHCKSELR[7:4] divider)--[x] clk_ptp_ref
>>>             |                                          |
>>>             '------------ ETHPTP_K --------------------'
>>>
>>> And this is what you should have, to avoid having two composite clock 
>>> which control the same mux using the same register bit, i.e. what 
>>> this patch implements:
>>>
>>>             .- ck_ker_eth -.  .--- ETHCK_K --.
>>>             |_______       |  |    _______   |
>>> pll4_p_ck--|M_ETHCK\      |  |   |G_ETHCK\  |
>>>             | MUX    |------+-----| GATE   |-------------[x] ETH_CLK
>>> pll3_q_ck--|_______/       |     |_______/                  eth_clk_fb
>>>                             |
>>>                             '--(ETHCKSELR[7:4] divider)--[x] clk_ptp_ref
>>>                              |                         |
>>>                              '---- ETHPTP_K -----------'
>>>
>>
>> These 2 solutions are valid. I made the choice to implement the first 
>> one to be able to change parent with the kernel clock of the IP (no 
>> need to add an intermediate binding).
> 
> Which IP are you talking about in here ?
> 
>> It's the same principle for all kernel of this soc.
> 
> The first option is wrong, because in that model, you have two composite 
> clock which control the same one mux bit in the same register. Basically 
> you register two distinct clock which operate the same hardware knob.
> 
>> I can ask to Alexandre to comeback of this principle, but i 'm not 
>> favorable.
> 

The only discussing thing is how the clock is shown. I mean either two 
composites or one mux plus two gates. Gabriel made a choice to abstract 
the mux in two composite clocks. But it seems that at the end we have 
the same behaviour, isn't ?

Adding "ck_ker_eth" would impose a new clock to take in DT ?

regards
alex

> Please ask.
> 
>>>>> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
>>>>> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
>>>>> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent 
>>>>> clock
>>>>> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
>>>>> ETHPTP_K remain functional as before.
>>>>>
>>>>> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>>>>>      Figure 83. Peripheral clock distribution for Ethernet
>>>>> https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf 
>>>>>
>>>
>>> [...]
>>>
>>>>> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
>>>>> index a875649df8b8..a7c7f544ee5d 100644
>>>>> --- a/drivers/clk/clk-stm32mp1.c
>>>>> +++ b/drivers/clk/clk-stm32mp1.c
>>>>> @@ -1949,7 +1949,6 @@ static const struct clock_config 
>>>>> stm32mp1_clock_cfg[] = {
>>>>>       KCLK(DSI_K, "dsi_k", dsi_src, 0, G_DSI, M_DSI),
>>>>>       KCLK(ADFSDM_K, "adfsdm_k", sai_src, 0, G_ADFSDM, M_SAI1),
>>>>>       KCLK(USBO_K, "usbo_k", usbo_src, 0, G_USBO, M_USBO),
>>>>> -    KCLK(ETHCK_K, "ethck_k", eth_src, 0, G_ETHCK, M_ETHCK),
>>>>>       /* Particulary Kernel Clocks (no mux or no gate) */
>>>>>       MGATE_MP1(DFSDM_K, "dfsdm_k", "ck_mcu", 0, G_DFSDM),
>>>>> @@ -1958,11 +1957,16 @@ static const struct clock_config 
>>>>> stm32mp1_clock_cfg[] = {
>>>>>       MGATE_MP1(GPU_K, "gpu_k", "pll2_q", 0, G_GPU),
>>>>>       MGATE_MP1(DAC12_K, "dac12_k", "ck_lsi", 0, G_DAC12),
>>>>> -    COMPOSITE(ETHPTP_K, "ethptp_k", eth_src, CLK_OPS_PARENT_ENABLE |
>>>>> +    COMPOSITE(NO_ID, "ck_ker_eth", eth_src, CLK_OPS_PARENT_ENABLE |
>>>>>             CLK_SET_RATE_NO_REPARENT,
>>>>>             _NO_GATE,
>>>>>             _MMUX(M_ETHCK),
>>>>> -          _DIV(RCC_ETHCKSELR, 4, 4, 0, NULL)),
>>>>> +          _NO_DIV),
>>>>> +
>>>>> +    MGATE_MP1(ETHCK_K, "ethck_k", "ck_ker_eth", 0, G_ETHCK),
>>>> assigned parent with ETHCK_K will not work
>>>>> +
>>>>> +    DIV(ETHPTP_K, "ethptp_k", "ck_ker_eth", CLK_OPS_PARENT_ENABLE |
>>>>
>>>> CLK_OPS_PARENT_ENABLE flags not useful with a divider.
>>>
>>> How so ?
