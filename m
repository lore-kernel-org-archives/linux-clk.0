Return-Path: <SRS0=edwH=37=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1924C352A4
	for <linux-clk@archiver.kernel.org>; Tue, 11 Feb 2020 03:08:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCA0220714
	for <linux-clk@archiver.kernel.org>; Tue, 11 Feb 2020 03:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSR5Znb7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbgBKDIt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Feb 2020 22:08:49 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:45720 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgBKDIt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Feb 2020 22:08:49 -0500
Received: by mail-qv1-f65.google.com with SMTP id l14so4305703qvu.12
        for <linux-clk@vger.kernel.org>; Mon, 10 Feb 2020 19:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wgGKUnlzEJ2a8qSB0a2zn1fdYwV5ER4chdWO8Q08nVo=;
        b=PSR5Znb7L+upKokNQwWbVpknxT3Muaf31/mEXb+pBcRSQ6PHXgARO708mWit9QHUr0
         ibmiPgIRciGUkP7kgjuB4u3d062JEQ4R0WMOryHxUmzaWrd9GpFCT9AxdYiyleWPlkG7
         HWVFF6zhh3NJ+deD+r2JbV2xEl3RckLT7CBp7HMwEkZwDBbJZGI+WY22IHAVbQaGVjCN
         fF+svijn84gQ2Fa6mbkxdCD5YvzW43XRRvREH3sEmztj+VlzyTPoS90+dmO4A9XqCX/5
         MRvgCpSg7RsSDKfrjFq8PfQ5p3l2QMXlFDg0+qHYnvt+IyBo3zEmcuMlusTPBYM3oekU
         kolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wgGKUnlzEJ2a8qSB0a2zn1fdYwV5ER4chdWO8Q08nVo=;
        b=fuxHNgPwLGFcaryUfSsHTL2mzGj79aNyY++pG41hj971iUcEguNrTwxPlcxtM/8cE8
         eeTsV8kx2ta98NvulJ1MXEGlTO4Bvk+0Ne6QQywp/pb13UMNe7emp84A904fJvk3Ytje
         yxtL0JViXk+ZVnjgzH5ZYJfbSDh8Zpu81ygKICfNKmkCe2fgwsoHVGz9xTTjF/9FdUAq
         KiqL5w/OKpb+3QKwzdfW3ZQEEILf05QPWfc61UMrvGQf3QKQCRKiIjazrJHPiBayn7ix
         R4LirSGurmdN0BG8mDbR9EbOBmlEio7Zk2wHhj+mmc8j68NA1y7Pw5qIxi/F6+VHdRW9
         QPOQ==
X-Gm-Message-State: APjAAAU5EWhBUd/aao0CB78ivCgd8T+d0/DjpQNtZa6Uyg6EJUzQr88e
        ivP9aPnJD9lU45PSefJxN/o=
X-Google-Smtp-Source: APXvYqyU9BnAd2BjDUkGBCIDNLhVOK8D8+Rp69IBo3DmZk4YQW+LtfWdj69yMYVM//AurEd+uNrq3Q==
X-Received: by 2002:ad4:5429:: with SMTP id g9mr1100800qvt.134.1581390527001;
        Mon, 10 Feb 2020 19:08:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:5bb::1])
        by smtp.gmail.com with ESMTPSA id x41sm1345893qtj.52.2020.02.10.19.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 19:08:46 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] clk: imx8mm: Add CLKO2 support
Date:   Tue, 11 Feb 2020 00:08:13 -0300
Message-Id: <20200211030813.13992-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211030813.13992-1-festevam@gmail.com>
References: <20200211030813.13992-1-festevam@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add CLKO2 support, which is useful for debugging purposes.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/clk/imx/clk-imx8mm.c             | 3 +++
 include/dt-bindings/clock/imx8mm-clock.h | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 770cf2ae58aa..2ea91ba5e63e 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -285,6 +285,8 @@ static const char *imx8mm_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", }
 
 static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "dummy", "sys_pll1_200m",
 					  "audio_pll2_out","sys_pll2_500m", "vpu_pll", "sys_pll1_80m", };
+static const char *imx8mm_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m", "sys_pll2_166m",
+					  "sys_pll3_out", "audio_pll1_out", "video_pll1_out", "osc_32k", };
 
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
@@ -504,6 +506,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MM_CLK_WDOG] = imx8m_clk_hw_composite("wdog", imx8mm_wdog_sels, base + 0xb900);
 	hws[IMX8MM_CLK_WRCLK] = imx8m_clk_hw_composite("wrclk", imx8mm_wrclk_sels, base + 0xb980);
 	hws[IMX8MM_CLK_CLKO1] = imx8m_clk_hw_composite("clko1", imx8mm_clko1_sels, base + 0xba00);
+	hws[IMX8MM_CLK_CLKO2] = imx8m_clk_hw_composite("clko2", imx8mm_clko2_sels, base + 0xba80);
 	hws[IMX8MM_CLK_DSI_CORE] = imx8m_clk_hw_composite("dsi_core", imx8mm_dsi_core_sels, base + 0xbb00);
 	hws[IMX8MM_CLK_DSI_PHY_REF] = imx8m_clk_hw_composite("dsi_phy_ref", imx8mm_dsi_phy_sels, base + 0xbb80);
 	hws[IMX8MM_CLK_DSI_DBI] = imx8m_clk_hw_composite("dsi_dbi", imx8mm_dsi_dbi_sels, base + 0xbc00);
diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index edeece2289f0..37f523cec390 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -265,6 +265,8 @@
 #define IMX8MM_SYS_PLL2_333M_CG			244
 #define IMX8MM_SYS_PLL2_500M_CG			245
 
-#define IMX8MM_CLK_END				246
+#define IMX8MM_CLK_CLKO2			246
+
+#define IMX8MM_CLK_END				247
 
 #endif
-- 
2.17.1

