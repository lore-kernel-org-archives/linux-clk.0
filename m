Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EA4C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 13:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4457861165
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 13:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237524AbhHXNGo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 09:06:44 -0400
Received: from mail-vi1eur05on2048.outbound.protection.outlook.com ([40.107.21.48]:21889
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237537AbhHXNGn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Aug 2021 09:06:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cyu64Twd1uxo7DG1Uwk5lrVRqZ73/UUF4fhsu465UH2X2cwNwyGmSEOn+D/icJ7MQ5QYx9vDPolDBymZBXOrqEDwtd1ZO1loBsrUnEnpKrUfSQtcnpTcZ8iRg5rfdVfUpJuwQsY2UEjMF2hjJ0+33ZTqmyHttMlnG0IwMbVl5y3m6FZeVnooYi97c7Qz/TmP0kYbocEfBxLa9AvF0pukwEuN3mENBVzT/vn8yQCJ1ICF8pBo3sH0of0i1IsahQ/fdDsaCDL+aoIPZ/B7Ixt8deqbXk1H9k81mfi7s6Uxg72MNz5n6shLrtxqcXygUOFoNSNONltDRoOMwab7DsuB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjTeTcss9VOibkczZUe5NGFSK90U1ssgluL2sdHLowk=;
 b=oXpXW9qN/tjhOljsCJH3vCpXqAss7SV67ku6E2Fac7ullBBsJ+wtl3k7BhmRguWiyZTCgoXnvTJkRYlqLeyRj+BdrQL3GdKQI1Qx9s0cLy9EGZo/uZDZ2WOLl0TN17C8EMIATUAi0hUVh0NuOoqoDafkKmC+lVDiQ6B8MaYexf8iJBYl2VyROTr8WGKouzy+jVCGk5kYqecVcraTwdnQDcwApVEXEKBaHXirwuu52gbm5KjDsiQH9o06ZsP/qm3K+9gdjFRW3GbdCPe1paXlOEk2lkL4ydI0z0VxOWFIDYy0KShFHlnslU6D0TUXfCD8+6xoL+vmkPCl9s8ZpzkPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjTeTcss9VOibkczZUe5NGFSK90U1ssgluL2sdHLowk=;
 b=MGgwts/ewNr4QXy9IRf2QZuHJeomBP+LU8ahMXVNnoAxTm61ZNzh+7UiNbwsxcKk1bSn7PggEbTaDUoXMGB4+MBTUc6bUETEOq/lvKQg6pgc1Ch2EmszUEKNRlF077c3K8stLG4oEAsTPA29spJDFIyrllZdmfCMxm1EU60oV0A=
Authentication-Results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0402MB2927.eurprd04.prod.outlook.com (2603:10a6:800:b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 13:05:55 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4436.025; Tue, 24 Aug
 2021 13:05:55 +0000
Date:   Tue, 24 Aug 2021 16:05:54 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] clk: imx8mn: Add M7 core clock
Message-ID: <YSTusuQJlTKtYkAQ@ryzen>
References: <20210819202036.2084782-1-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819202036.2084782-1-marex@denx.de>
X-ClientProxiedBy: VI1PR0701CA0064.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::26) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.27.180.28) by VI1PR0701CA0064.eurprd07.prod.outlook.com (2603:10a6:800:5f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 13:05:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 679a0051-a424-4172-5e73-08d966ffe89f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2927:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB29274EF19EF77CA0BB3BA88BF6C59@VI1PR0402MB2927.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4LuVHqYZOCmAwbvDFE+aHZo+/ByOdEktEEca/6fw32LhqDB/AHgGkhvhohqOxHy/BhhsM5NtPBzI/Udwon2xtRqNHbiQ2gshi8Uz/GHnm/GI+G/3fgvaAW+0J3lZMn6eibZuhLnrTC7gczzirCBcZo0mNy9cXAkjv2dfXmHfzxtqkVygm4KdTtKNQtMyY1VsvaF6LEa/R8BqTptuAG5zpIMg2FUumMuyALu1mH0GcoQjvf+ItEpX5l0lFeJXX+t/eSIoqUEofzxFqA3KitdFtMxRBEKZEXzY1XiLJV5P0el/TsL961wd4B0OMYJc44kPbUmbpSbI1zVQ/014vLuK1RpTvaSPsvcOaL6Ig7eLj+eKrayUzJqSgWo0O78nOn05HWB6JUFzQvesrsJdZkkLg4WiMq+fGUJ8s3dKD1w+745rv6wuPivKfgHyxaEXS3M4pX/Jz6dax3hdKO3bPQCrTLi+SA5NtuQNeR9Oq/9iI7dZobKpdo4+KKytXz51AXkj1I9UbyAleIOXZg4jdVH7Q85+4Ab0fZsZD3oijSVIA/uiwjLKT2KIjSQie48q7kvfuMsnrs0hBJn03X7RaEcken5YQVo3u2DukD3O6+VPDr6N7eLenwy2r0JyYIW0yVwhBRiCmuxrExM1DXFmE5aoDvrT8JaoINDcu/xAdtcQzcWdgXr8k430B0ADi3kDQ3q0bbjd3w1fZTZpb6qhDK9NEOM8ssNFGjsSXluTyMpk2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33716001)(9576002)(8936002)(4326008)(9686003)(83380400001)(66946007)(316002)(66556008)(66476007)(38350700002)(38100700002)(8676002)(86362001)(55016002)(186003)(508600001)(52116002)(26005)(44832011)(6916009)(5660300002)(54906003)(2906002)(956004)(6496006)(53546011)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4uB6hrbx5OR7qT9M9WK4k/QQy5GvyRReMKEAYRv6BvloEl6XsXZ+LSJj+52B?=
 =?us-ascii?Q?ghnDsUb/tlwGo/isS87CQE3fXQqKvCIpbw3EUHfzowdXOuJUTsaVpRNK6pBG?=
 =?us-ascii?Q?ga2crwMoHuukFJvfAsLrRPIZBnXoJV31Tfs0ESHG+P2I4n72iE+LR+DBY9PK?=
 =?us-ascii?Q?+PevlvynoRvptDIJSIPF7IMSA+3KEbdMbZRnox/5+65wDoNHGqh2l4IZN41N?=
 =?us-ascii?Q?VCW0pIbA4pWFH6GfW12saUiTBK6FSlOxlwSOFE7hY4wemvmwH1AdfuI1KKcs?=
 =?us-ascii?Q?yXXiy6smeBtenw8TE981KSe6nl3yu9vCQ1CZ/Py+m2iDFCS5K2lcdY425hRr?=
 =?us-ascii?Q?zUW57nZ5o7o0ZIL/Il2UYmiY6SgnF2kiLVdxPxCaUgZ9Ma3bMH3ZokV9LKIH?=
 =?us-ascii?Q?1HEP3DdD5xOKBrrBHaqJ6R0LjkRVxABzKXzIpfHUAr17vvVLBQxyVXWbuJ22?=
 =?us-ascii?Q?P0dX1PQ9QBjIZyOfbe/KpW/Q5u02+w5KKZ86YI4BV1rFZhUCXGa0SuVNw8Eg?=
 =?us-ascii?Q?c8hizCD2yulPaXITp4O0xFLlPhixh4HHBz/mDArc2iiwoJWT3SL1fT1w1TQn?=
 =?us-ascii?Q?wqHGcECWydGyX60l/V5fVjni8JOq1+Eg4Un3z2T9gGhlA7qnsrFrjZNSiSc+?=
 =?us-ascii?Q?uhGvdlqSdDRMwxFBW/9SRzvuj3Iverq2WhaWhZJfD8kDWHQi0uaYCApKsRJT?=
 =?us-ascii?Q?hIz+KhOREV6gyv4o9Y+HVJnCSQEhcgmb/hD5px+momB6cctVugNsslM6W6vJ?=
 =?us-ascii?Q?xEwgIcGdw4bv7bZvp9sBx4c+kSV3Cf4BOOUGWSHhpbKM9hFox/SdFCriECFU?=
 =?us-ascii?Q?cuWS6z8kR+B+cXxa8TTy12EjmDZTGtYJbv9xRLFRQZ17hMrIgwaGLYZY8iyx?=
 =?us-ascii?Q?ATbT39biA71RuYYH8BubhwIp1qkyTjtJwEEajdHmo+xQWkPjB+On9H5A/K0g?=
 =?us-ascii?Q?Z9ijlcZ5j9mGdzMex7aI/EXBTuK1kAGTMVM1LPMiP+I/6mzqIjsjF3WLzLqk?=
 =?us-ascii?Q?9BsCq16RXzEKzZvybSBTYtAT4YPNACWchnnZopg9vfWCqklUWNDkZKOM14dc?=
 =?us-ascii?Q?Qv2hM9Vc5ayBVfIU6rOKf2fEhvqPe+fDF6glvtLEAof7rgRsIAoEdBfE69Iv?=
 =?us-ascii?Q?ANzgsAgn9TDu9LmOofkZok/m4o5VYDLIunsKnz4Lv52G8+UUFRmAVgwTV7vX?=
 =?us-ascii?Q?uGJ9haZ8d9/IWzqV9Q1xX9OTYWPJPwetXzQ/nwu0OxXqf4r2SeO5ZRT8WZPk?=
 =?us-ascii?Q?X/yAeNG/AoTpsVK0Y7F0ydh7poznrFEK8EeEqDQp/ygPjpwe/YfAmwIrjVdc?=
 =?us-ascii?Q?uc0rt23dd8VzAno32EdZsghn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679a0051-a424-4172-5e73-08d966ffe89f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:05:55.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxKMls/uhKvg1QZPCpjQCPdL29ewCgmMY9jBb+PahItATIYSTxrtHhwAK0AsW2bk9m5FhOnZh4Z82FnX6IQ7vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2927
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-08-19 22:20:36, Marek Vasut wrote:
> Add missing M7 core clock entry to the iMX8MN clock driver.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>

Applied, thanks.

> ---
>  drivers/clk/imx/clk-imx8mn.c             | 5 +++++
>  include/dt-bindings/clock/imx8mn-clock.h | 4 +++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index 212708e9388e2..9dba4eb643ab9 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -40,6 +40,9 @@ static const char * const imx8mn_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pl
>  
>  static const char * const imx8mn_a53_core_sels[] = {"arm_a53_div", "arm_pll_out", };
>  
> +static const char * const imx8mn_m7_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m", "vpu_pll_out",
> +				       "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
> +
>  static const char * const imx8mn_gpu_core_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
>  						    "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
>  						    "video_pll1_out", "audio_pll2_out", };
> @@ -421,6 +424,8 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MN_CLK_A53_SRC] = hws[IMX8MN_CLK_A53_DIV];
>  	hws[IMX8MN_CLK_A53_CG] = hws[IMX8MN_CLK_A53_DIV];
>  
> +	hws[IMX8MN_CLK_M7_CORE] = imx8m_clk_hw_composite_core("arm_m7_core", imx8mn_m7_sels, base + 0x8080);
> +
>  	hws[IMX8MN_CLK_GPU_CORE] = imx8m_clk_hw_composite_core("gpu_core", imx8mn_gpu_core_sels, base + 0x8180);
>  	hws[IMX8MN_CLK_GPU_SHADER] = imx8m_clk_hw_composite_core("gpu_shader", imx8mn_gpu_shader_sels, base + 0x8200);
>  
> diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
> index d24b627cb2e71..01e8bab1d767a 100644
> --- a/include/dt-bindings/clock/imx8mn-clock.h
> +++ b/include/dt-bindings/clock/imx8mn-clock.h
> @@ -241,6 +241,8 @@
>  #define IMX8MN_CLK_CLKOUT2_DIV			219
>  #define IMX8MN_CLK_CLKOUT2			220
>  
> -#define IMX8MN_CLK_END				221
> +#define IMX8MN_CLK_M7_CORE			221
> +
> +#define IMX8MN_CLK_END				222
>  
>  #endif
> -- 
> 2.30.2
> 
