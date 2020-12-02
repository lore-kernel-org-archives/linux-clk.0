Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FF4C64E7C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16E1421D7F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgLBOzS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 09:55:18 -0500
Received: from mail-dm6nam10on2060.outbound.protection.outlook.com ([40.107.93.60]:21750
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726430AbgLBOzS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 09:55:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AydB+xa+7sDo+ABUzCI5nWRR7Kw+DBltsZYmboOE/MEW0r04219hQiFHsVhIG4YiyToKefkd1hM4u/Yl/YkqhflHCsT8FQolhtKTb5BoW7/dLhjQdEU3jFXg/C1TNKEkxKiFyafWL1bjkz9q/CC8AcigfRzrTWHtszCPAFSvS+9ncRtsyJj3afcPlcMQdHc0aJLZQdz0zL6uV0svZ17EEIdE0PPb6mbnkmLCNfPHipIwVnirk0X4djeDD9P742tXAEU+g0wNduOyyHR2OAWLCXhdLaJ5VCtR1gs+r+ZmJmweQKiVp54G9swP/zg730ZnuyrLQSykYdFC0f4zGDxE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3WHfk6qXAXIq6r1CU+yHNIWpkbxB/YY0zfLKreaVx0=;
 b=Ar1EvaIrZcl12fiB6+7DIhjwKIrUqHVcO+onnpOPyZeIgFFATlSvjlpoUX5DZ3X1zTRm0AhZN5l7Ye2WIMYI0rp2nBCsJTz/JXhU3hJc+/OTM0Qc+Pa8ar1IkY7n6KmVZFke9pClRZY5zCii5g3ikhXNYsbvkU2wd7bkp/7cF48aLoP+fGjx5o8ZwE580leSUFi+H3PMJsvi4CcKyuAqR4bKVS+8Ed4AafgFZjiPv2QvFNoOpVPiBiJV3hSXpwMn0cbKFR/lyVD1gWDBiW9wgAIi39CUOyI6t6Jli63PzhrcnBMps0GGemU8L1f/Zgn/8jRoY/1BbWRQn1xCF7h8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3WHfk6qXAXIq6r1CU+yHNIWpkbxB/YY0zfLKreaVx0=;
 b=oSa6WnsppiKKY+AEAh9FhPCtsdAmj0jlOK10JtrcYxzOUYlZAgJUWJqZIK16PU0J7cANmN8QWPu39ovTd8DnrbLodCOvobWGC2Y9foPCZXWrR2sHM07PwpmHqHUzn5qMpezHdUU0xn8Y9yKpAeGedMi6gig3Rro6I/HWoLM5Waw=
Received: from CY4PR08CA0036.namprd08.prod.outlook.com (2603:10b6:903:151::22)
 by BN7PR02MB4131.namprd02.prod.outlook.com (2603:10b6:406:f6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 2 Dec
 2020 14:54:22 +0000
Received: from CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:151:cafe::74) by CY4PR08CA0036.outlook.office365.com
 (2603:10b6:903:151::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 14:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT015.mail.protection.outlook.com (10.152.75.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Wed, 2 Dec 2020 14:54:21 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 2 Dec 2020 06:54:19 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 2 Dec 2020 06:54:19 -0800
Envelope-to: rvisaval@xilinx.com,
 dshah@xilinx.com,
 tejasp@xilinx.com,
 rajanv@xilinx.com,
 sboyd@kernel.org,
 mturquette@baylibre.com,
 robh+dt@kernel.org,
 kernel@pengutronix.de,
 devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 m.tretter@pengutronix.de
Received: from [172.30.17.109] (port=39142)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kkTWN-00069S-Cv; Wed, 02 Dec 2020 06:54:19 -0800
Subject: Re: [PATCH 10/12] soc: xilinx: vcu: make the PLL configurable
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <robh+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-11-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <a780423e-56a4-9d0f-2c40-14c4bb9ea346@xilinx.com>
Date:   Wed, 2 Dec 2020 15:54:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116075532.4019252-11-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6212d11-a491-4b94-e51b-08d896d2270b
X-MS-TrafficTypeDiagnostic: BN7PR02MB4131:
X-Microsoft-Antispam-PRVS: <BN7PR02MB41316BDBF8FB55390EE63C95C6F30@BN7PR02MB4131.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgBws03tMNlEgnRuicAJu3xzARxu53ZXLmsZ5BZzrvokg9QL2O9O5FFK8WncKm5+sUs9n9KaS54/Y6i7kDdYQA4uYa8xWXfJvzpNR3y95QU4+dLCb6+ZNiL44DC8EzP/NUVxngYKztkNWrWvNsuQBPzQEzyAsv72y+LwHXuftKDiFV1Y2IC/QLpQDHii8YWm0BhOO/lDh2PZappbwncqbCXNHdf8xuQPZ4G1x7X9TPyGkmm0XT9YmAlvoqY9pSH5fSIXKaUFolVy9iYr8p3IAvXi0jx9Zym6ocgYfy/Tyypyxg5mwk2F9haIv34ZFIqWeI8/DeZx+L+HciXa1KHi/1wm5IVbSg+bvfb4Ca+na0i98bBoyWCLXtqPFfUy+UhNO9h4+qb25LDpdhdXEX4TQ7LklvV3PeJ4MkOd0KzSZyh09nh6KcOsnCkwJKV3bXEdoxnvfUKewUDOVjCHQ+ZYxj8uL/VdXeh+5fkFQh6urso=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966005)(2906002)(6666004)(5660300002)(70206006)(82740400003)(356005)(7636003)(8676002)(83380400001)(82310400003)(4326008)(44832011)(31686004)(70586007)(36756003)(2616005)(26005)(316002)(9786002)(186003)(426003)(31696002)(478600001)(54906003)(336012)(8936002)(110136005)(47076004)(50156003)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:54:21.4695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6212d11-a491-4b94-e51b-08d896d2270b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4131
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 16. 11. 20 8:55, Michael Tretter wrote:
> Do not configure the PLL when probing the driver, but register the clock
> in the clock framework and do the configuration based on the respective
> callbacks.
> 
> This is necessary to allow the consumers, i.e., encoder and decoder
> drivers, of the xlnx_vcu clock provider to set the clock rate and
> actually enable the clocks without relying on some pre-configuration.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/soc/xilinx/xlnx_vcu.c | 137 ++++++++++++++++++++++++++--------
>  1 file changed, 106 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
> index cf8456b4ef78..84d7c46cd42f 100644
> --- a/drivers/soc/xilinx/xlnx_vcu.c
> +++ b/drivers/soc/xilinx/xlnx_vcu.c
> @@ -257,9 +257,18 @@ static void xvcu_write_field_reg(void __iomem *iomem, int offset,
>  	xvcu_write(iomem, offset, val);
>  }
>  
> -static int xvcu_pll_wait_for_lock(struct xvcu_device *xvcu)
> +#define to_vcu_pll(_hw) container_of(_hw, struct vcu_pll, hw)
> +
> +struct vcu_pll {
> +	struct clk_hw hw;
> +	void __iomem *reg_base;
> +	unsigned long fvco_min;
> +	unsigned long fvco_max;
> +};
> +
> +static int xvcu_pll_wait_for_lock(struct vcu_pll *pll)
>  {
> -	void __iomem *base = xvcu->vcu_slcr_ba;
> +	void __iomem *base = pll->reg_base;
>  	unsigned long timeout;
>  	u32 lock_status;
>  
> @@ -307,9 +316,9 @@ static const struct xvcu_pll_cfg *xvcu_find_cfg(int div)
>  	return cfg;
>  }
>  
> -static int xvcu_pll_set_div(struct xvcu_device *xvcu, int div)
> +static int xvcu_pll_set_div(struct vcu_pll *pll, int div)
>  {
> -	void __iomem *base = xvcu->vcu_slcr_ba;
> +	void __iomem *base = pll->reg_base;
>  	const struct xvcu_pll_cfg *cfg = NULL;
>  	u32 vcu_pll_ctrl;
>  	u32 cfg_val;
> @@ -334,24 +343,49 @@ static int xvcu_pll_set_div(struct xvcu_device *xvcu, int div)
>  	return 0;
>  }
>  
> -static int xvcu_pll_set_rate(struct xvcu_device *xvcu,
> +static long xvcu_pll_round_rate(struct clk_hw *hw,
> +				unsigned long rate, unsigned long *parent_rate)
> +{
> +	struct vcu_pll *pll = to_vcu_pll(hw);
> +	unsigned int feedback_div;
> +
> +	rate = clamp_t(unsigned long, rate, pll->fvco_min, pll->fvco_max);
> +
> +	feedback_div = DIV_ROUND_CLOSEST_ULL(rate, *parent_rate);
> +	feedback_div = clamp_t(unsigned int, feedback_div, 25, 125);
> +
> +	return *parent_rate * feedback_div;
> +}
> +
> +static unsigned long xvcu_pll_recalc_rate(struct clk_hw *hw,
> +					  unsigned long parent_rate)
> +{
> +	struct vcu_pll *pll = to_vcu_pll(hw);
> +	void __iomem *base = pll->reg_base;
> +	unsigned int div;
> +	u32 vcu_pll_ctrl;
> +
> +	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
> +	div = (vcu_pll_ctrl >> VCU_PLL_CTRL_FBDIV_SHIFT) & VCU_PLL_CTRL_FBDIV_MASK;
> +
> +	return div * parent_rate;
> +}
> +
> +static int xvcu_pll_set_rate(struct clk_hw *hw,
>  			     unsigned long rate, unsigned long parent_rate)
>  {
> -	return xvcu_pll_set_div(xvcu, rate / parent_rate);
> +	struct vcu_pll *pll = to_vcu_pll(hw);
> +
> +	return xvcu_pll_set_div(pll, rate / parent_rate);
>  }
>  
> -static int xvcu_pll_enable(struct xvcu_device *xvcu)
> +static int xvcu_pll_enable(struct clk_hw *hw)
>  {
> -	void __iomem *base = xvcu->vcu_slcr_ba;
> +	struct vcu_pll *pll = to_vcu_pll(hw);
> +	void __iomem *base = pll->reg_base;
>  	u32 vcu_pll_ctrl;
>  	int ret;
>  
> -	ret = clk_prepare_enable(xvcu->pll_ref);
> -	if (ret) {
> -		dev_err(xvcu->dev, "failed to enable pll_ref clock source\n");
> -		return ret;
> -	}
> -
>  	xvcu_write_field_reg(base, VCU_PLL_CTRL,
>  			     1, VCU_PLL_CTRL_BYPASS_MASK,
>  			     VCU_PLL_CTRL_BYPASS_SHIFT);
> @@ -371,9 +405,9 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
>  	vcu_pll_ctrl |= (0 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
>  	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
>  
> -	ret = xvcu_pll_wait_for_lock(xvcu);
> +	ret = xvcu_pll_wait_for_lock(pll);
>  	if (ret) {
> -		dev_err(xvcu->dev, "PLL is not locked\n");
> +		pr_err("VCU PLL is not locked\n");
>  		goto err;
>  	}
>  
> @@ -381,15 +415,14 @@ static int xvcu_pll_enable(struct xvcu_device *xvcu)
>  			     0, VCU_PLL_CTRL_BYPASS_MASK,
>  			     VCU_PLL_CTRL_BYPASS_SHIFT);
>  
> -	return ret;
>  err:
> -	clk_disable_unprepare(xvcu->pll_ref);
>  	return ret;
>  }
>  
> -static void xvcu_pll_disable(struct xvcu_device *xvcu)
> +static void xvcu_pll_disable(struct clk_hw *hw)
>  {
> -	void __iomem *base = xvcu->vcu_slcr_ba;
> +	struct vcu_pll *pll = to_vcu_pll(hw);
> +	void __iomem *base = pll->reg_base;
>  	u32 vcu_pll_ctrl;
>  
>  	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
> @@ -400,8 +433,49 @@ static void xvcu_pll_disable(struct xvcu_device *xvcu)
>  	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_RESET_MASK << VCU_PLL_CTRL_RESET_SHIFT);
>  	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
>  	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
> +}
> +
> +static const struct clk_ops vcu_pll_ops = {
> +	.enable = xvcu_pll_enable,
> +	.disable = xvcu_pll_disable,
> +	.round_rate = xvcu_pll_round_rate,
> +	.recalc_rate = xvcu_pll_recalc_rate,
> +	.set_rate = xvcu_pll_set_rate,
> +};
> +
> +static struct clk_hw *xvcu_register_pll(struct device *dev,
> +					void __iomem *reg_base,
> +					const char *name, const char *parent,
> +					unsigned long flags)
> +{
> +	struct vcu_pll *pll;
> +	struct clk_hw *hw;
> +	struct clk_init_data init;
> +	int ret;
> +
> +	init.name = name;
> +	init.parent_names = &parent;
> +	init.ops = &vcu_pll_ops;
> +	init.num_parents = 1;
> +	init.flags = flags;
> +
> +	pll = devm_kmalloc(dev, sizeof(*pll), GFP_KERNEL);
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pll->hw.init = &init;
> +	pll->reg_base = reg_base;
> +	pll->fvco_min = FVCO_MIN;
> +	pll->fvco_max = FVCO_MAX;
> +
> +	hw = &pll->hw;
> +	ret = devm_clk_hw_register(dev, hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	clk_hw_set_rate_range(hw, pll->fvco_min, pll->fvco_max);
>  
> -	clk_disable_unprepare(xvcu->pll_ref);
> +	return hw;
>  }
>  
>  /**
> @@ -426,7 +500,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
>  	u32 pll_clk;
>  	u32 mod;
>  	int i;
> -	int ret;
>  	const struct xvcu_pll_cfg *found = NULL;
>  	struct clk_hw *hw;
>  
> @@ -486,13 +559,9 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
>  	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", coreclk);
>  	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
>  
> -	ret = xvcu_pll_set_rate(xvcu, fvco, refclk);
> -	if (ret)
> -		return ret;
> -
> -	hw = clk_hw_register_fixed_rate(xvcu->dev, "vcu_pll",
> -					__clk_get_name(xvcu->pll_ref),
> -					0, fvco);
> +	hw = xvcu_register_pll(xvcu->dev, xvcu,
> +			       "vcu_pll", __clk_get_name(xvcu->pll_ref),
> +			       CLK_SET_RATE_NO_REPARENT);

You should be passing address not xvcu structure itself.

Reported by sparse.
drivers/soc/xilinx/xlnx_vcu.c:562:43: warning: incorrect type in
argument 2 (different address spaces)
drivers/soc/xilinx/xlnx_vcu.c:562:43:    expected void [noderef] __iomem
*reg_base
drivers/soc/xilinx/xlnx_vcu.c:562:43:    got struct xvcu_device *xvcu

Thanks,
Michal
