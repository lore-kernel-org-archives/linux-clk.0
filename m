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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F80DC07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07AE5613EA
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhFDJM6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:12:58 -0400
Received: from mail-eopbgr140078.outbound.protection.outlook.com ([40.107.14.78]:62080
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230010AbhFDJM6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:12:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7UAA9sdy4m4tymb9gBXgP4zxbqU4mX0rJ3GklRWRznJ6VHsUBmQ1TjQcU3ruB/h32Hcdtn2mvl9SYuFUbb41qnrzf37C+8vTkGPBJYYkuFpR2e23ymtUFtJoiivbDe9n7YnHs5RShMFfWtKsfTegunpSmazCZO9LGBgLVg6NgyTayyzgfB5eBuVRrMLSxuPCcqlaewxfYgiX/9yMwGEQbI9CqVAZnDYqSjOZnCsqXqwwN06LuhnapRnuVuBOZrG+7L4MIR5CmTosvNIWWqluZ4yjqojJNtU6sCFpwUOGqJKCU+fYcozSw6fGkZctc6E6WVLKoyadJYQs8RpeTbD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJuMCtNjl4Evz0hxZuVeKNixObtbgSixxvat92YiYPA=;
 b=R6F2XxVnXkOwcwlakpo4FRuMxvBD7dDqON2XipliRHWyDH1ra0LH4bXt7BbQIr2i0Q9wcbjuP9mPdOIgX+B3y8kRpS2o441ec5d5nyQiFTxxAxaqurlUHk/zStBJA4OHMyf7qONScI3C+hvCxrxd2KMp9DYllyzU9YXKMMLgl91rHy3ZotV9JoQYuAAUaiRE/ZorBuGg4TIpERgHoHX7Xq9ph0bZic7LAIlxCxbNCACIEkH5nb/2M7W+0FvxOiLjpDWD2+KnFA2OG9lr8KiaA6Dj9NAAkyTL++fW4srY8KZYBPKnWHHPR8CzdDHRaC6gzc7zbnwwtuJNcX79MRaClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJuMCtNjl4Evz0hxZuVeKNixObtbgSixxvat92YiYPA=;
 b=kkOoJDed4+eLoKbNAw+MiwyxS2dt6WGpWNPEiP+GH2HufTW0OsWDQC/n1JO7gTNieQ9xgFOfdDYsdrVlZJhHObLBDBuK61O7iQaWOf7O8JANftnonTrIZMkDppoyihfuK6oQEN3RIWTdxv/mG79bpG6y+hop4/kIeGny855LAck=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 09:11:10 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:11:10 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Anson Huang <Anson.Huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 06/10] clk: imx: scu: Add A53 frequency scaling support
Date:   Fri,  4 Jun 2021 17:09:39 +0800
Message-Id: <20210604090943.3519350-7-aisheng.dong@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:11:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b24712f0-6940-41bf-8c62-08d92738b1a8
X-MS-TrafficTypeDiagnostic: DU2PR04MB8502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB85025884AE6872B3050A0A07803B9@DU2PR04MB8502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: reEh7o9ke3ewDKq26w6NescjO/5M3ZeOriwRAgyxekO8jy42sjQ80wsISIHfJaAwgNK87GUpWLbffist6xcXJ8Y90s7YD0jGVHBQY6tbZ1vsp6plw3oVR5JRd047X26fCqOAjhJ7Hd+QC/15zzWO8YMF/j9tN7+kE6vQCJgD0W+WGZyK6FRvo0PfBLdUhtS3l58mlu2tJ+ZZTEA6KiXbLJM0RDAlii+rnoTFJDVT+vntQC3XA4ArE3uKuZ0Vwv5KMC1VQkn6WjwoYOpuPfa/9jA/yL5/7bjBgBNY0bWkmsZO8626PEQqeWqBI/5/Q5ONEntgibsZuXVcHNlELr+lLGODXYcnFHbIsXBkoxa3N4z65Jskjph0WKtKr+AD1Sn8SgllzfLA/o+ZF259Z5XkgPZl0e+D1fjUvJuxn6y/7OtaYuB4XMpiIj1L62OaC+BdWyQPw32/mtVUZbrLp60yRkO4dRjfmJIx4nsZO5SGCrTvpDp0XMdNRYD9nMQyjSNwUVSzEv+4wHK5OqrSFi6w3+/j7Xl5y7OPfjH7xG3fkG0wRzY7OsginIa3GL0TZH/FaJ6fitdFsusoVVJ6WkrQTBypLjqgqY9Tb2tVvNnK4FKyv4THZd8iDX0IMLw37yvxLK+mmONNDRWYaC7BtugJkJsVfNW7yfz9v3X/Fh0Fc8I7AFHuJsATvVbZMEE0zwiZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(52116002)(6916009)(6506007)(478600001)(83380400001)(4326008)(38350700002)(1076003)(5660300002)(6666004)(38100700002)(2906002)(36756003)(16526019)(186003)(26005)(54906003)(316002)(66556008)(66946007)(66476007)(2616005)(956004)(8676002)(86362001)(6512007)(6486002)(8936002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?71ZSFyLb9SJs0/2Ky73wlfzQieG6pm0xtOEG4J7Jxon43sLoYAUdZFDLhCim?=
 =?us-ascii?Q?h2sLaVJdL46QaYVjN/rD/P1XfLWhVw+ngQn0RhSuoo1O/BEN9E5W4n3f4E1x?=
 =?us-ascii?Q?mPA9jz/hbFKe9MmldGCYBnweZj4O73UMykHDJX40ldKVnReFOJRRFm2Q9Mzl?=
 =?us-ascii?Q?VHm0+PHXjRkBTb3dAW0hCMZMT4OwW4e3kCJiJY4EP1+KG0Iv+TeDAiF0H4+Z?=
 =?us-ascii?Q?fm6fdHQVqEJdEp0t9M6nHY1+2+OH8Avr1r5jbfMQnGqe/8dYbnrDo+gZDKK6?=
 =?us-ascii?Q?+Glxv9zOdlJQ/IqXutOWL3Z/BjZO08/JjJPTJ6HJA00IpULLHurBhKr6Gx8q?=
 =?us-ascii?Q?1VvVQEskdzFlUEDAOAk9QZqQd3Y4WksIfEuRHCFkAsqnW/Xyrxd47To9udH0?=
 =?us-ascii?Q?CbfZBqpdPDySsb+tzKmxMQWsDsAWG8oMkC62kmxOQQIW0vKUfFes9lbaYPXE?=
 =?us-ascii?Q?VctCuLtNmy4gAhBIW4d34WCsZV7a3u1+QfjuRnwfAxHm1F6//5mibNDRCFDd?=
 =?us-ascii?Q?iBzt/2YIdGT6E9HTrPWAkyBEDR4hPGPluxwsF8UkIHageKBFf769nSmVVlhn?=
 =?us-ascii?Q?D8IqRj+6R+XdHqqznO9qk7NamSzrLh7QCm1d1XfWp42H8mzgtFUXMSEhYrdw?=
 =?us-ascii?Q?w7Y0/Iu7lv5+Eu+cE6UXdvFtAFFzweKCjGTgGRjWfCwUG3ArQVUU8Ly5wIC/?=
 =?us-ascii?Q?oNmSmYaqcYK6S3LyQzk2jxQ5nXfthjLvF0nzMEMrRuW0W+ak4pVO4HVYngct?=
 =?us-ascii?Q?4+YC8qx1NZqhCCiHtg+kWu2jOWHynt/kz+BVkgIdTnLwVt3z86LVAepvwHLl?=
 =?us-ascii?Q?EgHWZ7nwDY1tL328wMlVNae4JZo35jMaQOdcNO+q2U62V03BBUEauhviMAv4?=
 =?us-ascii?Q?JTdEAZ9+EfQozMrFtPSsa0G/Qeg0DxCddEkpEESaSzLIbohvmoyezKNfYKnB?=
 =?us-ascii?Q?mUtijJPFvd/edtwDorknBdLold5PKpqWJe/qOhnvCcz2afsMRu0pYti+YF9m?=
 =?us-ascii?Q?13P+8FWpe2a4r4AYQnhQo6bT2nCi5cFV6OX1vRHe9StQy4LScofy09FK2Bup?=
 =?us-ascii?Q?uuzjFsLvc4Fv/f67jQjHMLvDf5scQZn2uqgnp3lZYqw6IaFQ0dQCyYcTXAj0?=
 =?us-ascii?Q?8mMe/eaBSFNMlK7vU+F8nQrRpTpTsRI8fLuKoscH64kwQE7FfNgw6iuZyFO5?=
 =?us-ascii?Q?KyrkVXS+f4M6F6FDN8U9nXRvtoA8rWrv6lHG1idaU1Cv6SpPtGcpSXPm4Wr1?=
 =?us-ascii?Q?sOjZM4rVWcWL+dNf6nzwmqGges9O2v34zVTQYTGHAYK6eegRzbSxbgvO1gaR?=
 =?us-ascii?Q?L1veVVSscWIbSVWew2wpgk6Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24712f0-6940-41bf-8c62-08d92738b1a8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:11:10.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixEQ/Hx3vu+WfyOTqo1bw0815nbO7QLSCZ4jb+B4kn4okMf2o+jasKgjpAFWNVOKJmcIGm6Fqz7nggHQNPqG7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add i.MX8QM cpufreq support for A53 cluster.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 2537e68ded16..8b3eb58e6d12 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -273,7 +273,7 @@ static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 	struct arm_smccc_res res;
 	unsigned long cluster_id;
 
-	if (clk->rsrc_id == IMX_SC_R_A35)
+	if (clk->rsrc_id == IMX_SC_R_A35 || clk->rsrc_id == IMX_SC_R_A53)
 		cluster_id = 0;
 	else
 		return -EINVAL;
@@ -449,7 +449,7 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 
 	init.name = name;
 	init.ops = &clk_scu_ops;
-	if (rsrc_id == IMX_SC_R_A35)
+	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)
 		init.ops = &clk_scu_pi_ops;
-- 
2.25.1

