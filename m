Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B2AC433B4
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 13:47:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47385611BF
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 13:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235263AbhDPNr4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 09:47:56 -0400
Received: from phobos.denx.de ([85.214.62.61]:41060 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244263AbhDPNry (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Apr 2021 09:47:54 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9018980040;
        Fri, 16 Apr 2021 15:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1618580848;
        bh=OkObua3KTR0ZNvWiLBL10CgIZu5NLuXFPgQ2hfNtDr8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=0Oceb2TXalrun+4ppaaRrDWZVnjO7lfCCz70lpunWIg9wNQkRD7+H/uBcS6sKA20S
         xPjSwO24QtWgzSbvM6xfWrawA3Ka3S+eDuoZHs/oIZOYGlt3m0yd7xIq6tEUPkCslB
         rjsCjRuDvwy6+JIqpMkO08rz3futhwprguu0BFgIFrUW62Ib6wvgf+DqldAE33+Tbl
         mFusjXYKuJT4o3ujG0J9LzbQTJvWnDOtwOmfMQRW3R0ZmLQL9vPxqcX1BwtOj787hm
         tmXAkOXXTsfIHFqCALplyUxCd9X7zQ52DeKLrj9khTCi0sSDW24VshTDeaocPopjGh
         MMSdMff8GTnSg==
Subject: Re: [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
To:     "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
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
From:   Marek Vasut <marex@denx.de>
Message-ID: <e27dbccd-518f-7718-8cf7-cc9c8adb8a56@denx.de>
Date:   Fri, 16 Apr 2021 15:47:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d168aed8-aebd-1bee-aa72-3a3601718cad@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
> Hi Marek

Hello Gabriel,

> On 4/14/21 4:04 PM, Marek Vasut wrote:
>> On 4/14/21 3:03 PM, gabriel.fernandez@foss.st.com wrote:
>>> Hi Marek,
>>
>> Hello Gabriel,
>>
>>> Thanks for the patchset
>>>
>>> On 4/8/21 8:57 PM, Marek Vasut wrote:
>>>> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
>>>> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
>>>> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
>>>> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
>>>> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
>>>> in use, ETHCKEN gate can be turned off. Current driver does not permit
>>>> that, fix it.
>>>
>>> I don"t understand, it's already the case.
>>>
>>> ETHCK_K it's a composite with a MUX and a GATE.
>>
>> But ETHCK_K is _not_ a composite clock, look at the Figure 83 in the 
>> datasheet again and schematic below.
>>
>>> ETHPTP_K (ETHPTPDIV) it's a composite with the same MUX and a DIV (no 
>>> gate)
>>
>> But ETHPTP_K shouldn't control any mux, it is only a divider.
>>
>>> If you use only ETHPTPDIV,  ETHCKEN gate can be turned off.
>>
>> Look, this is what you have today:
>>
>>             .------------ ETHCK_K -----------.
>>             |_______               _______   |
>> pll4_p_ck--|M_ETHCK\             |G_ETHCK\  |
>>             | MUX    |------+-----| GATE   |-------------[x] ETH_CLK
>> pll3_q_ck--|_______/       |     |_______/                  eth_clk_fb
>>             |               |
>>             |               '--(ETHCKSELR[7:4] divider)--[x] clk_ptp_ref
>>             |                                          |
>>             '------------ ETHPTP_K --------------------'
>>
>> And this is what you should have, to avoid having two composite clock 
>> which control the same mux using the same register bit, i.e. what this 
>> patch implements:
>>
>>             .- ck_ker_eth -.  .--- ETHCK_K --.
>>             |_______       |  |    _______   |
>> pll4_p_ck--|M_ETHCK\      |  |   |G_ETHCK\  |
>>             | MUX    |------+-----| GATE   |-------------[x] ETH_CLK
>> pll3_q_ck--|_______/       |     |_______/                  eth_clk_fb
>>                             |
>>                             '--(ETHCKSELR[7:4] divider)--[x] clk_ptp_ref
>>                              |                         |
>>                              '---- ETHPTP_K -----------'
>>
> 
> These 2 solutions are valid. I made the choice to implement the first 
> one to be able to change parent with the kernel clock of the IP (no need 
> to add an intermediate binding).

Which IP are you talking about in here ?

> It's the same principle for all kernel 
> of this soc.

The first option is wrong, because in that model, you have two composite 
clock which control the same one mux bit in the same register. Basically 
you register two distinct clock which operate the same hardware knob.

> I can ask to Alexandre to comeback of this principle, but i 'm not 
> favorable.

Please ask.

>>>> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
>>>> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
>>>> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent 
>>>> clock
>>>> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
>>>> ETHPTP_K remain functional as before.
>>>>
>>>> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>>>>      Figure 83. Peripheral clock distribution for Ethernet
>>>> https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf 
>>>>
>>
>> [...]
>>
>>>> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
>>>> index a875649df8b8..a7c7f544ee5d 100644
>>>> --- a/drivers/clk/clk-stm32mp1.c
>>>> +++ b/drivers/clk/clk-stm32mp1.c
>>>> @@ -1949,7 +1949,6 @@ static const struct clock_config 
>>>> stm32mp1_clock_cfg[] = {
>>>>       KCLK(DSI_K, "dsi_k", dsi_src, 0, G_DSI, M_DSI),
>>>>       KCLK(ADFSDM_K, "adfsdm_k", sai_src, 0, G_ADFSDM, M_SAI1),
>>>>       KCLK(USBO_K, "usbo_k", usbo_src, 0, G_USBO, M_USBO),
>>>> -    KCLK(ETHCK_K, "ethck_k", eth_src, 0, G_ETHCK, M_ETHCK),
>>>>       /* Particulary Kernel Clocks (no mux or no gate) */
>>>>       MGATE_MP1(DFSDM_K, "dfsdm_k", "ck_mcu", 0, G_DFSDM),
>>>> @@ -1958,11 +1957,16 @@ static const struct clock_config 
>>>> stm32mp1_clock_cfg[] = {
>>>>       MGATE_MP1(GPU_K, "gpu_k", "pll2_q", 0, G_GPU),
>>>>       MGATE_MP1(DAC12_K, "dac12_k", "ck_lsi", 0, G_DAC12),
>>>> -    COMPOSITE(ETHPTP_K, "ethptp_k", eth_src, CLK_OPS_PARENT_ENABLE |
>>>> +    COMPOSITE(NO_ID, "ck_ker_eth", eth_src, CLK_OPS_PARENT_ENABLE |
>>>>             CLK_SET_RATE_NO_REPARENT,
>>>>             _NO_GATE,
>>>>             _MMUX(M_ETHCK),
>>>> -          _DIV(RCC_ETHCKSELR, 4, 4, 0, NULL)),
>>>> +          _NO_DIV),
>>>> +
>>>> +    MGATE_MP1(ETHCK_K, "ethck_k", "ck_ker_eth", 0, G_ETHCK),
>>> assigned parent with ETHCK_K will not work
>>>> +
>>>> +    DIV(ETHPTP_K, "ethptp_k", "ck_ker_eth", CLK_OPS_PARENT_ENABLE |
>>>
>>> CLK_OPS_PARENT_ENABLE flags not useful with a divider.
>>
>> How so ?
