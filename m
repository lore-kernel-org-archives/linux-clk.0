Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DA4C48BE8
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 09:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91106023F
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 09:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhFNJJX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 05:09:23 -0400
Received: from mail-eopbgr80053.outbound.protection.outlook.com ([40.107.8.53]:18048
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232631AbhFNJJP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 05:09:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCx/iuCeLFBBDtYz3M4xL4lQZbUKjfhlcIvpJMKtuguYdMaLcAlCyW8ooRTOdMU0h58M0MxIbETf0uaIZPhnjuuICZYHo4STdJHLj7caPCxnYKW07v5TDD2fHY1CALmQjFtYNFyLNun9Dvd54TOt9EnjUwpD2LHEBrGAZP4Im07Oqx8qltfMwa64mSanFE9aYjXV7YCPfhc52MS0i8RP9DKd5THWyKDUlIHN+xnc708Rh/sU3RTBi89XJCWyuqCBD32C4f44mMRwsVcfXG/WOkz79lLGUUWdaPxxQgLSqdIv+EZRdQYvIx9GwsQOmx+wd7EpeHO7RubBPI+VxQ8o2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOwvCt1D1OAZO5cAOEo7FWnu0yNJhmV8NV76o67OzRQ=;
 b=au9I1XpJUTFTmLl01nN1jvu2NV7l7N21+jH+Wo3I92jCSFZRpr5d79maYCrXy1H3Hlk+4TxzWZr7AjT0oBZKPqz+sS6DKa9TgAA1j5ueG6yRyxxwmfl+kNQTOQN+n5p/R3zJHQ7bnYskKIAeIV7KP1uAaqir0kqvt/lIAOK9cMKUmpzHNwU3QUQv5pPCjPZq5cJro6eJWMArTRSoMeHzIRQk+W5oyoEW6qRr6DVXULKOJa8uqctZMw0xmCGuHOyCJR2pogM+kh8D/r2szbZHiJeaATothf2a3Px5wlBJFs0y2vC9Gjm/AWWX4yAD9Jj3cgguR3lANjahEuzAD48+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOwvCt1D1OAZO5cAOEo7FWnu0yNJhmV8NV76o67OzRQ=;
 b=T0WRtUFGOOp0Jzm3q1d35BzwdmWKGVUjV/x3SSRpeHZ+L7mQOW2YY1X1HDsPC/OeJ8yxUakUtjdnCRYqLF3iOH3IENtycWysMn6aooN3tY7icLz3pitbVTGnpQsbLAbgLYW+QS9lAb64xjA+UQN4wTnYkoqyNqGT2m0nKTlnNh4=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB5934.eurprd04.prod.outlook.com (2603:10a6:803:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 09:07:11 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 09:07:11 +0000
Date:   Mon, 14 Jun 2021 12:07:09 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, dongas86@gmail.com, shawnguo@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 00/10] clk: imx: scu: add more scu clock features
Message-ID: <YMccPWF49O4jGLtB@ryzen.lan>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604090943.3519350-1-aisheng.dong@nxp.com>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR06CA0163.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::20) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR06CA0163.eurprd06.prod.outlook.com (2603:10a6:803:c8::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 09:07:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68280adc-8179-4d3e-c7c0-08d92f13cb5c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5934984E189CA3ED4320E01FF6319@VI1PR04MB5934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FYScX7bc4imQ/KFlGVQzSBmP3G06+DTGbm2W7R0Zqi6KJo2OWfDi3DJFxO3vAZ/kvQVTw450EI5vydhTk9sGxDikd0X/nzG9EipPKEnwQo5MUBhU2JRw3nMVtGIdWiaKqXOZFyJ/i7oDrYYAnYlpX97j6o7XyJyxQchYGeYWiChBxDvJs3Kp31keHkRp0p0pMNrMyazMH8R13I4VPsxYi9SBGu/61d1iNb8tJKm3jGIhzoyqH2Ij4byWmXUoXt/f4+3Jb6OodqfZze0ra4tuYOpahoMXdrbyF+SnjYzOnPXukgMI5E3BHl4THbJ20nf1ZVwOoAVP3btF6gtplmLHJN/gwJG+wiAYJ+OnBIUSjNblJkB0NLK87JtGJf+8DXjF0FGrYGb0zDFYMd6eHMSHVF3vyTn4RXqPLLN7IOIcDg8fYqaommdbsLZqPSjmc3lac9QBoZ3FbRX876S0tICyZeFqoEofTLoiXscun+WBdgiJOfpxojuN0eHsnLt6g1GzQ9LnmU1ePlCZaj7FCJQ3s7EGY+upUXodpXTqwxkT1GONnUxlIbxuPqoNNF33AsZ21Kv7AzKWiHK3E1eejL//Hd/fEloOXv0jjWjo9abbzyP5rcJbd/oAhLU4gxRyVodJGVYIEnhaGGAhrH6U5jWq0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(8886007)(478600001)(26005)(4744005)(83380400001)(66556008)(7696005)(8936002)(6862004)(52116002)(4326008)(2906002)(38100700002)(66476007)(38350700002)(8676002)(316002)(53546011)(9686003)(66946007)(6506007)(36756003)(956004)(6636002)(44832011)(5660300002)(186003)(16526019)(86362001)(55016002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t821EOM5BDD6S3jfKfZ/+G7a3l5ufP4Z/Vj1B0FNy7oBJ5qgzu++PRg+b9Cr?=
 =?us-ascii?Q?/bJDg2x3hx38i5ZgRvyVz3+UpaS0Aw/ecC8aE2ZUWfoy576/O4IfQ4Jak6sY?=
 =?us-ascii?Q?ck0r/CMb38SItKEM4j1uXVJXDybAr2LtceGlg4Tj3f6yEhCuxcjY1tAgAu8/?=
 =?us-ascii?Q?wXI08sciOISSDSeuJOGkMeIop9x0dor5kUKn/BoPoRqyuEbCu7SWEsR5dgtJ?=
 =?us-ascii?Q?tbUHOWAAHKrv+ykeE+PLfdxmpOjQiEMOJlpPlwuMNUfont7Fxa41WuCGTBtb?=
 =?us-ascii?Q?6P2liH4Y/TKGBuFqYCBLOqo0cOloDZIp1Wzx0ctGTTSG0DFuiZS+lXy/S+dv?=
 =?us-ascii?Q?/HLMDPQ6WXgfpH4pT7iXE/sMfWnuK2z3VvcymUNn0LrLYiRMB8KnNEg6N1FC?=
 =?us-ascii?Q?WZxbOOLkQyv3Dllma+/CWSC2XV9Mo+u+rhIC2eF2mFA0Lgm3HxDaxrKwulIM?=
 =?us-ascii?Q?OGGKfB4t1pAmeY6PE2DGOPKhW5IFO6kDHu8XUXutgfkKb/UOUj+IXgstyBJe?=
 =?us-ascii?Q?14mL2pThEV1gSj0dAVqmL0FyBhOhyILZoP41BuNumYPbE6PyoIBYmFcoBo3Y?=
 =?us-ascii?Q?0A9sk9jEOxMfPf9PhXjpCoPtoTkZD+XNfgf6Xx17BotCPQsXF46UpxIH/Gl2?=
 =?us-ascii?Q?Z5+pnxoPmmy8dRKAsp8t1nZigUkHrTXmxyg+ljLrlU/PuOSNpwprVwWxKX47?=
 =?us-ascii?Q?0b1Aj3p0DcTvgMp7LMcwqsRQ7AfEeRdrFS7FrF+qDb5mmcPdC0gswqreyYOG?=
 =?us-ascii?Q?Lw+I1Eet2WjhdcmyahOtX4NUkW8ZAvR46vMwSg5kQsiun/92mkYDdMI1aJqu?=
 =?us-ascii?Q?XqptKk24f+GgQXMl0DnL1xKPEXLyGMPDFBDDDkzWEadJF4TDpoOCNPY8Ujcp?=
 =?us-ascii?Q?/g9Ljy1ValkOh/FJw2tpoJeLGrBaYNeKhEIfrgDsfz1qtRXdEiZEnBKSTaiY?=
 =?us-ascii?Q?yjZubnqASLxSAzs8O7/DjjUOC0jrjSEcYa+nSEeQsYbxvxuh0tbno3dNa0gH?=
 =?us-ascii?Q?TYgiWCeUQXjKNcecYbKZPRnAxOaWULH5cJb3FKrAgrZCHxI+NqvacWzH5cLv?=
 =?us-ascii?Q?bgIUNQoQWzgplfFp/HnAeczmYHZIbYTXE6LtKo8VqqfeThR23NnUQ4pOsYlX?=
 =?us-ascii?Q?cTRBXn81ZJc+Kym0fDIv3w3joKVMoZ3NdN16rOhcUGDUe2mw/0z+/3e/O5N2?=
 =?us-ascii?Q?/o/CCooJUCQn5pk4mNNSD7AiR9GgDKL63zDKAq2J9UjW24yOAY1FF4Fa+BxR?=
 =?us-ascii?Q?crX0rn9WOmcWBfGK7/bqU4UM8PRG8W+nhH2eDoV6hXmHKJcwwqrgyG/E22A7?=
 =?us-ascii?Q?IK8egsL4Of7moyWtfAD3gcir?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68280adc-8179-4d3e-c7c0-08d92f13cb5c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 09:07:11.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rw7jlj/yVVWKAaiu/38V7hbUlJXv3lVlE8ffC/lv22F1YQu0RnUuKRUzfL7UZwhtWQZUJLZc6qAy41TrrObuEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5934
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-04 17:09:33, Dong Aisheng wrote:
> Add more scu clock features
> 

The entire patchset looks OK to me since it is quite straight-forward.

So, for the entire patchset:

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

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
