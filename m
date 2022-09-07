Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702D2C38145
	for <linux-clk@archiver.kernel.org>; Wed,  7 Sep 2022 10:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIGKz0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiIGKzZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Sep 2022 06:55:25 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409674056D;
        Wed,  7 Sep 2022 03:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMRbxefo9DtGvp1nPUyMwnmtObCL30nhaio/aSoBsIpbSSloZ+OV64SQaKCBtm5dACxh+NdCWFDaDl6L+2IbIMtcdv34k4ZetLjmhBL+811St3KNoDqMf9lGNK/awpY5j/MIB5a0zTwJCNIbSIHEUYe4v8I5SlKEv3dnmC5CbVgJ2Is3JEFFubfzVPHuREvHildz8HeZNyAnR86o+q/loQ5sMMGzE2QWizlL/DZfA9yUv8QlfE9Z6bTeoqQtxF0urRQW+M+YcS/IiZL/aeyHLonMtyec0o/lw+rv4JVzcytUwzScyrjmDu4XI1tsR263KodUFKMTqrAIQc8szo5h3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKKEfcZ1bthl+coW9fz7Rk6dRzrtdFkLzLY8AWwPask=;
 b=O+YvJgtWo2rYlpL+arXUzkXmYSEkqWR/3MkqjLy+V+1Bjffcb4TG9iNgBCo8NwLs06SLDm+CWWY/I6qzx9WOSUyc2UwUDV0jOjxbO6WUlmM35zmYIo97XgNSQeb/SnF4vpklwtwVf3vgD9iNFlm3e+Y9yeD270X0eqtQyRx+2e9GB/y6QYC6qrzB3OL4UAkCoFyHD+wO7gD5c+8AxPNBu+G3Aix3t2hpzDNN8geTeVTEkx46aeL1bByWIc4LUgrkJyEJ2ElkW0a+uJ19lF/QZyQTL3y1UpmggsgEOqxOONcfgpdB1kUGbO9RV5DHqv2tTFoNE4c4jEGis5IFifAoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKKEfcZ1bthl+coW9fz7Rk6dRzrtdFkLzLY8AWwPask=;
 b=n6n+dmgCMSSEb1JlKJnw6wcpJ4npv6/LkIzODwock5rwWblJxT6L7YD+uiT07OLA3lr8HWOcItYP9LY3bXycjf70ixZCkuqzjo+PnfyUyneWSwKkmRv4eC+vFH6V9oRHMDwf55xKyJkWXGS+ykXbVil5usl+JkTgucedyDrCrNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DB8PR04MB5628.eurprd04.prod.outlook.com (2603:10a6:10:a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 10:55:20 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2%9]) with mapi id 15.20.5588.012; Wed, 7 Sep 2022
 10:55:20 +0000
From:   Li Jun <jun.li@nxp.com>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
Date:   Wed,  7 Sep 2022 18:37:07 +0800
Message-Id: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::20)
 To PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e8a3a26-bc26-4f7a-21a1-08da90bf74d9
X-MS-TrafficTypeDiagnostic: DB8PR04MB5628:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +WE3vFDeoqzc+WeVp742oiv34htlKt7KtjhFmAR6i/WIathsR6A3KKVghH6UdyjkaaIlcaV68r+27kCbrZkqZzFrCLbxhm/KFj7ZkPWEARc+2X9UJFNlBwcNMwy5iHbDwc6u+PoKXzfd6ipZCeDevpY3LpxQmznCKjqTkS/xOCuYk2qbyh7dRznzGE1Fdd1PxyCwIHF3sC91KQswsqWQUgMHwCRmGhURZlmySW10SXEngnmZ/uKN3LDZ8qHNZrepkLlKRP9CqwTuH+NiI/0oPym8Nbk7gRJ9Ix9ug1Hv3050XH83/xV85Y4+Id5QVsvB3Iku9q4NKLvnn8yo1BwQ3OVBVTFEwXJEf+WJWK9g45wwBYRU3J6fNcbjvkTxuW5KpDRmnwu3pstBrd0uJnHo+v9QcS1/QbR1Mh1B70vz737ZSGlYXmQ+b/jI7h7x1o0eCVKp2/1zbTII9iVKJe09R/JH+btvsNNKp0SK/q0Q1vEbYhJYiqGBHwVx74nvf/K095nXftQf47pe1slI3mBSeRYjgas3xHPrxKG3Y59+viSUI06IlfFoqFTuTtdGusGitAtuJo3A8N0RevJ+UtftUudtExhTlQLHdyciH/X9sjbL5kaHroTINVKvzWM46jpMtyvOSRMrLU6ObrhRKTZ7LHqAKm/g320ZutBC4SPrqOSS2N9n8bOS9SO2wS0vrjm4kPuZHaGASNNuEEI4133hwmkzJchIpRHP+D4zeqjlmLhl1y6ccX5t7iO9Dt8+pOA51ocKvT4qv+++EfDu67TzmqBaZ+y4Sy1b/fV37VcBDDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(5660300002)(8936002)(41300700001)(26005)(6512007)(15650500001)(52116002)(2906002)(6666004)(7416002)(86362001)(6506007)(2616005)(38350700002)(38100700002)(4744005)(186003)(6486002)(66476007)(66556008)(4326008)(83380400001)(8676002)(66946007)(316002)(478600001)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SYSy8jC6KEnezdfIYaWwTfwpiCUKPOSnP78NDpxgffVWZ3XGQs0Kf3sVM3zI?=
 =?us-ascii?Q?IbmWx9QxF5KOPDzvqFAkW0ZPKfleGBhfqMabSLOCxnHXrXKEOjKbbFg5j3tg?=
 =?us-ascii?Q?5PyVfxFHzm3V6F2TEWFcVJQJxGGAoh2C6IKpBOoGUtXsMQfN/JNh8pM5ZkVo?=
 =?us-ascii?Q?bcV8vHxhZ3Y8ekOTHjf8Zkd+OOKPJgdfnWzs8YBqQiBmOeGooAaUO6FRYkMl?=
 =?us-ascii?Q?nDHL7Nhi/01PCEpwAkg14D1cTuv949AVJJ5xyxbRrzTr8cKF0zIDRdrEuSzb?=
 =?us-ascii?Q?SContlmFF8yzq8wHVJa+muh1zzLSDnAeUp+EqoP55WRQ102yzmW2VDZtUWmq?=
 =?us-ascii?Q?nnMp2T+c/ToR0HuD3f9nsPI0IunENCfJRVFEeTIESohXclPaN1TKZdFzisti?=
 =?us-ascii?Q?OBxottmPcPWxZ65TmEQuXhGprvZs5Ey8yH0zIJ7bsVIodRzYJTlY9ICvZ1TT?=
 =?us-ascii?Q?LKW4QiNPWtIbS5FdYC6UnSsm3BUxNiF8bOgFXXYxKtVuhPN+NI+Ul5nu7uhl?=
 =?us-ascii?Q?jfSSYHoaFWHCgqzJOB5dcsAtywWOnJtm0akKI0QSxSWZ2Xuyydgng/JAk8u+?=
 =?us-ascii?Q?MwRIknshqjqYwZzdZ71FEDgay1+x5IQDsinK7usAAC8kGPs/YjROpNcHi/QM?=
 =?us-ascii?Q?lRAtsFkHjMGne3bljbyVaR4VQyQqmALDcYO+EF8U900+LhD5ea3G5MaAd04s?=
 =?us-ascii?Q?m9U80cSJiAr/4oscF9jeUBfuuV1fTTKIhhIhwZcv4E171UXgw9C/8CPOi3Nw?=
 =?us-ascii?Q?bGijVL9zspirgQGCcON3hl7ATHLXX5A60qHWoBRxs626z5RasxNZ0tgafo7M?=
 =?us-ascii?Q?eeuNUimCXBr1sczlLZpIf4vLUpNIHHYnOr6oN72bI3dtd55uLsKviyZ38qZD?=
 =?us-ascii?Q?anjTlRfUkBm/qWICWkvogsjxUZKgOFCJoyvKb3alrn/9Ao+7lO/ymPMZ9j9o?=
 =?us-ascii?Q?cyFB3TDCUyvk3ERCo/FI2T+F/KdDp+PG7monruNDRNXXCjiaG55FKRPj7ox3?=
 =?us-ascii?Q?HSJw6tHVv2n92Up0P5RKjLTRknstbJGb+kgS2meqflIxQ7i2AfEHwCwIWTRG?=
 =?us-ascii?Q?gPJQQvp9HTXmGQdXmD61yYgSzqR5Fp7ybaPlVKHAB/KqFpsUwHqVCi0Ehrzx?=
 =?us-ascii?Q?QyffDRfB3I2C00MfBLRqnhdPpqk0mtnte5eJpCug1/oBTIxumgtmJtF1Df8E?=
 =?us-ascii?Q?hB2eUwq5me+rWEfm7uvsG1tJMOwEHCtnl6N2MT+HKe81hLjvlqpuFFbd8eh5?=
 =?us-ascii?Q?VSvIj++PVB6pWfJNAjsshEbpfNYB/OObv0LphlO1f9FJtGrRdonzivTo0z+8?=
 =?us-ascii?Q?l3AzrcXxsNzC4jJppWjtXyyRCZbhhGIgNyHfbXozgbLUoWuDF/LCj1pTyDl4?=
 =?us-ascii?Q?AErCB5oGwfeeVMO4mTv5pEGKtrycUvpPHmIFX1ZDJBpYEPodN+jNPDeJ4PlN?=
 =?us-ascii?Q?9Mb5idlrEBkFGAxvyMvJSsdxWmNeduUDwyKb1Z5nlDzdNZ76kZsB2Vy6QGP4?=
 =?us-ascii?Q?ZTG7ocGu5SZJgQQk0kqMHB0qt4SjCtgox3uyoOogPc/aJbyHE9XGxsRg2luZ?=
 =?us-ascii?Q?2DeAPUsEXBSB4Ml9SPo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8a3a26-bc26-4f7a-21a1-08da90bf74d9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 10:55:20.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBw/O4I4WtrgAXBWH7yKexWYssayvf5l9Y+1AUSQdlyCFzh39srvPodwHPpjXfZM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5628
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

usb suspend clock has a gate shared with usb_root_clk.

Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
Cc: stable@vger.kernel.org # v5.19+
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 include/dt-bindings/clock/imx8mp-clock.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 9d5cc2ddde89..1417b7b1b7df 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -324,8 +324,9 @@
 #define IMX8MP_CLK_CLKOUT2_SEL			317
 #define IMX8MP_CLK_CLKOUT2_DIV			318
 #define IMX8MP_CLK_CLKOUT2			319
+#define IMX8MP_CLK_USB_SUSP			320
 
-#define IMX8MP_CLK_END				320
+#define IMX8MP_CLK_END				321
 
 #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
 #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
-- 
2.34.1

