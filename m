Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13B1C64E7B
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E9CB221FA
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgLBOu4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 09:50:56 -0500
Received: from mail-dm6nam12on2066.outbound.protection.outlook.com ([40.107.243.66]:14305
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726430AbgLBOuz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 09:50:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8/rutCwR9KHk/C6K27lvb6gVFM2GZ2eOpnWFRsuqiuT8pK4oHYnqB5G92Syw3IQT9hCX510JzVZjmndKQpyrCUYzxDzfvtmEZsEw+hEFJjlGtJojmfjav9yfEGW/1IVY0d0p+A+ejTJRLco7kG7sLa8C6Rg8LHnRBnkd6jKYfu2VcHR+1qgQCANERrHIaONtzZz8k/fIPHr7cwKg4rqQ5972mHHTNk6gCh2j4ahGOQFbTt7w8UhXC9eVaPiYG0dYKWLKX0hF+iyUKcO0Al5j7hdJc2IZFsTQfF8gWn/bl6Qb3guBoSgF5g+c35G1li3dYveH2Y0u4/UCr5cYAXtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUGIzIOrjzJBFKG3ueRE94c3LzqVznXyzXWApympgbk=;
 b=SSJ5AcxJwNDbEXqpfSegYQDWOXSOAZG3v7202JKwq2HbAPnoVNIvFiIV34vKRDHTSKbi7ZKOlZ4mDw/XLI7Fq+qmSH0/B8/UcmlRxLkXc7gVwW5YIq2bzHTPTaAiPmyBUdhVDcS7fW6RLPGzgWSJ7z8n/svDW8WfXy4Q35BFnJ0LKZ0iftRfk924/wOkkeqCI5nth7tael+T6XgS9BmxCNZJ4R6LdRDisGESaod3nNq2oe3pfhB3hshhJHZwG+Z/nKxgrB8iRbmj9DNYa1LAjzTs1okJwSIot3Oni40rPYE+NLh+JnZEK9/Qzp4cJ5zIbtSASB1/uVV282yF841UyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUGIzIOrjzJBFKG3ueRE94c3LzqVznXyzXWApympgbk=;
 b=SkeZKZ9DM3uXFluL/UOw8pqd1vqzKDfdHJXoLoO5f6j3nLF76sGUgetZJIy8SKswgBTEANhk9zYA9gac7Bu12eulFTFNmb8D0JsgvPWaWvGH0m6lYvyORUF7bcWYZC54Qsw5TIOXjAjrysKZILIlcAfSWJpzQ3wTp0C4HjTdQx0=
Received: from SN2PR01CA0067.prod.exchangelabs.com (2603:10b6:800::35) by
 PH0PR02MB7461.namprd02.prod.outlook.com (2603:10b6:510:15::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Wed, 2 Dec 2020 14:50:01 +0000
Received: from SN1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::8d) by SN2PR01CA0067.outlook.office365.com
 (2603:10b6:800::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 14:50:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT042.mail.protection.outlook.com (10.152.73.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Wed, 2 Dec 2020 14:50:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 2 Dec 2020 06:49:58 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 2 Dec 2020 06:49:58 -0800
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
Received: from [172.30.17.109] (port=38784)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kkTSA-0005cP-7M; Wed, 02 Dec 2020 06:49:58 -0800
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <robh+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-9-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 08/12] soc: xilinx: vcu: implement clock provider for
 output clocks
Message-ID: <71afe870-a10b-755d-37d3-1010abe17fe0@xilinx.com>
Date:   Wed, 2 Dec 2020 15:49:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116075532.4019252-9-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04de3dc7-199f-42be-8a68-08d896d18bc3
X-MS-TrafficTypeDiagnostic: PH0PR02MB7461:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7461D14BEB41F2B00285D201C6F30@PH0PR02MB7461.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jReer3yL2A0xbMHYOS0zHH+5nJ4f/6XrapvWBK9n7nr2jECNPS6iqoN8Rf9SleOz0vy+P45LmJGfoXxeo1g/bCeRaED+Fi6k8lLqnFU6jQN+oHFmE9pXIwBDXVG4VeBBnGs60aZamz/WwwOWMf1/syDWenmWX4965xI2jhCgaq8flyZLvKTOpiDc9zWW3qL3cfg9zbBRJnGdq8y7FTMNWfqnrsz6WB5p9XYullhorjhOmXLuxADmPLTXISCMFXoi+kEAUcqyPBDoTqaDUKLbRhJynOXNsvHFzPfGAmun9OcSXy++4si30ZG3hmqrI28ZrpNGf4wvU/UpJqk5bF+YIFbS3fSC8JJSIoDtST33O8splri0VFumD6dJvjZICbiRReqMRLkCXR78JLI+9cej1cfUb9g50h4fxj5CvZob5TJv2moO9zvwnx26PviZqUZMuaiMYKwol8Z89OhThfPoqab1eGGSf1a0gaMUePd6lIY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(5660300002)(6666004)(7636003)(82740400003)(70206006)(356005)(2906002)(31686004)(47076004)(4326008)(44832011)(2616005)(70586007)(9786002)(336012)(36756003)(83380400001)(31696002)(186003)(426003)(8936002)(8676002)(26005)(110136005)(82310400003)(36906005)(54906003)(316002)(478600001)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:50:00.9264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04de3dc7-199f-42be-8a68-08d896d18bc3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7461
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 16. 11. 20 8:55, Michael Tretter wrote:
> The VCU System-Level Control uses an internal PLL to drive the core and
> MCU clock for the allegro encoder and decoder based on an external PL
> clock.
> 
> In order be able to ensure that the clocks are enabled and to get their
> rate from other drivers, the module must implement a clock provider and
> register the clocks at the common clock framework. Other drivers are
> then able to access the clock via devicetree bindings.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/soc/xilinx/xlnx_vcu.c | 191 +++++++++++++++++++++++++++-------
>  1 file changed, 154 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
> index 725e646aa726..cedc8b7859f7 100644
> --- a/drivers/soc/xilinx/xlnx_vcu.c
> +++ b/drivers/soc/xilinx/xlnx_vcu.c
> @@ -18,6 +18,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> +#include <dt-bindings/clock/xlnx-vcu.h>
> +
>  /* vcu slcr registers, bitmask and shift */
>  #define VCU_PLL_CTRL			0x24
>  #define VCU_PLL_CTRL_RESET_MASK		0x01
> @@ -50,11 +52,6 @@
>  #define VCU_ENC_MCU_CTRL		0x34
>  #define VCU_DEC_CORE_CTRL		0x38
>  #define VCU_DEC_MCU_CTRL		0x3c
> -#define VCU_PLL_DIVISOR_MASK		0x3f
> -#define VCU_PLL_DIVISOR_SHIFT		4
> -#define VCU_SRCSEL_MASK			0x01
> -#define VCU_SRCSEL_SHIFT		0
> -#define VCU_SRCSEL_PLL			1
>  
>  #define VCU_PLL_STATUS			0x60
>  #define VCU_PLL_STATUS_LOCK_STATUS_MASK	0x01
> @@ -82,6 +79,7 @@ struct xvcu_device {
>  	struct regmap *logicore_reg_ba;
>  	void __iomem *vcu_slcr_ba;
>  	struct clk_hw *pll;
> +	struct clk_hw_onecell_data *clk_data;

The same here with clk_data - please update kernel-doc format.

>  };
>  
>  static struct regmap_config vcu_settings_regmap_config = {
> @@ -403,7 +401,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
>  	u32 refclk, coreclk, mcuclk, inte, deci;
>  	u32 divisor_mcu, divisor_core, fvco;
>  	u32 clkoutdiv, vcu_pll_ctrl, pll_clk;
> -	u32 mod, ctrl;
> +	u32 mod;
>  	int i;
>  	int ret;
>  	const struct xvcu_pll_cfg *found = NULL;
> @@ -478,37 +476,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
>  	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", coreclk);
>  	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
>  
> -	/* Set divisor for the core and mcu clock */
> -	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_ENC_CORE_CTRL);
> -	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
> -	ctrl |= (divisor_core & VCU_PLL_DIVISOR_MASK) <<
> -		 VCU_PLL_DIVISOR_SHIFT;
> -	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
> -	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
> -	xvcu_write(xvcu->vcu_slcr_ba, VCU_ENC_CORE_CTRL, ctrl);
> -
> -	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_DEC_CORE_CTRL);
> -	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
> -	ctrl |= (divisor_core & VCU_PLL_DIVISOR_MASK) <<
> -		 VCU_PLL_DIVISOR_SHIFT;
> -	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
> -	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
> -	xvcu_write(xvcu->vcu_slcr_ba, VCU_DEC_CORE_CTRL, ctrl);
> -
> -	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_ENC_MCU_CTRL);
> -	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
> -	ctrl |= (divisor_mcu & VCU_PLL_DIVISOR_MASK) << VCU_PLL_DIVISOR_SHIFT;
> -	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
> -	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
> -	xvcu_write(xvcu->vcu_slcr_ba, VCU_ENC_MCU_CTRL, ctrl);
> -
> -	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_DEC_MCU_CTRL);
> -	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
> -	ctrl |= (divisor_mcu & VCU_PLL_DIVISOR_MASK) << VCU_PLL_DIVISOR_SHIFT;
> -	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
> -	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
> -	xvcu_write(xvcu->vcu_slcr_ba, VCU_DEC_MCU_CTRL, ctrl);
> -
>  	ret = xvcu_pll_set_rate(xvcu, fvco, refclk);
>  	if (ret)
>  		return ret;
> @@ -545,6 +512,146 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
>  	return xvcu_pll_enable(xvcu);
>  }
>  
> +static struct clk_hw *xvcu_clk_hw_register_leaf(struct device *dev,
> +						const char *name,
> +						const char * const *parent_names,
> +						u8 num_parents,
> +						struct clk_hw *parent_default,
> +						void __iomem *reg,
> +						spinlock_t *lock)
> +{
> +	unsigned long flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT;
> +	u8 divider_flags = CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO |
> +			   CLK_DIVIDER_ROUND_CLOSEST;
> +	struct clk_hw *mux = NULL;
> +	struct clk_hw *divider = NULL;
> +	struct clk_hw *gate = NULL;
> +	char *name_mux;
> +	char *name_div;
> +	int err;
> +
> +	name_mux = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_mux");
> +	if (!name_mux) {
> +		err = -ENOMEM;
> +		goto err;
> +	}
> +	mux = clk_hw_register_mux(dev, name_mux, parent_names, num_parents,
> +				  flags, reg, 0, 1, 0, lock);
> +	if (IS_ERR(mux)) {
> +		err = PTR_ERR(divider);

mux here?
And smatch is reporting also this issue. Please take a look.

drivers/soc/xilinx/xlnx_vcu.c:541 xvcu_clk_hw_register_leaf() warn:
passing zero to 'PTR_ERR'
drivers/soc/xilinx/xlnx_vcu.c:577 xvcu_clk_hw_register_leaf() warn:
passing zero to 'ERR_PTR'



> +		goto err;
> +	}
> +	clk_hw_set_parent(mux, parent_default);
> +
> +	name_div = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_div");
> +	if (!name_div) {
> +		err = -ENOMEM;
> +		goto err;
> +	}
> +	divider = clk_hw_register_divider_parent_hw(dev, name_div, mux, flags,
> +						    reg, 4, 6, divider_flags,
> +						    lock);
> +	if (IS_ERR(divider)) {
> +		err = PTR_ERR(divider);
> +		goto err;
> +	}
> +
> +	gate = clk_hw_register_gate_parent_hw(dev, name, divider,
> +					      CLK_SET_RATE_PARENT, reg, 12, 0,
> +					      lock);
> +	if (IS_ERR(gate)) {
> +		err = PTR_ERR(gate);
> +		goto err;
> +	}
> +
> +	return gate;
> +
> +err:
> +	if (!IS_ERR_OR_NULL(gate))
> +		clk_hw_unregister_gate(gate);
> +	if (!IS_ERR_OR_NULL(divider))
> +		clk_hw_unregister_divider(divider);
> +	if (!IS_ERR_OR_NULL(mux))
> +		clk_hw_unregister_divider(mux);
> +
> +	return ERR_PTR(err);
> +}
> +
> +static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
> +{
> +	struct clk_hw *gate = hw;
> +	struct clk_hw *divider;
> +	struct clk_hw *mux;
> +
> +	if (!gate)
> +		return;
> +
> +	divider = clk_hw_get_parent(gate);
> +	clk_hw_unregister_gate(gate);
> +	if (!divider)
> +		return;
> +
> +	mux = clk_hw_get_parent(divider);
> +	clk_hw_unregister_mux(mux);
> +	if (!divider)
> +		return;
> +
> +	clk_hw_unregister_divider(divider);
> +}
> +
> +static DEFINE_SPINLOCK(venc_core_lock);
> +static DEFINE_SPINLOCK(venc_mcu_lock);
> +
> +static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
> +{
> +	struct device *dev = xvcu->dev;
> +	const char *parent_names[2];
> +	struct clk_hw *parent_default;
> +	struct clk_hw_onecell_data *data;
> +	struct clk_hw **hws;
> +	void __iomem *reg_base = xvcu->vcu_slcr_ba;
> +
> +	data = devm_kzalloc(dev, struct_size(data, hws, CLK_XVCU_NUM_CLOCKS), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->num = CLK_XVCU_NUM_CLOCKS;
> +	hws = data->hws;
> +
> +	xvcu->clk_data = data;
> +
> +	parent_default = xvcu->pll;
> +	parent_names[0] = "dummy";
> +	parent_names[1] = clk_hw_get_name(parent_default);
> +
> +	hws[CLK_XVCU_ENC_CORE] =
> +		xvcu_clk_hw_register_leaf(dev, "venc_core_clk",
> +					  parent_names,
> +					  ARRAY_SIZE(parent_names),
> +					  parent_default,
> +					  reg_base + VCU_ENC_CORE_CTRL,
> +					  &venc_core_lock);
> +	hws[CLK_XVCU_ENC_MCU] =
> +		xvcu_clk_hw_register_leaf(dev, "venc_mcu_clk",
> +					  parent_names,
> +					  ARRAY_SIZE(parent_names),
> +					  parent_default,
> +					  reg_base + VCU_ENC_MCU_CTRL,
> +					  &venc_mcu_lock);
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
> +}
> +
> +static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
> +{
> +	struct clk_hw_onecell_data *data = xvcu->clk_data;
> +	struct clk_hw **hws = data->hws;
> +
> +	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_MCU]))
> +		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_MCU]);
> +	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_CORE]))
> +		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_CORE]);
> +}
> +
>  /**
>   * xvcu_probe - Probe existence of the logicoreIP
>   *			and initialize PLL
> @@ -639,10 +746,18 @@ static int xvcu_probe(struct platform_device *pdev)
>  		goto error_pll_ref;
>  	}
>  
> +	ret = xvcu_register_clock_provider(xvcu);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register clock provider\n");
> +		goto error_clk_provider;
> +	}
> +
>  	dev_set_drvdata(&pdev->dev, xvcu);
>  
>  	return 0;
>  
> +error_clk_provider:
> +	xvcu_unregister_clock_provider(xvcu);
>  error_pll_ref:
>  	clk_disable_unprepare(xvcu->aclk);
>  	return ret;
> @@ -664,6 +779,8 @@ static int xvcu_remove(struct platform_device *pdev)
>  	if (!xvcu)
>  		return -ENODEV;
>  
> +	xvcu_unregister_clock_provider(xvcu);
> +
>  	/* Add the the Gasket isolation and put the VCU in reset. */
>  	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
>  
> 

M
