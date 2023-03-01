Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB97DC7EE36
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 02:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjCACga (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 21:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjCACg3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 21:36:29 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BF833442;
        Tue, 28 Feb 2023 18:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHGS8E4SEPRpLqR+NFfAMV+I67fBv+yTUUq+TXcNQGwdTiXEEBa1qZ8/X3HYvQ8SrvBTOPt1RAsqtdQ4YJCc+fcAWvkJkK2NR7Q1qevZsW91E1hZdBn7fRitoCVf3GOBPFAwPBrW8QCBDu7B+9lkbzT0QIudWzHYs0o+r4tktjYLZ+8Tj1RVDqclEvubDTVRFBbDuhveNnngFpcR17dg+YAL8UA5qkxGB7HLpCGkWmaLepvhFId1X9ENTyiJJVBt3q8pweSI/qxidBJnwFJwQStG9CepFDz/XOKgZTwJVy9yUhRUmcgPicOumc54aSPwkO5lKjXzX3gBibwBnzwvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MFryLX0DKnE5umAGO4XO7t0wM0c7gEYTLLvRyi+Ho0=;
 b=moAg57bIxpoI3Bi+Q8TXoGWbtey4qJx14ksF78iijSywFkUXF4Z0LtXSG5RHY8o1mIy6pc4PTPS8KUdHsoBSAgk9LvbUvmXR2Ve/vO3LAIVgOofBCADhJIcobLW9rBCngtDPkHs5faqH+GJSNKsJk+CScb1IBo+AQbi8sXZn6yyQm6UjaVUmFPPdX9PQiNrGqqIsc5EjI4OpUYE+2tP1AA/XzrJv1PhI36KTLFPGGcvJ4xciWLllX9IUxuWFlBxlYvr4cs/twUtyIP5m+5byZ7C5B3p1Xhz0VREItF98Lh5hBJP0zfxxyLcFO/Jg5UHW1EpYPM6F6k6u8mSCYjHSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 02:36:12 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a%3]) with mapi id 15.20.6134.027; Wed, 1 Mar 2023
 02:36:12 +0000
Message-ID: <dc704880-5745-1c0d-0eef-3bb399411aca@oss.nxp.com>
Date:   Wed, 1 Mar 2023 10:35:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v6 4/5] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc:     Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
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
 <20230228215739.171071-4-marex@denx.de>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230228215739.171071-4-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ceb3984-7ede-4acc-11f3-08db19fdb8e0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: to7SBLKCkekriHmdzsEbefFAKN4dvJSrPL6G6kFyS07pG6NW05IRy6ePixb3TfpOW7MlYX+1R/a6HhzGqjE90vjE/VLhv5hZX+uu3yg/ZbtK9VOgnWqe4Cd/jWuKbBosNuZFKQYsLfSnA9o58vkRErC61OmJ9aF3qkZMxqV5ajsaoUnD00vmKhszGMEqJQCG8tXDnGGaBf8Y+BtEt2SwjfEE0G+ooT/7OD3huh0iJZKlp4JL2/4P1RbPXuquZF8yKCQHI+ilCspjErIbt/yF+/hmsEOvUydzf84HxXIDg67FPYKdIV/zdmqpT2GPrAiqKU8MxMNcdmb+j3h38IN7LWxoN8HYSpiRRWlyb4WFQGoGEkS8+zNESGrniixqljLbiZk1iCq3+e1wIM9XzzfAVBhsD8iKj6ihD6v+hRDpIRm8eBmPBXps0kVrQYrnhjzb4ube4rZQizgdlLrr2OTZlRSl+q0OdeUFq9zw6wwKmicBHfljJ64SYGeEPutxghIJ2MqlEO9ibgbijd/6ZNXvuOuaLi5HINuops8ZpGwB7IuEEzIvONZe4lHyHIBmwDNZ1m1cWKq3zcTFVwqopFa1mwW1UG2/lrgTRRDkOs6FSeJf/SbbxU7vnWFXEou2JltNUD1n+52M/+9E5WXp/mOZEYPidgu1W8N/BfzkyxjlJE3otLJw8tALQwM93v7D4DCSVzALdCk8xPmr+BOA8nBzgilo0ysmyBn8zvv+Gs3WF9TsRlwq1Xg42N+xn7+NFJOuwyy8jv3cVnQGkVR+6Q1QSryhb64J3sd9yW78e4fx2wk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(54906003)(316002)(478600001)(83380400001)(6666004)(52116002)(6486002)(2616005)(6506007)(53546011)(6512007)(186003)(26005)(8936002)(41300700001)(86362001)(2906002)(31696002)(5660300002)(7416002)(44832011)(66946007)(66556008)(38350700002)(38100700002)(4326008)(8676002)(66476007)(31686004)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkJIWURNY3FKNU0zWU5PWmRmZVE5Wkg2djREZlNjY0E1S0ZWMlU2aTJFdVhu?=
 =?utf-8?B?bDBLTWovQ2JWRzR6TzB0YXIyVVdiZldBOUhMZEpPc3JsN0I0ck15Q25UOUc4?=
 =?utf-8?B?d3FEZEpEb1NLWXFSalRRQ1IvVVpReUdhLzNnU1EvcDhHUWFFY3hLUElTWEt0?=
 =?utf-8?B?SHMrTUZPcm1YMEVpeTQwdFVjL1dJTFRXUGxDaDlkYzRDSFJRMGV0cEVlRkVL?=
 =?utf-8?B?UmNSV01UR01lOWE5ckFyb2JEelByVE1EMGRLbEFYUzA1Q0J3R2tBT0h0bERT?=
 =?utf-8?B?aDB0SzNLSUN4MTVueGxBZ2V0YmQwWFhwQ29JUXdTTUY5cy9ENnF6eHVWQi9T?=
 =?utf-8?B?UEl2S0dncGhmUS82UVV1RndDRGJzQklsYXRzZi9mR3hrb1F4N09iVjNybWpM?=
 =?utf-8?B?dWdMNDRGM2V2eFIreTZCU3dSQVM1K2hVMlVoc3FTUkxNV3QvUnd3a3lrc3Fs?=
 =?utf-8?B?akhPL3BsKzd3dEIwL2p3Y29BdXpvNWFUcDFzVzVKZzdieGwzcDd3TGRWT0lE?=
 =?utf-8?B?bW9FUGFGRHBGeCtZQUhISGcyMzZ4ekVNaVgwbGlGSHFmVWVYYlZzMnJocTJa?=
 =?utf-8?B?bWRQZUQ5Nys1d1RxdWhJdmtvT25aclJyLzJ3b3I3SlVTU1ExeERJN0xJM08r?=
 =?utf-8?B?Wm8xWjdlaTZBbWRmODlkZ29IZGUxQktBeERWUTYwclhjWHVyR3doS1dVTFZM?=
 =?utf-8?B?RXArZ3F0RGVNOURjVE85eVNpeGdtWEtjeUJhQkNtS2Q3KzluYTBHZjJQUCtS?=
 =?utf-8?B?RkM2bFdzM0ltN3g1bTc0TzBrczRuQU0zU2lkbWt1Q1dVT2MxQk9UWHF0NVNE?=
 =?utf-8?B?MitnRHFqcXg4QmVaTFIyR0g2OFZIR1hoWUVqM1htZnIwNE85dTNhcmV4MWVG?=
 =?utf-8?B?NmoveWZhWnZTbkxlaWdLQm1PbEZmb2htZU1ZQVdSS0c1N3pZN0YwZlkrdGRH?=
 =?utf-8?B?dzV6ZDBGNEp6TENZMXBOZElOSzJmVUZ4a01SS3duNWx3c05WWHc2aUVBb3RC?=
 =?utf-8?B?T3RsdmRURndTRHZZT0RmL3hHWE5TS1kySmVCcjBQcy9PWDhNTWpZWnhldE1w?=
 =?utf-8?B?T2lPbEhpT2pYTVMxOGkwck9IM2c3Y3FuZkNYQ2ZiSkxPSDYyWDhKS0RVVFZl?=
 =?utf-8?B?WG1EeCtYeURDaUdndHVNYnAzdmJQU3U4Y053RXhNejJrZHo0MzJyOG5DaUZm?=
 =?utf-8?B?S2tDMkhaSlRnb1RwcXFTZW1wdnoxRW1vOE1seEVIYy9mbmxDWFpmOU1JWURv?=
 =?utf-8?B?cEw1MHdiMGx4YkhHWWErWVg0MjlVNzFOQitCVVN4SEY0bEI1a1hvUys2KzRW?=
 =?utf-8?B?R25DNHVSOEwvVFA0R1hJUzVsZWdVTTJYTldHL0hFSUU2c3hwWmNGTG12RDc5?=
 =?utf-8?B?QmFWTEhHdUpscnArei9DMWk3dUZWRisxV2x3Wkx0amRMMmVjazV5bXB0VHVl?=
 =?utf-8?B?ZVBHbU1rdkg0N0pYbjBVYlp4RHV0Q3A3WEJaemZ5YnBIVFlGUzN5ejBTbHJV?=
 =?utf-8?B?U0JmL1RXcnR2Tk1Tbyt6b1hFUThnN2l0dWtha25ScmpzMzdrYW5tcU9yakFh?=
 =?utf-8?B?bmI2N20wbXJ2QU43K1craXNsWWNHNDVLSzgwL1hsSW9QTzlSclQvcVhVQk0w?=
 =?utf-8?B?MzdHYXpsQVd0ekw1eTFybUMrcnRGcDdGdHdsYXdGd3JJODUwOWZoakszeTNx?=
 =?utf-8?B?VlpSVTZCUHQwY1Zhd2xlbGZnK1BqU1BjQUoyS3FYd2JTeGlQeW5meVFUN3Vw?=
 =?utf-8?B?VnFXRDFxRTZ5bzRkWjJQaW1KRC9oeUhRNm9pdmhpamQvZHNNQ2NLMDNyNzFs?=
 =?utf-8?B?VzlGemlObWQrZGw5a3o4K3BjYmFldUxkREFJUzcxU25kV0U3UFZ1TUhSYTBm?=
 =?utf-8?B?a3pBNmVOWDlMM05ISHdCbkYyZ0lpeEZDbmpVcDJSTVN3WjI2dEMzN2M4dlk5?=
 =?utf-8?B?MHdvRGFJMW16UHJ4aTF5a3V6MEtWRENXcGRISW95VjZOMFpVMWM2ZUt2UURV?=
 =?utf-8?B?NmFJbW9qZWpMTk92dkxVTWw5WGY3U2ExbGI4bHl5eXZPbDdzRzlHSTRRdU5y?=
 =?utf-8?B?Q1NOamJHOFdic3Q2bTJYOURBbHl1UnFFRkFtaTMzbWw0cVRVTVFBazBYanhG?=
 =?utf-8?Q?K2s2KYLXrT+P85AfJHl9YvqmC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceb3984-7ede-4acc-11f3-08db19fdb8e0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 02:36:12.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0tTChUzPl5CK7xtrL0GxlwZCmNE6S9HN/l66bIJAk9UIJKshsXrrW4HfGzovsnKtYfTR2wniCr8wWEMZxChqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/1/2023 5:57 AM, Marek Vasut wrote:
> Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> needed to get audio operational on i.MX8MP .
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
> V2: - Add AUDIO_AXI clock to audio gpc
>      - Use IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT for SDMA2 IPG clock
> V3: Rename audio_ahb to plain ahb
> V4: - Add RB/TB from Luca
>      - Rebase on next 20230223
> V5: - Add TB from Adam and Alexander
>      - Replace blk-ctrl@ with clock-controller@
>      - Specify sound-dai-cells in sai nodes
> V6: - Add RB from Fabio
>      - Drop power-domain-names from audiomix block/clock controller
>      - Move reg below compatible property
>      - Move sound-dai-cells below reg property
>      - Sort DT properties: compatible, regs, #cells, properties, status
> ---
>   arch/arm64/boot/dts/freescale/imx8mp.dtsi | 158 ++++++++++++++++++++++
>   1 file changed, 158 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 524b4ccfcc553..7184b46fe0480 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -571,6 +571,13 @@ pgc_usb2_phy: power-domain@3 {
>   						reg = <IMX8MP_POWER_DOMAIN_USB2_PHY>;
>   					};
>   
> +					pgc_audio: power-domain@5 {
> +						#power-domain-cells = <0>;
> +						reg = <IMX8MP_POWER_DOMAIN_AUDIOMIX>;
> +						clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +							 <&clk IMX8MP_CLK_AUDIO_AXI>;
> +					};
> +
>   					pgc_gpu2d: power-domain@6 {
>   						#power-domain-cells = <0>;
>   						reg = <IMX8MP_POWER_DOMAIN_GPU2D>;
> @@ -1119,6 +1126,157 @@ opp-1000000000 {
>   			};
>   		};
>   
> +		aips5: bus@30c00000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0x30c00000 0x400000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			spba-bus@30c00000 {
> +				compatible = "fsl,spba-bus", "simple-bus";
> +				reg = <0x30c00000 0x100000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges;
> +
> +				sai1: sai@30c10000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c10000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai2: sai@30c20000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c20000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 2 2 0>, <&sdma2 3 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai3: sai@30c30000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c30000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 4 2 0>, <&sdma2 5 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai5: sai@30c50000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c50000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 8 2 0>, <&sdma2 9 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai6: sai@30c60000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c60000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI6_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 10 2 0>, <&sdma2 11 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +
> +				sai7: sai@30c80000 {
> +					compatible = "fsl,imx8mp-sai", "fsl,imx8mq-sai";
> +					reg = <0x30c80000 0x10000>;
> +					#sound-dai-cells = <0>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_IPG>,
> +						 <&clk IMX8MP_CLK_DUMMY>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK1>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK2>,
> +						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI7_MCLK3>;
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +					dmas = <&sdma2 12 2 0>, <&sdma2 13 2 0>;
> +					dma-names = "rx", "tx";
> +					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +					status = "disabled";
> +				};
> +			};
> +
> +			sdma3: dma-controller@30e00000 {
> +				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> +				reg = <0x30e00000 0x10000>;
> +				#dma-cells = <3>;
> +				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> +					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
> +				clock-names = "ipg", "ahb";
> +				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +			};
> +
> +			sdma2: dma-controller@30e10000 {
> +				compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> +				reg = <0x30e10000 0x10000>;
> +				#dma-cells = <3>;
> +				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
> +					 <&clk IMX8MP_CLK_AUDIO_ROOT>;
> +				clock-names = "ipg", "ahb";
> +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +			};
> +
> +			audio_blk_ctrl: clock-controller@30e20000 {
> +				#clock-cells = <1>;
> +				compatible = "fsl,imx8mp-audio-blk-ctrl";
> +				reg = <0x30e20000 0x10000>;
> +				clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +					 <&clk IMX8MP_CLK_SAI1>,
> +					 <&clk IMX8MP_CLK_SAI2>,
> +					 <&clk IMX8MP_CLK_SAI3>,
> +					 <&clk IMX8MP_CLK_SAI5>,
> +					 <&clk IMX8MP_CLK_SAI6>,
> +					 <&clk IMX8MP_CLK_SAI7>;
> +				clock-names = "ahb",
> +					      "sai1", "sai2", "sai3",
> +					      "sai5", "sai6", "sai7";
> +				power-domains = <&pgc_audio>;
> +			};
> +		};
> +
>   		aips4: bus@32c00000 {
>   			compatible = "fsl,aips-bus", "simple-bus";
>   			reg = <0x32c00000 0x400000>;
