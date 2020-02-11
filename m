Return-Path: <SRS0=edwH=37=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F44C352A3
	for <linux-clk@archiver.kernel.org>; Tue, 11 Feb 2020 07:18:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49DC72082F
	for <linux-clk@archiver.kernel.org>; Tue, 11 Feb 2020 07:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YKnxBZtE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgBKHS1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Feb 2020 02:18:27 -0500
Received: from mail-am6eur05on2046.outbound.protection.outlook.com ([40.107.22.46]:23705
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727467AbgBKHS0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Feb 2020 02:18:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0FWlYkNBZPT6X0zQkSGF8tiaojr2nyoChqMJA2P9gK+anHYxnlpbr+aAO2NtDOpdqyvYweGoeiiGjJILLqP/3hKCBxJe7xT8P67mcTT4jEm9VhaJsiDNVdCSAE8ZVEIf1aR48weLysJHL4Wfoy5YON7LacvnSF2nBrVquh9Ulyv0DXKLDWtu5SE7MYRrYCJx4tXcRnXWqi+KAjcq0+zsNHH0ScJ3mg05Pl7CVlhUHYwq7A0+5QGilxYAn4YQaYDq2LChueyuIPE9HHn3N+Exiq/lGJXAL+4hvbkbhmAJEIDkkjyJCXBbnEiFB6OXa0Cvl9mfh5wytaTRTnZrHHD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EeDTQ6aeQpcHFHBjnweAvI4HrbzhWPqXBZwRMNSMG4=;
 b=S230Ri6IZEc0Y5n48Pv+qMHjWc5CSdoQAGMsLKluAZT+NQDO9/C5INIxY0yIRhRRAstsVHKzhdKBgr7ftQ9pLbSCUdSaF6A2kdAaYp3qN2s48tPC6pASskOH7AhMF7PjoizpyuWz2T7lLGoY3u3PwcAHIXhzojj87VNlgAQ2WO1ESU0j8juoWzK4OYYgna2sQhTGR2AzVDxj7sNOoIxk/KlnpJW2YVASAVCw19EzyxJ6wlNw+bNNT3KwyWR7YVZm9B7Zp4mgWL5pp2/G4d6q9G/kr9N7ugFiNGec1uX1ozoHH7WRQ5c5dSe8mRJ+2m+4DBJa4lFtBuMVFWOzaztxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EeDTQ6aeQpcHFHBjnweAvI4HrbzhWPqXBZwRMNSMG4=;
 b=YKnxBZtEwuAaSGMcrkrcxv3DiwfWodradLzaMGoOYfPB0MjOPh2KFlC/2fOyeUGG8X+EpBBODuRoTwrtPZVnArRqPx7z2jClrSeGcnGvEr/n0zL8cUEyyeF5GQiOtU5MlXke9JepbTDAvc5NO6yyOzKC49xISqIfR9qe+jk44DI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=abel.vesa@nxp.com; 
Received: from AM6PR04MB4599.eurprd04.prod.outlook.com (20.177.37.82) by
 AM6PR04MB6712.eurprd04.prod.outlook.com (10.255.168.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Tue, 11 Feb 2020 07:18:23 +0000
Received: from AM6PR04MB4599.eurprd04.prod.outlook.com
 ([fe80::8c62:b251:ffe3:af8c]) by AM6PR04MB4599.eurprd04.prod.outlook.com
 ([fe80::8c62:b251:ffe3:af8c%5]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 07:18:23 +0000
Date:   Tue, 11 Feb 2020 09:18:22 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: imx8mm: Fix the CLKO1 source select list
Message-ID: <20200211071822.z62jkodywyohi5c6@fsr-ub1664-175>
References: <20200211030813.13992-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211030813.13992-1-festevam@gmail.com>
User-Agent: NeoMutt/20180622
X-ClientProxiedBy: AM5PR0701CA0067.eurprd07.prod.outlook.com
 (2603:10a6:203:2::29) To AM6PR04MB4599.eurprd04.prod.outlook.com
 (2603:10a6:20b:15::18)
MIME-Version: 1.0
Received: from localhost (89.37.124.34) by AM5PR0701CA0067.eurprd07.prod.outlook.com (2603:10a6:203:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.9 via Frontend Transport; Tue, 11 Feb 2020 07:18:23 +0000
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed9024f0-3fca-4b58-52e4-08d7aec2946a
X-MS-TrafficTypeDiagnostic: AM6PR04MB6712:|AM6PR04MB6712:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB6712A50A5D773730ECAE8945F6180@AM6PR04MB6712.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0310C78181
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(189003)(199004)(53546011)(6496006)(26005)(4326008)(186003)(16526019)(44832011)(81156014)(81166006)(6486002)(6916009)(316002)(8936002)(86362001)(956004)(5660300002)(8676002)(2906002)(478600001)(9686003)(52116002)(66556008)(66946007)(66476007)(1076003)(33716001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB6712;H:AM6PR04MB4599.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUMyNeCDT39ikt/eCvGxj32Jj7F3wC9QieqnNHWwUv4FHFK8MILz5R0nkwKbpLyxf5n5Alf5ZUrDSMaPVpS6RLBx05L/U6/pJBPtAiWhJiLtafMcMqVqXNE1JhMw4Ry1HOz0n3cZKMpgxs41PRJmbLL6Bp3bESsJv50t/q5SuPH2dnD+GJT+GegAG/HzfbKxn8M/0tuUdMNM1K6AFPFdxfNVLZF4/oe27aeClkZxU+zoqXJwIV6p16Rh3WYrwBwzoB2B4Di2N5w9ezuMDNRq5/zinpfsh34G36u80bEfO0fdRpOcvFrNngsLZODhw9KASOLxDxFXuDsMSRuR4tNYFEzfqu+nb34c6BvePygDOVhH2WPPsU5fJS2E3nEctFEDkanfpiwCGIehZe+6OcgCQsxahOn0dz6Lb7X4qEGd6IzV1k5xxxWC2PuEZPT+tUKkKhbd0z/tYcPu3Qef1Nu9BorlmEjCnZHR0rYyZ7mH+SX4vLo1NkaCl5AWUHC/g15a
X-MS-Exchange-AntiSpam-MessageData: bVnDY++Qr1BugR5w0vQ/UcgHkh3qCPOinlNDIkMi6O0EslAQxCkfWq5H/f2J5o7KYckDzKCh6NYT94MLr6gNURjNgzMw1/I4tRCd1L5VrXp1NCiUi2/ZnIfEfYmUNAxegZPYvVrTl5lJHlWqjzzLNA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9024f0-3fca-4b58-52e4-08d7aec2946a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 07:18:23.5157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSLJ9VjjFOfrYaXU+kvNn0DYPUDTTv/YIrJyDGWQtIi41FYEqImeWYTPyNh64SMCwofvU+3yfQJCDcNdeIcD8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6712
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20-02-11 00:08:12, Fabio Estevam wrote:
> The CLKO1 clock source select list is the following as per the i.MX8MM
> Reference Manual (put in increasing order):
> 
> 000 - 24M_REF_CLK
> 001 - SYSTEM_PLL1_CLK
> 010 - None
> 011 - SYSTEM_PLL1_DIV4
> 100 - AUDIO_PLL2_CLK
> 101 - SYSTEM_PLL2_DIV2
> 110 - VPU_PLL_CLK
> 111 - SYSTEM_PLL1_DIV10
> 
> Fix it accordingly.
> 
> Fixes: ba5625c3e272 ("clk: imx: Add clock driver support for imx8mm")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

For both patches:

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 2ed93fc25087..770cf2ae58aa 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -283,8 +283,8 @@ static const char *imx8mm_vpu_h1_sels[] = {"osc_24m", "vpu_pll_out", "sys_pll1_8
>  
>  static const char *imx8mm_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
>  
> -static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "osc_27m", "sys_pll1_200m", "audio_pll2_out",
> -					 "vpu_pll", "sys_pll1_80m", };
> +static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "dummy", "sys_pll1_200m",
> +					  "audio_pll2_out", "sys_pll2_500m", "vpu_pll", "sys_pll1_80m", };
>  
>  static struct clk_hw_onecell_data *clk_hw_data;
>  static struct clk_hw **hws;
> -- 
> 2.17.1
> 
