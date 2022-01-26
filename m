Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A85EC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jan 2022 22:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbiAZWSc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jan 2022 17:18:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbiAZWS1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jan 2022 17:18:27 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EFEC06161C
        for <linux-clk@vger.kernel.org>; Wed, 26 Jan 2022 14:18:27 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id t32so576494pgm.7
        for <linux-clk@vger.kernel.org>; Wed, 26 Jan 2022 14:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NhtQdk8q5SXLHFlgFWNWtWzRrPQhAgDGiyA1NEvtJBY=;
        b=IRiuLMMrE8xO54Vu13p08A8VB4kFWkxDqOEu1FN4kcp+ekdAwiyjMx8UsTQVPwmLv9
         LC8G5ACUfrvH4ZCYrqpazmQ41smLGtTQd+Omepssbi7dMq5u7BHeHirwQ9kQBpG7qQf2
         iL96AU1n/aF279rMySL3WvvfgJBgbXpjE6v+StBu68gBEzE7T1qn/soVWZ4GEq1RHQE/
         nVsu/J6jPImA7ZgMk33SPWktVP7FN8WB0tCj8iS8GmsoGZVjgYLn4qJwUpRhPLxh1oLI
         P+9JFTcoQrws0f4Tb2omsV45Gy9MsNdf8/+2+U+NLLugtppFF1lE2JUyfhlLm6q2DSI2
         pUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NhtQdk8q5SXLHFlgFWNWtWzRrPQhAgDGiyA1NEvtJBY=;
        b=ghCZ5KJl/O4dGa5alaoUeLlzuCENjx/bJWeKJLcODPVk3m9YBTzFmskPHp8d1US9f2
         ctK3ndQrCLifYR1L9LiSessJbKwTFoup1f4FQcK9EAE/wYVcaI+i3YPm7PBhcDkDcDEI
         DPYpNi0Ids9PtLgybIj/rzJTYTs1uPukpIgoNl9DyPtrINOz3DBLD28lwQIp80Qw9k1W
         3AUYs68KOL28B9dpyt5dz1ilpW2avN6yzCtCJeE1nyENRZ2Eh2cDxTe0fxzrKF6HLbiu
         ib6T1iJWMcC18AdSD5vkVu5lsH98AX7kzHyIRdjTgQV6p/CG3bITtr3B8SlmfMhy06kv
         PAsQ==
X-Gm-Message-State: AOAM5334Msf/0raGAxT/OfgAAceBJh3YptG5KTpgK4Di1umGToywaHMq
        oAVPOFeVurvJNyWDx0FJVIzSvA==
X-Google-Smtp-Source: ABdhPJz8cLgbeLCgqEO2TeOrJz20u+wTYr0rpZGVy6QmetXqtrrN54C1KZWoXp2EX3pXFMm7dNrh+Q==
X-Received: by 2002:a63:d54:: with SMTP id 20mr717502pgn.442.1643235507283;
        Wed, 26 Jan 2022 14:18:27 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:4e9b:8fa7:36dc:a805:c73f])
        by smtp.gmail.com with ESMTPSA id t17sm4233742pgm.69.2022.01.26.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:18:26 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org
Subject: [PATCH 3/8] clk: qcom: gcc: Add PCIe, EMAC and UFS GDSCs for SM8150
Date:   Thu, 27 Jan 2022 03:47:20 +0530
Message-Id: <20220126221725.710167-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the PCIe, EMAC and UFS GDSC structures for
SM8150. The GDSC will allow the respective system to be
brought out of reset.

Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/clk/qcom/gcc-sm8150.c               | 74 +++++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-sm8150.h |  9 ++-
 2 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 245794485719..ada755ad55f7 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3448,22 +3448,67 @@ static struct clk_branch gcc_video_xo_clk = {
 	},
 };
 
+static struct gdsc emac_gdsc = {
+	.gdscr = 0x6004,
+	.pd = {
+		.name = "emac_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc pcie_0_gdsc = {
+	.gdscr = 0x6b004,
+	.pd = {
+		.name = "pcie_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc pcie_1_gdsc = {
+	.gdscr = 0x8d004,
+	.pd = {
+		.name = "pcie_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc ufs_card_gdsc = {
+	.gdscr = 0x75004,
+	.pd = {
+		.name = "ufs_card_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc ufs_phy_gdsc = {
+	.gdscr = 0x77004,
+	.pd = {
+		.name = "ufs_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
 static struct gdsc usb30_prim_gdsc = {
-		.gdscr = 0xf004,
-		.pd = {
-			.name = "usb30_prim_gdsc",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-		.flags = POLL_CFG_GDSCR,
+	.gdscr = 0xf004,
+	.pd = {
+		.name = "usb30_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
 };
 
 static struct gdsc usb30_sec_gdsc = {
-		.gdscr = 0x10004,
-		.pd = {
-			.name = "usb30_sec_gdsc",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-		.flags = POLL_CFG_GDSCR,
+	.gdscr = 0x10004,
+	.pd = {
+		.name = "usb30_sec_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
 };
 
 static struct clk_regmap *gcc_sm8150_clocks[] = {
@@ -3714,6 +3759,11 @@ static const struct qcom_reset_map gcc_sm8150_resets[] = {
 };
 
 static struct gdsc *gcc_sm8150_gdscs[] = {
+	[EMAC_GDSC] = &emac_gdsc,
+	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[PCIE_1_GDSC] = &pcie_1_gdsc,
+	[UFS_CARD_GDSC] = &ufs_card_gdsc,
+	[UFS_PHY_GDSC] = &ufs_phy_gdsc,
 	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
 	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
 };
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
index 3e1a91876610..35d80ae411a0 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
@@ -241,7 +241,12 @@
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR				28
 
 /* GCC GDSCRs */
-#define USB30_PRIM_GDSC                     4
-#define USB30_SEC_GDSC						5
+#define EMAC_GDSC						0
+#define PCIE_0_GDSC						1
+#define	PCIE_1_GDSC						2
+#define UFS_CARD_GDSC						3
+#define UFS_PHY_GDSC						4
+#define USB30_PRIM_GDSC						5
+#define USB30_SEC_GDSC						6
 
 #endif
-- 
2.34.1

