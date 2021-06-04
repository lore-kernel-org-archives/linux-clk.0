Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE1C07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 08:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B0C661421
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 08:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFDIWN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 04:22:13 -0400
Received: from mail-eopbgr20062.outbound.protection.outlook.com ([40.107.2.62]:26390
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229978AbhFDIWK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 04:22:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fooiaxjtuB0+f7O8N/G37P5WHNpvpIzEM25+cYAlMWUkcfC9FW4w8agXkc/UaEbIZ3vWa/oAIU2Kwzg/GCVq6DaFvYRRnumC9LTUi+F1fElJCbLi9oWXUW3nWXSjJE8fMJaS51BVcv38XNq/xh0OPDDOpHlBwiyTicwJ0+6/u6BH2PBB6OMK/X9iHWNI2dssMeOFBdDfmL3ztzzTrvNYFFYuCzakYbAzeWEGGME5bbpuOYosS6k5pq81O6xT6W7WFmYjGYGHWvw4CD6O61mPTv6W5tU6gv4Evw5RbMXNS8Ou14fbWesiESRmOhRA5yg28nyAV6gw4EkIbtFj+GqD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MK2Q8RG1tUf6Rf0OrAxhOJzi+XxxPJZdccym+ET8l4=;
 b=nfz7RLau52DrcCwbXmAJxYd/8UQ+dl4BdalCQpv4+8cS0nZyFixX8SgHryDMjVi5GTXy0meHrUBv+el3ziFGzrMuQWLzUbGBoBSmy9TjYZ1j1HmheVn+KDc/lZ6nUms7KwQ2AmLFQ0ZzDZC2EkG3ch824mqCe9SfWrFK4gGs+p4dvW9/W1D+TJohAwWwrOtIl6lc378Z/eX0/RkfL7bNx9/XUAvD6Mfjsn0qMGKZ4b3qrBa94AbUiqnOSsyk90PJHwLkwBevU6ZjrPV6ACyZAHhcfm2cy+gPEemB+CDO4Wh44rilXT3Mi5oPGsViArIPPbF14+chqcCI/aXycf5ZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MK2Q8RG1tUf6Rf0OrAxhOJzi+XxxPJZdccym+ET8l4=;
 b=rOJfdfXQJcBBhYT5oFo5ePJh5JdNhNe+wgsTCtNCY1/wzACub1UUr2Q4FRrNi1FrT3Vv4l9yZoiiNSYU1TLebXT3H5WPxERcl9oZkmgHLRWTFTnMsHi3TCQmvnr9innA+BFA04whvtKIAdFMkOqPddFoG43f0dP0oFqja8CcIkE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB5088.eurprd04.prod.outlook.com (2603:10a6:803:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 08:20:22 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 08:20:22 +0000
Date:   Fri, 4 Jun 2021 11:20:20 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <dongas86@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 6/6] clk: imx8qm: add clock valid resource checking
Message-ID: <YLniRO+huV0+rytH@ryzen.lan>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-6-aisheng.dong@nxp.com>
 <162259860630.4130789.2941110953953498194@swboyd.mtv.corp.google.com>
 <YLnMUtxEAxAq3vBO@ryzen.lan>
 <CAA+hA=QO2CSAqFMcyEakADNPqVej09i9jkO7HLnQ=-pR_ESbeg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+hA=QO2CSAqFMcyEakADNPqVej09i9jkO7HLnQ=-pR_ESbeg@mail.gmail.com>
X-Originating-IP: [188.27.175.31]
X-ClientProxiedBy: VI1PR0501CA0005.eurprd05.prod.outlook.com
 (2603:10a6:800:92::15) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.175.31) by VI1PR0501CA0005.eurprd05.prod.outlook.com (2603:10a6:800:92::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Fri, 4 Jun 2021 08:20:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4ba2eb-a98e-4799-95d1-08d927319907
X-MS-TrafficTypeDiagnostic: VI1PR04MB5088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5088BA52D40FB9A6E5E20FA0F63B9@VI1PR04MB5088.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wZSglPLXUW5Y8TPbXbWtK7YIE24ha7TrHYCKTvXSpVGZ2JM2azo7F/DFz0cIvuuN+pG+OZJplBUotmRPeN0CIicUt0mukwTcRPTdydzjNyrniwLbxkJCNIUuqxHdQdW0JBh9dI6t39jD6+vT7K3rsQr0BRjvShMA9BTwvGct/On5jIJVUqe/yevD5PbO3RFQoYsSYyL+C7sEXZf57Tl7IIHcgp4GHDocDcs1/j/8E3pcRGMRAjc9Y8OlQWrC3ZRYDK+clXEf7uCLJIOMB3pgdJ3jmFGOWRBZ8LwXgPGcgoXYUf5tZ1yHftgQe/0vTStAQ+C0+S1dpC9Zak03xoIMBc9empr6dWqNoQsCzDWTevDNU5jy3YitKe1PViZbsznrHazjSW61LK6ye51Rw1gqMCmagL9RllzPPsrUxbwvdr5nVhGrN1smJLy+acNW1cfX1CnKpILYo7pHvw3iZCf6XQ5ghMdlfusoYZzodyPgYysdSS9rn/zxBIoKOae+hYe6KzRzuUMB3KQC60dlF2JpMws36ZoHfhzVS/B7ls3SqrsymRzwSSYkygP06ocnZi9IqWvhn9NYfk2FKAZIhvQo921SSSaRF52HFx4Ysj2Q3cXdwUK/dY2ejq/sFKog2UG52VhR2RQtIyPabRk43WBNrUFwhx1tPnaGzGwUMHrdlJwMddY2j7qeFSbAYy4+Wpwp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(956004)(7696005)(52116002)(5660300002)(9686003)(316002)(54906003)(55016002)(8676002)(36756003)(8886007)(2906002)(66476007)(66556008)(478600001)(8936002)(4326008)(66946007)(186003)(16526019)(38350700002)(38100700002)(6506007)(44832011)(53546011)(86362001)(26005)(6916009)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KIItpfeJEbvjBtnpS9VToRJ1z52QxyP5BRnQGhoy+AtASzzzDXhfChnksRcn?=
 =?us-ascii?Q?1hE+cAAE63vdGljgKvTl0WXh4i8FXj31BchZqT2t/vLQn9RuzlVZDYcaIHF+?=
 =?us-ascii?Q?6IBrOpkgxnhJfNbK1zZ9XV213rAQ87cHfdD4DFbONalCWv3BJsZTLQdvehJ0?=
 =?us-ascii?Q?b4rLDa1fXTb0F8zBSxVL1peai6nDhCDSjhKG+AdVDdnrx52w2GkqfeWDmwP7?=
 =?us-ascii?Q?DEjHHzo6jrkLIZoRyuQW+3ROZRVfGRqysoRI3VXe9abZ+1jlMg1nsyMsSj3p?=
 =?us-ascii?Q?tz5Fg6WrUhJHEfWBORRbY4XPEbcK1m4zrpl3CqEMXe3vkrrxNMF3h4sctfrj?=
 =?us-ascii?Q?v4KDdtHZ6US3qrZohoMMvMrHD/TED9Rxz70vMOfleCuouEoPwpZn/S3YtJkK?=
 =?us-ascii?Q?x1pzBfschIX7+KflDjZZ8zVAwb61ebcLh7YRkICHUie4wwIcg2c7dcRMJlXg?=
 =?us-ascii?Q?lrLqlm9zd8jNDGNMoHG2etvxlxXBGMNXAgwCFc8RMozPbh8ML0WhAoueHQIz?=
 =?us-ascii?Q?2YHnXpMHZXTWLfMGNxTskqnOKZpBfriyz2db06RfiY77EWPX1g1JAXvHRnlA?=
 =?us-ascii?Q?GHbynSVXukYG08hrD/FPRg4cbvqMC4SLzRVZCvk8dlHp7dB4LySD6Z/1HF/q?=
 =?us-ascii?Q?MnQ/IGx+u8JMgFITvEGMlR8F4S+S0PD/rjf/B8IQLnpM0AjycFW71p9k3V6x?=
 =?us-ascii?Q?fq5n+5g1unPCq2tlo2JmD5ZHH/BD85ZOx+rPZGFDfo8p5OM2ZNA6EpTHs3r2?=
 =?us-ascii?Q?ItJvJ7wo1i2Qm74FP1Np7dgcrsOOIHGqjGn7nXbhHBAf/qNUuQSBcQohXzJc?=
 =?us-ascii?Q?Sz+ajUKEMsH6KvY785rl99TesVtjx0oxqSmwBN4ATaJ3PJomCZbbnDGJrSoa?=
 =?us-ascii?Q?bsR8b5vx//Z0fLoDUaQT81247OHImUjC2ngtifEPuP09QI7YAPowkzaF3Exk?=
 =?us-ascii?Q?x0acl+yYjV2Wq3YID/Z6dLTaN7IvPfdr7cLilWfD+T3sVI+hev78T5iG+2Kp?=
 =?us-ascii?Q?dFou7/VKglEvva2k6H0sSKa9pvpT0hEEC0kjKNhwvijnH3z57yMDbAuF7P9m?=
 =?us-ascii?Q?CF6XKWs99yRZZg3qKTtH7Fj0PbjBwROhe+ndm3kMZ2fipQtZnK+EiEwnJjaP?=
 =?us-ascii?Q?USSeAyEVRpA1Th5OPAWJcu7bCx/hYXENy1FiX96bZY36hmZrM5DVm/IrRNbJ?=
 =?us-ascii?Q?YoUjMzo+/o0boyF+hbZS3npNgufpKyyCKyLitsUFE5B1WWO1p+6cWP8N1ztq?=
 =?us-ascii?Q?AQeOUl48pi7SdkMCkZjalco3FB0MvlpkkCVTfP+2bNU1Bae4pTUs/t8gDat7?=
 =?us-ascii?Q?l0M6oLmQlR/kl86QvC7PD99C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4ba2eb-a98e-4799-95d1-08d927319907
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 08:20:22.6006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgsNDanscTXIZoNgar3PdMpalRKh7GxH4uNoVazWgkGQsM+Yiy5KTJx85BUwEl7dPDQYsv6WOMhBCC325dC/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5088
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-04 15:04:03, Dong Aisheng wrote:
> On Fri, Jun 4, 2021 at 2:46 PM Abel Vesa <abel.vesa@nxp.com> wrote:
> >
> > On 21-06-01 18:50:06, Stephen Boyd wrote:
> > > Quoting Dong Aisheng (2021-04-22 20:33:34)
> > > > diff --git a/drivers/clk/imx/clk-imx8qm-rsrc.c b/drivers/clk/imx/clk-imx8qm-rsrc.c
> > > > new file mode 100644
> > > > index 000000000000..183a071cbf20
> > > > --- /dev/null
> > > > +++ b/drivers/clk/imx/clk-imx8qm-rsrc.c
> > > > @@ -0,0 +1,116 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > +/*
> > > > + * Copyright 2019-2021 NXP
> > > > + *     Dong Aisheng <aisheng.dong@nxp.com>
> > > > + */
> > > > +
> > > > +#include <dt-bindings/firmware/imx/rsrc.h>
> > > > +
> > > > +#include "clk-scu.h"
> > > > +
> > > > +/* Keep sorted in the ascending order */
> > > > +static u32 imx8qm_clk_scu_rsrc_table[] = {
> > >
> > > const?
> 
> Stephen,
> Thanks for pointing this out
> 
> > >
> >
> > Aisheng, no need to resend, I'll fold that in.
> 
> Thanks
> 

Applied all and folded the const change in.

Thanks.

> Regards
> Aisheng
> 
> >
> > > > +       IMX_SC_R_A53,
