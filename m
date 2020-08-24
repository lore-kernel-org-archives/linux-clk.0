Return-Path: <SRS0=ipkz=CC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE8AC433DF
	for <linux-clk@archiver.kernel.org>; Mon, 24 Aug 2020 07:43:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ED3D207DF
	for <linux-clk@archiver.kernel.org>; Mon, 24 Aug 2020 07:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UBLyP0Jy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgHXHnI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Aug 2020 03:43:08 -0400
Received: from mail-eopbgr70087.outbound.protection.outlook.com ([40.107.7.87]:4324
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725730AbgHXHnH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Aug 2020 03:43:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEvwKmFAbRrpEUYFUOHAhBa9JDSgz3N+68H/0orz2vw0fVZeARQXKVh5+0ab/BH5VPim0gl/ESjDwCUPTvnN7SUUttwvcf7rysxJ4moJcn9Y1sOzHYE4wEZIs76bjWGYIIgqWi1r+ox4Apq4W8WXoydVgKGN0DecHEwsTFr5b2syHwgzPcg/2aY9cfkg2yDVvEtQsSaeLKKJalYG2mWczFLvZVdhXhfQcCDhhNMrj5meEc8SDTU//TKDYY0JpAo2YLTESGjofQ6Hwp+6dOO3s4WkYkys/U8luqZdpXdmIYZgIgANAhUFnAcIKD/5Vk4fBWeBBMDsfwEC47WTGnIS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0B4k4dQbvnffoB8TyNL6hjlp4Y6jRVk/osCy7nOplw=;
 b=BPX8M0ntRQC+KqE0BZsSMt4DdaschMt9TAfvLpqtuc7Op8YCWZuhzU1U2BQ4sOWHBGq45WUoAe3Gs4LP7QJE5e5633WHNitNrE2q5fgSij7btH/teF+ensc6QCtiUkeggWuSC/lF/1biH9oob/pX4WvHG93mwb1jBknMhCxzBER+fK3viaMiZavaH8JctpwiHXp1eT+5evg6psBmon92iIypnACToBfZwW9Rf2OjDlXzS4SaN+C3cWnnHjOjtkrsdwKxkXWZDB8D/I7vEyUXrMW3w7240fOANknDRftJULwoszwllrfe5sFCXpR/YvWmGGXLPoocEkvuyXhyhVWh7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0B4k4dQbvnffoB8TyNL6hjlp4Y6jRVk/osCy7nOplw=;
 b=UBLyP0JyLYq2T73SleuXmvVdh7l66S4PayRnNUf53CXgW8JpT34JTh5PXUP7hq8RDdv+qKEHADb1UL+TDUcb48F5Skf99d1guEe1WSgz/Z6vImEytCcZi4YlZd4qWf44sC6LS9XIcccoCpsb0NyfbtnTKfbkGKiB1TfqCeChDg0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM0PR04MB6083.eurprd04.prod.outlook.com (2603:10a6:208:141::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Mon, 24 Aug
 2020 07:43:02 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3%7]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 07:43:02 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, robh+dt@kernel.org,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: imx: Correct the root clk of media ldb on imx8mp
Date:   Mon, 24 Aug 2020 15:37:01 +0800
Message-Id: <1598254622-29340-1-git-send-email-ping.bai@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To AM0PR04MB4915.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR02CA0083.apcprd02.prod.outlook.com (2603:1096:4:90::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 07:42:59 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0031bb5-6c08-4ae2-7eaf-08d848015445
X-MS-TrafficTypeDiagnostic: AM0PR04MB6083:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB60838E1A341B118B11FBA06587560@AM0PR04MB6083.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mx7w7TLX0yHYSd/XTgzMEDmooP1Fs487iv/beA0jfRB1vKMAxWZsDm4HHp74TBu+AdPzwZD9yTYimB5n5q83Lb9loOTceJZZMgvZR0oFHeHRjQ1VQ/CLID3FimbXsDyjEi8LTaPIoYruCVkeY+DD9SFafg3JlmBVT1zBJbr7XROFQgWmiaXDBYYX20PAK5kBhmf7pZfBIgj4Y/QnU2rvIlO0+w1dZyD/dkvWBGqxcCDiBz4R4EsscVZ5OYNK3s+nS20O7sXEoH+uiqQU1lTHaH2XUFq5429Il1Z/QCHznYBD1Vd13enYOxe3kqNY+PRHvWFmVO0ZWvXW6uHrATGUOi057D1iDoM090o8Z3S/EnTpJtEz4cJYJjidxx4gUqPY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(52116002)(66946007)(8936002)(2906002)(186003)(16526019)(36756003)(5660300002)(26005)(86362001)(478600001)(66476007)(66556008)(6486002)(6666004)(4326008)(8676002)(316002)(16576012)(956004)(83380400001)(2616005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /+M/p+jSIPdVamZTZwdXRQT0RjG8nX5399ZUT5X6qYydfBCd2P7O0mBxWfL7e/dfopv8wcjNJmh7p0udinKrpml5rqr2KaloopiWeRzD/OnNDNHAU15U7f87Q0JzIvy2ANSh1SCGVJDVjxDxb0wahHuaSpG1K/vGTpID3kvLP0ZKSSrhNKYdzPY+ZYTt5doM4lZ/DeCeIc8DD2cFSrSlWh6U3iaaZp10HUV3aeeFBKDd1ahrhAieVyyWfFJIpS11Scvhischh+cgH77qM/6qduIoCCU2iJZYa1XG45JGyanO0BsP7LV/1oCBfzP9hcM67X4uGimpEJQUce4zyiPBDGf+kc847yQRjRIwPpf7LSZXm3JABGh/FkMFqBaRCxZWO2zV4uEYMYxXPtCHPVx74WLVJVGVXHgDNk6P8NIUhZBwMh3rnSBlHTgEgO4myKoLWozxnRoqJHMlU2DgDFN90hv7Bncs3yxG9L0LtzObd+wK13ZLCTtb0hooKt7BIJFHFfAanB7ByISs5Hsbpz2SLWlaQMhYh01QQOP7JNm+gwOJLZ8jrstvhkIR4h//OMkEN28YsNd9nnSvoxfoH2OoGV+/5KtthvAhVng2aML25LwE0D2iiIbKiPjMRItc+8GKK54K1qZASZ1gB0Ec3uZFwg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0031bb5-6c08-4ae2-7eaf-08d848015445
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 07:43:02.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QC11UaCFf3Y+VeCQ4vwjR6OoZ6NiVtVKNu9VMDnlCr3kvKf69k43DDFPMohbBIpWEwPiyfotXGuPyxEx6/l+tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6083
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The root clock slice at 0xbf00 is media_ldb clock,
not csi_phy2_ref, so correct it.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx8mp.c             | 10 +++++-----
 include/dt-bindings/clock/imx8mp-clock.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index ca747712400f..9574ab1aff45 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -375,10 +375,10 @@ static const char * const imx8mp_media_cam2_pix_sels[] = {"osc_24m", "sys_pll1_2
 							  "sys_pll3_out", "audio_pll2_out",
 							  "video_pll1_out", };
 
-static const char * const imx8mp_media_mipi_phy2_ref_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m",
-							       "sys_pll1_800m", "sys_pll2_1000m",
-							       "clk_ext2", "audio_pll2_out",
-							       "video_pll1_out", };
+static const char * const imx8mp_media_ldb_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m",
+						     "sys_pll1_800m", "sys_pll2_1000m",
+						     "clk_ext2", "audio_pll2_out",
+						     "video_pll1_out", };
 
 static const char * const imx8mp_media_mipi_csi2_esc_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m",
 							       "sys_pll1_800m", "sys_pll2_1000m",
@@ -647,7 +647,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
 	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp1_pix_sels, ccm_base + 0xbe00);
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
-	hws[IMX8MP_CLK_MEDIA_MIPI_PHY2_REF] = imx8m_clk_hw_composite("media_mipi_phy2_ref", imx8mp_media_mipi_phy2_ref_sels, ccm_base + 0xbf00);
+	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
 	hws[IMX8MP_CLK_MEDIA_MIPI_CSI2_ESC] = imx8m_clk_hw_composite("media_mipi_csi2_esc", imx8mp_media_mipi_csi2_esc_sels, ccm_base + 0xbf80);
 	hws[IMX8MP_CLK_PCIE2_CTRL] = imx8m_clk_hw_composite("pcie2_ctrl", imx8mp_pcie2_ctrl_sels, ccm_base + 0xc000);
 	hws[IMX8MP_CLK_PCIE2_PHY] = imx8m_clk_hw_composite("pcie2_phy", imx8mp_pcie2_phy_sels, ccm_base + 0xc080);
diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7a23f289b27f..e8d68fbb6e3f 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -180,7 +180,7 @@
 #define IMX8MP_CLK_MEDIA_MIPI_PHY1_REF		171
 #define IMX8MP_CLK_MEDIA_DISP1_PIX		172
 #define IMX8MP_CLK_MEDIA_CAM2_PIX		173
-#define IMX8MP_CLK_MEDIA_MIPI_PHY2_REF		174
+#define IMX8MP_CLK_MEDIA_LDB			174
 #define IMX8MP_CLK_MEDIA_MIPI_CSI2_ESC		175
 #define IMX8MP_CLK_PCIE2_CTRL			176
 #define IMX8MP_CLK_PCIE2_PHY			177
-- 
2.26.2

