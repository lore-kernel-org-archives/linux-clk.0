Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F06C4743C
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 14:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D9AB61360
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 14:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234423AbhFNOGn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 10:06:43 -0400
Received: from mail-eopbgr50078.outbound.protection.outlook.com ([40.107.5.78]:40065
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234246AbhFNOGm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 10:06:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+AVdJyd9vfjkIkLdRzpObNR/uvDG4PqQZa9gUCXszhY9cf7wN5xnUbtAjRVQWaZcTBbYUxMyd/yKf3k5Eom6gDxJBI5Cpzhb2jZp2MwGDOJ8LxQAqSai/91po37oLQX/FPofywuQms2PeBhLrvUe1fupSPpkhDZqyOHmMq1xJcT4YXfp/Hce5lBPw+WtIJmSkIpYMVd8MeD9g7YMgBtAUEZ2/EbZL6zcbuGC22fWHEC72sdTFWYlQ81P8l3lc4FtUGGIwKDmyYO0IN6DSL3PC/zcJtgHDSdRcm+MYV4zd58t6VKOGNyAQVLqenrYAp6Cm1ObpMlb27jN1E4ey9IUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdEhoDymazAibbDlvYnAbB5j/eDgLvglpOP1ZZrk7fw=;
 b=eX01gYhFI3EIEi42kO5DEfj3LT9iEhas3u0jzI7A0A4Ve8TfaV7VIlSFfQ/vnDkUgv/MZ3UQbMYpU0F2sbLIefTu8R7vXetJMfdhv0rRGkO5BD3A9CDmpTzHjbmpe7eq0UaEKcGNZA6C0t3aLnJ0xk17HkrTxI7br1OjIeq820iCGB50fj5OWDwqQrwtdKpQ2rALwaDZ3AYNPtLAbjpe7z0XPB2fHCfjfPnjrTUpu/NVl03kGhDx8hwrJ0Z4DQDTuGd37CX7xZaxQ3L14hx4wdzffEw09wXIy64m1kRRmAk18uTrMBXp44jjKC0uk+1D83V1LUf55sG7vyTt+3Nf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdEhoDymazAibbDlvYnAbB5j/eDgLvglpOP1ZZrk7fw=;
 b=s/xDBg1Wdq761D5YeBt8JOJfDh77drdlflwE1sn4S0V5rqOEFTRDY1fICEjj9VHQThMPDEEpjjXatt8I/D7pn3fVbL1/KDj0ON5353BhW+WRSEKPec9wUOSixZU2tRBUXQ07BYk+/o9hUFKP3yNnuwbDyC5dQdflrjp3LXqKgMU=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB6238.eurprd04.prod.outlook.com (2603:10a6:803:f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 14:04:35 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 14:04:35 +0000
Date:   Mon, 14 Jun 2021 17:04:33 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH] clk: imx8mq: remove SYS PLL 1/2 clock gates
Message-ID: <YMdh8bQcnMe3k9iv@ryzen.lan>
References: <20210528180135.1640876-1-l.stach@pengutronix.de>
 <162262001425.4130789.11065881280638357225@swboyd.mtv.corp.google.com>
 <YMdZvv04Fl3S9bCh@ryzen.lan>
 <24cd89bb32cae386003a188623cdd7730580b643.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24cd89bb32cae386003a188623cdd7730580b643.camel@pengutronix.de>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR10CA0093.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::22) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR10CA0093.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:28::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 14:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac7cb757-f110-4184-e97b-08d92f3d575c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6238:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB623879D92094DB604538A4B6F6319@VI1PR04MB6238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9AYT/SUHf7coNASL/eaQTcyQZxtTRqyfc6VWNfXU9oWCWBkLxysLS2fYisQAGXqJoUIbe6PlXwIRLJidqJa2Q9/YZTnW+Zh7j4yqqgZGnbjOw3b90XHEqXQXWomLhIXkJwDJSKo7XCDsLYWhWZHJKiXJD1eEA58Cwi5IIZJKiAbe9w9fVLpb02ZexYnkMXSi3dkYOUoVr93PFx0hwDdP5dkEsHyDBrYpkLoVzB6H2D5NdjLKjmPCxR1N9qLlBHbHg+INlr+lWJzHQLSadJIJXrzTrQdbtkJUY3t3tRQ8QlKN/P/aF5Yzxfp4ua8ZSmT8HfFA25wB3NpNEB8zpOTHrFSNVKNbyiQfvYGeEC5+6TxGDJo9/g3/Vmkq63dy6PH+KTOMq0Xx+Ty8qx8zJO8iuPecen0Ia09Wfa2Db4PbzLZ4j0aauzinLL8irm2YrE5owO+7EmNcaf6acq4WJQpvqdf52ZjT7VYEgoicuhA2KUsNpcdib/ms5roNn9MJ5WWSoKRkNnXQgxU3+trhGcd9UhC4MndauBUzRd9O3HFS4/YO9bCTDbsWbkmxzn1ssq19QvvvhKgWqJzVveFzYC74dA8nRMrMl4XRsuAL+gY/sfEuuqUxLE+XNfci54ORzePPxkIGO67pq3TRy1473osquiSbspgIrZU1nk0TYL7JgVL8Ps3HgluoXAZeGC8n+eA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(5660300002)(86362001)(9686003)(8676002)(44832011)(8886007)(2906002)(8936002)(66476007)(66556008)(4326008)(66946007)(54906003)(55016002)(83380400001)(38350700002)(38100700002)(186003)(956004)(53546011)(6506007)(7696005)(16526019)(26005)(52116002)(6916009)(478600001)(316002)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C7y8oHa1Jxty7qpXzXTSQg1Mpx+dH3ZaAzP7ZpF9Y3LrkOo4fLFtVplt/0jR?=
 =?us-ascii?Q?spWM49mV0hVQ2ppyqKD0uNwEhio4eu1js+kpxz3Z9vwihAj3mvMwU9nQ//vp?=
 =?us-ascii?Q?Bcl2NyWquCnsAXV+imON4khP/HGkMXwjwmXEWuN6AuFLj/HEAJgdCpmVpK3q?=
 =?us-ascii?Q?/RP6+3jdUuDww7mI9bErS6jKOAasOZjr4VDUQCtnIp1uYHGWg9s0PRT5C0vN?=
 =?us-ascii?Q?x9R5vr27N70SmYIS/0I3pm+64SYOcYPkDEZp1KC21z2++oUsD3PdhVk/acZ9?=
 =?us-ascii?Q?gnjlyhg0arIMCX8P/9YEhrhl7INPCUL/cRhB+sZhrO03JWd+fOm9JEUpvYCr?=
 =?us-ascii?Q?a1LIKegacWldA+FQxI7fFit7+n4ILskYnKKDl+AxImxoVp0l1lZOIJVDWYHn?=
 =?us-ascii?Q?loSiXULHYZQb1wN8rUJXry9EBKcPC6w33XNVX/Cv+4ua+Fl/RPWg9sFXbfmb?=
 =?us-ascii?Q?vIe0/T/AxHfwWiXssj6lpAYgja6EhkDVq2Qz3YtXsIaQp8jFB4pFC8VkYM+L?=
 =?us-ascii?Q?CGLva8cFSCd83k9Yv7HaDol9/jnxv/ZYUOYgg15YYqaBeMNC3AEHKPdROOfQ?=
 =?us-ascii?Q?1u5/pfAPOYgqs7w4A8CD/ROTXXMk0ruYvxKb43aUxOmnY9OR6vUd76U6Kt5P?=
 =?us-ascii?Q?OtHWHN4jBGDRrf0JL91sekBHpvRJ3iU3raIWdzW/EJfhr7ghQmIPSA51KqvR?=
 =?us-ascii?Q?N7wrYwDf/oq00t/AW+aroHNnNLH+RrDZDTL7SC/g9kCwixWS2ki78u4N8Gvg?=
 =?us-ascii?Q?LFisR6aN1m3vRj0t6lAB5eav74edbhV9cipBrng4nvL+rnuol8XTBtbz7944?=
 =?us-ascii?Q?TV3KvW9wTWLVjVu2rYIEzXVhYoFYYtgd+WEZc0oaVKJWeVTLy/HpBJZcj3pE?=
 =?us-ascii?Q?hxlzWzm0eAB6SrwqHo/oOeHCwNUeD3zvNddjgLRC0NiJUJ2ccMz/KN9a2ld5?=
 =?us-ascii?Q?p12Vx6++gP22R0+/+3F0AIR3XIe9fpY1nrWACqMHcpdDfU/nr3c+T08j6ZU3?=
 =?us-ascii?Q?ygL26wcphoReTMw7ag9MIkfUWN+B3QaCG+wKbjlC6xqDkAKXTDH0CzF2zC6Z?=
 =?us-ascii?Q?uYnKSAR7gVk/ue4mTUo5o/Or7NqKgDsOgU+GFX5qf+9NWJFlv8Z9w0bMgK3z?=
 =?us-ascii?Q?aDcx36MVjaurW85yfnX57WeMHrU9S7gmth2HPojhVoDBykpM0CMX6xaTEtOd?=
 =?us-ascii?Q?qRv9KghQvERCrACwmn6wsrP6K1EE5v1bPB/VEs4pJpfxtOMp9mnQN9cDu4pc?=
 =?us-ascii?Q?znzSYc/DEN1R8n859v/ryJy+1vQt8YrJrAGs0sUjb/Al7R3T9jwXzRTdg39k?=
 =?us-ascii?Q?MSKaclON1uLefRu6zbyi+izl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7cb757-f110-4184-e97b-08d92f3d575c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:04:35.6592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIbpynMtcn49rL2iVGCbMYcQYkQQg0CR+lxk0mb7yI/UbHlLgqkyX5txbQJ+mv24+P84QbsLib178pR8y0//rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6238
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-14 15:43:58, Lucas Stach wrote:
> Am Montag, dem 14.06.2021 um 16:29 +0300 schrieb Abel Vesa:
> > On 21-06-02 00:46:54, Stephen Boyd wrote:
> > > Quoting Lucas Stach (2021-05-28 11:01:35)
> > > > Remove the PLL clock gates as the allowing to gate the sys1_pll_266m breaks
> > > > the uSDHC module which is sporadically unable to enumerate devices after
> > > > this change. Also it makes AMP clock management harder with no obvious
> > > > benefit to Linux, so just revert the change.
> > > > 
> > > > Fixes: b04383b6a558 ("clk: imx8mq: Define gates for pll1/2 fixed dividers")
> > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > ---
> > > > Previously this was a more targeted change only reverting the problematic
> > > > bit for uSDHC, but Jacky Bai expressed the desire to just revert the whole
> > > > change, as it makes things harder for AMP use-cases.
> > > > ---
> > > 
> > > Do we need to take this via clk-fixes for this release? Or can it be
> > > punted to the next one? The commit it is fixing is not new this merge
> > > window, but if there are big problems then I guess it is OK. The patch
> > > is fairly large but if uSDHC works better with it applied that is
> > > probably good enough.
> > > 
> > 
> > If Lucas has nothing against, I'll send this along with my clk-imx for
> > 5.14 updates. Makes even more sense since it is touching the bindings.
> > See my comment below.
> 
> Yea, the regression has been there long enough that it probably doesn't
> matter if this waits for one or two more weeks.
> 

OK then, applied to clk-imx. 

Thanks.

> Regards,
> Lucas
> 
> > 
> > > >  drivers/clk/imx/clk-imx8mq.c             | 56 ++++++++----------------
> > > >  include/dt-bindings/clock/imx8mq-clock.h | 19 --------
> > > >  2 files changed, 18 insertions(+), 57 deletions(-)
> > > > 
> > > > diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> > > > index b08019e1faf9..c491bc9c61ce 100644
> > > > --- a/drivers/clk/imx/clk-imx8mq.c
> > > > +++ b/drivers/clk/imx/clk-imx8mq.c
> > > > @@ -358,46 +358,26 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
> > > >         hws[IMX8MQ_VIDEO2_PLL_OUT] = imx_clk_hw_sscg_pll("video2_pll_out", video2_pll_out_sels, ARRAY_SIZE(video2_pll_out_sels), 0, 0, 0, base + 0x54, 0);
> > > >  
> > > >         /* SYS PLL1 fixed output */
> > > > -       hws[IMX8MQ_SYS1_PLL_40M_CG] = imx_clk_hw_gate("sys1_pll_40m_cg", "sys1_pll_out", base + 0x30, 9);
> > > > -       hws[IMX8MQ_SYS1_PLL_80M_CG] = imx_clk_hw_gate("sys1_pll_80m_cg", "sys1_pll_out", base + 0x30, 11);
> > > > -       hws[IMX8MQ_SYS1_PLL_100M_CG] = imx_clk_hw_gate("sys1_pll_100m_cg", "sys1_pll_out", base + 0x30, 13);
> > > > -       hws[IMX8MQ_SYS1_PLL_133M_CG] = imx_clk_hw_gate("sys1_pll_133m_cg", "sys1_pll_out", base + 0x30, 15);
> > > > -       hws[IMX8MQ_SYS1_PLL_160M_CG] = imx_clk_hw_gate("sys1_pll_160m_cg", "sys1_pll_out", base + 0x30, 17);
> > > > -       hws[IMX8MQ_SYS1_PLL_200M_CG] = imx_clk_hw_gate("sys1_pll_200m_cg", "sys1_pll_out", base + 0x30, 19);
> > > > -       hws[IMX8MQ_SYS1_PLL_266M_CG] = imx_clk_hw_gate("sys1_pll_266m_cg", "sys1_pll_out", base + 0x30, 21);
> > > > -       hws[IMX8MQ_SYS1_PLL_400M_CG] = imx_clk_hw_gate("sys1_pll_400m_cg", "sys1_pll_out", base + 0x30, 23);
> > > > -       hws[IMX8MQ_SYS1_PLL_800M_CG] = imx_clk_hw_gate("sys1_pll_800m_cg", "sys1_pll_out", base + 0x30, 25);
> > > > -
> > > > -       hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_40m_cg", 1, 20);
> > > > -       hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_80m_cg", 1, 10);
> > > > -       hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_100m_cg", 1, 8);
> > > > -       hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_133m_cg", 1, 6);
> > > > -       hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_160m_cg", 1, 5);
> > > > -       hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_200m_cg", 1, 4);
> > > > -       hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_266m_cg", 1, 3);
> > > > -       hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_400m_cg", 1, 2);
> > > > -       hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_800m_cg", 1, 1);
> > > > +       hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_out", 1, 20);
> > > > +       hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_out", 1, 10);
> > > > +       hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_out", 1, 8);
> > > > +       hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_out", 1, 6);
> > > > +       hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_out", 1, 5);
> > > > +       hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_out", 1, 4);
> > > > +       hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
> > > > +       hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_out", 1, 2);
> > > > +       hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_out", 1, 1);
> > > >  
> > > >         /* SYS PLL2 fixed output */
> > > > -       hws[IMX8MQ_SYS2_PLL_50M_CG] = imx_clk_hw_gate("sys2_pll_50m_cg", "sys2_pll_out", base + 0x3c, 9);
> > > > -       hws[IMX8MQ_SYS2_PLL_100M_CG] = imx_clk_hw_gate("sys2_pll_100m_cg", "sys2_pll_out", base + 0x3c, 11);
> > > > -       hws[IMX8MQ_SYS2_PLL_125M_CG] = imx_clk_hw_gate("sys2_pll_125m_cg", "sys2_pll_out", base + 0x3c, 13);
> > > > -       hws[IMX8MQ_SYS2_PLL_166M_CG] = imx_clk_hw_gate("sys2_pll_166m_cg", "sys2_pll_out", base + 0x3c, 15);
> > > > -       hws[IMX8MQ_SYS2_PLL_200M_CG] = imx_clk_hw_gate("sys2_pll_200m_cg", "sys2_pll_out", base + 0x3c, 17);
> > > > -       hws[IMX8MQ_SYS2_PLL_250M_CG] = imx_clk_hw_gate("sys2_pll_250m_cg", "sys2_pll_out", base + 0x3c, 19);
> > > > -       hws[IMX8MQ_SYS2_PLL_333M_CG] = imx_clk_hw_gate("sys2_pll_333m_cg", "sys2_pll_out", base + 0x3c, 21);
> > > > -       hws[IMX8MQ_SYS2_PLL_500M_CG] = imx_clk_hw_gate("sys2_pll_500m_cg", "sys2_pll_out", base + 0x3c, 23);
> > > > -       hws[IMX8MQ_SYS2_PLL_1000M_CG] = imx_clk_hw_gate("sys2_pll_1000m_cg", "sys2_pll_out", base + 0x3c, 25);
> > > > -
> > > > -       hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_50m_cg", 1, 20);
> > > > -       hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_100m_cg", 1, 10);
> > > > -       hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_125m_cg", 1, 8);
> > > > -       hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_166m_cg", 1, 6);
> > > > -       hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_200m_cg", 1, 5);
> > > > -       hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_250m_cg", 1, 4);
> > > > -       hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_333m_cg", 1, 3);
> > > > -       hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_500m_cg", 1, 2);
> > > > -       hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_1000m_cg", 1, 1);
> > > > +       hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_out", 1, 20);
> > > > +       hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_out", 1, 10);
> > > > +       hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_out", 1, 8);
> > > > +       hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_out", 1, 6);
> > > > +       hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_out", 1, 5);
> > > > +       hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_out", 1, 4);
> > > > +       hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_out", 1, 3);
> > > > +       hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_out", 1, 2);
> > > > +       hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
> > > >  
> > > >         hws[IMX8MQ_CLK_MON_AUDIO_PLL1_DIV] = imx_clk_hw_divider("audio_pll1_out_monitor", "audio_pll1_bypass", base + 0x78, 0, 3);
> > > >         hws[IMX8MQ_CLK_MON_AUDIO_PLL2_DIV] = imx_clk_hw_divider("audio_pll2_out_monitor", "audio_pll2_bypass", base + 0x78, 4, 3);
> > > > diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
> > > > index 82e907ce7bdd..afa74d7ba100 100644
> > > > --- a/include/dt-bindings/clock/imx8mq-clock.h
> > > > +++ b/include/dt-bindings/clock/imx8mq-clock.h
> > > > @@ -405,25 +405,6 @@
> > > >  
> > > >  #define IMX8MQ_VIDEO2_PLL1_REF_SEL             266
> > > >  
> > > > -#define IMX8MQ_SYS1_PLL_40M_CG                 267
> > > > -#define IMX8MQ_SYS1_PLL_80M_CG                 268
> > > > -#define IMX8MQ_SYS1_PLL_100M_CG                        269
> > > > -#define IMX8MQ_SYS1_PLL_133M_CG                        270
> > > > -#define IMX8MQ_SYS1_PLL_160M_CG                        271
> > > > -#define IMX8MQ_SYS1_PLL_200M_CG                        272
> > > > -#define IMX8MQ_SYS1_PLL_266M_CG                        273
> > > > -#define IMX8MQ_SYS1_PLL_400M_CG                        274
> > > > -#define IMX8MQ_SYS1_PLL_800M_CG                        275
> > > > -#define IMX8MQ_SYS2_PLL_50M_CG                 276
> > > > -#define IMX8MQ_SYS2_PLL_100M_CG                        277
> > > > -#define IMX8MQ_SYS2_PLL_125M_CG                        278
> > > > -#define IMX8MQ_SYS2_PLL_166M_CG                        279
> > > > -#define IMX8MQ_SYS2_PLL_200M_CG                        280
> > > > -#define IMX8MQ_SYS2_PLL_250M_CG                        281
> > > > -#define IMX8MQ_SYS2_PLL_333M_CG                        282
> > > > -#define IMX8MQ_SYS2_PLL_500M_CG                        283
> > > > -#define IMX8MQ_SYS2_PLL_1000M_CG               284
> > > > -
> > > 
> > > Just to doubly confirm, none of these are being used in dts files? It
> > > would be simpler to leave these defines here and drop the clks from the
> > > driver to reduce risk.
> > > 
> > 
> > Double checked. These are not used in any dts files.
> > 
> > > >  #define IMX8MQ_CLK_GPU_CORE                    285
> > > >  #define IMX8MQ_CLK_GPU_SHADER                  286
> > > >  #define IMX8MQ_CLK_M4_CORE                     287
> 
> 
