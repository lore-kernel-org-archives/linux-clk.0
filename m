Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B95C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 02:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjCACgr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 21:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjCACgq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 21:36:46 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727EB34022;
        Tue, 28 Feb 2023 18:36:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQfL9g0fhQuJzh74o4c6EDSENP9CWdUAyI9xmLdg2Vyx/vO31WjfxcPP/BO9nIVO8hjehJ5sLNWesYIBn0FeED7oLC3MuDZMAxd7rMJBSxplGJTT9f3eLtrATd4/VuvpTYNaDuCqZtkT9kobG8KnPCUFUr3ZLaZtHTEpAuZi8CEO9WYxhmPcCWM0JCmy/5qegciv4R+IE3XclYJVd/IXAc8kTEI9r6QBREjlqRRp40Y1RAVjdJCjVvisGQ+HOjYhtUSnBt7rFDZ8MhrGOUZWhBnmIPlHBC3fr6uJ+DSfFhF+tavJObt/c6DfeP9ML+wUsaVm3JWoGfmGWaz0GTCUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFUMO5tVPMUWXKHpF6RGHeUZHjxNvdP51iU0JmBKxwU=;
 b=Q6Cf9NNquXGSjXfeGjRoKzeRrlh32wzf9Cu7uO7QUJjqgZgjLAZC826cSt7j0mEacuRVcnWrjpYqrdadUFIYZ/RB7rGC6ZPpgip0Npu3U0NYhjxZ5po/CsyS3dMbLiIRVbABLDSF/vXl8ZNu4SCJ466/9jPARB5Woy7mcPmHpyupFiM12hUlik1LhjfkPUL9ZETu5CYsxVP2x+SNelG4LYgu8nl2QgzbVWQe3yJItZcLbBiZZNnRFUW2R/dCp2i8mk0lQzRk9VS/B7VIq8fKTNyL7R5a2Yi8cHn5OAMXxkuuw0mFL1Elu1rhZ7XmH0u0DZZKBukdbW2XYs9vfBaqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 02:36:41 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a%3]) with mapi id 15.20.6134.027; Wed, 1 Mar 2023
 02:36:41 +0000
Message-ID: <613008e5-8c78-ab6a-41d2-a8994da87b43@oss.nxp.com>
Date:   Wed, 1 Mar 2023 10:36:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v6 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc:     Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
 <20230228215739.171071-5-marex@denx.de>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230228215739.171071-5-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd194ba-08a3-48cf-8b56-08db19fdc9cc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XDgZIMPnt6kYspj4O3I+/aYgv/3QR0DPLQBq770gRgXgsH6JCCERX+bK7jToJe/fXI6qnm47R1cmEJM5GZ2TRTqo047nba+YqG8DZqslYwguZ2n+cQ/AaOHsVsJ7WbeuS/j8pW2hVKP9JBSvD+xuhcUMv7dVzyGomgcZOSSabjwJKAxH63x6/vCV1wfG0jQ/PcKEZro2K4FXjk9Q5vAW3Kl/I3sEOYKBgZJNw5yqXW8HNts4ZQRRFUba5gAIX78n4rzlQjKyYyn9LRpdpBrkgF6ZyceCk2cZCVdDF9ivPdyXMucmgwI8NoXAtxAF8hNPDmN79nqxhvdnVnK/rEqZaNev52ecOLBxOdWT9byy5UVXAJII0DY0w4zTjRjlRmAloPQh3caoNJm6vz6yppmhq5h1VxW0LWr4Ku8ElapqAeYKcxnBWcldJG+8D51NlMRVBI10rCfN991w3oL8BjzI2NMrwxKyAkG+OuRyft+uCUcGhPJDdHCwNyce7GG8CN6P7bTmQzlk2ncGOU65Sy3Ktm5bsG6SRDMeXinC8yPlcEZxTRY0Vq7tIaTJG46YrLmytjSebvS3xvLvNXSSVc3XxthKZXS4UJVeuqtfXOexXTUi3h11MU2bDOIc8cAPt21q2FCBASF84LqvAe6DLdLDu4V+N9c2W7ZGpXlzYUiNV+I2vRROC4aBNTaGOuciJYg+djD9TIfXHPFysmaltOg1qQaF3T6bF0VGvEvBmxsZKiQSnazIIaSQr5lfmsQ+aaFLic20fH4CX25i+Q+qf+xxBnNtNjeGVC28MR4iF+TRUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(54906003)(316002)(478600001)(83380400001)(6666004)(52116002)(6486002)(2616005)(6506007)(53546011)(6512007)(186003)(26005)(8936002)(41300700001)(86362001)(2906002)(31696002)(5660300002)(7416002)(44832011)(66946007)(66556008)(38350700002)(38100700002)(4326008)(8676002)(66476007)(31686004)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JOaFlqaXEvelVpWXAyMFhIZWFEMlpXODc1U1BlVVFETFJwRDZZdU5DZDlB?=
 =?utf-8?B?YlVOcmFLaElMQTZBVzZEV1I3YUdSR28vRFA5NGE2VGVWaFkrRTZnZHJCUDR1?=
 =?utf-8?B?TDJNYkFRNE1lRFg1dEh4TWdSaFRrYk9xOGdFNHpWQnMzd0R2VmpHd1YvaUVK?=
 =?utf-8?B?aDByS1FxRVdLQWJLc01YUkhRQURSNm4xY0pGVCtlWm5YNjliUFNFdTYydFN4?=
 =?utf-8?B?dG5FOFhvV0d3RWR1UVBYQ2xmREsrZVdXY1hYVS9mRFVmd0lCK0FMd3NjL0x6?=
 =?utf-8?B?bmtMTU9qT2Q0WnpEdDBPc25LSmk2M2Zvd3RDRmo5NHZDV0FHTEI3Wk5nQm9E?=
 =?utf-8?B?V1ltMS9UV1NNZDJRNlYrdkc4VzJuNCt3UngvTFVucENPREVIbWtYN1lJc1FE?=
 =?utf-8?B?WFdVcDhkYnJBeVZkZWRUVjVEZ1ZHb3JFdmtNNnZxTXYrSnBZaWlKdGxtT3R4?=
 =?utf-8?B?TjFqNGVnYU9TRWxyQnhSbk1WY0QxTG91bHFvT2NEQlIrSE85Y0tyM1dPaGhG?=
 =?utf-8?B?WHVOMEpYT3ppSmRNdGl5SVhqUUhpcEFOWHNCU0Z2d010NGdIYVdTNk9JV2VB?=
 =?utf-8?B?dWcveTJFMG9ZSmhGKzNlMkxoR0xwa1BPdmZsT0d3K0tBZWJGOEJwc1JZVkRJ?=
 =?utf-8?B?elovUlQxZUVvSDBXLzF6b1lSZXg5WFhsN2VmanNZSHdZZHdaYlUvN0pVNy9U?=
 =?utf-8?B?YmJLejJPUlZIRUpUNDI3SHZvVUppKzZSNTVOY2lCM2ErZDBYSllvV2Nyd1k3?=
 =?utf-8?B?MUw1KzUvQk1TSlZYd3lXbFFKNmJ5QzhyaVcyVkdzUFU5OTdPbVR0b1dqd2RH?=
 =?utf-8?B?Mnl5UVJ4RkRLc2NYUVlpV1d3MER6d3ZMRGRpYzJCa2xMVHExQkFkRkhDdTNl?=
 =?utf-8?B?N1RiWFhnSWlpcnh6VUhCRmxUanFOL0hoNkwyREN0NGExb3Fsdld6WHlkbVRl?=
 =?utf-8?B?QUFqQURvWU81WDNPcFdydzNKcG4yS2tJUmplMTBjd0pqdER5VmFEc1hnUWY3?=
 =?utf-8?B?WGs3U3JjMTJhazJTYVN1bEtjRGo1Y2c0VTk5MFBaaDIyYVhYa1pZYkxvTzdx?=
 =?utf-8?B?WTRkc0FBN2kzcWd6Yi8zQ3ZoaGd6V2JDUDlLTXRQTVNGdUlRdVFFclp2RWlV?=
 =?utf-8?B?Vk8zMU1EUDlnYWNwazVrZ1FueDFvN0RwNlZiWFQrcmd2UUlxNFJSb284T0dS?=
 =?utf-8?B?VmtjVkM0YnEyT3FGeDBWMHQ3K2FzRFNYOTNCdDJMdVU3R01QRTR1UzFZUnVt?=
 =?utf-8?B?SW5LdkI4L1QxQjBKaDlRd1NJVVUxc3FCZFU4eTBtaW54dDd2RC80bFo5L25w?=
 =?utf-8?B?S3lucDFINE1RTDRUaW1ZVXJoL2pGU0d4bmNUL04wL0lJWjZXTjhvNDJtZ2Fq?=
 =?utf-8?B?Z2FUNDNueGpQRUtIdUJ4aGloNkx2ZUhLU21OOUhUWE9yYUNBM0NhcE91cFBy?=
 =?utf-8?B?a3dVdHFRRmlCR3BxVHJyZmQyQyt3MjJHYzJIMGcxa0VFaE10eEx6aUUwdW1i?=
 =?utf-8?B?aTM2ejgzUEtkY0dQRVFFeERlZXpaczlqREVRNXkrMk1TOVZCcUV3RDJ2ellr?=
 =?utf-8?B?enV2MGVVSkN4UlJNN2hqMjNTdExreGM2YXNjK243S1ZOZEl1YnBjRmNETDhQ?=
 =?utf-8?B?NXBqcEtuZXYvbTZqVmNVbVlkNTlhTmFvRHRjNzhxRE53UmhnY3JJYXZHRDZF?=
 =?utf-8?B?Znd1RCthOVZwZkdWLzAvanNVZ3Q0R0Q0bEpNbDJqVk8yNG9oaStRRzhmSThi?=
 =?utf-8?B?cUUxRU51K0p2emJmNFY4MmFNYzg3cjlsRUgxUUNnK2dhUzdXR1JWMHkvZVNQ?=
 =?utf-8?B?QmdwQ0xvRHhJeHV6UXhoY0oyeVpXMnFzQnM4dWhrVU4xTGRDbnByY2d6c3or?=
 =?utf-8?B?ZGdkSzBndUxld3lDWjBSU0Z6WTFWZngxWEZuZGRScHlwQVN6NDdNaDBEV0Fp?=
 =?utf-8?B?WUNYUXNTU0NNOHdJMkdrWkh0QkVKVm44UjBISUw1Sm9heUEvTGxEbEtrWFlB?=
 =?utf-8?B?RnBqbmlMTkdQUDloOGt1YmxUYUFSMlZiaENldmg0bHQ2RDFlRjR4Vk1oMUEy?=
 =?utf-8?B?bHBrOWM1SWE5bWZDaWZ4MmxCR1JDSEZPL0FhQUZtNmdQUytVbEh3WTR6V2Mz?=
 =?utf-8?Q?H2lQ2xU5dtf43um8enZK6iXbG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd194ba-08a3-48cf-8b56-08db19fdc9cc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 02:36:40.9539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ctxYyUcnLXiMNjKdYS0kPtfeerc2Jd7Dlg3oEMiJlkhXLhtZ8GLyV6i68EFsVtm7BN4079qdOUD19fF6of89g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/1/2023 5:57 AM, Marek Vasut wrote:
> Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
> This is all that is needed to get analog audio output operational
> on i.MX8MP EVK.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Peng Fan <peng.fan@nxp.com>

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
> V3: No change
> V4: - Update codec node name and phandle label
>      - Use just sound for the sound node name
>      - Rebase on next 20230223
> V5: - Drop regulator-always-on from codec regulator
>      - Add RB from Fabio
>      - TB by Alexander added and removed again, since the patch was reworked
>      - Switch to simple-audio-card
>      - Add sound-dai-cells to codec node
> V6: - Split off separate pinctrl for regulator
>      - Drop unused SAI3_RXFS pinmux
> ---
>   arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 80 ++++++++++++++++++++
>   1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 7816853162b3f..fa37ce89f8d3d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -40,6 +40,17 @@ pcie0_refclk: pcie0-refclk {
>   		clock-frequency = <100000000>;
>   	};
>   
> +	reg_audio_pwr: regulator-audio-pwr {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_audio_pwr_reg>;
> +		regulator-name = "audio-pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>   	reg_can1_stby: regulator-can1-stby {
>   		compatible = "regulator-fixed";
>   		regulator-name = "can1-stby";
> @@ -83,6 +94,37 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>   		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>   		enable-active-high;
>   	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "wm8960-audio";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&cpudai>;
> +		simple-audio-card,bitclock-master = <&cpudai>;
> +		simple-audio-card,widgets =
> +			"Headphone", "Headphone Jack",
> +			"Speaker", "External Speaker",
> +			"Microphone", "Mic Jack";
> +		simple-audio-card,routing =
> +			"Headphone Jack", "HP_L",
> +			"Headphone Jack", "HP_R",
> +			"External Speaker", "SPK_LP",
> +			"External Speaker", "SPK_LN",
> +			"External Speaker", "SPK_RP",
> +			"External Speaker", "SPK_RN",
> +			"LINPUT1", "Mic Jack",
> +			"LINPUT3", "Mic Jack",
> +			"Mic Jack", "MICB";
> +
> +		cpudai: simple-audio-card,cpu {
> +			sound-dai = <&sai3>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&wm8960>;
> +		};
> +
> +	};
>   };
>   
>   &flexspi {
> @@ -344,6 +386,18 @@ &i2c3 {
>   	pinctrl-0 = <&pinctrl_i2c3>;
>   	status = "okay";
>   
> +	wm8960: codec@1a {
> +		compatible = "wlf,wm8960";
> +		reg = <0x1a>;
> +		#sound-dai-cells = <0>;
> +		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
> +		clock-names = "mclk";
> +		wlf,shared-lrclk;
> +		wlf,hp-cfg = <3 2 3>;
> +		wlf,gpio-cfg = <1 3>;
> +		SPKVDD1-supply = <&reg_audio_pwr>;
> +	};
> +
>   	pca6416: gpio@20 {
>   		compatible = "ti,tca6416";
>   		reg = <0x20>;
> @@ -422,6 +476,16 @@ &pwm4 {
>   	status = "okay";
>   };
>   
> +&sai3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai3>;
> +	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
> +	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>   &snvs_pwrkey {
>   	status = "okay";
>   };
> @@ -499,6 +563,12 @@ &wdog1 {
>   };
>   
>   &iomuxc {
> +	pinctrl_audio_pwr_reg: audiopwrreggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
> +		>;
> +	};
> +
>   	pinctrl_eqos: eqosgrp {
>   		fsl,pins = <
>   			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> @@ -668,6 +738,16 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
>   		>;
>   	};
>   
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
> +			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
> +			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
> +			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
> +			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
> +		>;
> +	};
> +
>   	pinctrl_uart2: uart2grp {
>   		fsl,pins = <
>   			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
