Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD8DC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 09:18:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241532AbiATJSO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 04:18:14 -0500
Received: from mail-dm6nam12on2089.outbound.protection.outlook.com ([40.107.243.89]:61601
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238582AbiATJSO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 20 Jan 2022 04:18:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlCx33579p3n6GEpfV0JFFTFVzliiV7nbTimmOMuGAcR/7QjQ5XBiaz6mTJ4FlD48CxhZnAfAynElukpd6kxxUc1I/SgQc9iT4P4GApNcKJc7Ixqltz6J1w9Lxp3msDsXX+YEjD+knLYB/Y0UFYgqeH3XHv0tSnVB0J1KxYEodoMNdhgQ142CvixTFpqIWzuUWyOIWO82qdEp1zGgfHnyoaQizWsxT5A0hLIKpobZBSG2T77fQnHwnywUtmRPlWMNHyo1d+jqoJPmirL5WCSuyElWJqVD+RNnSjBWmMLKNQg2I5Sr4DBfk6UVsaWdEvD/uuujNx4bxvMe+qZhbKEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKfUqZOa2D/lb93382ALDTB3PA0K7vmcAIALW1+GaMA=;
 b=DU04zcuAYUssUSsHYIlr0Xai1vOXsTG96Bfu11dOe93hu5xTTmzSbUqG85tTxo4GimeFkhfCRxMq/eIBHoh+On2zIOdRUvQZcfj/yjH7xFQaiTdh5E1nkRYu2KPcw2FM5G0tBTvde9idoH/3eGb50pWdbuYbDYFeCIIILI6oVV/KEZj/yfXuqaAiGGdqcBTCE0uT63o4gdB41vj6Vj3I9TSkCrjHtdIuIWg7qnt9zXT6aoB/EWhtN1pbveF24OezscjOuUcGmHtOGRccI7uh5g3Yk3ECpAHrbdtAosWQPZ5MsvtMq6uqZ45T/0Oj1iCRgVlP79zPtSeX6yIu7HH/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKfUqZOa2D/lb93382ALDTB3PA0K7vmcAIALW1+GaMA=;
 b=hTHK3EH/RQAQAbl9x1LL4avHxhrSZmqaifT64ZicW+VZ+UmTF/j5gzxU/ibqi9IgC3dVwVYhrCU4+iaUaR1BYHhk8cFmhxYd5eliDsjIbmZJoBD5JtZqkKnXg0AUloOemX9v7Ep7zLc0U7Xe7oZf6b+ExGknJPqsVlb1yc5pEq0=
Received: from BN9PR03CA0303.namprd03.prod.outlook.com (2603:10b6:408:112::8)
 by BYAPR02MB4054.namprd02.prod.outlook.com (2603:10b6:a02:fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.14; Thu, 20 Jan
 2022 09:18:09 +0000
Received: from BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::bb) by BN9PR03CA0303.outlook.office365.com
 (2603:10b6:408:112::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Thu, 20 Jan 2022 09:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT030.mail.protection.outlook.com (10.13.2.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Thu, 20 Jan 2022 09:18:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 20 Jan 2022 01:18:02 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 20 Jan 2022 01:18:02 -0800
Envelope-to: m.tretter@pengutronix.de,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 kernel@pengutronix.de
Received: from [10.254.241.49] (port=44140)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nATZy-000F9d-1u; Thu, 20 Jan 2022 01:18:02 -0800
Message-ID: <c496ed85-d64a-4961-3577-a917fecfc51e@xilinx.com>
Date:   Thu, 20 Jan 2022 10:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] clk: zynqmp: replace warn_once with pr_debug for
 failed clock ops
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <michal.simek@xilinx.com>, <rajan.vaja@xilinx.com>,
        <kernel@pengutronix.de>
References: <20220119115434.2042017-1-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220119115434.2042017-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be6137a3-588a-44f0-ef4e-08d9dbf5c666
X-MS-TrafficTypeDiagnostic: BYAPR02MB4054:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB40542280CCEF38A48D0FD18CC65A9@BYAPR02MB4054.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:174;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uscv940Hw05+/rTiI1M2tz7prBmhHohPehbAeHUxIo7aAI957D3l+xgqzS+kcG2MbEHQl3RbpJtSC2a6MgWrmx2FhYIxrycgO1tPR3TVVILyBNhjRBCSmz5zEHq3Om+mCYLdaIChH5FOYSK3/OreccsTog9GAiPPUWFva5m13iJdZXTi3Z7ec1mPBBlXM98KxU6y7lABMYWl2M2VHSobMUJb0Pk9lb/8tJxBzYYogYXRiHKj7urHTb2TOpAg5mqNBONRFVFMRzpuZVcNOic4vl0g/ZPi1OPSGmMLTwC5r6ifwhNe7ZJwvctCvEAbr+GM06THOCI/KQIWjM6FGlMi6iIrU8dV+bkk1Y6xDP5/CCok1OWQ6+3hUgGgVmnnoQ7E4AwtQz6s1Iu4nAqduuuoWdkdyPiQT0Afx8i+KM+q1T00y/rgCibqJ+FEjRIYMHA6a9SQ7CmnC3mnIQXWMlj3HxUSnK1L6FdfPYrePuLKFItdVQlWae18EJYBxKO+uaqg9GhnUruM7oDZ/w/IInzewT3AVfLbCj6BPReFNWZFwCnG8U2gkS1lmfwRmHWiVlG6I6DWW/hgmuXgzgv3zov+EzEA21txZK/PfGlWgcHJWkdsLDF+sXc0T6dRK+36uNJ6ETq/66PVrV+0YJ3l2Obts/ns7S6XGiILSLUAUaXZil/B3Jf++i5m77fC5ju/LVniTVN71qwxLUe4tcYH7fRuqPCyOAOzbkMJNg7TB3/wXlohHtxJMwet+eF505jOc8pHJLT6735PlsTNzhmNJ3JUm+vBnrbsz5Ka2v7BkrLz3me5+KmWQFCl6GxAGnO4tOhHUKEPSagUeEoearBSgnsnob7XcakjxV3zpCAJG/sUWnY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(336012)(186003)(44832011)(70586007)(426003)(2616005)(316002)(70206006)(26005)(508600001)(2906002)(9786002)(8676002)(53546011)(8936002)(54906003)(110136005)(7636003)(82310400004)(31696002)(36860700001)(36756003)(966005)(31686004)(6666004)(356005)(47076005)(5660300002)(83380400001)(50156003)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 09:18:09.0491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be6137a3-588a-44f0-ef4e-08d9dbf5c666
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4054
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 1/19/22 12:54, Michael Tretter wrote:
> The warning that a clock operation failed is only printed once. However,
> the function is called for various different clocks. The limit hides the
> warnings if different clocks are affected by the failures.
> 
> The clock ops might fail if the firmware that handles the clocks is
> misconfigured. Therefore, replace the pr_warn_once with pr_debug to
> allow the user to see all errors if necessary. By default, hide the
> error messages and let drivers handle the errors.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> This is v2 of the patch to improve the error messages of the ZynqMP
> clock driver [0].
> 
> [0] https://lore.kernel.org/all/20220112141229.700708-1-m.tretter@pengutronix.de/
> 
> Changelog:
> 
> v2:
> 
> - Update commit message
> - Use pr_debug instead of pr_warn
> ---
>   drivers/clk/zynqmp/clk-gate-zynqmp.c | 12 +++++------
>   drivers/clk/zynqmp/clk-mux-zynqmp.c  |  8 +++----
>   drivers/clk/zynqmp/divider.c         | 12 +++++------
>   drivers/clk/zynqmp/pll.c             | 32 ++++++++++++++--------------
>   4 files changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/clk-gate-zynqmp.c
> index 565ed67a0430..b89e55737198 100644
> --- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
> +++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
> @@ -41,8 +41,8 @@ static int zynqmp_clk_gate_enable(struct clk_hw *hw)
>   	ret = zynqmp_pm_clock_enable(clk_id);
>   
>   	if (ret)
> -		pr_warn_once("%s() clock enabled failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() clock enable failed for %s (id %d), ret = %d\n",
> +			 __func__, clk_name, clk_id, ret);
>   
>   	return ret;
>   }
> @@ -61,8 +61,8 @@ static void zynqmp_clk_gate_disable(struct clk_hw *hw)
>   	ret = zynqmp_pm_clock_disable(clk_id);
>   
>   	if (ret)
> -		pr_warn_once("%s() clock disable failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() clock disable failed for %s (id %d), ret = %d\n",
> +			 __func__, clk_name, clk_id, ret);
>   }
>   
>   /**
> @@ -80,8 +80,8 @@ static int zynqmp_clk_gate_is_enabled(struct clk_hw *hw)
>   
>   	ret = zynqmp_pm_clock_getstate(clk_id, &state);
>   	if (ret) {
> -		pr_warn_once("%s() clock get state failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() clock get state failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   		return -EIO;
>   	}
>   
> diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
> index 17afce594f28..60359333f26d 100644
> --- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
> +++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
> @@ -51,8 +51,8 @@ static u8 zynqmp_clk_mux_get_parent(struct clk_hw *hw)
>   	ret = zynqmp_pm_clock_getparent(clk_id, &val);
>   
>   	if (ret) {
> -		pr_warn_once("%s() getparent failed for clock: %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() getparent failed for clock: %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   		/*
>   		 * clk_core_get_parent_by_index() takes num_parents as incorrect
>   		 * index which is exactly what I want to return here
> @@ -80,8 +80,8 @@ static int zynqmp_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>   	ret = zynqmp_pm_clock_setparent(clk_id, index);
>   
>   	if (ret)
> -		pr_warn_once("%s() set parent failed for clock: %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() set parent failed for clock: %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   
>   	return ret;
>   }
> diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
> index cb49281f9cf9..422ea79907dd 100644
> --- a/drivers/clk/zynqmp/divider.c
> +++ b/drivers/clk/zynqmp/divider.c
> @@ -89,8 +89,8 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
>   	ret = zynqmp_pm_clock_getdivider(clk_id, &div);
>   
>   	if (ret)
> -		pr_warn_once("%s() get divider failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() get divider failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   
>   	if (div_type == TYPE_DIV1)
>   		value = div & 0xFFFF;
> @@ -177,8 +177,8 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
>   		ret = zynqmp_pm_clock_getdivider(clk_id, &bestdiv);
>   
>   		if (ret)
> -			pr_warn_once("%s() get divider failed for %s, ret = %d\n",
> -				     __func__, clk_name, ret);
> +			pr_debug("%s() get divider failed for %s, ret = %d\n",
> +				 __func__, clk_name, ret);
>   		if (div_type == TYPE_DIV1)
>   			bestdiv = bestdiv & 0xFFFF;
>   		else
> @@ -244,8 +244,8 @@ static int zynqmp_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
>   	ret = zynqmp_pm_clock_setdivider(clk_id, div);
>   
>   	if (ret)
> -		pr_warn_once("%s() set divider failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() set divider failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   
>   	return ret;
>   }
> diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
> index 036e4ff64a2f..91a6b4cc910e 100644
> --- a/drivers/clk/zynqmp/pll.c
> +++ b/drivers/clk/zynqmp/pll.c
> @@ -56,8 +56,8 @@ static inline enum pll_mode zynqmp_pll_get_mode(struct clk_hw *hw)
>   
>   	ret = zynqmp_pm_get_pll_frac_mode(clk_id, ret_payload);
>   	if (ret) {
> -		pr_warn_once("%s() PLL get frac mode failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() PLL get frac mode failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   		return PLL_MODE_ERROR;
>   	}
>   
> @@ -84,8 +84,8 @@ static inline void zynqmp_pll_set_mode(struct clk_hw *hw, bool on)
>   
>   	ret = zynqmp_pm_set_pll_frac_mode(clk_id, mode);
>   	if (ret)
> -		pr_warn_once("%s() PLL set frac mode failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() PLL set frac mode failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   	else
>   		clk->set_pll_mode = true;
>   }
> @@ -145,8 +145,8 @@ static unsigned long zynqmp_pll_recalc_rate(struct clk_hw *hw,
>   
>   	ret = zynqmp_pm_clock_getdivider(clk_id, &fbdiv);
>   	if (ret) {
> -		pr_warn_once("%s() get divider failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() get divider failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   		return 0ul;
>   	}
>   
> @@ -200,8 +200,8 @@ static int zynqmp_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>   			WARN(1, "More than allowed devices are using the %s, which is forbidden\n",
>   			     clk_name);
>   		else if (ret)
> -			pr_warn_once("%s() set divider failed for %s, ret = %d\n",
> -				     __func__, clk_name, ret);
> +			pr_debug("%s() set divider failed for %s, ret = %d\n",
> +				 __func__, clk_name, ret);
>   		zynqmp_pm_set_pll_frac_data(clk_id, f);
>   
>   		return rate + frac;
> @@ -211,8 +211,8 @@ static int zynqmp_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>   	fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
>   	ret = zynqmp_pm_clock_setdivider(clk_id, fbdiv);
>   	if (ret)
> -		pr_warn_once("%s() set divider failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() set divider failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   
>   	return parent_rate * fbdiv;
>   }
> @@ -233,8 +233,8 @@ static int zynqmp_pll_is_enabled(struct clk_hw *hw)
>   
>   	ret = zynqmp_pm_clock_getstate(clk_id, &state);
>   	if (ret) {
> -		pr_warn_once("%s() clock get state failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() clock get state failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   		return -EIO;
>   	}
>   
> @@ -265,8 +265,8 @@ static int zynqmp_pll_enable(struct clk_hw *hw)
>   
>   	ret = zynqmp_pm_clock_enable(clk_id);
>   	if (ret)
> -		pr_warn_once("%s() clock enable failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() clock enable failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   
>   	return ret;
>   }
> @@ -287,8 +287,8 @@ static void zynqmp_pll_disable(struct clk_hw *hw)
>   
>   	ret = zynqmp_pm_clock_disable(clk_id);
>   	if (ret)
> -		pr_warn_once("%s() clock disable failed for %s, ret = %d\n",
> -			     __func__, clk_name, ret);
> +		pr_debug("%s() clock disable failed for %s, ret = %d\n",
> +			 __func__, clk_name, ret);
>   }
>   
>   static const struct clk_ops zynqmp_pll_ops = {


Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
