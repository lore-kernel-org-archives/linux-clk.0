Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D48C4708F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 06:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B59E613F3
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 06:46:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhFDGsd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 02:48:33 -0400
Received: from mail-am6eur05on2086.outbound.protection.outlook.com ([40.107.22.86]:19878
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229978AbhFDGsd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 02:48:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJizsN5Ixvecy/BSR2a9PmIk6Cs9P/g3RJJcUcaKOhUFMDd7CGgheuu6Yw/IYDguznJHwlOcMi9CqOIusCZ5VvPvo/f1Q+9c7zVJ4CNrEQWCFnzXqWc1znh65Wku0o6BP/WkQbIjGKtfkAhVgOoUApariUleM+D/iJrSBQD3Vw46mxNb11y8aoY+j7Ulv052FtkKwaBuIrGTyCquZ0fJLpbld3EkpzfqNjhpLpGAXhc9U4myM9Pg9heaCW7guGbocka/MaQqFsX8A+d+hgXNq18aGqEN9qpccA0IhAYsm5RKGFLipxbGjxYtpDfbxoovnVtWCDnSHW+btG3xuD+J/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59buwlR6BQn8KW32eBHJzW4p/P+blaHW2ca4U5oisVg=;
 b=mImvrSP1JyvOyue9wVSMYPhQHKsTmEBe6LxihIc5r1f5h4UdoVEr8KyJxUaFiZpL25KXzxg4uRux6cPEXubEndqTjpZQS203F5SFigs+ES3NxL7UXuh80+afIT00iv9Aov+fiTWfkRQ/gIUvWPGd7UL6j6IlaEjiif5RJHK0N1OUMKhglutCT27MJ09BctYvszEoq1XIjSH4gDJYVe+Y+q1v6dyCSk3RR1g3N6umz8My0VdDmWdTuzXCQ7UZde5gZC8XR/ETEfpPpK67Ttnv6u6fwG9QFri/J2GrZEaskyofnhitPjO8LA0H/eZtrtutSScsMRenY/+QBBPum6ZoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59buwlR6BQn8KW32eBHJzW4p/P+blaHW2ca4U5oisVg=;
 b=BpRQkJMQGrzLCD16icLOdG5xGHDOQNQUqzP6rVgCyJ4L1iZEYfYA6JHXg/sUOIRTa5JlrJWqyW6ym2pnK4pFEOQD5RZBa3EH0QwWX3ghyES6NrJqiyRipIFt7t71rOIINL1fb0JAObnRV7FXQo6BAtF5rm9Vatt7ED6cXlQTtxY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB4096.eurprd04.prod.outlook.com (2603:10a6:803:44::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Fri, 4 Jun
 2021 06:46:45 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 06:46:45 +0000
Date:   Fri, 4 Jun 2021 09:46:42 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH 6/6] clk: imx8qm: add clock valid resource checking
Message-ID: <YLnMUtxEAxAq3vBO@ryzen.lan>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-6-aisheng.dong@nxp.com>
 <162259860630.4130789.2941110953953498194@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162259860630.4130789.2941110953953498194@swboyd.mtv.corp.google.com>
X-Originating-IP: [188.27.175.31]
X-ClientProxiedBy: VI1PR07CA0231.eurprd07.prod.outlook.com
 (2603:10a6:802:58::34) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.175.31) by VI1PR07CA0231.eurprd07.prod.outlook.com (2603:10a6:802:58::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.11 via Frontend Transport; Fri, 4 Jun 2021 06:46:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b281aec4-da4f-471a-7326-08d927248464
X-MS-TrafficTypeDiagnostic: VI1PR04MB4096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4096BF9649E89B73FFFEAF7BF63B9@VI1PR04MB4096.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXM5QwGbkj7JXZcD3Ax5ddb184U2pOt8Tg2bXavJmgjfZuTmQ21+ysi8Jv7hxoIYn8e6x7S+1AezRa2vrRNyP/aYxsG21dddlBzO07VvtZzLLaTnrq08iOd9lD4cih/WzvptFs9GfW4k7iq6XOmQgZB+PanCPhOltG8uD8Jjpkqv43R1D5/yTao8bfoDomgF2bx0wVd8fiDwWPBONQeW+pKq8NiAgpuj3wgbYcmxLPCrP8sHHMh1lHa3STugj6lKhlADQX1kk3Bcv/K1AQVxA5LvFyCPCMvdZOezBBg3PfL+DOEjiwy2Z0gyJ+fVoKiBlPuXnaaoPg6pf/TS7DqNBp4ONd8+2XDLcHat2zrpFqtDQc7rqFoZq/qruDcnpVWEqeQntf1dGpNfVH1yiFANChbtAaR0QSB02MiMYkxceGDP0vBCPh9YVna66XFyMFsCGzaeuBkreXxcSWw3vBKz0a4kEr2CAhFohA4MaTjY+LFGx6KTuRy22vAp5MFgjDDiIX0VDdsOPvdK08h/5Vl9yDIhHmwQh28RtZuwc+qKhZqaM0kHwr0gPNhnvww1UwWFIqtOzZRPBNF+AXDndfnjrmliwDRZ3s+Oe189TXuTGp7l/A6X4XDOPRnPV6B6AqAgFq8Kd/QEtSMnObfSnrQmQ+xMlHZYPK+YmhrsURmgjcU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(5660300002)(86362001)(7696005)(52116002)(38350700002)(55016002)(6506007)(53546011)(44832011)(8886007)(9686003)(38100700002)(956004)(478600001)(8936002)(8676002)(6916009)(4326008)(16526019)(36756003)(4744005)(26005)(66556008)(66476007)(2906002)(316002)(83380400001)(66946007)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?q1e6k21CJTtGUWfAeic2MnmWvK0XDjXS8JSr+nNfahreMuS29tSyqLHSYvNZ?=
 =?us-ascii?Q?8YTgZtiLHQslPnwt9QcLpcWgU2yA+7Tw4g/m8ZAjeaYuLL8aPG9e4CGglXkW?=
 =?us-ascii?Q?ul+UXLaswG2uAagdPacbzEK1VUy0IPeg8WJumC+D6HHwDl9RVRZLSUarieBo?=
 =?us-ascii?Q?tU1ynOdWh4tQFP9APwsD5xheLLVHOeD2K7z5J7tqAy3gIs4h7o2FqbM2P44/?=
 =?us-ascii?Q?w0idTvhbJObA8tAepYMPea5Kq/1TlO1GSR1CljL2qyYPT0SscyiVkL6qZUt5?=
 =?us-ascii?Q?cYanXSD7omPsjRer3coVC2QWDHyG2vpKc6b88hwYNDuLjCSJ5TW4uH4fxbqF?=
 =?us-ascii?Q?602c3bqHEXEGnRRC2cvB9IDmm49Io3Y+16mcxRbSzBPGBN+ZMA1P2NVDTcoh?=
 =?us-ascii?Q?bNVYUSdTGcntBlcPJMEM5CLjTAc1fxEr873PK09b++T0A0oewDJ3isihlksL?=
 =?us-ascii?Q?fxTVJdMjx9eU9+F3JyAuO6O5pMqK+JXEdYm0M/GwdsI+GrqOBYdkIktPWAX4?=
 =?us-ascii?Q?4vNrL1BogDzewaEcW146tAz2k2v6LYGaulHisjWwloJqgkeSJvwG+e7mbnaX?=
 =?us-ascii?Q?6d5H64UMCCKPHmJHYlldhInIznCpBqEnd745SMv9cX4OwsmKywJa0YFzG2Mz?=
 =?us-ascii?Q?DjyfSQOt6UjlynlkuQYePH70xpkIKQ07ET/DZ1bjjFbH8UT9XFdpqbxSJdDV?=
 =?us-ascii?Q?Cq0B/wTUazOEAV0bDPQVXjrhLHokEJ+ZBpN5oUuhJ/8d9o+w+NUG6ZXipEFl?=
 =?us-ascii?Q?rdABROVEsqpEwSMKEH2KY5QMUuuuxzHl3d60LT+dNciqhe/pZZ+rDCNLdntZ?=
 =?us-ascii?Q?EXm7gSRzdwY6cV5RgRck6o19tgsV+a+hKn6h+SHh5wk4gRCdp+F/KlkeTgoC?=
 =?us-ascii?Q?UXoK1Py7bfsntd5Hqauz2ITZ9P97IvrFDtTZTy8pWjBlHn4gOwo5+yNfQdjK?=
 =?us-ascii?Q?FKOWD5Z7oCYuoRPo7cmDEHf4fsz2+zM3fq8YfRcXwWX4ouVHYaSz/5nmzMNn?=
 =?us-ascii?Q?guw4Kmaq92T1uY6gB3GkAYo+MX21Ls/8X0V1FAH1GxXXM3G7PjNM6ybAQ77y?=
 =?us-ascii?Q?tjlVEA2ZqTkesYkcus3O7wPPywVLZulCZmiC91rgW4v4211se7XOAOEV4AH0?=
 =?us-ascii?Q?io9fKuGGjlHsm+Yg0Sw/OWYR38+LSQZMPL9+En2Oh9mUwu4cmoqRWxEPAYm8?=
 =?us-ascii?Q?vHyTMX9p5MWQO5CzG6C693o3Eq89r9U0h9Kq3sb3ReB4Wdz3FZxbPhh+vhZD?=
 =?us-ascii?Q?Xh0YfoKBgzIJt/TRv45NpSciWp4joOiw6vLCwlCDm5n0Qw0GckmS4InlRsui?=
 =?us-ascii?Q?+LqGGGo+d0QqOM44D/e/lz/I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b281aec4-da4f-471a-7326-08d927248464
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 06:46:45.2283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FInX3XGMlyN39lXsMAd2+aBVU9jxixH0jIrWjFvqfT/4pfnXHExFS8rTN89VWlcBbPinmBWPqQlQKFdvJ5V9Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4096
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-01 18:50:06, Stephen Boyd wrote:
> Quoting Dong Aisheng (2021-04-22 20:33:34)
> > diff --git a/drivers/clk/imx/clk-imx8qm-rsrc.c b/drivers/clk/imx/clk-imx8qm-rsrc.c
> > new file mode 100644
> > index 000000000000..183a071cbf20
> > --- /dev/null
> > +++ b/drivers/clk/imx/clk-imx8qm-rsrc.c
> > @@ -0,0 +1,116 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019-2021 NXP
> > + *     Dong Aisheng <aisheng.dong@nxp.com>
> > + */
> > +
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +#include "clk-scu.h"
> > +
> > +/* Keep sorted in the ascending order */
> > +static u32 imx8qm_clk_scu_rsrc_table[] = {
> 
> const?
> 

Aisheng, no need to resend, I'll fold that in.

> > +       IMX_SC_R_A53,
