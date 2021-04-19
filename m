Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00F9C433B4
	for <linux-clk@archiver.kernel.org>; Mon, 19 Apr 2021 07:46:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68A956102A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Apr 2021 07:46:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237922AbhDSHrS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Apr 2021 03:47:18 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:32194 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237916AbhDSHrS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Apr 2021 03:47:18 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13J7h18C024163;
        Mon, 19 Apr 2021 09:46:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2XcjnkEAyiJg5CAr01NS0o8zmjlzeCSZ86XHOaG3ovw=;
 b=GpI0yH4lYjAUy0k1hlirnxQb6FWkMhG7J2zRCvVKWJ3qu/+WVShRXvyRiM37CLgqVXWv
 Y0cPSst9SwY7Qkn56lqXJ4LRR9DCApkSgYNA0S4McDmWVJKdVJtH/vWNKXeO1yIroIvh
 vt7ePSLE676f3fH9TC6vaqtnhne/MDV7fxPVmBOO8zftR6aw0mHhTNOU1qfFZiUdU0Tx
 YPajW3+BkWijYi0ELcCUWC05Ar0ZelrfIz6KpoEOLYAYqM+OeEu0r5S3wcBuSWTxYASk
 t6LZF03KX5mOhtPP67182n1XORKkk+ktxq/J5HMy4cGvVTokhAa20Bo17Ah1K8UJYtrD SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 380rdgatep-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Apr 2021 09:46:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40FCF10002A;
        Mon, 19 Apr 2021 09:46:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E5EA2200DD;
        Mon, 19 Apr 2021 09:46:29 +0200 (CEST)
Received: from lmecxl0572.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr
 2021 09:46:28 +0200
Subject: Re: [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
To:     Marek Vasut <marex@denx.de>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
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
 <6416577a-ea06-a014-543a-9ef86aae603d@foss.st.com>
 <2281af74-33a0-df45-968b-baa1ddd9d6e0@denx.de>
From:   "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <8481872c-9ee0-c759-3ab0-5209165ad9b2@foss.st.com>
Date:   Mon, 19 Apr 2021 09:46:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2281af74-33a0-df45-968b-baa1ddd9d6e0@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-19_02:2021-04-16,2021-04-19 signatures=0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On 4/16/21 5:31 PM, Marek Vasut wrote:
> On 4/16/21 5:23 PM, Alexandre TORGUE wrote:
> 
> Hello Alexandre,
> 
>> On 4/16/21 3:47 PM, Marek Vasut wrote:
>>> On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
>>>> Hi Marek
>>>
>>> Hello Gabriel,
>>>
>>>> On 4/14/21 4:04 PM, Marek Vasut wrote:
>>>>> On 4/14/21 3:03 PM, gabriel.fernandez@foss.st.com wrote:
>>>>>> Hi Marek,
>>>>>
>>>>> Hello Gabriel,
>>>>>
>>>>>> Thanks for the patchset
>>>>>>
>>>>>> On 4/8/21 8:57 PM, Marek Vasut wrote:
>>>>>>> The ETHCK_K are modeled as composite clock of MUX and GATE, 
>>>>>>> however per
>>>>>>> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. 
>>>>>>> Peripheral
>>>>>>> clock distribution for Ethernet, ETHPTPDIV divider is attached 
>>>>>>> past the
>>>>>>> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN 
>>>>>>> gate.
>>>>>>> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP 
>>>>>>> clock are
>>>>>>> in use, ETHCKEN gate can be turned off. Current driver does not 
>>>>>>> permit
>>>>>>> that, fix it.
>>>>>>
>>>>>> I don"t understand, it's already the case.
>>>>>>
>>>>>> ETHCK_K it's a composite with a MUX and a GATE.
>>>>>
>>>>> But ETHCK_K is _not_ a composite clock, look at the Figure 83 in 
>>>>> the datasheet again and schematic below.
>>>>>
>>>>>> ETHPTP_K (ETHPTPDIV) it's a composite with the same MUX and a DIV 
>>>>>> (no gate)
>>>>>
>>>>> But ETHPTP_K shouldn't control any mux, it is only a divider.
>>>>>
>>>>>> If you use only ETHPTPDIV,  ETHCKEN gate can be turned off.
>>>>>
>>>>> Look, this is what you have today:
>>>>>
>>>>>             .------------ ETHCK_K -----------.
>>>>>             |_______               _______   |
>>>>> pll4_p_ck--|M_ETHCK\             |G_ETHCK\  |
>>>>>             | MUX    |------+-----| GATE   |-------------[x] ETH_CLK
>>>>> pll3_q_ck--|_______/       |     |_______/                  eth_clk_fb
>>>>>             |               |
>>>>>             |               '--(ETHCKSELR[7:4] divider)--[x] 
>>>>> clk_ptp_ref
>>>>>             |                                          |
>>>>>             '------------ ETHPTP_K --------------------'
>>>>>
>>>>> And this is what you should have, to avoid having two composite 
>>>>> clock which control the same mux using the same register bit, i.e. 
>>>>> what this patch implements:
>>>>>
>>>>>             .- ck_ker_eth -.  .--- ETHCK_K --.
>>>>>             |_______       |  |    _______   |
>>>>> pll4_p_ck--|M_ETHCK\      |  |   |G_ETHCK\  |
>>>>>             | MUX    |------+-----| GATE   |-------------[x] ETH_CLK
>>>>> pll3_q_ck--|_______/       |     |_______/                  eth_clk_fb
>>>>>                             |
>>>>>                             '--(ETHCKSELR[7:4] divider)--[x] 
>>>>> clk_ptp_ref
>>>>>                              |                         |
>>>>>                              '---- ETHPTP_K -----------'
>>>>>
>>>>
>>>> These 2 solutions are valid. I made the choice to implement the 
>>>> first one to be able to change parent with the kernel clock of the 
>>>> IP (no need to add an intermediate binding).
>>>
>>> Which IP are you talking about in here ?
>>>
>>>> It's the same principle for all kernel of this soc.
>>>
>>> The first option is wrong, because in that model, you have two 
>>> composite clock which control the same one mux bit in the same 
>>> register. Basically you register two distinct clock which operate the 
>>> same hardware knob.
>>>
>>>> I can ask to Alexandre to comeback of this principle, but i 'm not 
>>>> favorable.
>>>
>>
>> The only discussing thing is how the clock is shown. I mean either two 
>> composites or one mux plus two gates. Gabriel made a choice to 
>> abstract the mux in two composite clocks. But it seems that at the end 
>> we have the same behaviour, isn't ?
> 
> Not really. Since the two composite clock control the same mux bit, 
> consider what would happen if you were to select pll4_p_ck as parent for 
> one (e.g. ETHCK_K), and pll3_q_ck as parent for the other (e.g. 
> ETHPTP_K), what would be the result ? I guess the result would depend on 
> when the reparenting of each ETHCK_K/ETHPTP_K happens on boot, and I 
> don't think that's how it should work. With a single mux controlling 
> that one single bit, such situation wouldn't happen.

The reparenting is managed. This mux has specific ops.
root@stm32mp1-disco-oss:~# cat /sys/kernel/debug/clk/ethck_k/clk_parent 
&& cat /sys/kernel/debug/clk/ethptp_k/clk_parent
pll4_p
pll4_p
root@stm32mp1-disco-oss:~# echo pll3_q > 
/sys/kernel/debug/clk/ethptp_k/clk_set_parent
root@stm32mp1-disco-oss:~# cat /sys/kernel/debug/clk/ethck_k/clk_parent 
&& cat /sys/kernel/debug/clk/ethptp_k/clk_parent
pll3_q
pll3_q

> 
>> Adding "ck_ker_eth" would impose a new clock to take in DT ?
> Nope, the ck_ker_eth is without ID and internal to the driver. They 
> exist only to describe the clock tree correctly.
> 
> [...]
