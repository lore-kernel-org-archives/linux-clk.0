Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD33C07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:10:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 211B26140F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhFDJMj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:12:39 -0400
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:47430
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229936AbhFDJMj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:12:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Snft6ckKzg5U+YDyv0sFNqPfG0ETIe50bjFA0OT+lXbpedveCj8UtcR0LV9mJJEVgrNgZFCMXaLx+j5/fVF9zbsKF2G+S8BP+YBzSaLLG62uQbtg/9ktkGYl4WnU/oKtMuA2LWKJd3G2HT1lkCETQ4uoFHZEcb985TZY3TCmHDdIyTqjB7F0fg299uw+UdNIXI0w040CU2Rg+3fEsA3z2LtJ6F5Zhi9azcueCrlC8BMClADZFgGiVRuDbHuJPJGVKxi3BOfh+khJmbCi4VwbXhFQ3k04sdmIAoG7eg0KbnqqwARg44FGSOXHFclRyP7hUF7VNO86YAiDRLn38QzWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiWePHEPLycQuhnysJWiMONomDnqGbcH4KL2u7Ybggs=;
 b=Bpifen40HQkgi+AiW5wPqnJ938nDASRqhkzerxkh1Ob3DSmTw/gLMgNCKUiy+6cgbJOciOqkIfAs3ectrZLH/XaAnZ3AokRacKumI58oFW7afdRe6DcQq27dH5ZyWTnEE4Rr/B1CsXJOATh/d5qL1Zl48mR2s+zRLP9AgtJdw9Fyf0bkshFagKvu6QMoRTdZBzu+JcaZQK7Yi741NTg7nLDzVM18MplmO+CLkr+4AGpMJxpx0bbPWoP/LrmT6eCu7go1EllHbldoSYeOmE3OcC5+0Q0tHivQPyk6BpE3Qr24vLaBDxUPYjdHrm3cs0tJ/TBkKvpJTnXlel/pdN4lhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiWePHEPLycQuhnysJWiMONomDnqGbcH4KL2u7Ybggs=;
 b=b19wi0taD05m1+YDrs4S/+owtDulwk/IMDUuhCuyhZU0/DKdmZEQX2DqHQCNKQns62EY0nkESSVW50QBgRhtgnkSj2Kf9pw2POXBeBL7yqhaOYGEeLtd7bLLq2/+QDWaMr5HUljsx9Qkr9rrV8FoZf54YLAGGMRTvoYCaxr2iMQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8917.eurprd04.prod.outlook.com (2603:10a6:10:2e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Fri, 4 Jun
 2021 09:10:51 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:10:51 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 00/10] clk: imx: scu: add more scu clock features
Date:   Fri,  4 Jun 2021 17:09:33 +0800
Message-Id: <20210604090943.3519350-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20)
 To DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:10:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b7ca11a-e510-4ff0-be6e-08d92738a67a
X-MS-TrafficTypeDiagnostic: DU2PR04MB8917:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8917ECFEA5B7CDD05435EA5D803B9@DU2PR04MB8917.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PaGTfs25h0XfKv6SfWmDUFFcBetvRRh2JabsGNWWDSc+H/zVKnjigbJfEIW51p66pZppSWe2+rroq5pB3+Gt3GFU5KcQMtB3GPOlm+9Pqyds8XL4iV5q44kfI3utVWnH0BNttRbfElArt3Rnj5HuSf0pHkoJEltMP2xqSgthj/UFDlf31xmYS6fHC+vgC0siOzM+FKw8z6md2/U0tI7IecD8Pz5O9GHjJI1g0W7xqVBPbhtdYxwEiuqraJwNyetnbHOcGQk07ti39zMw4Q0BFa6fhFHT5EVFCCfAt/Zu9MMdElfYoAJO7Q49/2f/hR6Iw6EKTN0oXHVfqZlJDEq8dnjYDpQ7eQtRGePyOlJFD3hGA84WQKx4q0jGXR+2SxWKCawcB4SO1DkBZqqJboh3QhXkynm3i2Eikg/e2UFHzzoOhUVXVLqrkXh4v836Q1K2/xxRX9jipNjqeNvmPGS3doP8QeTqUqmTYB0vOExoKnrZWHTkkbN8fCognu3QMrHfoeDpY93tEcUeHjVtf1ejQ8qBngqZExloV/s0vSb2C9BZL3UGK4Uk4Wxp4vOzKjBofScit3i2AWFjcVmyHIu9JWRvKnfGok/Yr8Ad6LwN/aDctc8U45A4o976M3kIDpjFfuMwJ2pQe3R3lL0JqIkLxwROXfCd+1D85vF/s5q5Rv3pcdgXzBGhOfPu4xoqxPx4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(186003)(16526019)(6506007)(2616005)(26005)(956004)(2906002)(478600001)(66476007)(66556008)(83380400001)(316002)(66946007)(86362001)(52116002)(36756003)(1076003)(4326008)(6486002)(5660300002)(8936002)(8676002)(4744005)(6666004)(38100700002)(6916009)(6512007)(38350700002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?t4fkQ6owOM6EXmvTluQcU0QbNbc8950wF4tjUXXvuNKYFgBW8F22J1EG0NzT?=
 =?us-ascii?Q?WazLTNwDkfpuoVQ0D4DF9S9dJtEBQQObyWddo7jsTgA4x3iujpu5AcFfbbUf?=
 =?us-ascii?Q?gjfMMVuBwVcSgSRCYY1HjpBdyBZhgRDC4cPf2VSeywdAQPERWuTifPX9hGeL?=
 =?us-ascii?Q?XNwqV3u+PoYi9Ate+5Bu8G6Q1aX2On53uUqa8SlVcYCr6I5A7Fn0Vj/x6whH?=
 =?us-ascii?Q?nbyn21y5z4xJ/NZjj51sBu9qn5rXR3fGZRFHvLHxOB8lIfwfD+oTLiMjc9Wj?=
 =?us-ascii?Q?EOu0ew8w8xjhiH5mb4uOSNG7Qe2Wor0EJpCIVbcecxigGxRuA/VkGXMloT+S?=
 =?us-ascii?Q?T+gWm7w3RGyCM/5tmF8lZuSWwsnTjk0KNf+yLv3UsYwDA/Yfh0dwzVGS9waf?=
 =?us-ascii?Q?KGwct1vBTwSkcCkxS824MaAV/Lfu7sX0go6zgidM7Y4kj7qdRMICLoO1nIsy?=
 =?us-ascii?Q?B0T3CjtIrkuAjz8hMQEC2YcmHAhcFI2wE9lhqweMgzKMTlP9GFejGl8ZiuaE?=
 =?us-ascii?Q?SKW+nv8aRbrmQP+OVNRWnLFNmIQsLIdt99j38LyMWSxx8RJZz5loDIf6cSQI?=
 =?us-ascii?Q?TR5vHCMQa+I2CUyvvI/fbc+5qBFfPY/aUvV7AsE7cxeV1aotUT569DUwUpp9?=
 =?us-ascii?Q?+b4QNhIuit+6VJhgYpNbr8c2vcGPQFSQBhTOQ85FtyRkrQsINjKKYw304KAb?=
 =?us-ascii?Q?+EINbCCcMgB0Li6UWKhXXRxp9pYWpaofGjLh+mhN+iHQFY/+ysLyAJMMwXYE?=
 =?us-ascii?Q?g9FzlCoYdfjCuFGpdEkLAORs1pRYT5PJCN2H+gl1yES11XDqpoLTbIuFl5j+?=
 =?us-ascii?Q?lwoVcVVoNSGkvfVnZlT4q6Tlcsuadc0yb4iE63hARzPbFyosgXZQiJlhKRgt?=
 =?us-ascii?Q?LcuTNjtZ1UKCkJDHCLG9tZJUigr0288qU565DtEuW53wc5S1vZnzW7PKoeEL?=
 =?us-ascii?Q?zqrKSLIa4kdoXrbVm+l8wzirP+gZIJD7Y+VM5iTs3ONAhiLoqb6YW+ARRAJa?=
 =?us-ascii?Q?ol/TXggltLxe8fsX4WoyHJJRSZ5KyBhWj83D6z7fWq51PTHxt5OJbnJ3bsiF?=
 =?us-ascii?Q?gD7kLmZsJG8FEuJgglHDED1GNmnHwjazgzp0CVDwgzGizr3dSpPtQJfxsGSx?=
 =?us-ascii?Q?QE6NV7zlw/tLYitYDTskpLQgXaKz7iWSrZz4nN1Ja8Ww39pR/5LW0umF0MY9?=
 =?us-ascii?Q?3TlT5wqVvba8qE/If6QW0mRuqFpqV8PS6jwqWPfMEUkXj4ahJDjjeuAmfFBf?=
 =?us-ascii?Q?8l2Cip8G4ZRFJP5Aanifk0KybSWV3joU8RPVI/IO3oZNvzE1kDRdDSbcOpkX?=
 =?us-ascii?Q?TXQapTEI3YRY00cXnPinGgxg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7ca11a-e510-4ff0-be6e-08d92738a67a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:10:51.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Lez86+grMI7761lEU6IksrTThrSiSlNwnlnt9Mna1+z4Gl2hSkp1T4FZH6UdSkYlU4HlM04ZNLd3pAXhnrZrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8917
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add more scu clock features

Anson Huang (3):
  clk: imx: scu: Add A53 frequency scaling support
  clk: imx: scu: Add A72 frequency scaling support
  clk: imx: scu: Only save DC SS clock using non-cached clock rate

Dong Aisheng (5):
  clk: imx: scu: add more scu clocks
  clk: imx: scu: bypass cpu clock save and restore
  clk: imx: scu: detach pd if can't power up
  clk: imx: scu: bypass pi_pll enable status restore
  clk: imx: scu: add parent save and restore

Guoniu.zhou (1):
  clk: imx: scu: add parallel port clock ops

Nitin Garg (1):
  clk: imx: scu: Do not enable runtime PM for CPU clks

 drivers/clk/imx/clk-imx8qxp.c | 152 +++++++++++++++++++++++++++++++++-
 drivers/clk/imx/clk-scu.c     |  93 +++++++++++++++++----
 2 files changed, 227 insertions(+), 18 deletions(-)

-- 
2.25.1

