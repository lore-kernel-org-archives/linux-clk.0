Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9550C48BE6
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9483161370
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbhFNI4n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 04:56:43 -0400
Received: from mail-eopbgr10078.outbound.protection.outlook.com ([40.107.1.78]:29613
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232528AbhFNI4n (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 04:56:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1q5+lmJRMOr42dFcepduXMkbjQquh2MWx5nMislDif0UsZPv91m6mflXwZB9kqtfm67EbvBzEP7AS7EpvVS00r/sFsGsOJpfP8bMmKIOJwkqrKE4/jW9i/70F9XHjAxQft9coASLzFzEwZdiEck7KWoqS7rTT8wDg39IW5udZ9ibeTuDb2s16KMOa7EXtQGX/VfXHhRyFsqSD20Wqb6LkH8suWmaN7n195ak7kxFdX+uz8ls0LIXklBP1dfHvdrYblyIN5saAIFl4bViSfBEg++dS/tEwZfs4CPG2LDJ4BD757PZAKLN6obT203iVQacWv7xlIPDvNZEpavDXPMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L/wVZgC+hl4nfLU/d3YxDO8JivqSbzUEsub/ucO4Ec=;
 b=PEydAu6XX1tyasiT4no8J+VBRElkGOsyXNr1bhnmvcz+i6wTX+Ut8OzUvbOyzk8iADni2z4/6Yvgx0KsH7ymmNp9VFqKKULXG27IdxD2SZdbkPJSy7704Pdv+YjaImo9uMcdsba56AU4HvkoOjq+Y2FAGvtPDXejyzeblwedR6Sl4/6w5Uzfc3cPgAEjSpibKZgC5LyuQM1K8DIayY8viPhM6nEGQvIJJlDoOIRsDk22S8TICBx3MGIb3JbC493pkVnILie0sgFMcPvOMz5Zyy4ijctVN7QVdfI7DK7vAD4zTHJmr9vPkG9dErViMErg6mpl+81guHcPEl6xJgV2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L/wVZgC+hl4nfLU/d3YxDO8JivqSbzUEsub/ucO4Ec=;
 b=jXKuFSZuoM8x3aVqUAS4pl2W0//0NeYFyuS5Vd6wC8bJ31VGSBQO/GvcWnkw3g6byyt9+igy7eDYYo2+awcYehOUw3expschZyGnuHXPKUiLMgT51BZr0K2tum+kbQK/H9BToqhF9wl8SJU4Lq3prOG3zETbCqcSdQ/umpnElU4=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VE1PR04MB7293.eurprd04.prod.outlook.com (2603:10a6:800:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Mon, 14 Jun
 2021 08:54:38 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 08:54:38 +0000
Date:   Mon, 14 Jun 2021 11:54:37 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, dongas86@gmail.com, shawnguo@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 03/10] clk: imx: scu: bypass cpu clock save and restore
Message-ID: <YMcZTdWMZKEmMSkQ@ryzen.lan>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
 <20210604090943.3519350-4-aisheng.dong@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604090943.3519350-4-aisheng.dong@nxp.com>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR07CA0249.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::16) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR07CA0249.eurprd07.prod.outlook.com (2603:10a6:803:b4::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 08:54:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3589d41c-3f6c-495f-1225-08d92f120aba
X-MS-TrafficTypeDiagnostic: VE1PR04MB7293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7293129A378A2927BD4E642BF6319@VE1PR04MB7293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kw/mcANlviEoF0rCkboGe0RA1SR+3xCrJBfz20zEGsgpYGtDpESau/0VyNTfc+ao1EgxIvWk8nXukPaIiGWQdxboB+ExTRPl061MSnpEHxNe4Yg8Y6dc7K6pBSZYd0jGP0keeQue1Dutfj9hAUODY6902uD8BTFiYgEkrkpko2rG8RI5gJmlBmw4Bx97i+xk/NZAFcSpBiT4uMH3dwV0DiPsN3wa2R8v2kfV9Dj4DXbHpgeuxRY5vNXdJc9xQrQVIiBMEEGl/4NeTB/2roDMsFsea5VLI5QeOFcikdFUJ1fxXIMmPVroPLHWTP/HZ9DFPQdBWEa40WJJa4vQ8bSWu0A/6zGdpCPHrkx1lyzLArjGs3/LGqOxET0y4oCFAuESEPEzXO0yB4gvQiTvG3vPsJuHvqkPt4Lzh9axHXmXAkjVVW1mB2O4RLJQH0epigwA4iaAXzoIKGY271nXlPw4BGwoStULMvhXvkLhnLPgIfs9BbCVIiaZEEnEA1Q/N4HhXwh8K9sNwWQEqhWXpnl2k+rA+DKU0yTZCA0+w2+4dkrC28pTeMOas3KqD0xSrmIrphJurlVLWMaSdemThnTp/07phdZofC8HUMCPhyhvSFsgFtwVXaPVefH2ezOvkHGxdScnktq/IQtqG76mBDY6X4sgRQE5ohdXKBYfIjX994w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(8936002)(9686003)(36756003)(316002)(6506007)(38350700002)(8676002)(4326008)(53546011)(6862004)(66476007)(66556008)(38100700002)(66946007)(83380400001)(8886007)(6636002)(5660300002)(86362001)(44832011)(956004)(7696005)(52116002)(2906002)(26005)(186003)(16526019)(55016002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJOUDzKFTksgWL0xcr4WD3McSR/p60Xb1VouQt1MhJN4e4vlMFaaUontks47?=
 =?us-ascii?Q?lSRxfrBUWrJDEiezoJU2qu0aMCfyP/Q166IMiCeq0NRhkx+VxT2CeZr1Erus?=
 =?us-ascii?Q?PkkSjgXvUWncE/Hto52wD2I0oa1lxvoCtAOZVNnRJ5ikUkYPR+3lPgquiqKl?=
 =?us-ascii?Q?HNP6zk77TmQgFsJ3lf2VBvv5fMctYI3SBmQXpuP3UgbW6oEkWpi/korUHr1s?=
 =?us-ascii?Q?MCxVAtd1cKVpqff1QYa/gKXU5cvH1XFE8QDPufQPOMe604TUpTCawNh7ianz?=
 =?us-ascii?Q?WoFBfkB2gIk4ZOsFPkk6CRH/xvYnEb5AWAxRK8FbC3GTdBDKWhDWRr+fGFDV?=
 =?us-ascii?Q?297VPFqgPM3NtodFuetpnsiaKg9OQtq7bzSdkLxnV/YaKiniBvCwWFI1op3h?=
 =?us-ascii?Q?aCS8i/9VohOMihS/kuv8fHyjjMSodpbv3zwMGd+chPKSGQkHrlPHz06zypAk?=
 =?us-ascii?Q?ajxNHIVglnsz+rWzBzYfdnzyDZeIAs/jS5003XGKC+0f5yDSegEjreVjo7rk?=
 =?us-ascii?Q?JHLvK8QsFfNEeI+oN0abAv6OuHwAcMpoLp5vK3wyCK1YBlzHjgIi4icQEdir?=
 =?us-ascii?Q?RkGzPtiki22dGkSoiqCDZl5U/6+9S6usQ2Rvg09PukSWK3I6UqSvsV1Bu/cW?=
 =?us-ascii?Q?lIO5DHPh9g0cBBgLBhKWZqKS2BwiKkirKkRZZ6bA3rjB/Pm3mH27bwXqRu8F?=
 =?us-ascii?Q?VYJAdbwl7VLml8o5gElCNYAdAJmVtQ9alH9Wi3V1sUuR0rZ+nT8+59i08HCP?=
 =?us-ascii?Q?LK6Jau2tiTXUKYON28TRrb3Z5Q64dEPBQ7hj8F4DkgS7gW3icOYSF4aYmtfP?=
 =?us-ascii?Q?YASTCtOaOEfl5tI029OVferN8L4DDHluCgFJ4AdR5eRL2geZLgJXGJPzqgVb?=
 =?us-ascii?Q?God4qzu71jIjL8OHuKmnRBhEtyVRcRxUB9/R4C7bK0vmkEHAAvCgqjYOg7wS?=
 =?us-ascii?Q?Ccfi7FNb+EC4o+eFSGxMgN+3hDqCvrpdaWpUVSahOAbYWArh2PJ+wrcdyFeQ?=
 =?us-ascii?Q?T6nu6upV73gjgGanNJ9UtVzwDGvqrdExzwq47hk5GuTUcxoIxb035bIaT46E?=
 =?us-ascii?Q?bxUgO+bjEobXBGZdTt59gJwFA7Vhf56WqSiWlOxCBZdMZQ855cgKB2zAgM1S?=
 =?us-ascii?Q?CW+wv8BMUfafhTkidxpdEC52FCdXKepv5IZvzBaUCy/qUudH1lhilkNLYPNq?=
 =?us-ascii?Q?GIu7CVEDjwKkfrMcYWdXqIceeTMXL2GxmnYwfTRGUv3hphG2z7o33upMjuQH?=
 =?us-ascii?Q?QlqEm8RfY9OAixiTSF3JkohiZsaePdCVfqoouPllxAD4zgVllBpsHO2yGmry?=
 =?us-ascii?Q?KnXSX6PirvzJIcdk9PfIo/8N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3589d41c-3f6c-495f-1225-08d92f120aba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 08:54:38.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4Ljm9Ji2eO5QgcmgR6YLtQm8Ee1Iwe4OIDEgQ/IYXobtmVlvpvTVHq8mwagIqfP6HW/f1tok369t7Opt+YdEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7293
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-04 17:09:36, Dong Aisheng wrote:
> CPU clock is managed by ATF. No need save and restore.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Looks good to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-scu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 680b2650fd45..d87a1a1b297e 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -538,6 +538,11 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
>  static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
>  {
>  	struct clk_scu *clk = dev_get_drvdata(dev);
> +	u32 rsrc_id = clk->rsrc_id;
> +
> +	if ((rsrc_id == IMX_SC_R_A35) || (rsrc_id == IMX_SC_R_A53) ||
> +	    (rsrc_id == IMX_SC_R_A72))
> +		return 0;
>  
>  	clk->rate = clk_hw_get_rate(&clk->hw);
>  	clk->is_enabled = clk_hw_is_enabled(&clk->hw);
> @@ -554,8 +559,13 @@ static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
>  static int __maybe_unused imx_clk_scu_resume(struct device *dev)
>  {
>  	struct clk_scu *clk = dev_get_drvdata(dev);
> +	u32 rsrc_id = clk->rsrc_id;
>  	int ret = 0;
>  
> +	if ((rsrc_id == IMX_SC_R_A35) || (rsrc_id == IMX_SC_R_A53) ||
> +	    (rsrc_id == IMX_SC_R_A72))
> +		return 0;
> +
>  	if (clk->rate) {
>  		ret = clk_scu_set_rate(&clk->hw, clk->rate, 0);
>  		dev_dbg(dev, "restore rate %d %s\n", clk->rate,
> -- 
> 2.25.1
> 
