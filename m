Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECA0C2B9F4
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 10:22:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79E2761206
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 10:22:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbhFNKYT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 06:24:19 -0400
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:5346
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232809AbhFNKYS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 06:24:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ii7YxCx6mNcFl+6YeHcLeWsMSxV1V5iINyIhVT9tu1KTRe+KOb8nHXZ5D7QdI8JW5sccnF79y5+aVzUo9dESgEm0NYX1D0P7lot49c2A9VbPCEW8QrVA/Gy8nZf1h7rYRWt2vyc5L2E4uqNeqKFdIeOt2ywr9lH/YXRl/2FHdNYly7MKXFY5jlp1tcywyXA4jzL29uLK7B3J3zvoA8Kx7dM9C+BwN0gp0Xkm+S3OYce1oAe15ys4BWOBIlF1elrFJTv5RKWe7BVhqdi52L5UfFJVHKFtStbpgh6xJvbkfbVzWBnTUnB0TMwKe/+UbOMg5izdPu4neoRdqWB+r+jolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0fOFXdGhvedRi2ZcprCu7H2DZCnJPChetbI1O+Ufpw=;
 b=AyssTZhNg7myhACY/028ZooFTwpZeAIeuykaJfbaIGPW1m96StCsb27GfzuOO/8dgGUS0Pujx5NBB3SzRHBWmTUfAmgS+rcfnwQDqqqQqIG3R+oIDqheoia/FbGfVVNoDY3mmDyTTir8kOyeZLdxE4yVueB88ETEvMaav3hKi0r7kDCszHjNum+TpWG9oHnvIHAsY1EOg+b9jfXyOxhe77jhlyrOKFE8BAgZih3oFSgHNkGUax++fBb5gHV01H8jJoA1FnVDofv/fmpiujOjbR0T/2YItwS9k/W7SvksKf6ktlWzvGtjKcp0UtCqj9Nl0D4JAec/PQd5x0OoQlF9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0fOFXdGhvedRi2ZcprCu7H2DZCnJPChetbI1O+Ufpw=;
 b=JzYHkq6orbglPsnYsqVdKn6gmscn2w8GF6e+uPRoCxBxoqs8tpftI/1lI4TDfDdL8qoamuVkdcSnC+CfbqiERveQFayrI+PTFzfmPtBeiJZI47hwVpARQgq+pyCPL9sxt0Uf/2z6NBB4R4QkCFBFdI3SCVB9x2swNEJBegxLqAE=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0402MB3440.eurprd04.prod.outlook.com (2603:10a6:803:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 10:22:13 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 10:22:13 +0000
Date:   Mon, 14 Jun 2021 13:22:02 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, dongas86@gmail.com, shawnguo@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 00/10] clk: imx: scu: add more scu clock features
Message-ID: <YMctylPusJFi871m@ryzen.lan>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604090943.3519350-1-aisheng.dong@nxp.com>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR06CA0188.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::45) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR06CA0188.eurprd06.prod.outlook.com (2603:10a6:803:c8::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 10:22:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd5f9be1-761d-4ffa-030a-08d92f1e46bb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3440C3147BABAB620CC8FEC8F6319@VI1PR0402MB3440.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/AbCX6Bk/U1JNfNl7N5ECpypQSZr2tP+dbQm9ou8BGcIfi7bAPPp51LU15iCIMy2jvOVelqg1Ug2/UBE58jD+yHQCG9cpo339xvvgRA/zQ0K/TCxO5XgFcqTueZEnMqAlVfd5+3gb/rA57FiBkS70T6LCNy8GzB+edux79I5FMTS25/fTKhmqADTNfkfxonFDL//MW94nCQs6kP+n6o51KpEBZfbfdZYs3cTox+0KbxvJjmRXqsG0AlMKZLGMvD69jmWqO7HPvr3rZ5kIss9ZJy/NhJx57VxM2miTRK9zAXzBakYyDkubKF/HuFPQWqGRbucnq4khHU1yYRrjwwpLRm292hCohJXfwS70A9FzyTMbPd46NElvnJV5wbieTKVhPhr1mZdkLOOaTFi4WGgDoNYsGM8UyybhSnRHuWVpvK6llOripFSsvcDqzAaIX+LJj6TmIq28ExesTyQQWVsrBaZ9ASk5eEvtB6pNfAAVRzkqSowxfRF0SKQkMICjvj7pAkmoX+g6bRzzJWdzBfrAN/Fe5CNH1PCGskwswnY3gL20V8k8IaXUhrbWIIoKhGFFS22p9PTGQDl8GClcB9UvDI2bi6eg5/GbTEUidq+15TdsxDXChntTZsQV6yWCLm1wanzp0q7qIR5Cv4FTgyZ5x2B/DOWRfpzndbo/8KhHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(4744005)(9686003)(186003)(6862004)(2906002)(16526019)(8886007)(44832011)(66946007)(316002)(86362001)(8676002)(6636002)(83380400001)(8936002)(26005)(66556008)(66476007)(55016002)(38350700002)(38100700002)(6506007)(6666004)(53546011)(5660300002)(52116002)(956004)(7696005)(36756003)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sZD9KL9QHrDGueQxuocmllmkpyjk2IbD3QGzysmKTK3AZK8dZbO0sPLezAse?=
 =?us-ascii?Q?D9xojFXLh0MHnRraAb0qhWhwsvZd/t15lsXbAGPzknLA0EGMrdX+q7PIZyWf?=
 =?us-ascii?Q?PuPVwqmT3wwlXkzEAlt5uu8EzVEggZOt5S999P3wgok0H5KOoNuISBY1sd+L?=
 =?us-ascii?Q?H06ps2sE43UQs0il1O10j2iGcKDB0/Kx9GoWxOApphFcImROLgr5YtBu/Roy?=
 =?us-ascii?Q?/927nshdvNc5O97hNSYTLUX+IVRLlTxSqqSB1UFcWmP4LiJqOgH764IquVSa?=
 =?us-ascii?Q?zPYif9cymnusYlBBt7ZepYiROT79A8OWmNNP0wRi1ETULpHPHwLHq6F80Dki?=
 =?us-ascii?Q?6RCv8w/qRSPLbYaelAyJcppwHMXidE4p5sBMZuWVO3QCw994qTAb4aGoEGky?=
 =?us-ascii?Q?QWfbUjBPBQxpsdCpiY4J0gpl0Gof4mgDJ5fbmtjiA3t4cDIS2USSgqVgwwJQ?=
 =?us-ascii?Q?zahEXaZ76C5piyNrRlGln/ikVy1LZd2qSLlLOcvKxV+3HC0VM3xW6FVQ5T74?=
 =?us-ascii?Q?tADK1iykxLzIbR8HMR7Qh1WeXfY4DWqVTZ9sKBRnGlx95abExWoYsqyiJ1wc?=
 =?us-ascii?Q?JDCytyBgPAYeoRuhfXICOwMJIzhfyw3+Wfs6x5/7srrkm+vU0wFzL+9WuKUn?=
 =?us-ascii?Q?WFhELtkG7z+4SnhQsnr/RvRriz/uwJiCJMFAiX6UOnTczmLKgihF4S/jTTf/?=
 =?us-ascii?Q?oXDp12etbPF+R1qX0zQd7J9sxYjaK7UhlVCYvBn3DBLLKBvflHpIIEBe15+9?=
 =?us-ascii?Q?bJOuQ90XftVXArFCQl/ul8PBKyZVaIGRcZovmgieMpaWV4ml52TUfzyCb8pp?=
 =?us-ascii?Q?PrLHUGt/ZJtpFw4ijDguW2t+MdTxa9mL85exJCSvaDrkQfty/Cysxe5r+sDV?=
 =?us-ascii?Q?HXP8G4LKFDFrfC0uEMXlXtpZttgjhew+mQH6epHzg1pmQWTUu2qr0P0U/YeC?=
 =?us-ascii?Q?cQr47wpHuGRMLi5f69WGdUylUvmmKXApGDJVEpqicpgGeFFCcBvP5hhIzOFE?=
 =?us-ascii?Q?JoaPhci3EEjIevhRMieBJKeEfjX3dQ7rIU3GujQFfAFXlUrw7RNYpotsJbuh?=
 =?us-ascii?Q?TOFlgsTEg8hhbuZrmJep4xmJQvw/mv2mLPywKhYZ6JTojcbF6pLtHg9xAr4/?=
 =?us-ascii?Q?hLFrxHKVk3LbodMgNFPzeAQs7DMqPqVvzjPZ1JqMp1uR8ZQx4iZnbB220zqG?=
 =?us-ascii?Q?2CWRfBUCmseAj42UuqRxJaPSZwX+0Vvscw2IPHEGLL6/RddYL/8+hg7AC2X+?=
 =?us-ascii?Q?Tcsg2SGrN3tRgysKyUMfWd3qpO5hnIjHokr4Vmq4b48u2Oowetyk8EhtJLcZ?=
 =?us-ascii?Q?XvkEvVYb7SFyAcMnPeinQSSR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5f9be1-761d-4ffa-030a-08d92f1e46bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 10:22:13.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8JtKFd4UNLqCNmOxt8LrhorrnZ/VYHfnGYAuq0Ctie0EC+ID2C9vhn9ktv2fYYcxyW6ZgL5IZAEhRF42LjZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3440
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-04 17:09:33, Dong Aisheng wrote:
> Add more scu clock features
> 

Applied all. Thanks.

> Anson Huang (3):
>   clk: imx: scu: Add A53 frequency scaling support
>   clk: imx: scu: Add A72 frequency scaling support
>   clk: imx: scu: Only save DC SS clock using non-cached clock rate
> 
> Dong Aisheng (5):
>   clk: imx: scu: add more scu clocks
>   clk: imx: scu: bypass cpu clock save and restore
>   clk: imx: scu: detach pd if can't power up
>   clk: imx: scu: bypass pi_pll enable status restore
>   clk: imx: scu: add parent save and restore
> 
> Guoniu.zhou (1):
>   clk: imx: scu: add parallel port clock ops
> 
> Nitin Garg (1):
>   clk: imx: scu: Do not enable runtime PM for CPU clks
> 
>  drivers/clk/imx/clk-imx8qxp.c | 152 +++++++++++++++++++++++++++++++++-
>  drivers/clk/imx/clk-scu.c     |  93 +++++++++++++++++----
>  2 files changed, 227 insertions(+), 18 deletions(-)
> 
> -- 
> 2.25.1
> 
