Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5897EC43461
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 08:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 359E66121E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 08:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbhDLIJk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Apr 2021 04:09:40 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:20934 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237214AbhDLIJj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Apr 2021 04:09:39 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13C7w1aK025434;
        Mon, 12 Apr 2021 10:09:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pvms5u7x6A4ecK+KuAFYjtDWOxQgnlO0iSYSxnq8Vp4=;
 b=Jl9F0NnvfASZrqidpqpAuk8JntlQHOH6feqn5lhcAEOVLZlCNcmG98UhpbeHoh/TZGiq
 +4pBe5uRy8/K3AlrI0HH5yiyDGpF90RABKK9uCyyXwmgquLW6C+7jz8UUJftvok70FRI
 EJ82kT5jpHw23AgrNNVMU9WkjYK6uQfvudF8LPH40b8tl6B0NbC4Uce7DHMVFKtIDjz1
 Z4EPkaHbSVMH22hO5IunBSkl1f91LueP/+P+Yu39VR/OHjSDVSg8fdYM3gSthD9/tQwp
 KFRdJlRBZI38Jiz4QddhSe3xWaGPIO8lrqySeTc+RX9ocd8dQJAc8gS/bD4l6QinCPLp Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37v3g5u8s0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Apr 2021 10:09:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3617710002A;
        Mon, 12 Apr 2021 10:09:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26A14221F74;
        Mon, 12 Apr 2021 10:09:08 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 10:09:07 +0200
Subject: Re: [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX clock parent from
 ETHCK_K to MCO2 on DHCOM SoM
To:     Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC:     Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>,
        <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210408185731.135511-1-marex@denx.de>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <b81d6a69-713f-eda7-0837-d6e80d691c6a@foss.st.com>
Date:   Mon, 12 Apr 2021 10:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-12_04:2021-04-12,2021-04-12 signatures=0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek

On 4/8/21 8:57 PM, Marek Vasut wrote:
> The implementation of ETH_RX_CLK/ETH_REF_CLK handling on STM32MP1 currently
> does not permit selecting the RX clock input from SoC pad, the RX clock are
> hard-wired to eth_clk_fb. This cover letter describes multiple unsuccessful
> attempts at solving this problem and a proposed partial solution.
> 
> The problem is that in stm32mp151.dtsi, the "st,stm32mp1-dwmac" compatible
> ethernet requests mac-clk-rx = <&rcc ETHRX> as MAC RX clock, which per [1]
> page 576 maps to clk_rx_i signal. Upon closer inspection of clk-stm32mp1.c,
> the ETHRX clock 1) only models G_ETHRX gate, which represents ETHRXEN bit,
> and 2) sets ETHRX clock parent to ck_axi. Both are wrong for the following
> reasons:
> 1) ETHRX clock are composite clock of gate and two muxes, which ultimately
>     permit selecting ETHRX clock parent to be either eth_clk_fb or external
>     ETH_RX_CLK/ETH_REF_CLOCK clock from SoC pad. Because only the gate part
>     is modeled, the clock topology is wrong and it is not possible to select
>     the ETHRX clock parent using the clock framework at all.
> 2) ETHRX clock are supplied from a mux controlled by ETH_SEL[2] (from
>     SYSCFG), which is supplied from a mux controlled by ETH_REF_CLK_SEL
>     (from SYSCFG), which is supplied either by ETH_RX_CLK/ETH_REF_CLK
>     from pad OR internally from eth_clk_fb clock, which maps to ETHCK_K
>     clock. Hence, ETHRX can never be supplied by ck_axi.
> 
> Another unique feature of ETHRX clock muxes is that they are controlled
> via SYSCFG block instead of being part of the RCC block. This is a rather
> unfortunate design, as it creates dependency between RCC, SYSCFG and DWMAC.
> Currently, those clock muxes are configured in the dwmac4 driver through
> syscon interface to SYSCFG block, based on custom device tree properties --
> st,eth-clk-sel and st,eth-ref-clk-sel -- this is clearly not the correct
> approach.
> 
> First approach was to implement ETHRX clock including muxes in clk-stm32mp1.c.
> This means RCC clock driver, clk-stm32mp1.c, must obtain access to SYSCFG IP
> registers via some syscon_regmap_lookup_by_phandle() when registering ETHRX
> clock in RCC driver probe, so that it can read out SYSCFG register state to
> determine the current mux state, and later toggle the mux bits. The problem
> here is that the SYSCFG requires clock which are provided by RCC, so
> syscon_regmap_lookup_by_phandle() fails with EPROBE_DEFER because the clock
> are not available yet in RCC clock driver probe, so there is cyclic dependency
> between RCC and SYSCFG.
> 
> Similar approach would be to turn SYSCFG into simple-bus and implement
> separate SYSCFG clock sub-driver, which would register single clock mux with
> two parents -- ETHCK_K and ETH_RX_CLK -- and would only control the SYSCFG
> clock mux bits. The problem here is similar, for RCC driver to register the
> ETHRX clock, the ETHRX clock must have a parent clock, however the parent
> clock are not ready yet, because this new SYSCFG clock sub-driver requires
> SYSCFG register clock, which only become available once RCC finishes probing,
> so there again is a cyclic dependency between RCC and SYSCFG.
> 
> One possible solution could be to defer obtaining the SYSCFG regmap handle
> until later point, i.e. only once a register access to SYSCFG is required
> the first time. This could permit us to register the mux in the RCC driver
> including a mux which requires SYSCFG access via syscon, although this would
> likely still run into problems during probe, since the clock framework would
> call .get_parent() during mux registration and trigger the SYSCFG access.
> 
> All the above still only discusses the clock part of the problem. Even if
> the clock cyclic dependencies could be solved, it would be necessary to
> resolve legacy dwmac st,eth-clk-sel and st,eth-ref-clk-sel DT properties
> and avoid DT ABI break.

Thanks for those clear explanations and for this series. As discussed, 
this approach looks good to me as it doesn't break our current strategy 
for dwmac clock integration. I don't know if those cyclic redundancies 
will be fixed one day but we can have a look on dwmac DT properties (the 
gain to change them, the effort to keep the backward compatibility, code 
readability, ...).

Your DT patches looks good. I'll merge them soon.

regards
alex


> So in the end, this series takes a different approach and only partly solves
> the problem. This series splits ETHCK_K, so the ETHCK_K gate could be turned
> off and adds support for selecting ETHRX clock parent clock via DT. This then
> permits e.g. DHCOM to select MCO2 as ETHRX clock source and the clock tree is
> then correctly set up.
> 
> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>      Figure 83. Peripheral clock distribution for Ethernet
>      https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf
> 
> Marek Vasut (7):
>    clk: stm32mp1: Split ETHCK_K into separate MUX and GATE clock
>    clk: stm32mp1: The dev is always NULL, replace it with np
>    clk: stm32mp1: Register clock with device_node pointer
>    clk: stm32mp1: Add parent_data to ETHRX clock
>    ARM: dts: stm32: Add alternate pinmux for ethernet0 pins
>    ARM: dts: stm32: Add alternate pinmux for mco2 pins
>    ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on DHCOM
> 
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi     |  49 +++++++
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi |  20 ++-
>   drivers/clk/clk-stm32mp1.c                   | 134 +++++++++++--------
>   3 files changed, 146 insertions(+), 57 deletions(-)
> 
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> 


