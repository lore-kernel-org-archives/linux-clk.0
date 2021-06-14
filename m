Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A710C48BE6
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 13:29:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 101C861356
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 13:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbhFNNbp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 09:31:45 -0400
Received: from mail-eopbgr60082.outbound.protection.outlook.com ([40.107.6.82]:37273
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233890AbhFNNbl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 09:31:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM5QrQsrN3QRxSURAP2Q9UpPv1gt9sQPWtjKZjL/KR0XRGchbD2KoQ6FkDqWmoCQ3ZRyZ4cq63IgB4hqSJ9bIQG9USYJ2XAOxjoygcZv7vbm7ThMVAZrHyjt6wacih88wGAokyg2NfSDeFZ2uj+9szBAJHq/uK4bb7jRHKJmBA38Bzoq+gY8gCCUBVCpyrInNw403ksMaVzWHr8HL0ybTlIgHdMU0yg6K7gMgr49t0/P/GnlsO6YbgE5RsKa/AMxE+EcwikdFv9ijPxwepAVZnAbFO9d6xnG3kwdGfFxZ0nkE7L9WZwAMk3K7n3gak5vSSFoXcV7p7ZIUdgp6PAq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNdCK6QsnEG/eqnOdnYXH/pmIbLJ3mDzUOXz+cZWCQ8=;
 b=jUrWnZuF/9jot1Pv8t8+HzGvtRwOhC/bgwFnIcO1lRYzPkkoi4DyTh1MAvhhC/2PR7KmpOAsZSKRJH4yDv9uo+pzzHdE0vI1MZ+3qC7p82pgvAbdFQWyNkHtdkpd/WQa8VKH2qC8jdhBmEIfJtcgs7pQTOqkNhl6iwhvBiHtCtRHR+9eXfsmBdcGotxcTwN+XeA+6FcsNG0USJUiBJeET3MxT4z+TLSJSZ00Dph/Jpiw7dTX8yHnWVj9DwhuJOfdcHtbj80RIKrY0qG20q+3kplm46b/Bp3dIf7RqhFew0cNMo67kCxsIz7yGyvloB7yGyS63VJRab0JZ7kQFM4K5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNdCK6QsnEG/eqnOdnYXH/pmIbLJ3mDzUOXz+cZWCQ8=;
 b=VaT62KvjtGeZqtc8Hd+Fsl/Hy41Q9VjjwD3PSP7UHNEIspWdyfs8iaMB7jAKEMwZ6FVXKzDTngbcycODosdo2w4Kz2JTEA9w75RfMt5CzxVdXWIBdzl3kWOHFiVt1F9IXpxIY61gX1x+foWIus9fb/sFkZTC7g8i+uENU8VYyHI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0402MB3439.eurprd04.prod.outlook.com (2603:10a6:803:4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Mon, 14 Jun
 2021 13:29:36 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 13:29:36 +0000
Date:   Mon, 14 Jun 2021 16:29:34 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH] clk: imx8mq: remove SYS PLL 1/2 clock gates
Message-ID: <YMdZvv04Fl3S9bCh@ryzen.lan>
References: <20210528180135.1640876-1-l.stach@pengutronix.de>
 <162262001425.4130789.11065881280638357225@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162262001425.4130789.11065881280638357225@swboyd.mtv.corp.google.com>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR0602CA0007.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::17) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR0602CA0007.eurprd06.prod.outlook.com (2603:10a6:800:bc::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 13:29:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 721a5ef1-3ffd-428f-3ea4-08d92f3873e0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB343948B6E427F08F8D73C922F6319@VI1PR0402MB3439.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nIjA2XLhaZx4miI6DMHzijB34/GYe53tSvKeyWvgllTii12SQQAD/IVzYSz64JtQ5YzACdZfo373O8LsLP7Hk6PLvSEPw7ncwduqEuDw0BNvFOmDUeDfUSXttspApoRryY1ouoOMvXXhWbdvW3nJjUZY9+7P+ESXDBuR3Bn1YXr6SyYF/WkkErWNaaieTXKRyzk191sEtXAq3aAISejMrv/7NHxqikF7JEa9VI/J5DPSgdHVwA/VzEckSnXzUffiWFNGiDGe6F1Coa9c2Hw2ViaezhtfamCMJ6CBEGHbkuR5tz5iSbKsholTstJkFOM2VfzUCwBOjgh7WWHac5ozcuCgNTxa7oRLqEw/awssx7iVWVKOYh9BgvJJaI6Wdm+ihBtcPUuAPOaUsqFRdUvQ/d2vb+ZeXYF9M/h7UEAcYcMrbwA6F/TXV0S0eHbdw2auumosboh1lPcwhXyVoc1y5cMCXM8Iz3JHlj89QsZ2Q5UpYGEkl3/bcAgbOrk9tmguBcxFS36NvbqNlcKYcOv3WLoeZhORbhUc0PjusL/X6jxojWbZ0lotFXuU9B9LW6NIruZxW40NIbYFzVwfWY20hjkPxI7hvujGCJ8/myj/OpwfCLBggBHITqBVOfbQRSyIVQxd1IVbRDrnzujondW6oa8eeIVMfhZFA5SkHU7m6GfnTcj6aQx4WVJuIC19Lcpd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(39840400004)(396003)(8886007)(316002)(54906003)(86362001)(53546011)(52116002)(5660300002)(6506007)(7696005)(38100700002)(66476007)(186003)(66556008)(66946007)(38350700002)(26005)(16526019)(55016002)(36756003)(4326008)(478600001)(6916009)(9686003)(83380400001)(2906002)(8676002)(8936002)(44832011)(956004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xa+UGBpqxRvDnttgBuyyUlZLe8HyoSnmRhXQxHmZL9FCzLHpogBZ/xfM1YWq?=
 =?us-ascii?Q?5YhgcYtJrRirN+rw2w6crt5ub0XxqTgisMnqJRD4wZRa1RBitTyahrpjBCb4?=
 =?us-ascii?Q?Yq8yuDJm0Kc5qIPgmCA/XCxZFY+mqeO6/6lbR/oLmGDJK0dS4EAu3RuqpXdD?=
 =?us-ascii?Q?bchzts5YKEG0gaOo72wsW0dZU5h9W8cIXFc/q/kJLOPqpDaEoBGyXS4WqebU?=
 =?us-ascii?Q?kTAg4TUGgUsYUH8Rl2lZHd1IOeDYIn+YzLoinRgrwI+YtcSMSy2GRnp1l7VH?=
 =?us-ascii?Q?ym4jvFSCkl68IadADEa0evYtLOZ9X/bUfKDp+5qZqb3hAvNkG2xQbAZucrDa?=
 =?us-ascii?Q?40pmL8jnv/2Ln+AB6iIFI2rCoZvB1TKkMqPz2NPy9dECiIk9/v2m6TUg5TIL?=
 =?us-ascii?Q?eNn8ePZdYnBhNbromoffngwcUlIixuSR4U3JskccNurxC8sbVOErNfDQvf+Y?=
 =?us-ascii?Q?dhF+GNZ/JyqR2r14+Nq2SLWvow/W73nz/8vKN8THvYb78LS8IPhCxuNeLCj2?=
 =?us-ascii?Q?Mla7wzY4u9PPTvuxS7HaJn4DYAzJJcL5qQF4ooGAkADIUiMX+Kne+m6FR13Q?=
 =?us-ascii?Q?m4FHinbl+1teY9TFKICfHSkXiKLLUtPpJ9lagXcu4bogPW0rFCqKfZ9Pmgxr?=
 =?us-ascii?Q?rHhgVFVDVQxe611gWuqGnFm9kV/gOD2d1wSfn4PdyReSwMcdbaRuHcGwlY4r?=
 =?us-ascii?Q?RzFTcb9zoYYyI0vtQ5klJ8rx3A+JXAFRLt66KWYMUAyz1obo1amMjBypXCru?=
 =?us-ascii?Q?K+KkCkfUquD7Q8wm2LlT5l/iOJwXz7sZ4pwQX///DQ5FICNCDLSYeqUcKdjs?=
 =?us-ascii?Q?K4GhPna/wYof5A4l3kKLejFbgssahiD4gtXpyDWasnJl5u3WDW+V/9CiDEh7?=
 =?us-ascii?Q?248YQrPyRR7/gAUVS52xYiu55+HYm3ISiyWxPomvW+3sMvHN4DGcUe8EiA8P?=
 =?us-ascii?Q?SFl3xmBvVU2g82fR1+yZCWNuYpFyo2nblGV/dveCF0XoIOq76qjamkoxoup7?=
 =?us-ascii?Q?x6b+nPFDrJfKZzkAKIZLl3VfC12qeGYoPWs8vdFVS2r20D4ViMzivD0MmsRW?=
 =?us-ascii?Q?/LNnAkCcDivy3nWjhYBLdvo22ESFRIr32dzdKaKs6kA0rS3EzupK0mHk9FqL?=
 =?us-ascii?Q?GQSadCrmnCPim2k4dYB5gt2ijmCfjhSV2+GzWqMNVDR+koPgkpTwonvP8sy+?=
 =?us-ascii?Q?rPvrJugCL1F/WDi56mB7lD1OednOrn3+yZHF5SQGuR6+nt9JRy3+VlnwVxeY?=
 =?us-ascii?Q?aRKuwgTzSEEnToxjlB5vGatKwmUHVB508vy5rlqBYpW17nTBx4wmSfSfuENJ?=
 =?us-ascii?Q?Owu17dPXyQqOIjfESHytwX0p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721a5ef1-3ffd-428f-3ea4-08d92f3873e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 13:29:36.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRuC57VpLcvJdvaM4tTF0OK0qZyJvSPJsh0csoLxbvFyv6izY89zT0X7lV/qQaYJqdQukD1HXP1QN8QalCVWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3439
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-02 00:46:54, Stephen Boyd wrote:
> Quoting Lucas Stach (2021-05-28 11:01:35)
> > Remove the PLL clock gates as the allowing to gate the sys1_pll_266m breaks
> > the uSDHC module which is sporadically unable to enumerate devices after
> > this change. Also it makes AMP clock management harder with no obvious
> > benefit to Linux, so just revert the change.
> > 
> > Fixes: b04383b6a558 ("clk: imx8mq: Define gates for pll1/2 fixed dividers")
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> > Previously this was a more targeted change only reverting the problematic
> > bit for uSDHC, but Jacky Bai expressed the desire to just revert the whole
> > change, as it makes things harder for AMP use-cases.
> > ---
> 
> Do we need to take this via clk-fixes for this release? Or can it be
> punted to the next one? The commit it is fixing is not new this merge
> window, but if there are big problems then I guess it is OK. The patch
> is fairly large but if uSDHC works better with it applied that is
> probably good enough.
> 

If Lucas has nothing against, I'll send this along with my clk-imx for
5.14 updates. Makes even more sense since it is touching the bindings.
See my comment below.

> >  drivers/clk/imx/clk-imx8mq.c             | 56 ++++++++----------------
> >  include/dt-bindings/clock/imx8mq-clock.h | 19 --------
> >  2 files changed, 18 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> > index b08019e1faf9..c491bc9c61ce 100644
> > --- a/drivers/clk/imx/clk-imx8mq.c
> > +++ b/drivers/clk/imx/clk-imx8mq.c
> > @@ -358,46 +358,26 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
> >         hws[IMX8MQ_VIDEO2_PLL_OUT] = imx_clk_hw_sscg_pll("video2_pll_out", video2_pll_out_sels, ARRAY_SIZE(video2_pll_out_sels), 0, 0, 0, base + 0x54, 0);
> >  
> >         /* SYS PLL1 fixed output */
> > -       hws[IMX8MQ_SYS1_PLL_40M_CG] = imx_clk_hw_gate("sys1_pll_40m_cg", "sys1_pll_out", base + 0x30, 9);
> > -       hws[IMX8MQ_SYS1_PLL_80M_CG] = imx_clk_hw_gate("sys1_pll_80m_cg", "sys1_pll_out", base + 0x30, 11);
> > -       hws[IMX8MQ_SYS1_PLL_100M_CG] = imx_clk_hw_gate("sys1_pll_100m_cg", "sys1_pll_out", base + 0x30, 13);
> > -       hws[IMX8MQ_SYS1_PLL_133M_CG] = imx_clk_hw_gate("sys1_pll_133m_cg", "sys1_pll_out", base + 0x30, 15);
> > -       hws[IMX8MQ_SYS1_PLL_160M_CG] = imx_clk_hw_gate("sys1_pll_160m_cg", "sys1_pll_out", base + 0x30, 17);
> > -       hws[IMX8MQ_SYS1_PLL_200M_CG] = imx_clk_hw_gate("sys1_pll_200m_cg", "sys1_pll_out", base + 0x30, 19);
> > -       hws[IMX8MQ_SYS1_PLL_266M_CG] = imx_clk_hw_gate("sys1_pll_266m_cg", "sys1_pll_out", base + 0x30, 21);
> > -       hws[IMX8MQ_SYS1_PLL_400M_CG] = imx_clk_hw_gate("sys1_pll_400m_cg", "sys1_pll_out", base + 0x30, 23);
> > -       hws[IMX8MQ_SYS1_PLL_800M_CG] = imx_clk_hw_gate("sys1_pll_800m_cg", "sys1_pll_out", base + 0x30, 25);
> > -
> > -       hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_40m_cg", 1, 20);
> > -       hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_80m_cg", 1, 10);
> > -       hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_100m_cg", 1, 8);
> > -       hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_133m_cg", 1, 6);
> > -       hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_160m_cg", 1, 5);
> > -       hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_200m_cg", 1, 4);
> > -       hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_266m_cg", 1, 3);
> > -       hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_400m_cg", 1, 2);
> > -       hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_800m_cg", 1, 1);
> > +       hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_out", 1, 20);
> > +       hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_out", 1, 10);
> > +       hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_out", 1, 8);
> > +       hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_out", 1, 6);
> > +       hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_out", 1, 5);
> > +       hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_out", 1, 4);
> > +       hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
> > +       hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_out", 1, 2);
> > +       hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_out", 1, 1);
> >  
> >         /* SYS PLL2 fixed output */
> > -       hws[IMX8MQ_SYS2_PLL_50M_CG] = imx_clk_hw_gate("sys2_pll_50m_cg", "sys2_pll_out", base + 0x3c, 9);
> > -       hws[IMX8MQ_SYS2_PLL_100M_CG] = imx_clk_hw_gate("sys2_pll_100m_cg", "sys2_pll_out", base + 0x3c, 11);
> > -       hws[IMX8MQ_SYS2_PLL_125M_CG] = imx_clk_hw_gate("sys2_pll_125m_cg", "sys2_pll_out", base + 0x3c, 13);
> > -       hws[IMX8MQ_SYS2_PLL_166M_CG] = imx_clk_hw_gate("sys2_pll_166m_cg", "sys2_pll_out", base + 0x3c, 15);
> > -       hws[IMX8MQ_SYS2_PLL_200M_CG] = imx_clk_hw_gate("sys2_pll_200m_cg", "sys2_pll_out", base + 0x3c, 17);
> > -       hws[IMX8MQ_SYS2_PLL_250M_CG] = imx_clk_hw_gate("sys2_pll_250m_cg", "sys2_pll_out", base + 0x3c, 19);
> > -       hws[IMX8MQ_SYS2_PLL_333M_CG] = imx_clk_hw_gate("sys2_pll_333m_cg", "sys2_pll_out", base + 0x3c, 21);
> > -       hws[IMX8MQ_SYS2_PLL_500M_CG] = imx_clk_hw_gate("sys2_pll_500m_cg", "sys2_pll_out", base + 0x3c, 23);
> > -       hws[IMX8MQ_SYS2_PLL_1000M_CG] = imx_clk_hw_gate("sys2_pll_1000m_cg", "sys2_pll_out", base + 0x3c, 25);
> > -
> > -       hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_50m_cg", 1, 20);
> > -       hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_100m_cg", 1, 10);
> > -       hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_125m_cg", 1, 8);
> > -       hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_166m_cg", 1, 6);
> > -       hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_200m_cg", 1, 5);
> > -       hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_250m_cg", 1, 4);
> > -       hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_333m_cg", 1, 3);
> > -       hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_500m_cg", 1, 2);
> > -       hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_1000m_cg", 1, 1);
> > +       hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_out", 1, 20);
> > +       hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_out", 1, 10);
> > +       hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_out", 1, 8);
> > +       hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_out", 1, 6);
> > +       hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_out", 1, 5);
> > +       hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_out", 1, 4);
> > +       hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_out", 1, 3);
> > +       hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_out", 1, 2);
> > +       hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
> >  
> >         hws[IMX8MQ_CLK_MON_AUDIO_PLL1_DIV] = imx_clk_hw_divider("audio_pll1_out_monitor", "audio_pll1_bypass", base + 0x78, 0, 3);
> >         hws[IMX8MQ_CLK_MON_AUDIO_PLL2_DIV] = imx_clk_hw_divider("audio_pll2_out_monitor", "audio_pll2_bypass", base + 0x78, 4, 3);
> > diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
> > index 82e907ce7bdd..afa74d7ba100 100644
> > --- a/include/dt-bindings/clock/imx8mq-clock.h
> > +++ b/include/dt-bindings/clock/imx8mq-clock.h
> > @@ -405,25 +405,6 @@
> >  
> >  #define IMX8MQ_VIDEO2_PLL1_REF_SEL             266
> >  
> > -#define IMX8MQ_SYS1_PLL_40M_CG                 267
> > -#define IMX8MQ_SYS1_PLL_80M_CG                 268
> > -#define IMX8MQ_SYS1_PLL_100M_CG                        269
> > -#define IMX8MQ_SYS1_PLL_133M_CG                        270
> > -#define IMX8MQ_SYS1_PLL_160M_CG                        271
> > -#define IMX8MQ_SYS1_PLL_200M_CG                        272
> > -#define IMX8MQ_SYS1_PLL_266M_CG                        273
> > -#define IMX8MQ_SYS1_PLL_400M_CG                        274
> > -#define IMX8MQ_SYS1_PLL_800M_CG                        275
> > -#define IMX8MQ_SYS2_PLL_50M_CG                 276
> > -#define IMX8MQ_SYS2_PLL_100M_CG                        277
> > -#define IMX8MQ_SYS2_PLL_125M_CG                        278
> > -#define IMX8MQ_SYS2_PLL_166M_CG                        279
> > -#define IMX8MQ_SYS2_PLL_200M_CG                        280
> > -#define IMX8MQ_SYS2_PLL_250M_CG                        281
> > -#define IMX8MQ_SYS2_PLL_333M_CG                        282
> > -#define IMX8MQ_SYS2_PLL_500M_CG                        283
> > -#define IMX8MQ_SYS2_PLL_1000M_CG               284
> > -
> 
> Just to doubly confirm, none of these are being used in dts files? It
> would be simpler to leave these defines here and drop the clks from the
> driver to reduce risk.
> 

Double checked. These are not used in any dts files.

> >  #define IMX8MQ_CLK_GPU_CORE                    285
> >  #define IMX8MQ_CLK_GPU_SHADER                  286
> >  #define IMX8MQ_CLK_M4_CORE                     287
