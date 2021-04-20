Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12784C433B4
	for <linux-clk@archiver.kernel.org>; Tue, 20 Apr 2021 05:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA68961007
	for <linux-clk@archiver.kernel.org>; Tue, 20 Apr 2021 05:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhDTFpq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Apr 2021 01:45:46 -0400
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:13540
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229450AbhDTFpq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Apr 2021 01:45:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+1BCzEcMRMMtL37nGWp2ntop0mDaruML8MnOGCaaULtghooBRDpAoF4oREM2ERmScSGrIRJZgkjpvgZuK/VVD0XWLBGM6qE12Ul8wNcTuei9QGz3znkYaVi65R5GTCDAs9bUzfwERFlIFS36w6FIZlP55uXCAeDf71umOnH+uMhYuruILYJRVz1Lf+dGiMxYlSdES10aDSxG2H9MoQOBW/if5s5A5+8uLsYhfmwr3MqL7u88TCe0YHK/i//SkS1RzylcwVIs4w8+JZAWnwBZFCKb/XbgYPEaRK0z06+Awe4/Myx4f+sHGa7IU/uQMqfbJenLPUakJqWuwU5ZLA8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yA3ZAT6rdUozt9Xi14XeoT7pwKdHOiv2qFdUf27x84=;
 b=JSrcSYXpNdRl7eDB+TByPy2DRQiCxW0QrY8pQ9pzLNH0nTbM+GXa3L/JNEqYI0NXdLXAKf1+HSqOQrdNPIlViaAzcrKd4yk8Cxp0gYiXmrZDk/efBd6G6ro8o86QXFCrKsJ3k7DbTKCfkXUMzqM8zxRfP4RR6ROFNpq2vmJsrBEzg6ikJNpCxZMyzeMLPuDKsWQGbBoYZKg2ILf0mhVxXrh66WSKbs2+RBio2W9Sa3jaUC723Sza2qX+Q3SlZKrTH0eOTYhYAcSLSrd0g8mrKyVSfU7OpOm2uwcxy+PzFzGdMya/gN3fFwjUUGFgRxyrzPRWDdPpSIHS1IejAyLpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yA3ZAT6rdUozt9Xi14XeoT7pwKdHOiv2qFdUf27x84=;
 b=elVQz5ro/yjqPqWMIYZwjScvEDpKxsU8tOuKRNb6zqRyn2wY8mlO7C58foCxpCrukIo+CVxOHw/kAxpriUO7B7sawo2ogpNSCehGo4+v7CpUM0sRIpq3Pxwl/ZjmxR8oxw1YcMPRCWGHr+TQ6VVnsNkTx3AmKJkW5kuA2KGHFrc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB6PR04MB3013.eurprd04.prod.outlook.com (2603:10a6:6:4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Tue, 20 Apr 2021 05:45:12 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274%5]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 05:45:11 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        s.hauer@pengutronix.de, sboyd@kernel.org
Cc:     festevam@gmail.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v2 1/2] arm64: dts: imx8mp: Remove the reference to audio ipg clock on imx8mp
Date:   Tue, 20 Apr 2021 13:54:52 +0800
Message-Id: <20210420055453.1235297-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR03CA0045.apcprd03.prod.outlook.com
 (2603:1096:202:17::15) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR03CA0045.apcprd03.prod.outlook.com (2603:1096:202:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.6 via Frontend Transport; Tue, 20 Apr 2021 05:45:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98d97b7c-baad-44ea-dd29-08d903bf76c2
X-MS-TrafficTypeDiagnostic: DB6PR04MB3013:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3013F16399AC243A969940FE87489@DB6PR04MB3013.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bx3J7IrzQm9D/ywEZDHi4a2uucZsllCYQfF305Z9KXr4Quot3ojtkcTHyrVx1DiUmtclQDU2QdnbI6Dv+G6EDDlnwPYbnqpSaJ79oIJ3S41UesRsw6t07QuviFxEKpf8MtuuljDxvXnHWOK4hhsXEjVLkVuDqsAdLTxhcLaoD36bZfOX7cwoLmn8J7SzMylgBKPx4x/7KDzTuMXAr7NaDrfFTeYV0j3zlpGM8aCTsP4DosLVDXRhtAMqliS2uH1XcfSsG7HOE/0bm7puBb6RIO+9LqBAgwE6Jcu/4IvctneFd6stdzMLd12qXFS3DN44pVuYjvaGs70Y5PEBmzg0oiGCZjJQvARt5/PQ/H7asYCtpESFQBB0JAeUpyDciWw1cYr7IYPKJK+XlQElEqr+csKkmnUw2nlBFc4V6Mgd2ooFpLaNRisdowD4vtU95IbY19YJdJZPnnnU2Dur4fwhBJc6kGh58oMzvr4KDo/YOEwuVMp3kUtDzYpoe2LzTE4RtfOP/7FvHOR1NMHchCzLVH8gZem9jjRqDss982Hd6H0mPVzQPtVOtFFpjigb3Kc6OxRBS4ImWTDu+KWYwglS1vn8KXbEhwNYHLmQ3IXl56NfkWu28vJt4/MzMUcr3nxdH1La+4ZvNO/ig0GUjrq0AaZokyXgLaCmHR1dsyyyF52bK627O27mcdwskAC/uQ2O0soTNHdmz2spdEcEIjJlig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(186003)(1076003)(16526019)(38100700002)(52116002)(26005)(316002)(38350700002)(86362001)(6506007)(83380400001)(956004)(6486002)(2616005)(6666004)(66556008)(66476007)(8676002)(36756003)(6512007)(4326008)(5660300002)(2906002)(8936002)(66946007)(4744005)(478600001)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s/T7HKAtYtoeyhQEgigEha21v8WrLroohFZAb8TcQFK2l9ixLb9At96frSmL?=
 =?us-ascii?Q?GMt05iyQ05hV0oWpXxGWrq1Zxyhrj1mov/p/ON417FECvklgASXn+iCkzx4p?=
 =?us-ascii?Q?qIAJttcpVlFp2fMZzatElD9QvnzpLkCweerwyPbPcZIWHVixXlWw4xOZl6bv?=
 =?us-ascii?Q?jZ2Olz8udhSoKYHes9UyOf8fSRA0bVDLcUKGWOKeU/gk37ONJ6iODO/FqcOH?=
 =?us-ascii?Q?MvgS3HQ+1l4d2yyLC8Pf9TZHEymPzhim9xFT2LM+Xb7ngASoSp7hgUDRsOsl?=
 =?us-ascii?Q?oDVQkyNZLAicJx0rREaIrVo0jPnxugyD49vWBqB9B0sIGj0Gm7sW/8Zk0Nv3?=
 =?us-ascii?Q?XjhW3AXrgBGUpXU4YfAwScnJSYgHUw3+FXWa38vDMrhTAtxmnoXAHDQqPQaE?=
 =?us-ascii?Q?lIROJtb9jUaDnD/nZv8cVkFaVkdAct9pGKM65UbSJkjrAeb+FMoxjoXVTxoh?=
 =?us-ascii?Q?NKs7IWxTkTOJ620ZMJl+DpGkl/e42HAhwc1TEs0zw9+7dv3i/UvIKGO34sGT?=
 =?us-ascii?Q?D0RtXifQ2D5/3ZdWFrYXZ/KTK1TMsFNqpYwT+Qow2yRb/9OQ/1+VM17F6y9T?=
 =?us-ascii?Q?ihCTkLrhx5SvhvwmEuBUzTeI6SKV1QMScWX+acF5Q1oQlcKrFuDF6gEw9Rk3?=
 =?us-ascii?Q?7ic+Er1HQ06T9zQ3ymCLWAs/8aax4dGdqm2j8EoghPb9W4SvuLeqmUTooziD?=
 =?us-ascii?Q?EkVClnxNaUeOcm3P9VNbaHrN6y6b3WzWAQPBQIDgT0QG4ztHKQEmKpTMAv+O?=
 =?us-ascii?Q?qruHuMUWSqX17yodu36uF8ee20k5duHP7ep5tzi2ERYL9AE6m//aTa0Jh1Gh?=
 =?us-ascii?Q?+e+CvH00jDl66cyhx/0WKsOlGAvSnvHc6o/LDw9IYOV2KBYZK2wxnVRLDMmG?=
 =?us-ascii?Q?kUpHpXHCiyCj8WQ3wFHzzjlPenw/U4ZQw3bBdChV9Nx+V/4IFNFuTA7Xt59i?=
 =?us-ascii?Q?qE3OUWZ6IgZCOdC76C7jCZ6vhJCKOecFMch7a/jjDFSo9JVcBMqOtWegPPKi?=
 =?us-ascii?Q?eGcqiIJO+HbtsxORbfJvTjbcideJtw0/yltbWw/BoNlo6654xVrj4ihSQU+v?=
 =?us-ascii?Q?oPmLnTEwVhtLKn3Jx+XedPwxJSxrsZP/8c1ZWS/pTOgSQKZIUPlR3+pv1WnJ?=
 =?us-ascii?Q?XYrpCx7entKuGsrSXuUmxNc7Bi6hBeIfX3nFusyDWcLuNzJpeOArSA39dBnm?=
 =?us-ascii?Q?6aAptOqcV6OEpjS7pZwbNP3CAsfnyPKgTr1UgHoQIkd0qbALbPawjmnIFIyI?=
 =?us-ascii?Q?7Gl1uKNpD/7u09ka853nXhlDtUHBeRcaN10oBJebboskFu2HS7B66Pw0JWWs?=
 =?us-ascii?Q?Y5qBUsXKV06kE/P4dU1fJIV6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d97b7c-baad-44ea-dd29-08d903bf76c2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 05:45:11.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GgRiKCMz4PThbadBKDdXg4DtT4D8SMrnNnlW63LAeC0ytIbuuJKeDBy5JHWMQ3aRhQbX/A9bi5l7AvQoAKWGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3013
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On i.MX8MP, there is no audio ipg clock, so remove the wrong reference
to this clock in dts file.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
- changes v2:
  no 
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index c2d51a46cb3c..0283c22c2bd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -407,7 +407,6 @@ clk: clock-controller@30380000 {
 						  <&clk IMX8MP_CLK_GIC>,
 						  <&clk IMX8MP_CLK_AUDIO_AHB>,
 						  <&clk IMX8MP_CLK_AUDIO_AXI_SRC>,
-						  <&clk IMX8MP_CLK_IPG_AUDIO_ROOT>,
 						  <&clk IMX8MP_AUDIO_PLL1>,
 						  <&clk IMX8MP_AUDIO_PLL2>;
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
@@ -423,7 +422,6 @@ clk: clock-controller@30380000 {
 						       <500000000>,
 						       <400000000>,
 						       <800000000>,
-						       <400000000>,
 						       <393216000>,
 						       <361267200>;
 			};
-- 
2.26.2

