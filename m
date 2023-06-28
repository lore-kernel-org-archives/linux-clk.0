Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185F0EB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jun 2023 07:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbjF1H5Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Jun 2023 03:57:24 -0400
Received: from mail-am7eur03on2073.outbound.protection.outlook.com ([40.107.105.73]:22464
        "EHLO EUR03-AM7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231256AbjF1HzS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Jun 2023 03:55:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mo2EW6i1eAd1sjwybu+MbvgYcD1W4YbZhWlK5CjYk9SXy/LzS+6ElF9RAdbDSFpvJPKa0QLm5tZQRm0XHPVTBnMI4SnMbD+7va/UIsvuxE9FWt4nDM89qejuY+nl7IwVv4QKgoVoazDDeemhZpks4tqyJSYL5buuyuh6HowxcXkoGLMFBengY41MKNRDioFRUrDB7pL7R0LB7PauZYSfhIKwezU076Ieo5zVgiuMlUoVoy4Tgil7a9AHrn/io48P2711tK7hNw9VIIoxNlg3UHa/pkf5ubBibICyWa613CGYivv+UCWdkWoYGnvHCV65BD1myLRtIWru7KmRtPaDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2is7AfdIg69MwhhrCL6YNXv0/TKBK1JzfwiWo+XrxX0=;
 b=k9ppgP0Kfq73y11Vp6kJ49DZxxa6KAunZHbsXu5S05zzhKs2Cz/LPLdNxRGbSurdBe5b6+ocihtu5GopXNxwiUCv53WT3GQP166xmQssMEYY+n75/B6qUaTJ7bjyL6FtNWr6Xgjle1K5rHtvl1JTfWfOs2yDqNcYqqp9XaixKMwrX8tFp/+vBSkQGEUw3+QBJRdz8aYG6Uzr1zso3VAg/PQ+MhZ2aT7qFXl/CjjeAkp+ZcN2QCibvCjvvls8SlEKn77tqROWlfOTm2X2HZ7HO2M0tjryeZnfw0ICTQFaHnIqnMxvhHRjr9PmI7vAFUTEdc7i07fUfMaWr1mK7GZhuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2is7AfdIg69MwhhrCL6YNXv0/TKBK1JzfwiWo+XrxX0=;
 b=kLphK6NkZ9G87UjFEuSGCURirWc+4lu81g8WXQ4wzt7H8LI9vXbVJYWt4J2HCSpakI1kewZUWeRIdRAdtAHhiukUO8plOPmMnaNsC96f7BOOGhMlgB0VQPxunlXgmWJC9rNPSkVRluiRbPqIHu8TsbIz7C5gecPD+ICSx8OYa6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 06:14:03 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::4ecd:8d95:3543:cb6d]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::4ecd:8d95:3543:cb6d%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 06:14:03 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] clk: imx93: Add PDM IPG clk
Date:   Wed, 28 Jun 2023 14:17:23 +0800
Message-Id: <20230628061724.2056520-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628061724.2056520-1-ping.bai@nxp.com>
References: <20230628061724.2056520-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|DB9PR04MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2484e5-250c-4f9c-b3c2-08db779edf08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjigYHCTQs5oswdkWIiJeu3VQ+is6I6uzObNiXTQeRdItlRTqYr8kby+1fI0jZYhKVLoJvTVsD1K8p0NRDomoQ5M1zTrsZL0CPpggCQNu6hO5lP/y5p+N916B6D03U/7wGJcxj4uIOYqpjRElCDQIYMnRV40NsL7qdyyT+Q1/mpf664vspqd2ddwfK1d2WW29awB3cSoRs2dNUbd/FPAWHCwnEB9hcNHIG5L5Uj6GZl7zCvVAE7B493912Vk0nfZsDHF4ACb+ad5/PFYE/HjulTj4Mw7BPSzIk47cWt9tsHSPccvDUdly/CrSprGMIEBEikwZ0QYH8xujeEpMIKsdA49tBCTEic5s5BpuF0SsjyiatxM/7F4YA/Wn/l+aQYEogxV2gxg+D3cul/QlHL7ND3zS05yfxUoREUsSkggh+/jnt8NMoCTXdS3d0RQwzHAQWO0DlEP5XEwC5nx4Ts7x4wjA3Sn3i4zCTqSMttI6DjyO0MC4GluacJqIkkPKwhEsLPaQHD1geKr1wxXbrAeMSnFrssDrQcHRqrWlfiOWCouw2h+T0MeK8+uLuFPrYmVeko6853rQ63TzME0DdsrEPh5RMaUpqUw9CUTX/s0ipxvjOSZ3OR7eDUnnwwb8Xxo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(186003)(26005)(2906002)(1076003)(38350700002)(52116002)(38100700002)(2616005)(6506007)(6512007)(5660300002)(66476007)(83380400001)(66556008)(66946007)(8936002)(41300700001)(8676002)(6666004)(36756003)(316002)(86362001)(6486002)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pAn/eLszwW3dheMdF9TXnqvGkdaSNgF5Iu7KCRMOEn6WVdv+wEwkr846intM?=
 =?us-ascii?Q?cpH3eyQOmTPdw5EC9Q28yn+R/F1vJ8kfNSdgXQiexCXyeKGiO+qPBDVKSQA6?=
 =?us-ascii?Q?7NVCFBtKXrOqbeRHOmqRrfUsUnbY6V8cl9t9HFxkiXRd03uKmR6AvdfgLjwt?=
 =?us-ascii?Q?TraY8sWgxJftSq+kH2FGA0eUHunx25EbJzcGWtK3+h2154EofMJRvQg3puPg?=
 =?us-ascii?Q?9zHStfA4J9vTte8MMz/0dPTfJKNfN5rOz7SVzGxZ4cDv0OMp/BsGT+gYzI/W?=
 =?us-ascii?Q?O8MvJzKwCq664/VgIpGLBHwDETlgUu4XoAtlYUPlHX+TtjQnst/De6MX0TP/?=
 =?us-ascii?Q?Q6aAldDL1L4pVCFoNK4QBsTBdpNAXDYzsZcCufMUBc/6xN+D5tqGpeFYSGaf?=
 =?us-ascii?Q?gPqQoDMODi6oJ+4dAHDlnPGkrSU5by61d21HLwE7rYFAoegjHXNbNsGG0of+?=
 =?us-ascii?Q?NEqLs2ysXPJW/hn6wF0bxpMVaK7oucMgQ0UUPDIx68bDPwM/rRihN1v7JY5y?=
 =?us-ascii?Q?F0aMYpEjEGjNc37fFEC9ZNVV+pQutbwmBaV9KpDcNR+CE2mQV3cpDlgQRPia?=
 =?us-ascii?Q?5Ncz2RGomICwcdXzljeMHwAoQ8lsrTiM/vDT5h/piqyDPU7GIRg253/t/9sk?=
 =?us-ascii?Q?D/dwW4QIiru8RVvZ/u2pEsGqJ+Hi+gMhrIpvlHLZiX1oN5z0Wca2DyzHz1du?=
 =?us-ascii?Q?knltiz2gwK/OtFHTc+WdEiiHjmSNuBKfXYRkVF5MZmhWzDtNYPdVl2KEdl5S?=
 =?us-ascii?Q?aNUHNSm+mD44vP62H0Ijo2ag8QHoGozGaNKsIqo6S5CwWdCReY5IiSDkMOpZ?=
 =?us-ascii?Q?XCT2Otp4ZZLW0+N0RXvPfrIhTv3S/WpUGKClrSQBIUidVTxjtidy3VQIiBTv?=
 =?us-ascii?Q?GVAURD8BGmuSxRFmukX8XU4GbSKZ9rBxEkFvgmC8RA5nSCvnQ6nzrIVO9WcB?=
 =?us-ascii?Q?kz9iVVahe/YUvZyIB3jfuXCyAa3Alei7KR3KAtGCaKdFV7itPwDNfRWgid3n?=
 =?us-ascii?Q?RdmeMN97B4HUg0ZIdJ68JlA7t8tzW50LWQNipMrqFGVMLsHVSOCS0CdjVNTR?=
 =?us-ascii?Q?xrjUegLVVw3PMCNrUZE/8fjYHk2CXpIrcVH1CTHLpBV3tLvzlM12wC4Nxrlo?=
 =?us-ascii?Q?6tHcU9gEQTeGzFD5h0l3tgCogc0a7m9+fVzv9Ksm5zD/h5URLh/Z1NsVknJI?=
 =?us-ascii?Q?gMqKRmJe7EgTlw78xus2Rc7ScZ6VXJCOG3r1s/FyNv26cUVOGTDja7KuTXdm?=
 =?us-ascii?Q?zErU5hgKOzr6ykbOEyk0d/hl+3XQUovzudwkzV29JC/qGE2wSMC+QeMC3Acr?=
 =?us-ascii?Q?ljBMBIuPyLnqyhBwPkmrGccqLI4vf5yt9pyYz5H/jwa8h3kB8SSSrSVosNdl?=
 =?us-ascii?Q?Q2rB8NKObzdvOrV87mWFxDVj47Iaj/OX8KR3QQttaVCk5mMUaTxrJUyNRCKL?=
 =?us-ascii?Q?yP1ja3wbNavD6uhT8x4ywzFFMzkP5S93rXfVn6xBlMb1/PnBc47zIPqqNNwq?=
 =?us-ascii?Q?fFS+vI5c3HqI3EJCURj0wpQfho8RUlrowfUFJo0kDt9GG2plUvQVO3Fo3xhD?=
 =?us-ascii?Q?2QN55ZTVOGkPpE0j413ClVJy3KPQSLXIqcRV111N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2484e5-250c-4f9c-b3c2-08db779edf08
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 06:14:03.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhUs2ZQWxz3rtvkTx7lgUKM2kwW+VCSYcJ+/6mdAW3j6uixpJOc9YvGTG0/6+2fV2cwHXiq+abcpb66JiJHAZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chancel Liu <chancel.liu@nxp.com>

The IPG clk and MCLK of PDM share the same control gate.

Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index b6c7c2725906..f5dc1ee4990d 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -32,6 +32,7 @@ static u32 share_count_sai1;
 static u32 share_count_sai2;
 static u32 share_count_sai3;
 static u32 share_count_mub;
+static u32 share_count_pdm;
 
 static const char * const a55_core_sels[] = {"a55_alt", "arm_pll"};
 static const char *parent_names[MAX_SEL][4] = {
@@ -236,7 +237,8 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_USB_CONTROLLER_GATE, "usb_controller", "hsio_root",		0x9a00, },
 	{ IMX93_CLK_USB_TEST_60M_GATE,	"usb_test_60m",	"hsio_usb_test_60m_root", 0x9a40, },
 	{ IMX93_CLK_HSIO_TROUT_24M_GATE, "hsio_trout_24m", "osc_24m",		0x9a80, },
-	{ IMX93_CLK_PDM_GATE,		"pdm",		"pdm_root",		0x9ac0, },
+	{ IMX93_CLK_PDM_GATE,		"pdm",		"pdm_root",		0x9ac0, 0, &share_count_pdm},
+	{ IMX93_CLK_PDM_IPG,		"pdm_ipg_clk",	"bus_aon_root",		0x9ac0, 0, &share_count_pdm},
 	{ IMX93_CLK_MQS1_GATE,		"mqs1",		"sai1_root",		0x9b00, },
 	{ IMX93_CLK_MQS2_GATE,		"mqs2",		"sai3_root",		0x9b40, },
 	{ IMX93_CLK_AUD_XCVR_GATE,	"aud_xcvr",	"audio_xcvr_root",	0x9b80, },
-- 
2.34.1

