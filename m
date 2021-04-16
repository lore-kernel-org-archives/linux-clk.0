Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB523C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 15:31:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 857C8610CC
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 15:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343712AbhDPPcJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 11:32:09 -0400
Received: from phobos.denx.de ([85.214.62.61]:38640 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235563AbhDPPcJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Apr 2021 11:32:09 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3BC8580C91;
        Fri, 16 Apr 2021 17:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1618587101;
        bh=uv0frI0pVvjdGrlUcRarPqNaalC/4JZbhNGLO+NMpck=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=M5kCG0DOpjQXdhUWwgerHvNOUWghxEwX8nCF0r4SOzUJcOUzMWYApa0Q+5rmrOfGp
         edbPSzU80HL00MAzo81CmfykcsETQj+UPF6VJ6q2r+1vUHK2gNYjbcTQyKhbbWcUZP
         cwatxgJwLUzy1w5CmVzEzz8AZPmOZDR+chhzCEVPHs3a2bNaR2uTr+J81qkE3nYChw
         KrE8f3L9nUVEd7TAMQKFdeKC97l0qL5QT9UhuUna2e+Oxk8uaY9lvYzPV2s/XofVFC
         JJDlrPNpz1XRA+Jt2CSWo50YDKTOtPGMN0Zj1e2QAWyZzP2dBgvSNtp1aotaVqa3dS
         7KT5AS/mGig5g==
Subject: Re: [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
To:     Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Stephen Boyd <sboyd@kernel.org>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-2-marex@denx.de>
 <2b10f5d9-54cb-ce83-b7aa-f4ec8e67c001@foss.st.com>
 <92dd5798-8f5a-66e4-06bc-e3beb16690f5@denx.de>
 <d168aed8-aebd-1bee-aa72-3a3601718cad@foss.st.com>
 <e27dbccd-518f-7718-8cf7-cc9c8adb8a56@denx.de>
 <6416577a-ea06-a014-543a-9ef86aae603d@foss.st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <2281af74-33a0-df45-968b-baa1ddd9d6e0@denx.de>
Date:   Fri, 16 Apr 2021 17:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <6416577a-ea06-a014-543a-9ef86aae603d@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/16/21 5:23 PM, Alexandre TORGUE wrote:

Hello Alexandre,

> On 4/16/21 3:47 PM, Marek Vasut wrote:
>> On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
>>> Hi Marek
>>
>> Hello Gabriel,
>>
>>> On 4/14/21 4:04 PM, Marek Vasut wrote:
>>>> On 4/14/21 3:03 PM, gabriel.fernandez@foss.st.com wrote:
>>>>> Hi Marek,
>>>>
>>>> Hello Gabriel,
>>>>
>>>>> Thanks for the patchset
>>>>>
>>>>> On 4/8/21 8:57 PM, Marek Vasut wrote:
>>>>>> The ETHCK_K are modeled as composite clock of MUX and GATE, 
>>>>>> however per
>>>>>> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. 
>>>>>> Peripheral
>>>>>> clock distribution for Ethernet, ETHPTPDIV divider is attached 
>>>>>> past the
>>>>>> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN 
>>>>>> gate.
>>>>>> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock 
>>>>>> are
>>>>>> in use, ETHCKEN gate can be turned off. Current driver does not 
>>>>>> permit
>>>>>> that, fix it.
>>>>>
>>>>> I don"t understand, it's already the case.
>>>>>
>>>>> ETHCK_K it's a composite with a MUX and a GATE.
>>>>
>>>> But ETHCK_K is _not_ a composite clock, look at the Figure 83 in the 
>>>> datasheet again and schematic below.
>>>>
>>>>> ETHPTP_K (ETHPTPDIV) it's a composite with the same MUX and a DIV 
>>>>> (no gate)
>>>>
>>>> But ETHPTP_K shouldn't control any mux, it is only a divider.
>>>>
>>>>> If you use only ETHPTPDIV,  ETHCKEN gate can be turned off.
>>>>
>>>> Look, this is what you have today:
>>>>
>>>>             .------------ ETHCK_K -----------.
>>>>             |_______               _______   |
>>>> pll4_p_ck--|M_ETHCK\             |G_ETHCK\  |
>>>>             | MUX    |------+-----| GATE   |-------------[x] ETH_CLK
>>>> pll3_q_ck--|_______/       |     |_______/                  eth_clk_fb
>>>>             |               |
>>>>             |               '--(ETHCKSELR[7:4] divider)--[x] 
>>>> clk_ptp_ref
>>>>             |                                          |
>>>>             '------------ ETHPTP_K --------------------'
>>>>
>>>> And this is what you should have, to avoid having two composite 
>>>> clock which control the same mux using the same register bit, i.e. 
>>>> what this patch implements:
>>>>
>>>>             .- ck_ker_eth -.  .--- ETHCK_K --.
>>>>             |_______       |  |    _______   |
>>>> pll4_p_ck--|M_ETHCK\      |  |   |G_ETHCK\  |
>>>>             | MUX    |------+-----| GATE   |-------------[x] ETH_CLK
>>>> pll3_q_ck--|_______/       |     |_______/                  eth_clk_fb
>>>>                             |
>>>>                             '--(ETHCKSELR[7:4] divider)--[x] 
>>>> clk_ptp_ref
>>>>                              |                         |
>>>>                              '---- ETHPTP_K -----------'
>>>>
>>>
>>> These 2 solutions are valid. I made the choice to implement the first 
>>> one to be able to change parent with the kernel clock of the IP (no 
>>> need to add an intermediate binding).
>>
>> Which IP are you talking about in here ?
>>
>>> It's the same principle for all kernel of this soc.
>>
>> The first option is wrong, because in that model, you have two 
>> composite clock which control the same one mux bit in the same 
>> register. Basically you register two distinct clock which operate the 
>> same hardware knob.
>>
>>> I can ask to Alexandre to comeback of this principle, but i 'm not 
>>> favorable.
>>
> 
> The only discussing thing is how the clock is shown. I mean either two 
> composites or one mux plus two gates. Gabriel made a choice to abstract 
> the mux in two composite clocks. But it seems that at the end we have 
> the same behaviour, isn't ?

Not really. Since the two composite clock control the same mux bit, 
consider what would happen if you were to select pll4_p_ck as parent for 
one (e.g. ETHCK_K), and pll3_q_ck as parent for the other (e.g. 
ETHPTP_K), what would be the result ? I guess the result would depend on 
when the reparenting of each ETHCK_K/ETHPTP_K happens on boot, and I 
don't think that's how it should work. With a single mux controlling 
that one single bit, such situation wouldn't happen.

> Adding "ck_ker_eth" would impose a new clock to take in DT ?
Nope, the ck_ker_eth is without ID and internal to the driver. They 
exist only to describe the clock tree correctly.

[...]
