Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A02C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 22 Nov 2021 15:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbhKVPH5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Nov 2021 10:07:57 -0500
Received: from mail-vi1eur05on2087.outbound.protection.outlook.com ([40.107.21.87]:59008
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232910AbhKVPH4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Nov 2021 10:07:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIPD92VwiX6cSH4sBWxfmWiqhEmhTFbwsmFVcjEnrbexZRzh8m0yUcUVtBfW8pb7iGdDJiaWK8fc9e1arWYbx4fXyqXqj71dT2K/s5Nvc7djUiqEAzoM8kazZAUIiO1c2M5hdZadfw66frSGJ79/0yLDpPhrIXAkX3nP/dQcEw2zZO3UPcIwcaBLOj6JUVSqswpmyTfUYxljbMbRcQ4kCX07qaErosg05Drt/fd+cPq32A4SvcMkQ2cCJgweT2IYmwJ2dTSNOtxCREajAeDd30u1qa16wvGOWtJ3qQj0FtM2VpVcpkqWWK35sMGoI0lolHLZl29h3X4Ws/BM5Qc2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+cPMOE85DLHzqERYjgk8H7A1f0ajuF1bqTgCNdK0OA=;
 b=S0V3P2OZcGTrOzLkwm8oX6pTWcdAP/M7EPcOkW0le3T7N2SY3sdjIw4W3N1fOqe3XPBnwF5HaYDyp4bg3g3DOs1sEBCBIeekRCpbKwhSUZG15TthD/0QG50xO8H1UvqQOFfcVzHiXPP5tpV+eo2xXf7kOBwduamxTa/vG34GXKR0TB1MCOENuiB5o4XjpB3Bw+pGyq//4SGo2Ho39mWw/LKvVQAsNHcsMI68t5SpGvNXkSz0fR4prNF8Ybl+SPkdGlfikpHwbSVgfMx0+755elzk16crI6IlsMqg12zuQ+6xeMwFaqZpCJBGg3+chT1P3tcnZKidNWfGHyFEso2mhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+cPMOE85DLHzqERYjgk8H7A1f0ajuF1bqTgCNdK0OA=;
 b=N6KVnl4ttv3LNCVNi35vrorIn5ewZsJCrxUO8f3FbwZOQt7xvDayVLZXiQUx+Dwx0gEYxJ+/5m7OxQbFqw6ojzWotZdN3aBJNnCA18SHg8bZtpG3a2YWbJoaex+d6xULWdo3UCC/IVhNdmQJK8cNjVUtrpHoW2ffbGVmi3AScr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB5853.eurprd04.prod.outlook.com (2603:10a6:803:e3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 15:04:46 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4%4]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 15:04:46 +0000
Date:   Mon, 22 Nov 2021 17:04:43 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-clk@vger.kernel.org, linux-imx@nxp.com, shawnguo@kernel.org,
        Anson.Huang@nxp.com, ping.bai@nxp.com
Subject: Re: [PATCH 2/2] clk: imx8mp: Fix the parent clk of the audio_root_clk
Message-ID: <YZuxiyj5PAtCKhnG@ryzen>
References: <20211109125657.63485-1-hui.wang@canonical.com>
 <20211109125657.63485-2-hui.wang@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109125657.63485-2-hui.wang@canonical.com>
X-ClientProxiedBy: AS9PR05CA0027.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::18) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by AS9PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:20b:488::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend Transport; Mon, 22 Nov 2021 15:04:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1935635-a63b-4020-d43b-08d9adc96bd5
X-MS-TrafficTypeDiagnostic: VI1PR04MB5853:
X-Microsoft-Antispam-PRVS: <VI1PR04MB58534064EC732CB7A6BD61AEF69F9@VI1PR04MB5853.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 03Q4I2sciQMq8GqUTBvOD596Dzmqy30eM+VNHrLwrB2hK+li22TicM47Z3mj0XO6FJ9HbSRaodHzvrqGEJRA4ECOazJ9T0THPaPxLRzbLmU0ikWmD/dp7ZljHc4QHuoXTYDCDIaYvfbHaNQsogaetdnsRnFrXFueRmMH7K/kXedTeQMK06D6h8g0OpYaR5jHn2MsYGVPaX25uK8uaZ2vWLHNZdgXJY45YRd+knsB9mXjbxCHzXy2r+qw8UuKGq4tFy7TdhxFDkFD08gYLAaZoAcCi6MwP4bi5x2Q7ztpEc7lSuVYJIXa50y3ng4StZNud9fvWE/dGh1zmiba9njMgc4gKJSubouCiuptd456OLbGpB1w2rl5h1yY+5Zx4MwLtcLGp3+cduWmuI2YkLyyzphkFk864AqOyuzYF4ngXi2lJnZeVlpys1Hs/SiIQRHP8mfg0YEBbW4VZ+r4k7qXNBh3hlpiU61RbddorG0l7t8YquyYQB7VeDxj259IFH/aWZbC+HhuVhamLn/xp8HsQ4niZA392Pl2FxlSBI4qULGM//ubyXepkotFayQNZ7JvRTd5ejkz4gQs5gQgPPFRcjLlZ0OXzj76PTH3IOwXdQAroLw6AAqOgeZRfQI+a0qPboWExhorNiUk3C4Udba977C67mV9XeliCU5BVbBdHcyKYfoBPJb8ZAoOy0Meol4urT/oz5+cQz2DdDzdsUd/ZZ3jMQwduVfOQR74i4hDhmNd37fdvsTbEgeqdrzvTiGMdir3uftkxwF11xJFaJILDpKwyLTqOQysSz/kxKqtOE7TchtgsMXgud0EDlqKQWWE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(55016002)(5660300002)(33716001)(66476007)(9686003)(83380400001)(316002)(9576002)(956004)(8676002)(186003)(86362001)(66946007)(6496006)(52116002)(2906002)(966005)(6916009)(8936002)(26005)(508600001)(4326008)(38100700002)(44832011)(38350700002)(53546011)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G4rFNqZCsp84qPryzbb6Jo6tboeQtBRceZRmwf3uVyb8Aq4/eaMEkFqW5Wqw?=
 =?us-ascii?Q?spIttTY5k9btDFgzdXbdtNRRbOL5ri0IpovN3H3wNCTayHGuWGVUzfjxreZc?=
 =?us-ascii?Q?1gO+xj1WEIjozyMdJSzvM7VY/45qqFEn9sVfUGLBb+4d/OBbbOQ32OdoXhxp?=
 =?us-ascii?Q?SwkXy6s/LrXDrwIiBh9CFmthQDzICPxLuaDpm2Hm9Tq6QNRftYkPGn1KuO9r?=
 =?us-ascii?Q?M/7dUXaRUK0LVrDT7HQkVYLBoSsyNf+LH71EVOuTn2+VSrVxQc4BAPpsFbUM?=
 =?us-ascii?Q?j0wkUxTMMFpnrHPHAJkPem1rkBgsptswgEPF9yfcOsW1tF0BUGBr5Szi1WNB?=
 =?us-ascii?Q?Feb8r20UoZysxCEE7oIoQ9s3Vsa29hyTo2RyAUy/YVR5YU/0zJqr0Ud7PXH5?=
 =?us-ascii?Q?BH7hc9Eb1mZbYQtTF0Y7+zFq7vUM8FoyfI7joPMHMzh14JBLoz6UFI9rk5hZ?=
 =?us-ascii?Q?NnYYGEr3CwDQN6A3Rj/c8FHWFDRz8ibf0Vw5l/m4oUyFFyWZeqppDaNT8aGh?=
 =?us-ascii?Q?nxBcbsdaNUJk328eX8t2l+7VPsZ5reirgx8xXf8UH8cbdMNxlDcnZoD/3ph0?=
 =?us-ascii?Q?fzIP6xyHNVdo+AzP+denJAjV4S6WkcjRbiMhic6u5scbGaQlCexbhYFmlZq+?=
 =?us-ascii?Q?zqniB1uNbQs3teLIMbYLYq7Z/gzob3O4/3FXWT7+YqI9hZfjqIL7ErPD3YIc?=
 =?us-ascii?Q?Hbdjd2qaF+7rAuTdDqSEhwkGBZuUMGU9dWKmsk0id7FFpR+4eTY3GmSQIOH5?=
 =?us-ascii?Q?5AeWbaPcA1JUa8/rbql1r+Nb4mfSkQmYCHwwS/qquEah5bvxhw1aPpWiguP1?=
 =?us-ascii?Q?cxCi1bXiqzqDVSNvILqPLhV21eNvH1pVYFVd+egKav/xs3m7E/GUfjAMt8kq?=
 =?us-ascii?Q?Mj8O0AY7ksDJ8YdM13iR4axh/xqy9VtGSjagqO4U4ZQ7K1JQvH6/WgAOsqVc?=
 =?us-ascii?Q?VU3m9+EEdfBhEF9EL1yP65OC/8yrwXOI+2dzJuYX+FMS3fCpfIgEsn4Ap9IQ?=
 =?us-ascii?Q?77mexOL7pTyk3W1tQ2zfVmDplhNvhc6wK1FkHw7+8kWjsV4t3QZUBJLMNFrA?=
 =?us-ascii?Q?TRX+U9Yi6ZZuISiNqRUp43WI+B+eHm+mTeGNP+b2WjfVtBxmrH9v0C35fand?=
 =?us-ascii?Q?QfclGcqsD8m3NhBPwavRiWHdDqXTTdDHKSuaYTo/CDy5UsGkVtdI0yquYHYW?=
 =?us-ascii?Q?AbmxzVpIBkjvtb7oYtmLfS2IAuSoWl2MwUEXtmQfXZTJ7EJ7H5GtKnId4FVx?=
 =?us-ascii?Q?PbcQfpcjxjJylQnOjIgqoA9dnV7ViRn6uaZXx9P2De4cWeohhf8Kxykmd1bV?=
 =?us-ascii?Q?MZOJv4PvJLdl172Gp2RBtdzDrfmmgB2owE1rIGj75XhQC4TdYfdLco+m8Pwu?=
 =?us-ascii?Q?e2BjGGQv1cqRIHfLEWY2IMLar4bTQ3c1TrgFcgUzLzXxkEYGg0HWpnq/wyaw?=
 =?us-ascii?Q?NmGMJfnOF7Cvre7uMPRecon3jakpg4r/9cfwnzwbe0qvBfMyfwbtwS8FYwXL?=
 =?us-ascii?Q?HNYlkFz+zbS/heJUvQkdeWELuEJyOliKLD4V5kNMBpBPmwKUTZr1KIdaRqiG?=
 =?us-ascii?Q?6CbVF+BGAn7D51W96d6EjFV8X2x0G2eKckKhu03n9Cq3ILqlBGUn7VoyTG4l?=
 =?us-ascii?Q?L317PGgKZx0/GZe0H0gjlLc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1935635-a63b-4020-d43b-08d9adc96bd5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 15:04:46.0312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qeOnwc4SyyFJqTEUP2HccMfEcoZN585oJ39SRUu0Cr7jZBduNBnNtZWLxxyg+0bmnMXmtCoZs2P9cmHVm+WLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5853
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-11-09 20:56:57, Hui Wang wrote:
> Recently we tried to enable the BSP on a platform based on imx8mp, we
> backported the audiomix related drivers to mainline kernel from
> https://source.codeaurora.org/external/imx/linux-imx, when kernel
> boots to the audiomix powerdomain driver, the kernel will hang
> immediately. That is because we set the audio_root_clk to
> audiomix in the device tree, but the parent of the audio_root_clk is
> wrong in the clk-imx8mp.c.
> 
> And we could also refer to the section "5.1.4 System Clocks" of the
> IMX8MPRM.pdf, the parent clk of CCGR101 (Audiomix) is the
> AUDIO_AHB_CLK_ROOT.
> 

Thanks for the whole explanation, but I would not mention the audiomix
and the downstream source of it in the commit message, since it will
most probably never be upstreamed. 

So lets just stick with the boot hang fixing explanation and what the RM
mentions. I'll reword it myself, so you won't have to resend, and then
I'll apply it to clk/imx.

> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 12837304545d..c990ad37882b 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -700,7 +700,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_HDMI_ROOT] = imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", ccm_base + 0x45f0, 0);
>  	hws[IMX8MP_CLK_TSENSOR_ROOT] = imx_clk_hw_gate4("tsensor_root_clk", "ipg_root", ccm_base + 0x4620, 0);
>  	hws[IMX8MP_CLK_VPU_ROOT] = imx_clk_hw_gate4("vpu_root_clk", "vpu_bus", ccm_base + 0x4630, 0);
> -	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "ipg_root", ccm_base + 0x4650, 0);
> +	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "audio_ahb", ccm_base + 0x4650, 0);
>  
>  	hws[IMX8MP_CLK_ARM] = imx_clk_hw_cpu("arm", "arm_a53_core",
>  					     hws[IMX8MP_CLK_A53_CORE]->clk,
> -- 
> 2.25.1
>
