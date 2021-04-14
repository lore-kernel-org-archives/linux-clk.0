Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09F3C433ED
	for <linux-clk@archiver.kernel.org>; Wed, 14 Apr 2021 13:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A41C60724
	for <linux-clk@archiver.kernel.org>; Wed, 14 Apr 2021 13:04:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbhDNNFS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Apr 2021 09:05:18 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:50734 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233242AbhDNNE0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Apr 2021 09:04:26 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13ED3YIl029133;
        Wed, 14 Apr 2021 15:03:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WwyhOomJmwutrJbMMnWKe5Zzis82DOmKJvlisKhNjoQ=;
 b=rSdRTWMn5+Fd1h0LexopnJ5ivrThXPnhiO3kZWgl4x8V28CNDVDYmwbHbh1s2Ncow4bX
 Z6TYNTO/HD2QnfLmlh9RPSEzXRH6ITnXn+X3tzceXdSGelqxr77frhbrFj51IlTFESxh
 UUkTGbXe1C/5dUXl1Qwdu0JAEWVgoQUpz2GnUixALVXjwyQaLCNKpp0ZUIByWvJzGfJ6
 /AUZXFsu5WtSTLRT/rS3yfA+4E//eSGHBrdtC76L77PkluHGXFhUc4cmbP9vIM87CLvD
 7DFV4LA2B5zZ4Ozgd4hTbrvnunHGUjBfd93tE9n3Be6miHmrpD2AGSS4AUb2O9QoczK6 gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37wr0xudqs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Apr 2021 15:03:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5A0210002A;
        Wed, 14 Apr 2021 15:03:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A6B5237C65;
        Wed, 14 Apr 2021 15:03:38 +0200 (CEST)
Received: from lmecxl0572.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr
 2021 15:03:37 +0200
From:   "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
To:     Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>,
        <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-2-marex@denx.de>
Message-ID: <2b10f5d9-54cb-ce83-b7aa-f4ec8e67c001@foss.st.com>
Date:   Wed, 14 Apr 2021 15:03:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210408185731.135511-2-marex@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-14_07:2021-04-14,2021-04-14 signatures=0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

Thanks for the patchset

On 4/8/21 8:57 PM, Marek Vasut wrote:
> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
> in use, ETHCKEN gate can be turned off. Current driver does not permit
> that, fix it.

I don"t understand, it's already the case.

ETHCK_K it's a composite with a MUX and a GATE.

ETHPTP_K (ETHPTPDIV) it's a composite with the same MUX and a DIV (no gate)

If you use only ETHPTPDIV,  ETHCKEN gate can be turned off.

  

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
> Signed-off-by: Marek Vasut<marex@denx.de>
> Cc: Alexandre Torgue<alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier<christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez<gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard<patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay<patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd<swboyd@chromium.org>
> Cc:linux-clk@vger.kernel.org
> Cc:linux-stm32@st-md-mailman.stormreply.com
> To:linux-arm-kernel@lists.infradead.org
> ---
>   drivers/clk/clk-stm32mp1.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
> index a875649df8b8..a7c7f544ee5d 100644
> --- a/drivers/clk/clk-stm32mp1.c
> +++ b/drivers/clk/clk-stm32mp1.c
> @@ -1949,7 +1949,6 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
>   	KCLK(DSI_K, "dsi_k", dsi_src, 0, G_DSI, M_DSI),
>   	KCLK(ADFSDM_K, "adfsdm_k", sai_src, 0, G_ADFSDM, M_SAI1),
>   	KCLK(USBO_K, "usbo_k", usbo_src, 0, G_USBO, M_USBO),
> -	KCLK(ETHCK_K, "ethck_k", eth_src, 0, G_ETHCK, M_ETHCK),
>   
>   	/* Particulary Kernel Clocks (no mux or no gate) */
>   	MGATE_MP1(DFSDM_K, "dfsdm_k", "ck_mcu", 0, G_DFSDM),
> @@ -1958,11 +1957,16 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
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
assigned parent with ETHCK_K will not work
> +
> +	DIV(ETHPTP_K, "ethptp_k", "ck_ker_eth", CLK_OPS_PARENT_ENABLE |

CLK_OPS_PARENT_ENABLE flags not useful with a divider.

best regards

Gabriel

> +	    CLK_SET_RATE_NO_REPARENT, RCC_ETHCKSELR, 4, 4, 0),
>   
>   	/* RTC clock */
>   	DIV(NO_ID, "ck_hse_rtc", "ck_hse", 0, RCC_RTCDIVR, 0, 6, 0),
