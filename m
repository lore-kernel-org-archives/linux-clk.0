Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE81C07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6E0961411
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhFDJMw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:12:52 -0400
Received: from mail-eopbgr140042.outbound.protection.outlook.com ([40.107.14.42]:41447
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229973AbhFDJMw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:12:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtdgT1kkLBURqaPUzqqyhZwnIKpvm/DcguX7snSEV+czNWGm6pwzUl+77bX2Qc9W93BpI1ddwM3kBiX+mkE1nY/R+lRrDWcPhsbtAMOnO6etggL+uejGdBlqJE8ESOBS3y8rTJ8sJH+L4d6+vRr2Rf+Oh4C1lLp98e+YZ8qznA+ee1adhF1KeoEDd88kAr2jSorzEt7mQyhgbDjng+SxrPBCfWx0aT/doB92kupLr6A/rJOWf8ZXq49nyeSxU86nyXXqiTv05yc4Gf8IgSb8K3qdWdNcQCd/PQicbSuvLFdv5ieF2EbBhB3Xai7PvmnI6lKrTtv0tmK48fDTLL/BlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQMraDDWMvFHEhBHyr/ozl/5tIT9u6Zb/9rojGzKyvM=;
 b=HumIcfh7jm8cRaSJyfyMQpC6mnMEhKnDaHNc2bWNy7M1244Nde68cC37I6X6jAubrdE7sir9kPBSinqg2gSRmkuFCYuEMMlT3p0nM24WLDMlb6liHnRfgfnI2DyM9Vj41yfGmtya7v9ai3waNg3KNCqO6r+Xb3VEMv8+YorMaAd46jHgpP9o5MCMmjc1j/OpU8kDnBD2Y1tDWNC7rtCDo0JAg3fSXY30r/xFLqjhsaY96QvVh+mxgoZp8cpjk/XGoMbFKn7oAoRWQmihwcToybH7XbETrRrgvA3Li19UCXafmWQjB7/0+j6PFxACuYl/vDPqtNkUsYk11xkndwJWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQMraDDWMvFHEhBHyr/ozl/5tIT9u6Zb/9rojGzKyvM=;
 b=d/5j8HouZTiULS6O9iw2V5eQnoTY4ZtMVNgSCkbuogAb41s7g3KP36Ru1XLNFeK47LHAWWg9uqawZ2wySgy8lbQqs5wwXrHO/zeGhnKI4PFuW+z3NsSW17ouW/w+GEO81PrLbM7nluCYZjEZ7Xy6NoyoPzI7lFr3OqfI8068XSA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 09:11:04 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:11:04 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 04/10] clk: imx: scu: detach pd if can't power up
Date:   Fri,  4 Jun 2021 17:09:37 +0800
Message-Id: <20210604090943.3519350-5-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604090943.3519350-1-aisheng.dong@nxp.com>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20)
 To DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:11:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79a970ab-2798-4ec1-c035-08d92738addd
X-MS-TrafficTypeDiagnostic: DU2PR04MB8502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8502D4AE2BCB828220252A36803B9@DU2PR04MB8502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTL+Gn5YuJuc59GFo9yJ3CRGhHFaK1Jr2o0nlUDVJnu1KqKE0GlpYYEKCGjmunOlm+anoneagGNwrPF/DIKZFeXHcS4zIKK9NX4yWkCcCzD6AkdRr1bvv+X3lDHeHHCc6cUM/nJz81KxWdlIRy7lo4dca1nfIn9flzNCECtYIlWCJfRFIjvxKDyGIc3u/z9EHNz4dD7ubdcExB6MS3Y10gUDUnk582PowVSOUbMLlYbY2f66OtxeUjV1WUsusGsGzCJVz2Rpt8YVHKZ5WoK53QkL2QpQAH3O7ToD4VD6a94JURQSU0P223LRoJGY+fU/hinYetoAfvLcNRJow8F7eNZ8sCle/i/NXE7cntJRQeWwNv8eQ4Z+zELHBvtDKZTxPB1FULd7kUOtW7UPFGVEJog79aKOdayKwJul9YIqWq47TMLEhRTU/dFliZra0sw0PLfkNod1WsR2Q10g7Y2F3B3jUJjX9YX7s5hMEdR7iGZSat9kFPR7hOK9oBtefC+A52o77vFw5VfIbNc8H7YDyBO3oo1x6Fmq47Mi+GKFEO7f0AHUHSv07kU3cc5Czr2Dc0lqhTvs7laUxXEtlTUPmyRPiNP/H3842u2PMCVkegPEncpOstmobZDx2zZEqkiTu4S2GOC6i8WMvW6ApPPeHvVYbe90xJWEEYtuL6KDUKgA/JMVifR7Da3KZgLSTKS+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(52116002)(6916009)(6506007)(478600001)(4326008)(38350700002)(4744005)(1076003)(5660300002)(6666004)(38100700002)(2906002)(36756003)(16526019)(186003)(26005)(316002)(66556008)(66946007)(66476007)(2616005)(956004)(8676002)(86362001)(6512007)(6486002)(8936002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yyje2TMRvUqeBT6WNUGumUXtYIK/19FoK7gO9UlNjw52JZDeY0fe7Kqiy/VP?=
 =?us-ascii?Q?9s0RZDP/dsg4I+8Ar8PMgMyeR1r1DPNu+UQhXX46gPeZtT2Q0uZG5vMmiLb1?=
 =?us-ascii?Q?pXsftq3jwQg4Vrv8VqExvw9Au5EnCiP/omYqrek5lYCzyB2kuqefPVz7rOBt?=
 =?us-ascii?Q?RE4CgPx6aWVkFzH1yRLHtcNT/DRL2fRgxoXeP+l+ctcsso6TOr/CLq0kwxeA?=
 =?us-ascii?Q?Vm3vSZ6mTVm/G/TroP7edQ4bVenB8r2pDQ3Kdc3xn1qFSRinx4VSagYG5baj?=
 =?us-ascii?Q?kgEgw6Ezswp1dIHIDYSW29sscnWNChAjnOSqobl2uS92fmdjXOudWIW43BXI?=
 =?us-ascii?Q?DURd8cCRLId/GocXpEgerSIGVdsoHF9aYWlrisUgnPCAubjcmSAS8OwYJ+2D?=
 =?us-ascii?Q?vGa1O/ndfhehuRnxMfBIFXgJhJOypiCBzuUdk0Z13pchcrFY/GB40p6cp9Ps?=
 =?us-ascii?Q?Wc/tCPTflEHFh3VKJ7J0H6VyklIu89Qi2f/prka2O32M6gGSE0/DK4to9y8u?=
 =?us-ascii?Q?1ycK1xry0qLvQtyY52piwiKRfaqO/1jtow1iuH9Sa2gWxnUQFIitl309k+vz?=
 =?us-ascii?Q?nFVGNgyx5plY1FSUWtxjlcp5NrPVUFsiAjesWL43sKTNS6ry3moWw3bFMHAe?=
 =?us-ascii?Q?JSvoZxYY5K9ZP6Sv0fP/v2K6xuyLrniY4gNPAnrgZABZe49S+CDLgOiKsxGY?=
 =?us-ascii?Q?kP4mO7rO72Ub0mYbL1hAGGZguMVYGDgDm2fWsOz10125tUlRQnyxrutTLsP8?=
 =?us-ascii?Q?sKa50VM36YxISoHVoIC+wcr229JhBVD5Yv7ClbRbZHkLedai6lsClw4n+Hg7?=
 =?us-ascii?Q?fxmhw1Zmq1wgVAi7ugR8WRxhssGO+REgMM37MWGbqvN5YFlj9WfPMs+DwnIz?=
 =?us-ascii?Q?tmYs/qScVuOIpePuBKfZYb8F8/7zgN3pdyebkjOnOJG/7hF9Kuts8q8ma8jC?=
 =?us-ascii?Q?7NO65mpH0V6+5J4ogKnrxT/1EQ74vBrx5pVgyGOzRHAUkri1443/GvBHFxyZ?=
 =?us-ascii?Q?G6RTGxihQMtkY9IqqOYPZ6jdAnk19suEPhWXUZOLWq04IoBZKxotmXShKO+Y?=
 =?us-ascii?Q?XQ2KfbOX/SDkG6v3RnjQOQokP1gUwus99TztzlvxL2R9hWYmoILMEhwhVUlV?=
 =?us-ascii?Q?iVipRsjdyISegj6MMb4xlr6S3SHOR5CqYJg9+8IScXwK2UDNZufKNMKqvzed?=
 =?us-ascii?Q?j+mF5gBtrCVs4lt5JxEliABEKpdFefENyVIzW3xV9EIqHpIhxrDk5qd/Urwf?=
 =?us-ascii?Q?AByUY9N0K5ILGnwdxX7NxNbTgJJXcePvVFENVW4MG3RcbmI5q9+jLN0dOgB6?=
 =?us-ascii?Q?DK5KpB69ng3XpVIVMkXUzGbb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a970ab-2798-4ec1-c035-08d92738addd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:11:04.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rc3/qNJzAoxHAk6DXSJRU3zTiALRjgVp1xSxDsexUPbOTdvUuJlxQ/8baYvOArxQRUqwyuddkTDZIwLs+U5x7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

detach pd if can't power up as it may be allocated to a differet
partition.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index d87a1a1b297e..95fcac7f73b6 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -512,6 +512,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_get_sync(dev);
 	if (ret) {
+		pm_genpd_remove_device(dev);
 		pm_runtime_disable(dev);
 		return ret;
 	}
-- 
2.25.1

