Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E92EB64D9
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jul 2023 11:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbjGLLzO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jul 2023 07:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233391AbjGLLyw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2023 07:54:52 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB7C26BA
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 04:54:01 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1b3fb484eedso1339777fac.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689162795; x=1689767595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhxNJrO+C7dqS4hZc7jEcBrR+kGnCAyE3Qa2KVh3AZ4=;
        b=MEWsxjPVUjHs7u8eIqXBpNBo+voE7Cg2M9UnfHOFGBZAAQVty1EliINRWIm112NiPZ
         0Go01D4Sj2qQQrXl0taNzVr3rMCF+ab89PYwsb6AqMaNe35yL45wjTkiK84z+TTK4qeD
         mu5+21i3cieKs3D6UdJSY9aC5uryHqpVnytr2MIfCPud5kKbCyfKrDQeLpHRhKR+EGMA
         7TGgik7CYa8szdZoFe7EIMNPPoXrNl50Jx5Tm05CiJxUC6XKKbYT+kcQ43eTU5ieUdhD
         BvI1BXgvYnXAfeeL7uFry3Nbfx+EwVYXPQkMrzR44vUFhLDLxEOtJWQGGmQeoPPfi9ZS
         1lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162795; x=1689767595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhxNJrO+C7dqS4hZc7jEcBrR+kGnCAyE3Qa2KVh3AZ4=;
        b=YXou8R0yu3liyplBoNxlZ1bN06w7vQrCW5qPa10we3eEuD2D3V4oSpZPD1cWWgLs7M
         oocANUNfMgQIWGCWrV+q1LBDsDwt+HFAYYpAs5A3GH92EvS5K/UVjcvoPdmDytcOHi9U
         bItGQE0nqQezY3rv41elfi5j3DQAPZSrDhlv1M42tlKTb6lSDjcjFz9yp6bJTdT8wc8d
         6nfaIgcyvCQMcF+jrHUIkhFBYpRVkCe3UGH3iVN8y0c3dh2l+JRW2mURdmexywzPq7yX
         rIH6jsJQJ39orn9fHR57B8QrpEjyUruCK2zVN2CrblGuexnc2fk3hORvD7Hacauy5HC9
         aQWg==
X-Gm-Message-State: ABy/qLZ7z+ogdXpQY/ZA4WULuy3kJDf680M8HKcrOdm65cZUtQxHYMv7
        Dmv1vNuaj1Reb1FbNImbSW4=
X-Google-Smtp-Source: APBJJlGJQIZJA8B4pZuHg+Po2JXZJdxDBXRVpNdstY/fkoPZ0lKrgEbZe/bsK98g7aIBDzU+s98CqA==
X-Received: by 2002:a05:6870:548d:b0:1b7:5f4b:c686 with SMTP id f13-20020a056870548d00b001b75f4bc686mr3464617oan.2.1689162795154;
        Wed, 12 Jul 2023 04:53:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ce5f:dbc6:1eb6:2900])
        by smtp.gmail.com with ESMTPSA id zh27-20020a0568716b9b00b001a663e49523sm1905890oab.36.2023.07.12.04.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 04:53:14 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     hs@denx.de, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        abelvesa@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 3/3] clk: imx: imx6sx: Remove hardcoded LCDIF1 parent
Date:   Wed, 12 Jul 2023 08:53:01 -0300
Message-Id: <20230712115301.690714-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712115301.690714-1-festevam@gmail.com>
References: <20230712115301.690714-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

It is not a good idea to hardcode the LCDIF1 parent inside the
clock driver because some users may want to use a different clock
parent for LCDIF1. One of the reasons could be related to EMI tests.

Remove the harcoded LCDIF1 parent as this is better described via
devicetree.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Rebased against 6.5-rc1.

 drivers/clk/imx/clk-imx6sx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 3f1502933e59..b110258b9036 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -498,10 +498,6 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 	clk_set_parent(hws[IMX6SX_CLK_EIM_SLOW_SEL]->clk, hws[IMX6SX_CLK_PLL2_PFD2]->clk);
 	clk_set_rate(hws[IMX6SX_CLK_EIM_SLOW]->clk, 132000000);
 
-	/* set parent clock for LCDIF1 pixel clock */
-	clk_set_parent(hws[IMX6SX_CLK_LCDIF1_PRE_SEL]->clk, hws[IMX6SX_CLK_PLL5_VIDEO_DIV]->clk);
-	clk_set_parent(hws[IMX6SX_CLK_LCDIF1_SEL]->clk, hws[IMX6SX_CLK_LCDIF1_PODF]->clk);
-
 	/* Set the parent clks of PCIe lvds1 and pcie_axi to be pcie ref, axi */
 	if (clk_set_parent(hws[IMX6SX_CLK_LVDS1_SEL]->clk, hws[IMX6SX_CLK_PCIE_REF_125M]->clk))
 		pr_err("Failed to set pcie bus parent clk.\n");
-- 
2.34.1

