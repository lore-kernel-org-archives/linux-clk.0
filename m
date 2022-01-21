Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC69BC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jan 2022 09:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240373AbiAUJEO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jan 2022 04:04:14 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39004 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1379656AbiAUJEO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jan 2022 04:04:14 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20L8YTA8027829;
        Fri, 21 Jan 2022 10:03:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wCxNw4pqcHwF3iXeYrsZ/hQ8jl39eocjVL0EIzakIKE=;
 b=hDALP4HNcNS3/SW0v0Nb5k3g0tUnGqIP83UjY92RP0GwlNcwOj0sd3kfVM+3lS9UjQE3
 ReU7vAztqhp8zebdehrZFJ0Um/jbVbdBXIJext5l7p2ENxOpsbhmaTaxMceX8lhrTCW8
 PtLEsxbTILi0Y1hO6YMm2+t0W1Zu2SqsEWl4H//CTRsSlpmYkCa/bkn8uxUX9lMtk7As
 cIJSYVrRuJsPPoW5fPGAdRZfVoN61MiW1tJO/lJTPBR5dbhGp3akTVwQFUBMv8KKu0Tk
 c6/YgWQoMWTmGiU4Mr72bfdicqbUmOtEo7dwA8bMDS+pIi0iBYhvMY8dQPExv/2dhdJV pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dqhxet4em-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jan 2022 10:03:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EC3710002A;
        Fri, 21 Jan 2022 10:03:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62B3320FA58;
        Fri, 21 Jan 2022 10:03:45 +0100 (CET)
Received: from lmecxl0572.lme.st.com (10.75.127.44) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 21 Jan
 2022 10:03:44 +0100
Subject: Re: [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
To:     Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC:     <jneuhauser@dh-electronics.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20220118202958.1840431-1-marex@denx.de>
From:   "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <2502d220-e918-c6fc-6c66-16a3c7a48d5b@foss.st.com>
Date:   Fri, 21 Jan 2022 10:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118202958.1840431-1-marex@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_06,2022-01-20_01,2021-12-02_01
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

The split between ETHCK_K gate, ETHPTPDIV and ck_ker_eth is fine for me.
It's reflected much better the clock ethernet distribution.
However the initial code should have let the ethck gate disable if ethck 
is not used.

You can add
Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

On 1/18/22 9:29 PM, Marek Vasut wrote:
> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
> in use, ETHCKEN gate can be turned off. Current driver does not permit
> that, fix it.
> 
> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent clock
> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
> ETHPTP_K remain functional as before.
> 
> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>      Figure 83. Peripheral clock distribution for Ethernet
>      https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/clk/clk-stm32mp1.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
> index 863274aa50e38..23a34ab459a3b 100644
> --- a/drivers/clk/clk-stm32mp1.c
> +++ b/drivers/clk/clk-stm32mp1.c
> @@ -2008,7 +2008,6 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
>   	KCLK(DSI_K, "dsi_k", dsi_src, 0, G_DSI, M_DSI),
>   	KCLK(ADFSDM_K, "adfsdm_k", sai_src, 0, G_ADFSDM, M_SAI1),
>   	KCLK(USBO_K, "usbo_k", usbo_src, 0, G_USBO, M_USBO),
> -	KCLK(ETHCK_K, "ethck_k", eth_src, 0, G_ETHCK, M_ETHCK),
>   
>   	/* Particulary Kernel Clocks (no mux or no gate) */
>   	MGATE_MP1(DFSDM_K, "dfsdm_k", "ck_mcu", 0, G_DFSDM),
> @@ -2017,11 +2016,16 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
>   	MGATE_MP1(GPU_K, "gpu_k", "pll2_q", 0, G_GPU),
>   	MGATE_MP1(DAC12_K, "dac12_k", "ck_lsi", 0, G_DAC12),
>   
> -	COMPOSITE(ETHPTP_K, "ethptp_k", eth_src, CLK_OPS_PARENT_ENABLE |
> +	COMPOSITE(NO_ID, "ck_ker_eth", eth_src, CLK_OPS_PARENT_ENABLE |
>   		  CLK_SET_RATE_NO_REPARENT,
>   		  _NO_GATE,
>   		  _MMUX(M_ETHCK),
> -		  _DIV(RCC_ETHCKSELR, 4, 4, 0, NULL)),
> +		  _NO_DIV),
> +
> +	MGATE_MP1(ETHCK_K, "ethck_k", "ck_ker_eth", 0, G_ETHCK),
> +
> +	DIV(ETHPTP_K, "ethptp_k", "ck_ker_eth", CLK_OPS_PARENT_ENABLE |
> +	    CLK_SET_RATE_NO_REPARENT, RCC_ETHCKSELR, 4, 4, 0),
>   
>   	/* RTC clock */
>   	COMPOSITE(RTC, "ck_rtc", rtc_src, CLK_OPS_PARENT_ENABLE,
> 
