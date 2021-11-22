Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A1AC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 22 Nov 2021 14:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238762AbhKVO6M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Nov 2021 09:58:12 -0500
Received: from mail-eopbgr60063.outbound.protection.outlook.com ([40.107.6.63]:46718
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232494AbhKVO6L (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Nov 2021 09:58:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZPMTD4UIeQhbLsVlRpvV0Iu3SjTrPnwtXO3HIJCc4Yd5123d8APQ10Q1cgO+5YFyLNnvzj0nWmhJK+A70W2SWWFo89yhe9ohAVdJx2kMDxnIyYzVQr2MWdgyf7nwSsqgUqBFfVMD1J/qAbPjeCkkRmsjMYeQ8utc8LR3k8dOy8nln1aMUWAepmladgRJJjTycN/bZ+gjUhrm/FX15q3nedyPnr2Mi9poW5eqgVl6Zn/Bi33E+kHeb+0rkjnuJIQ33+ooaCd/eqtftKd9A8ZDdayysLU+SDkbKXSJL72VJJAOr3UTPeQ2lC3DOBWHqVpmNsQRt6DC6pmhUjF3esUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kngCUDJ5BqMH1qnKp511Ki2Pz3zq0/yFtTb1CbpoQPM=;
 b=SYNm1k2c+eJ8DsRDXB4disZe8ttMNHZtaLgHMgfG3gN6JJx4MlSaRjs9LOZz1gvz+TZcMjmnCzmYkyTMUUYyut9YJTyAadta3lPeLdSHP8inULON9Spxx8JltsMRt/Ler6le8iYDS1bD268ua8GaeHQe/HRne3Sq1KYn3XcOorkjEqmv+XShl4mzRfeY2YhCQb3satLHZfDjOKCkVbRTX1xR56QkJaO0p9AimmAc2mHh+XeGrQSC9zFr4fw6Z6Z29LHDJG9DvV5UtCEh89cPL3FhK75ta0N0+82cvD3WXO0538fE3KA1qkcoPaipo/LjjKw8VR7UVvSyrJ0Eud0b/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kngCUDJ5BqMH1qnKp511Ki2Pz3zq0/yFtTb1CbpoQPM=;
 b=S14sbdP+MlbstYR++3tKuSa/Kt9c4XYqk5cndsEm1XmtzN49PPj4qX6qeO+d+RQK+lFZiRCoOdY1NGg8F+TkTR5OIYkCezc77zysCv+9mBO6vDRIrfiUOBZTIkDeuJhRboiifUAQ2ggqBBxTESoqYKq1uxV8zdKtA1l9J98xP/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 14:55:03 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4%4]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 14:55:03 +0000
Date:   Mon, 22 Nov 2021 16:55:00 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-clk@vger.kernel.org, linux-imx@nxp.com, shawnguo@kernel.org,
        Anson.Huang@nxp.com, ping.bai@nxp.com
Subject: Re: [PATCH 1/2] clk: imx8mp: Remove IPG_AUDIO_ROOT from
 imx8mp-clock.h
Message-ID: <YZuvRGEGeTqp3Lky@ryzen>
References: <20211109125657.63485-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109125657.63485-1-hui.wang@canonical.com>
X-ClientProxiedBy: AS9PR06CA0031.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::7) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by AS9PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:20b:463::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend Transport; Mon, 22 Nov 2021 14:55:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abb9f791-9fd9-433b-5644-08d9adc81070
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:
X-Microsoft-Antispam-PRVS: <VE1PR04MB72168388F5C6ADE3482F5ABDF69F9@VE1PR04MB7216.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dGaRsXavN5K0GZLBwxmY0i11njk5yzAFr7BI6DL624RmNCvD2HEAW0iU9zxBqRwXImXWIYQK5eXFB2HYf03M1E+LWl4HSAbKvpt4UBGzcMPYVa5pG6lvKEF2zaYskxwIPwls4uVBeH5NiPik3miElEyM41wZBWduFeb6cPcCYceeGKzGeZdavzeA4sXHNOJkpjI+0Vqxww+1prEC9Eh7EdJB4pxI45yudZhV2EflM0Ah0LurdIp1cJr/sQVJVofvOiMB9zQewjxSGfzgD/D67/+RTbKHI3PMRjaFVsZvWgMtMOtKlqKKlJXSSUrp+XwKahgzGDkebpqItjeBYKSVYvaiD8MSAMjFGON02Ve71Jjic93CpMIRhSwCpDlWNJ60I9bSE7RD5BX/6M8SF5gg5zopIaACZUTqxcUBDXkKqWvP4rmT39VVPkB26X9I9FXvirue9ZhjjfSH2TuY2sjho9lVtYZj4uVonp1ppkyAkVhcItmmL1sMLjWtQYgeW1wqjzAxxUmx57YJpveFobnC2gBtGBktQahQXiz2Au83YQhE1Pc0Nny1Pw69TsTYylUSWS3jj5xMZih/a8lJB7yZzpz7aycqFQS5D74ND/px/55y1b8BElNcDk/XPuiKF55NTkaZEhrJTCqrSM6DNAJJ3jYTgTBqbpgrHJKavDoa3yzb6iefWce0JpL0/Xjjaol3ubMiZtloW8Jmh3ZnzdWX1jx9jj+J9KnJ6KEgZwxSmmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(44832011)(9576002)(316002)(4326008)(2906002)(55016002)(53546011)(52116002)(6916009)(6496006)(8936002)(66946007)(66476007)(66556008)(956004)(33716001)(86362001)(508600001)(83380400001)(9686003)(38100700002)(38350700002)(26005)(8676002)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jp/slALX+NW8in3+CsOiNhMWmmLWbssRGI1ziPladA4S7aGO6dmXnU32ak3J?=
 =?us-ascii?Q?pIeq9cbLMx1kwdu6lWS1Am83NxiPlhUt/wDJaRWBvhcT0n084IGzWSoQEDZ+?=
 =?us-ascii?Q?cKNc9pCrR20pT2yc3gFFEqE+IukMa0gvsV//lAuAzgd7DuBs2IIJm+TgtXSC?=
 =?us-ascii?Q?M1b4Us2kVr3W9AqGZAZVCNPWAiuogPKh27V31rhI5IUAQASacVEef0xQVAdG?=
 =?us-ascii?Q?LjTX0gqb4d17nPFNXjYC/ftx7Vb85fTk2laTi76tSiAhV0RGQo1vmxh4mFoG?=
 =?us-ascii?Q?VdgGrkdx3TAbo1MpmYSJinZNBJs9aas6/QQpmT3HXihoheAT+aKmv4Y2Qtlj?=
 =?us-ascii?Q?zfSOae65IA4HIywdhcGBbqG70+AntokFyqWdTUjZXSbWLV734I3nQ1A5/lpk?=
 =?us-ascii?Q?28uRemF1gywJ4i9BWCFB8SrsC6vCdXJGo7CZtriMp5q2ScvQgYQ20Vi26QR9?=
 =?us-ascii?Q?VSgjYudUfCt1y+Q4/hG2CeIfnLikI6EDz3LoW8JhAf3cNwTh2Q/C6VVV2XhN?=
 =?us-ascii?Q?9B7IhQ4OXP9BhuU8jkdYVwJomco3HrTOpfaA8JozUsqlsHuajCBY6fsz9zpD?=
 =?us-ascii?Q?Gmue1DUEg4yw/MUVV6DbVSjB1qYXJlP5a3tmQ/gfB8yfh82mCUth4328kQEg?=
 =?us-ascii?Q?ZPd0Wx/A6c2icSerwhLaiVuUphHcuLRap9HA+al90XGMWd1cBUYXc6mxFy9o?=
 =?us-ascii?Q?K3uAuWmbVG0Mr6KeKBPrRhhMHFPRubP/HJfERJkoKhTTEGIF3odN8MarjqaH?=
 =?us-ascii?Q?6JFpfZHxcgZK6QlH3tnWacSUUxABWg0mq0CdEW5OnHfIBzGWfGnw7oqo646F?=
 =?us-ascii?Q?a6GHETWY/6B1AzK6UeNaRBNv/JOYbKJZYz7D1Q1uofTvxpsMSyWvzdYyeU3x?=
 =?us-ascii?Q?zr+1Qj+UUl8+u8cnMEzXqZ0OYvY1/W08axV0JU9Ewc/LXDpdVsxHVzX6sT9m?=
 =?us-ascii?Q?Wdbi90xnECBcy4GoMIaQcycUf14bDtUpgXnRU8QK3H2BoAGlQ8DU7o1ROrXM?=
 =?us-ascii?Q?aDuoxKsumDUo94qsutsEtKQCKuNxEW1r8rYJLQOp+4IRPOmqJfbZknYlrQD1?=
 =?us-ascii?Q?ngGbFCrEl5wIuocOnqwxOcI6KYl3UlebYFGhXsaZRfhBOcLxCvtcFtjypNXx?=
 =?us-ascii?Q?cajQTLGuFGUCqv5p0kHnQs0TziJLTcPoKlzG7J8sUaJcfhUKaowPxiF0p16R?=
 =?us-ascii?Q?ryWqXnRTkqXNH3AVWm4u/4IWllue/kjk2kqxB8/+QSsRRJyPgrVsJWT+1o5Y?=
 =?us-ascii?Q?I47+0GMToeQUu2KBIaPpQPS9Mh+5RGfTgKWYJoINgNNb0GCSe15+ytJBYp/R?=
 =?us-ascii?Q?n2ee8yQ6t0s4hXZ0NN6tQAhQ0vMoQiFKNMhOrsi0YFdD0gzgqBl1ojZBqY5+?=
 =?us-ascii?Q?YJKUJK9MGrLH/4WlSZwrpW9eHLlwmRJbnufcw+Ug0xOHkQv/goadt+LmdwEV?=
 =?us-ascii?Q?xuMRieSHJ0pooFs2v0riJJtbIgGNLoFaZpIJ0JIeuEZ/jY0H2QAGzRHOPrtC?=
 =?us-ascii?Q?jrafAZhXF82f6RVA8OFTXEabduRsaO6KGQkeQy7qbF/0NOSNPtLtYJbF1ZvC?=
 =?us-ascii?Q?anf6Ngj76vp0LiJmg6N6laADRcimK6kGeuuMYADA/usOb0kKO5lYYpEAGU7e?=
 =?us-ascii?Q?1huC7fDhGqnN13743HpZKAs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb9f791-9fd9-433b-5644-08d9adc81070
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 14:55:03.3026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDo1OUfx2Woh7tes7nxmrP22yznQZQWiC3S84MqVTw+Sbd8bicLcK4+BRt62lidNeQjC8y9m6GfogGlA2MNs7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-11-09 20:56:56, Hui Wang wrote:
> Since the commit b24e288d5063 ("clk: imx: Remove the audio ipg clock
> from imx8mp") removes the non-existing IPG_AUDIO_ROOT from the
> clk-imx8mp.c, and this definition is not used by anywhere, let us
> removed it in the imx8mp-clock.h as well.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  include/dt-bindings/clock/imx8mp-clock.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
> index 43927a1b9e94..235c7a00d379 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -117,7 +117,6 @@
>  #define IMX8MP_CLK_AUDIO_AHB			108
>  #define IMX8MP_CLK_MIPI_DSI_ESC_RX		109
>  #define IMX8MP_CLK_IPG_ROOT			110
> -#define IMX8MP_CLK_IPG_AUDIO_ROOT		111

Seems this hasn't been used since 5.14, so I guess we're safe.

>  #define IMX8MP_CLK_DRAM_ALT			112
>  #define IMX8MP_CLK_DRAM_APB			113
>  #define IMX8MP_CLK_VPU_G1			114
> -- 
> 2.25.1
>
