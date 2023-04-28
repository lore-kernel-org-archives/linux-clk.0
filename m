Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424EFC77B60
	for <linux-clk@archiver.kernel.org>; Fri, 28 Apr 2023 08:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjD1Imo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Apr 2023 04:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjD1Imm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Apr 2023 04:42:42 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2069.outbound.protection.outlook.com [40.107.241.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B1E213A
        for <linux-clk@vger.kernel.org>; Fri, 28 Apr 2023 01:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvF3mqiIxgCeBkct8pjoAXpTeVz+5q0QnXBXDGg0LutU37d9wjDwWiK1opcPKNlom4zrc6Z3B84F+B6Xw5plMfWZIjS2GAL1wo7j3ID1ZU30HdJpeRan/6WqGLLWOzyczYVaC2qQYZZTBmE1OnbAPAs9/3GGOSZ74znF4hjJmbfgEp4XjlHS4i8jVdFacxMcC2hiVyP3qM6A4jhmQEvpg0jaZUx6qNxbVrXSs15RXy/gcn8hMz9qtjbLk/JpKR9jSIRb0sGOQeSijKr7epVp19aqkGcvZ6/OF9CYhc75b8pFjtHDcokvJnoZAR2SYEfkTYBQrMB62SQtzWLrpaAevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34NgGroehGuEGVr6vY3xNW3yp759ULvo/848ZOBrrhY=;
 b=jetVh1jrtzuFP/yy74Ug/BzVOForsWh2kx6v88jeBrxSXKtKsbcGTSf3p+jUrJY27HzbeerTmcyNcMXuDiVqN4i0GIGGgpeg+xIHGxYCvDRtr5MQtohggak3bkKDppL3W2ozrVqUGdAShwrZedpVdcJJTwChCdg2NWSL4B/uNxACDFnIWPEm5LQI1/B5kURzEPcBcpzUhBZBf/mFAw6x4jlB/veRm5f7IA8SnfMzQZhdDKSVvMTUTTO3wtI9lJ4IRHOMpRwQ/x8Wbx0Lepexv7vagF5NrlH6mMWyMzFvVhHLc8F1/1L0rvgyMIqXL14ugNRKlhvlKksSSL2TLSFkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34NgGroehGuEGVr6vY3xNW3yp759ULvo/848ZOBrrhY=;
 b=GO/ywLNKJeHlwhWJQpOgTh2+vh1BL+PL2SM1zbDdf0qm20pinnhcmFmnjoUhZO3lhfkITNswyn103UO4tRRfeYmbxLK28psNo1irMMqXjkOoTQ3z4SAwKWZci+xATuYZX8wV6NjoSG9NRMHhJMFcu2kKFudnd4Gx61S1Judg97k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8683.eurprd04.prod.outlook.com (2603:10a6:20b:43e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 08:42:38 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::b999:f2c6:a8cc:7b4]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::b999:f2c6:a8cc:7b4%5]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 08:42:38 +0000
Message-ID: <d3ce6787-3776-123c-7613-c488597da198@oss.nxp.com>
Date:   Fri, 28 Apr 2023 16:42:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] clk: imx: imx6sx: Remove CLK_SET_RATE_PARENT from the LDB
 clocks
To:     Fabio Estevam <festevam@gmail.com>, abelvesa@kernel.org,
        Liu Ying <victor.liu@nxp.com>
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
References: <20230416150004.16834-1-festevam@gmail.com>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230416150004.16834-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::14)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AM9PR04MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 93524de6-513d-4469-c6a0-08db47c48517
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCuKdjvu8GPwZDCnBNhtgriWwn9dt3N93Rzfv2/XPJwCXBKmW0iM5nM5UqAcZDXZnoSSqj9+zV5IC/X/zo2bZOyiCvU5XHTR1ZSOZbpctVHvJtnzg5WfcHqpED6YIU7XzQ8VakbKb8VEJfBb7r+WH6KUnMGMTY1nUq11lLyagDOvttBc7Rg4dcE7wzK+Ofko3ebOHECvokZA0WlDQ4bkvDXKltlil2jnA7G4JppdkGnZ6RogbbS5ON3MMyECdePOYNyoriSOdY3fpfXcoLmirdTEzZV4YImh1OuGcnGojDsAExk4qCa4hJFCoziPO/sWGE9Svy2S74ItNjLZ1F0KUE9/z+VdI1WNPp40POirWbFanmBH42N6MzrlfVTiU2E6WrqR/VWDG9rxDmO1PHyFoaqP/b7BDcY76cKiq5E11C5Y4XJTeQ8xCq4hdmQbsWMiyLrzP1f6flWcDuzG4LWg7UULjMX6P8Lmk2IzMicXkMyat10BhN8W+Moc4jYganx1tWJ5wwaS5GZgT5l53g7Fejvs3jtggngpF3Ww5yLoUnS625P+RUNVOWzuQ1+XSZ8mX52sDDWPAPEZ2+XVd0UU0OO0YfHKzIwhmstlACJ637OWIv40G1qZjydGWGCy1OyDvJhW5waIAstLgxvjfzrekO9oopWrOU0DiPVlayN9tlE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(26005)(53546011)(6512007)(6506007)(83380400001)(38100700002)(41300700001)(6486002)(2616005)(31686004)(6666004)(186003)(478600001)(110136005)(44832011)(4326008)(66476007)(66556008)(66946007)(316002)(5660300002)(86362001)(31696002)(2906002)(8676002)(8936002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVdOTFFsRzc1UjZFMU1YMG9ZWjJXL0lGSGMveWZjSUFCbGpWQ3AvY1lRTDRO?=
 =?utf-8?B?YllTbHdBVWcwWTBTV2VJbUJjZktZMytzckhLdmxJakFmdS9xTEtqUWc2NExu?=
 =?utf-8?B?TDNueDJVZjE0UXpENGdLY0JvckF0SUxkU2tnbmVLUTg5b0xZU21ra2RlSmIx?=
 =?utf-8?B?azg2TVdlQ2NmQ1ZwSElZZWRCa0tuUEdqY3Q3S1d6YTl5S3o2N1Z2SGFrYTFJ?=
 =?utf-8?B?RytiWnlwbVZTTEFNN3FrQUZBMEFLSDBxbXR2VWttbVNyMHpmSkhMVmlxaHNk?=
 =?utf-8?B?TkNubVhlYjYyNWJuSUJwRkg3MU9LWUVVNzMrY0grUllHWjFTanJRY01jMzZK?=
 =?utf-8?B?TERYblg1QzU1MFIxRVBHWmJZQ3docDBEUjd6bHM0aU9kYmhkMFZtZnlJK01z?=
 =?utf-8?B?UWdSdGVYalN3VkhEelJQTVVTZENvaFRBaWJyVGJzRnBaeGo0blB2Vk1BRTVS?=
 =?utf-8?B?K0NYTUhXWERDbU40aDdUTUtJQnRpZTdmeERuT1FXSmhOM05PNWxxaHRLMmpC?=
 =?utf-8?B?NmRJOHIrQktVR09id3d2MjJBRGFobXFVQWRKNnhOOGlFd2hwbk9ucEExNjFU?=
 =?utf-8?B?YS8xQzRKZTNrQmxmK2xaamEvcDVJdERtdVcyNlFkMTY0RkRyUFNzcUx1dXpF?=
 =?utf-8?B?eG5PY1JHQTNqVjFzc2hwM1FqNHZ0ZW5ldHN4OERVWUNRWnI4M0VEYUhGSjNX?=
 =?utf-8?B?MXdWU090MHdUTWF4d2xGL3BHWjVsUDdjSnpJRVZ3RWVmME1KTU14TnVTdlVJ?=
 =?utf-8?B?QVgrWS8xVHVtWEltaGl2b3E4cnA4djRRZDh1UVR1TVpsRGtZaFI3MlBZd2Ry?=
 =?utf-8?B?MnJyeGdVNStRdTBqKzVjRTV0TDVhRDlpbkxZRmJXbXRmWGpVaW1WMVJLQ3BO?=
 =?utf-8?B?OWYxcjVqMFZVWUlKVEZYd2w3OUN0V0YwZkNHMHhoV3lPdE44M1JzVW45SWFn?=
 =?utf-8?B?VW4rakF0UUx3WlFvMnpSSVFFRnhZc3l3Ym1Ock04YVFjdFRmV1ljWWVJWkww?=
 =?utf-8?B?SmRpUG5UZFV3cWN1SFlKVlVrYU56SUIvZURuS2JNOWtucnExQVlQOURUc0F2?=
 =?utf-8?B?TFljT0QxaHZtQnQwc251dDVud3JjWS9jQmNPSERsUWFtQnkvU3lWWXd4QkYz?=
 =?utf-8?B?SmlSaU1NbEE0WU5NL3dMKzl5c1c2WncvZzF0L2JaMXdwQXpaQTJzdUdVZ2ll?=
 =?utf-8?B?N3dGempHbEE3amtmVjRuNUhlL3dxelhUcmNFejhEWVJOc3NWeWh0VTU2MGFR?=
 =?utf-8?B?alRDbjRrV1JnOC9ONUdhTUFRMHlrVVR4d3NuYThBQW14bFNhc0hWb3RSUjNO?=
 =?utf-8?B?eTBpOHo3TmRoajAvNU0wT3hBZ1h4N3JWSy9icUFaRnhlaXNqMVJNOWZ4emJu?=
 =?utf-8?B?YUZQdGdaQjRCaktMNFhBNHFMdHA3akhYZXJzMklTL1ZYNlVFU2Jyelc4V2RK?=
 =?utf-8?B?bGxIelk0a3JUdWs2aCt3VVJPRk1lckZhelB6L2lsZ3NUV2ZMVEJzNERTTjQz?=
 =?utf-8?B?K2tNWEVjd0VwS05Cc25XME5YYzViUTJiU2tvNHVvYStLNklMc0xtSXVVMFZI?=
 =?utf-8?B?aTcyNzVPdS9xSFVrWTh2QW9MTWtTdkxsbUFuRWhnQVd5LzNUU3hmR1FTZm13?=
 =?utf-8?B?T1MyRWZpektUTDVqdkFnQVNiZTFCK05INUJ4bzlaVHJ1ZlFtVDZLUll3MXBt?=
 =?utf-8?B?OXZpdldlY1hja3VrSFZaMFI2WVNtSXBHc3FNL3FmaGorY2VnaDdqc25tZGN5?=
 =?utf-8?B?bkdLY0JHTENCRi9WNFZLeVZFdjhjc1dhcFVNUldsV1BqSWNENkVOQ2JKZ1da?=
 =?utf-8?B?aEhTLzE4L3p1SURrd1ZNMjJIdTFqYmw5WWRZSnBOMEx6WnIxTllHaGxLYXlT?=
 =?utf-8?B?cFMwdGtaSDBHMXhDMkhOUVV1cGFRWGZtOUNNSDRDc0VVTlBpaWs1anROVUNU?=
 =?utf-8?B?LytHdG9hY1JGMjFxV3N4bjVKaWZzSlpNQk5pVEUrUUlYV3BoWGREVWdkMkxF?=
 =?utf-8?B?R25UR1J5UEVuOWhvTllXamdpaGdSMnBUZjZOYVR1Ykp5bzNUdEdudHd0eVFa?=
 =?utf-8?B?L0lTVE0rVkNmdE0rNk1aaFNnTlNxM2hwS1JiUVRjdG5zQkMwWUUrSWVDQkdJ?=
 =?utf-8?Q?iN2b0fBPB54KV3ys8xmE61jKb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93524de6-513d-4469-c6a0-08db47c48517
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 08:42:37.9715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Shqt5ZY2EdA0GjFX5DcteLzoNcjwcg+FYaZuuJpAUk0zxUEGO9j3Oy2Fze6BLmmIH6DwZRiO1FmCpczMqBW+sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8683
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

+Ying

On 4/16/2023 11:00 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX6SX, it is common to use the LDB and LCDIF with the same
> parent clock, such as the IMX6SX_CLK_PLL5_VIDEO_DIV, for example.
> 
> Due to the CLK_SET_RATE_PARENT flag, the LDB clock would try to set the
> clock parent rate, which can mess with the required clock rate calculated
> from the eLCDIF driver.
> 
> To prevent this problem, remove the CLK_SET_RATE_PARENT flag from the
> LDB clocks, so that a correct clock relationship can be achieved.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>   drivers/clk/imx/clk-imx6sx.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 7cf86707bc39..3f1502933e59 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -302,10 +302,10 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>   	hws[IMX6SX_CLK_CKO2_SEL]           = imx_clk_hw_mux("cko2_sel",         base + 0x60,  16,     5,      cko2_sels,         ARRAY_SIZE(cko2_sels));
>   	hws[IMX6SX_CLK_CKO]                = imx_clk_hw_mux("cko",              base + 0x60,  8,      1,      cko_sels,          ARRAY_SIZE(cko_sels));
>   
> -	hws[IMX6SX_CLK_LDB_DI1_DIV_SEL]    = imx_clk_hw_mux_flags("ldb_di1_div_sel", base + 0x20, 11, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels), CLK_SET_RATE_PARENT);
> -	hws[IMX6SX_CLK_LDB_DI0_DIV_SEL]    = imx_clk_hw_mux_flags("ldb_di0_div_sel", base + 0x20, 10, 1, ldb_di0_div_sels, ARRAY_SIZE(ldb_di0_div_sels), CLK_SET_RATE_PARENT);
> -	hws[IMX6SX_CLK_LDB_DI1_SEL]        = imx_clk_hw_mux_flags("ldb_di1_sel",     base + 0x2c, 12, 3, ldb_di1_sels,      ARRAY_SIZE(ldb_di1_sels),    CLK_SET_RATE_PARENT);
> -	hws[IMX6SX_CLK_LDB_DI0_SEL]        = imx_clk_hw_mux_flags("ldb_di0_sel",     base + 0x2c, 9,  3, ldb_di0_sels,      ARRAY_SIZE(ldb_di0_sels),    CLK_SET_RATE_PARENT);
> +	hws[IMX6SX_CLK_LDB_DI1_DIV_SEL]    = imx_clk_hw_mux("ldb_di1_div_sel", base + 0x20, 11, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels));
> +	hws[IMX6SX_CLK_LDB_DI0_DIV_SEL]    = imx_clk_hw_mux("ldb_di0_div_sel", base + 0x20, 10, 1, ldb_di0_div_sels, ARRAY_SIZE(ldb_di0_div_sels));
> +	hws[IMX6SX_CLK_LDB_DI1_SEL]        = imx_clk_hw_mux("ldb_di1_sel",     base + 0x2c, 12, 3, ldb_di1_sels,      ARRAY_SIZE(ldb_di1_sels));
> +	hws[IMX6SX_CLK_LDB_DI0_SEL]        = imx_clk_hw_mux("ldb_di0_sel",     base + 0x2c, 9,  3, ldb_di0_sels,      ARRAY_SIZE(ldb_di0_sels));
>   	hws[IMX6SX_CLK_LCDIF1_PRE_SEL]     = imx_clk_hw_mux_flags("lcdif1_pre_sel",  base + 0x38, 15, 3, lcdif1_pre_sels,   ARRAY_SIZE(lcdif1_pre_sels), CLK_SET_RATE_PARENT);
>   	hws[IMX6SX_CLK_LCDIF1_SEL]         = imx_clk_hw_mux_flags("lcdif1_sel",      base + 0x38, 9,  3, lcdif1_sels,       ARRAY_SIZE(lcdif1_sels),     CLK_SET_RATE_PARENT);
>   
