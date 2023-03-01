Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363EBC64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 02:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjCACfS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 21:35:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjCACfR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 21:35:17 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9504E32CD7;
        Tue, 28 Feb 2023 18:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZF95IYSp3OAmSSIrBwSQ2eieREZaLUo3fkzMyZy1CQVuO5X34LTUj1heu/QunK0k4F22P+emRrUjvs0wAR7qlW3Emu4B/VgXlK4x7C9EX6lglb2uMd1bOYWnJPi+iJjJEcX5e+L60sZklImMtc1EkUG7UiO976V1EHpMyXwJGHFUQi/MlzsyZ13cKHnyLrgUT6HSqHRalXhLuhpyMwcgoTTkQIeqIay/uze3pVDrpTWEdm0c874J9NLrbekgnSI+kC8Wg0YBiAkqIm4MpZ7APHQw2YUMY89A0CwS8uSxPGJbmlySS8EN+yeT4j0JvfoxuNrkjG0L4w2ZXQPZHqAVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0R9WrlJEFPjDalOdiUaFPN5M7bsiOPE8gYFKjfVcEA=;
 b=ckkReh7KboJyZwghuoCi2KL46wIaLrzaBTrpWGq/h1j7AL7BMf/Zu5mJdN2h3RbfZjm9knDY/YUbJw6H/6lZYliZ/iBi/h7eU5hk1mzxmyVoJrO5LYcmMml2qiBzUO+waSFYXotqiDreJkrDxHkMOuYpNLjJXqoFmmnxsimEANF4GzAnMIGRwA6bAMlexk56juPnZfM7RVAwFIoEAiP6dy64eQLlEUxAzCFWMZD1p2X+UdUCMhjJLK7WMbKAIcPKzw+p494wxfab6jq4T7gwqHcD+ks5VnAPwO2gL19BHszd0R0wVXN0K2ge7JA7eItXSP1OYYixmsY3AXil0rbgrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 02:35:12 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a%3]) with mapi id 15.20.6134.027; Wed, 1 Mar 2023
 02:35:12 +0000
Message-ID: <8ab61d37-cd5f-87e6-c1dd-8ec06a0a8e16@oss.nxp.com>
Date:   Wed, 1 Mar 2023 10:34:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v6 2/5] clk: imx: imx8mp: Add audiomix block control
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc:     Fabio Estevam <festevam@gmail.com>, Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230228215739.171071-1-marex@denx.de>
 <20230228215739.171071-2-marex@denx.de>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230228215739.171071-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b071c1-5b4d-4c46-7433-08db19fd94cb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 83GDmtHugYNwcq+aen3/1qEVQgt3nwpHNmxxba0HKuaC7e1EIXEyCc7L46CnGbCPKTuT3wNwBp9QIecZWIRvEYnskEH4K2Zs2OCDuMz9telv8MIFybe73z8x6qZa7Q4thDr+UIypPxcqYn7BHdtJkzUAsbtV5oBMSuBMC3xxW7P4mx7uLghDQHNKFGOVLjz5kLJavLODmQYyayXN1eVgJd+W3gnFwVuj0LrLYaKmlTSIY2o6aQiIA/Bz7bs5NbJg0eLOejQRLxt5WG44l9W1rf64xd98p3fGhpk+LvmScMQm/rh01AIhTYSKJAMpP+bEiEjYbFCWWK40nzAEQyHagHzBxk97tbDyd4mHb2uPGxAGTkem5wkajaVIz6MH9V4Ifjwo7mQXSQdW+QhzdOC1fju/rniB1ya1JvfurmXgPqJI/kXCt/nE6KsGfanHVcpomJ6TLC/AaR3qX5/01Jq9O+JY97EcDB7wBkfB+QvKDY0wbCRsIAP/lRdbPpV5jfMfJSZ5wrapyYXWsv/RLhAZ7HJ8Mq5oChG3CygPkq+VjWEZadAMS1VU8Xsa16u7A8vewBpSWujXXDwtINWLRsRNwREDIdoP8lFr4CWW8VDmnbV3NM/knbMZ0lSiKNKvg3NOgqHz9yiN+TXDtWEHif3XDwivoJg1srpO7KRaZXDdjbmoKnWBCb8DT91TT/hSWyf2Rg+CTaZPVS6pHOsO1wxTKH6vSLdgk6nygBogbMiHZ4GQ7bO6hALl/9RnRYqKnmAPVL2wHZYB5V8HFvO6bq0+tMwi5OeUYitdrvZWifZrPNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(54906003)(316002)(478600001)(83380400001)(6666004)(52116002)(6486002)(2616005)(6506007)(53546011)(6512007)(186003)(26005)(8936002)(41300700001)(86362001)(2906002)(31696002)(5660300002)(7416002)(44832011)(30864003)(66946007)(66556008)(38350700002)(38100700002)(4326008)(8676002)(66476007)(31686004)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEczdUJkTTQzdTNSMFNJMnFDUytaOUpCejRvOHRCV0tHaENjVGNTMnFQSzBq?=
 =?utf-8?B?N0YxL1ZOc1YxT3VzeWlEbWtKMDZOakRtemJ0TXJ6aXdhR21uS3hGaUJlRmQ1?=
 =?utf-8?B?UnJyaGFubklJcTRiS1Noc1dCaUtFTmlCVlg0ZjZnbW10eHY4KzFuRGNVd2JO?=
 =?utf-8?B?SHgzY2hCUitkYnFzd2VrNS9iUzRrazdnSWhWdDVnbll4YTB0WmZob25iWGZM?=
 =?utf-8?B?SThoeTZWNndKYzVBSnRNZTVydlk0V0lJWmg3MkxBT2IweHFPSjFxbS9TWXB5?=
 =?utf-8?B?MDBidFFJcU5EYmtXZnlLUzNLQ24rZHlnQUUwUk92c1lTTUx2KzdqVGlHaU96?=
 =?utf-8?B?Mlg3clZOUnIxUGlPSXlPVHQyaFZBL0xYSDdwT2JuRFByK1EyKzRzMFlIcXg5?=
 =?utf-8?B?QVROVjZxbGxzM1JkV2lRdmdVMFZmeFYxMVE2bHcxS1BudkEzT0xVb3ZzTXZQ?=
 =?utf-8?B?Ujg0U2pDYnBLa25HeGdaY3FWdmxKMW54TVdISTh2NDlteVhQMGQ4bkg5TVRX?=
 =?utf-8?B?T2VjWlJMb005L3VXMGZJbzZ5NkJvN1ZCRGZSbFh2NXVsZlM2cmtGYXUvc1Ba?=
 =?utf-8?B?bEw0RWIvUEh4MU9IYjRNMWE4aTB1dlRSR3gzK2NTYitra2NId1psUDQxUzNv?=
 =?utf-8?B?VExVNXNnWStWdzFOTk5RWFJLTWZSZHdJOVZFUk5jSHlYRklDTGFQZVNUSzcy?=
 =?utf-8?B?c0l0QjFZcUVQN1V0eTh0dndWaStSV2M2UE1ETHRra29kSjA2UU51ZmEwSnpV?=
 =?utf-8?B?SkhDWFBxQ2FGalMyWXliR1JEU0duSnVpMjhIQVlaMVd6L3J1ODBQZ2VEbWRP?=
 =?utf-8?B?bmVFNXNqeXA5VDRVa1FiVUhQV3U3djhsc1FLM1kzSnBPM0Yva01hRjM2RjJo?=
 =?utf-8?B?WlZvdkNaSWFWWHpvblJjWDlZQWR6NlUybm1rd2VJOU1yRlpaTXNWMEVNUjhH?=
 =?utf-8?B?L0RCVk9zRFgvNThsT08zMm9sOFVDYVBaQkUxc2Y4SUo3VEN4Rm1wREY4RkE1?=
 =?utf-8?B?SkZ0U25Od3J1VWlRM1lIWDQ3bUgxZDVHbHA1aGtqcGdDQmg3K24yTEY3cTJz?=
 =?utf-8?B?c1E5R0pSNzhHTEdkcFZwVmtqbTBJc0lUMVEvZ0MvRDRXWU9Gc2VUVHpUZGlT?=
 =?utf-8?B?Nklyb0M3UGJia2hHc3hINEJqK2tTR3FhVlA0ZjFmS2tOYUZSSXR5VkNsUG9V?=
 =?utf-8?B?V29Dc3p5R2Z4N1hNMzZDZW92RUVYaHNaYUs5OWd0VXF4dVZJaVlzQnhrZ2JW?=
 =?utf-8?B?Zk5rNzhYeHlpbExtMkdWY0JmWHZCRHczY1crMG81cXlOWmVpRnNoNEVCQ0lm?=
 =?utf-8?B?MnpTU2Zncng1UXVtZHIyZlZESkhYa1RoSVdiQjkxWmIyU2YvZ3JtRkZaVGgv?=
 =?utf-8?B?NGc5NUE4eDNFaDBoL1phTEw0SnBEbTk2bVVNZlF1b0VwZHcwcCt5dHFkWmoy?=
 =?utf-8?B?RDJ3VUt0N0NTWDhGMVJubCtYcmdqRnY0c2MxVkVsZ3Vpd1JvcVA5QVNiR0Zj?=
 =?utf-8?B?N1NHUXZSdVVnRzBUMDBkNDY2cTR0RzBxODJWdUhCSUV0N3Y0dzFWL0lKVXJI?=
 =?utf-8?B?QUNBdnlpQ2M3N0luV2VZQTg3RVptUnpBUFJqNFNkV3FwODk2WStsQUdoc3d1?=
 =?utf-8?B?bW1GT0FkOTd1WUFwOEZaNWhwdWpjSW9NRFBtSm9Ua0l1RlVCdlV5bytudHBu?=
 =?utf-8?B?Mi9oa2Z2MzRRRFNITmJ5eE1pQXN1V0E0VHE5WEs1QnFoRkJubUdPbWhQT1Rs?=
 =?utf-8?B?YjhiTlZwNU1GTHZGb0ZTejhWVDdHVmZDU1VLTFVhQVJBV0NPSnVhSU1ycWNB?=
 =?utf-8?B?eGk4T0ZSand1aVNmMW1lUkNWZ0NPUWJrN0Fqc0hlWExxSmI1R0lJK0RLRmc2?=
 =?utf-8?B?UDFQamIvTlhLV1VBVHdLNDhPVS81UHNUZDA1UHVGeWxjbjZYcTJUQnlJWkZ0?=
 =?utf-8?B?YXU2UUlEZ1NlVkJhcmptd1NFTHlaSmZkTVJlUUdEemczWTZkc2NEMW1rMXhx?=
 =?utf-8?B?WFJDbnQ5dzlJd3lnSkV2bTJMMnA5enFKYzlmSzJEYnFlRHNhN3hCVEg1cllK?=
 =?utf-8?B?MGp2Umt5V0dXbkRrZmJaNExGcGoxbGROMmFrZmlGaUE3VmlnbjJpT1JzMXZu?=
 =?utf-8?Q?CQmKUmO4eew7aZOBrqfTA8awv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b071c1-5b4d-4c46-7433-08db19fd94cb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 02:35:11.9785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+PC1oLW37jiPU+/5QtQBZVzaVJAkEvEN/TcQ3UIvjdpf+do6TZHSlT/7PbNHNDCr4UvBegysPK2+CMsG5Akcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/1/2023 5:57 AM, Marek Vasut wrote:
> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Model it as a large static table of
> gates and muxes with one exception, which is the PLL14xx . The PLL14xx
> SAI PLL has to be registered separately.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: No change
> V3: - Use devm_platform_ioremap_resource
>      - Use clk_hw_onecell_data instead of clk_imx8mp_audiomix_priv
>      - Include mod_devicetable.h for of_device_id struct
>      - Use struct clk_parent_data instead of string parent_name
> V4: - Fix SAI_MCLK_SEL offset as pointed out by Marco
>      - Add TB from Luca
>      - Use devm_clk_hw_register_mux_parent_data_table() and drop
>        custom devm_clk_hw_register_mux_parent_data() patch, tweak
>        the indent to be less hideous
>      - Rebase on next 20230223
> V5: Add TB from Adam and Alexander
> V6: Add RB from Fabio
> ---
>   drivers/clk/imx/Makefile              |   2 +-
>   drivers/clk/imx/clk-imx8mp-audiomix.c | 277 ++++++++++++++++++++++++++
>   2 files changed, 278 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/clk/imx/clk-imx8mp-audiomix.c
> 
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index a75d59f7cb8a6..ae9d84ef046ba 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -27,7 +27,7 @@ obj-$(CONFIG_MXC_CLK) += mxc-clk.o
>   
>   obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm.o
>   obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
> -obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
> +obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
>   obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
>   
>   obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> new file mode 100644
> index 0000000000000..e4300df88f1ac
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for i.MX8M Plus Audio BLK_CTRL
> + *
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +
> +#include "clk.h"
> +
> +#define CLKEN0			0x000
> +#define CLKEN1			0x004
> +#define SAI_MCLK_SEL(n)		(0x300 + 4 * (n))	/* n in 0..5 */
> +#define PDM_SEL			0x318
> +#define SAI_PLL_GNRL_CTL	0x400
> +
> +#define SAIn_MCLK1_PARENT(n)						\
> +static const struct clk_parent_data					\
> +clk_imx8mp_audiomix_sai##n##_mclk1_parents[] = {			\
> +	{								\
> +		.fw_name = "sai"__stringify(n),				\
> +		.name = "sai"__stringify(n)				\
> +	}, {								\
> +		.fw_name = "sai"__stringify(n)"_mclk",			\
> +		.name = "sai"__stringify(n)"_mclk"			\
> +	},								\
> +}
> +
> +SAIn_MCLK1_PARENT(1);
> +SAIn_MCLK1_PARENT(2);
> +SAIn_MCLK1_PARENT(3);
> +SAIn_MCLK1_PARENT(5);
> +SAIn_MCLK1_PARENT(6);
> +SAIn_MCLK1_PARENT(7);
> +
> +static const struct clk_parent_data clk_imx8mp_audiomix_sai_mclk2_parents[] = {
> +	{ .fw_name = "sai1", .name = "sai1" },
> +	{ .fw_name = "sai2", .name = "sai2" },
> +	{ .fw_name = "sai3", .name = "sai3" },
> +	{ .name = "dummy" },
> +	{ .fw_name = "sai5", .name = "sai5" },
> +	{ .fw_name = "sai6", .name = "sai6" },
> +	{ .fw_name = "sai7", .name = "sai7" },
> +	{ .fw_name = "sai1_mclk", .name = "sai1_mclk" },
> +	{ .fw_name = "sai2_mclk", .name = "sai2_mclk" },
> +	{ .fw_name = "sai3_mclk", .name = "sai3_mclk" },
> +	{ .name = "dummy" },
> +	{ .fw_name = "sai5_mclk", .name = "sai5_mclk" },
> +	{ .fw_name = "sai6_mclk", .name = "sai6_mclk" },
> +	{ .fw_name = "sai7_mclk", .name = "sai7_mclk" },
> +	{ .fw_name = "spdif_extclk", .name = "spdif_extclk" },
> +	{ .name = "dummy" },
> +};
> +
> +static const struct clk_parent_data clk_imx8mp_audiomix_pdm_parents[] = {
> +	{ .fw_name = "pdm", .name = "pdm" },
> +	{ .name = "sai_pll_out_div2" },
> +	{ .fw_name = "sai1_mclk", .name = "sai1_mclk" },
> +	{ .name = "dummy" },
> +};
> +
> +
> +static const struct clk_parent_data clk_imx8mp_audiomix_pll_parents[] = {
> +	{ .fw_name = "osc_24m", .name = "osc_24m" },
> +	{ .name = "dummy" },
> +	{ .name = "dummy" },
> +	{ .name = "dummy" },
> +};
> +
> +static const struct clk_parent_data clk_imx8mp_audiomix_pll_bypass_sels[] = {
> +	{ .fw_name = "sai_pll", .name = "sai_pll" },
> +	{ .fw_name = "sai_pll_ref_sel", .name = "sai_pll_ref_sel" },
> +};
> +
> +#define CLK_GATE(gname, cname)						\
> +	{								\
> +		gname"_cg",						\
> +		IMX8MP_CLK_AUDIOMIX_##cname,				\
> +		{ .fw_name = "ahb", .name = "ahb" }, NULL, 1,		\
> +		CLKEN0 + 4 * !!(IMX8MP_CLK_AUDIOMIX_##cname / 32),	\
> +		1, IMX8MP_CLK_AUDIOMIX_##cname % 32			\
> +	}
> +
> +#define CLK_SAIn(n)							\
> +	{								\
> +		"sai"__stringify(n)"_mclk1_sel",			\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1_SEL, {},		\
> +		clk_imx8mp_audiomix_sai##n##_mclk1_parents,		\
> +		ARRAY_SIZE(clk_imx8mp_audiomix_sai##n##_mclk1_parents), \
> +		SAI_MCLK_SEL(n), 1, 0					\
> +	}, {								\
> +		"sai"__stringify(n)"_mclk2_sel",			\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2_SEL, {},		\
> +		clk_imx8mp_audiomix_sai_mclk2_parents,			\
> +		ARRAY_SIZE(clk_imx8mp_audiomix_sai_mclk2_parents),	\
> +		SAI_MCLK_SEL(n), 4, 1					\
> +	}, {								\
> +		"sai"__stringify(n)"_ipg_cg",				\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG,			\
> +		{ .fw_name = "ahb", .name = "ahb" }, NULL, 1,		\
> +		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG		\
> +	}, {								\
> +		"sai"__stringify(n)"_mclk1_cg",				\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1,			\
> +		{							\
> +			.fw_name = "sai"__stringify(n)"_mclk1_sel",	\
> +			.name = "sai"__stringify(n)"_mclk1_sel"		\
> +		}, NULL, 1,						\
> +		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1		\
> +	}, {								\
> +		"sai"__stringify(n)"_mclk2_cg",				\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2,			\
> +		{							\
> +			.fw_name = "sai"__stringify(n)"_mclk2_sel",	\
> +			.name = "sai"__stringify(n)"_mclk2_sel"		\
> +		}, NULL, 1,						\
> +		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2		\
> +	}, {								\
> +		"sai"__stringify(n)"_mclk3_cg",				\
> +		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3,			\
> +		{							\
> +			.fw_name = "sai_pll_out_div2",			\
> +			.name = "sai_pll_out_div2"			\
> +		}, NULL, 1,						\
> +		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3		\
> +	}
> +
> +#define CLK_PDM								\
> +	{								\
> +		"pdm_sel", IMX8MP_CLK_AUDIOMIX_PDM_SEL, {},		\
> +		clk_imx8mp_audiomix_pdm_parents,			\
> +		ARRAY_SIZE(clk_imx8mp_audiomix_pdm_parents),		\
> +		PDM_SEL, 2, 0						\
> +	}
> +
> +struct clk_imx8mp_audiomix_sel {
> +	const char			*name;
> +	int				clkid;
> +	const struct clk_parent_data	parent;		/* For gate */
> +	const struct clk_parent_data	*parents;	/* For mux */
> +	int				num_parents;
> +	u16				reg;
> +	u8				width;
> +	u8				shift;
> +};
> +
> +static struct clk_imx8mp_audiomix_sel sels[] = {
> +	CLK_GATE("asrc", ASRC_IPG),
> +	CLK_GATE("pdm", PDM_IPG),
> +	CLK_GATE("earc", EARC_IPG),
> +	CLK_GATE("ocrama", OCRAMA_IPG),
> +	CLK_GATE("aud2htx", AUD2HTX_IPG),
> +	CLK_GATE("earc_phy", EARC_PHY),
> +	CLK_GATE("sdma2", SDMA2_ROOT),
> +	CLK_GATE("sdma3", SDMA3_ROOT),
> +	CLK_GATE("spba2", SPBA2_ROOT),
> +	CLK_GATE("dsp", DSP_ROOT),
> +	CLK_GATE("dspdbg", DSPDBG_ROOT),
> +	CLK_GATE("edma", EDMA_ROOT),
> +	CLK_GATE("audpll", AUDPLL_ROOT),
> +	CLK_GATE("mu2", MU2_ROOT),
> +	CLK_GATE("mu3", MU3_ROOT),
> +	CLK_PDM,
> +	CLK_SAIn(1),
> +	CLK_SAIn(2),
> +	CLK_SAIn(3),
> +	CLK_SAIn(5),
> +	CLK_SAIn(6),
> +	CLK_SAIn(7)
> +};
> +
> +static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *priv;
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	struct clk_hw *hw;
> +	int i;
> +
> +	priv = devm_kzalloc(dev,
> +			    struct_size(priv, hws, IMX8MP_CLK_AUDIOMIX_END),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->num = IMX8MP_CLK_AUDIOMIX_END;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	for (i = 0; i < ARRAY_SIZE(sels); i++) {
> +		if (sels[i].num_parents == 1) {
> +			hw = devm_clk_hw_register_gate_parent_data(dev,
> +				sels[i].name, &sels[i].parent, 0,
> +				base + sels[i].reg, sels[i].shift, 0, NULL);
> +		} else {
> +			hw = devm_clk_hw_register_mux_parent_data_table(dev,
> +				sels[i].name, sels[i].parents,
> +				sels[i].num_parents, 0,
> +				base + sels[i].reg,
> +				sels[i].shift, sels[i].width,
> +				0, NULL, NULL);
> +		}
> +
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		priv->hws[sels[i].clkid] = hw;
> +	}
> +
> +	/* SAI PLL */
> +	hw = devm_clk_hw_register_mux_parent_data_table(dev,
> +		"sai_pll_ref_sel", clk_imx8mp_audiomix_pll_parents,
> +		ARRAY_SIZE(clk_imx8mp_audiomix_pll_parents),
> +		CLK_SET_RATE_NO_REPARENT, base + SAI_PLL_GNRL_CTL,
> +		0, 2, 0, NULL, NULL);
> +	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_REF_SEL] = hw;
> +
> +	hw = imx_dev_clk_hw_pll14xx(dev, "sai_pll", "sai_pll_ref_sel",
> +				    base + 0x400, &imx_1443x_pll);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL] = hw;
> +
> +	hw = devm_clk_hw_register_mux_parent_data_table(dev,
> +		"sai_pll_bypass", clk_imx8mp_audiomix_pll_bypass_sels,
> +		ARRAY_SIZE(clk_imx8mp_audiomix_pll_bypass_sels),
> +		CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
> +		base + SAI_PLL_GNRL_CTL, 16, 1, 0, NULL, NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_BYPASS] = hw;
> +
> +	hw = devm_clk_hw_register_gate(dev, "sai_pll_out", "sai_pll_bypass",
> +				       0, base + SAI_PLL_GNRL_CTL, 13,
> +				       0, NULL);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_OUT] = hw;
> +
> +	hw = devm_clk_hw_register_fixed_factor(dev, "sai_pll_out_div2",
> +					       "sai_pll_out", 0, 1, 2);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
> +					   priv);
> +}
> +
> +static const struct of_device_id clk_imx8mp_audiomix_of_match[] = {
> +	{ .compatible = "fsl,imx8mp-audio-blk-ctrl" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
> +
> +static struct platform_driver clk_imx8mp_audiomix_driver = {
> +	.probe	= clk_imx8mp_audiomix_probe,
> +	.driver = {
> +		.name = "imx8mp-audio-blk-ctrl",
> +		.of_match_table = clk_imx8mp_audiomix_of_match,
> +	},
> +};
> +
> +module_platform_driver(clk_imx8mp_audiomix_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("Freescale i.MX8MP Audio Block Controller driver");
> +MODULE_LICENSE("GPL");
