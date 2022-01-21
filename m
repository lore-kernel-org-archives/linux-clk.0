Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCFCC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jan 2022 09:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379665AbiAUJGN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jan 2022 04:06:13 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:37450 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1379663AbiAUJGM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jan 2022 04:06:12 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20L8WfN1032350;
        Fri, 21 Jan 2022 10:05:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=g4rovonmGNLKjDUFtX2MlXR6+C/jkRKT9QGyIVbUt7g=;
 b=yoYpTSAI3LhjSiiiBPiksPDn9lh2Tpskri0wep7Zb40O0ZnYYo3QUjhrq+I0en6TGODq
 TMOCDALyaLrT0zhjcpjebT0s3YHMwa1qXsB9V2UG2dXDsBTTHkSjNoHExEn1KxC07S6l
 c+MpFPRw1utTn5GtcKF9uesANiZqGSxrlJmjnIpMwturvy/WCeWf9FIWeLV5pH4mBNZ5
 l+bTdrhWwHS2ob7RfDhgCEEmD1lSdTwcGKuNu0dlzuziEHCqPU3JQSyvGFrbPO8HHjTZ
 tz4LyJ0BxKRzKlRUJxQbQpA1XJdz1Xb0gI/pqiMVAC5XVHhJQ1F4J3+WciWzluc3Ko6l 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dqhx0j3mf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jan 2022 10:05:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABD4310002A;
        Fri, 21 Jan 2022 10:05:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1EAD210F65;
        Fri, 21 Jan 2022 10:05:46 +0100 (CET)
Received: from lmecxl0572.lme.st.com (10.75.127.47) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 21 Jan
 2022 10:05:04 +0100
Subject: Re: [PATCH 2/5] clk: stm32mp1: Add parent_data to ETHRX clock
To:     Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC:     <jneuhauser@dh-electronics.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20220118202958.1840431-1-marex@denx.de>
 <20220118202958.1840431-2-marex@denx.de>
From:   "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <9c62790d-b6ee-1462-0a9f-9c5b0bd71a23@foss.st.com>
Date:   Fri, 21 Jan 2022 10:05:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118202958.1840431-2-marex@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_06,2022-01-20_01,2021-12-02_01
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

Thanks for the patchet.

You can add

Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>




On 1/18/22 9:29 PM, Marek Vasut wrote:
> Pass parent_data to ETHRX clock with new fw_name = "ETH_RX_CLK/ETH_REF_CLK".
> By default, this change has no impact on the operation of the clock driver.
> However, due to the fw_name, it permits DT to override ETHRX clock parent,
> which might be needed in case the ETHRX clock are supplied by external clock
> source.
> 
> Example of MCO2 supplying clock to ETH_RX_CLK via external pad-to-pad wire:
> &rcc {
>           clocks = <&rcc CK_MCO2>;
>           clock-names = "ETH_RX_CLK/ETH_REF_CLK";
> };
> 
> Note that while this patch permits to implement this rare usecase, the issue
> with ethernet RX and TX input clock modeling on MP1 is far more complex and
> requires more core plumbing.
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
>   drivers/clk/clk-stm32mp1.c | 36 ++++++++++++++++++++++++++++++++----
>   1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
> index 23a34ab459a3b..7ad2e6203baef 100644
> --- a/drivers/clk/clk-stm32mp1.c
> +++ b/drivers/clk/clk-stm32mp1.c
> @@ -155,6 +155,10 @@ static const char * const eth_src[] = {
>   	"pll4_p", "pll3_q"
>   };
>   
> +const struct clk_parent_data ethrx_src[] = {
> +	{ .name = "ethck_k", .fw_name = "ETH_RX_CLK/ETH_REF_CLK" },
> +};
> +
>   static const char * const rng_src[] = {
>   	"ck_csi", "pll4_r", "ck_lse", "ck_lsi"
>   };
> @@ -317,6 +321,7 @@ struct clock_config {
>   	const char *name;
>   	const char *parent_name;
>   	const char * const *parent_names;
> +	const struct clk_parent_data *parent_data;
>   	int num_parents;
>   	unsigned long flags;
>   	void *cfg;
> @@ -576,6 +581,7 @@ static struct clk_hw *
>   clk_stm32_register_gate_ops(struct device *dev,
>   			    const char *name,
>   			    const char *parent_name,
> +			    const struct clk_parent_data *parent_data,
>   			    unsigned long flags,
>   			    void __iomem *base,
>   			    const struct stm32_gate_cfg *cfg,
> @@ -586,7 +592,10 @@ clk_stm32_register_gate_ops(struct device *dev,
>   	int ret;
>   
>   	init.name = name;
> -	init.parent_names = &parent_name;
> +	if (parent_name)
> +		init.parent_names = &parent_name;
> +	if (parent_data)
> +		init.parent_data = parent_data;
>   	init.num_parents = 1;
>   	init.flags = flags;
>   
> @@ -611,6 +620,7 @@ clk_stm32_register_gate_ops(struct device *dev,
>   static struct clk_hw *
>   clk_stm32_register_composite(struct device *dev,
>   			     const char *name, const char * const *parent_names,
> +			     const struct clk_parent_data *parent_data,
>   			     int num_parents, void __iomem *base,
>   			     const struct stm32_composite_cfg *cfg,
>   			     unsigned long flags, spinlock_t *lock)
> @@ -1135,6 +1145,7 @@ _clk_stm32_register_gate(struct device *dev,
>   	return clk_stm32_register_gate_ops(dev,
>   				    cfg->name,
>   				    cfg->parent_name,
> +				    cfg->parent_data,
>   				    cfg->flags,
>   				    base,
>   				    cfg->cfg,
> @@ -1148,8 +1159,8 @@ _clk_stm32_register_composite(struct device *dev,
>   			      const struct clock_config *cfg)
>   {
>   	return clk_stm32_register_composite(dev, cfg->name, cfg->parent_names,
> -					    cfg->num_parents, base, cfg->cfg,
> -					    cfg->flags, lock);
> +					    cfg->parent_data, cfg->num_parents,
> +					    base, cfg->cfg, cfg->flags, lock);
>   }
>   
>   #define GATE(_id, _name, _parent, _flags, _offset, _bit_idx, _gate_flags)\
> @@ -1258,6 +1269,16 @@ _clk_stm32_register_composite(struct device *dev,
>   	.func		= _clk_stm32_register_gate,\
>   }
>   
> +#define STM32_GATE_PDATA(_id, _name, _parent, _flags, _gate)\
> +{\
> +	.id		= _id,\
> +	.name		= _name,\
> +	.parent_data	= _parent,\
> +	.flags		= _flags,\
> +	.cfg		= (struct stm32_gate_cfg *) {_gate},\
> +	.func		= _clk_stm32_register_gate,\
> +}
> +
>   #define _STM32_GATE(_gate_offset, _gate_bit_idx, _gate_flags, _mgate, _ops)\
>   	(&(struct stm32_gate_cfg) {\
>   		&(struct gate_cfg) {\
> @@ -1291,6 +1312,10 @@ _clk_stm32_register_composite(struct device *dev,
>   	STM32_GATE(_id, _name, _parent, _flags,\
>   		   _STM32_MGATE(_mgate))
>   
> +#define MGATE_MP1_PDATA(_id, _name, _parent, _flags, _mgate)\
> +	STM32_GATE_PDATA(_id, _name, _parent, _flags,\
> +		   _STM32_MGATE(_mgate))
> +
>   #define _STM32_DIV(_div_offset, _div_shift, _div_width,\
>   		   _div_flags, _div_table, _ops)\
>   	.div = &(struct stm32_div_cfg) {\
> @@ -1354,6 +1379,9 @@ _clk_stm32_register_composite(struct device *dev,
>   #define PCLK(_id, _name, _parent, _flags, _mgate)\
>   	MGATE_MP1(_id, _name, _parent, _flags, _mgate)
>   
> +#define PCLK_PDATA(_id, _name, _parent, _flags, _mgate)\
> +	MGATE_MP1_PDATA(_id, _name, _parent, _flags, _mgate)
> +
>   #define KCLK(_id, _name, _parents, _flags, _mgate, _mmux)\
>   	     COMPOSITE(_id, _name, _parents, CLK_OPS_PARENT_ENABLE |\
>   		       CLK_SET_RATE_NO_REPARENT | _flags,\
> @@ -1951,7 +1979,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
>   	PCLK(MDMA, "mdma", "ck_axi", 0, G_MDMA),
>   	PCLK(GPU, "gpu", "ck_axi", 0, G_GPU),
>   	PCLK(ETHTX, "ethtx", "ck_axi", 0, G_ETHTX),
> -	PCLK(ETHRX, "ethrx", "ck_axi", 0, G_ETHRX),
> +	PCLK_PDATA(ETHRX, "ethrx", ethrx_src, 0, G_ETHRX),
>   	PCLK(ETHMAC, "ethmac", "ck_axi", 0, G_ETHMAC),
>   	PCLK(FMC, "fmc", "ck_axi", CLK_IGNORE_UNUSED, G_FMC),
>   	PCLK(QSPI, "qspi", "ck_axi", CLK_IGNORE_UNUSED, G_QSPI),
> 
