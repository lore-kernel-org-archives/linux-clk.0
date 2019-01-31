Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35718C282D7
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 00:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEF772087F
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 00:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb4dQDda"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfAaAVJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 19:21:09 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42389 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfAaAVJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 19:21:09 -0500
Received: by mail-qk1-f194.google.com with SMTP id 68so896595qke.9
        for <linux-clk@vger.kernel.org>; Wed, 30 Jan 2019 16:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=z6jbomTcGNYr8GK31Y5viWPelpWwK53klWRjBO3VrHY=;
        b=Cb4dQDdaEJBrnLTS3PrZ14YUxgByS2UfC40XUHIDrk/3xwXWmHKolhETkWWHkKYdyg
         KgJIIzInsLsRwVLHMmFUR6+4a3CGXuNP2UJdtDi5yJt3QXAwZxCl+uodBHf8e9L6wGEq
         oPObjiHdvvvVgxk02EVtXD4SqkXCU1vTlbrMqwELVY2zyfSUXRnoorfRcrgV7R09nw/+
         F8GhXxR+umErkXR19jvKccHrnGNUrXfC2JuESXE6JiVrkRcLlYu1EPCUaVyfoqoA3NGa
         w+o9Yu1uGzyDrULGI6yVtKOfzpMvP6eV9BW05nOjy+r6z9EArI/C9XNMOQyGMatS5v6b
         RDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z6jbomTcGNYr8GK31Y5viWPelpWwK53klWRjBO3VrHY=;
        b=FsrpqqZ8fcEcG9cu/6+Dxcx03b9tv5uVAMETSivoa5fkLzlBwHUBfurc620Xr7ec+D
         Rtm2WFZKotCCDDZmjZUow03PpphP3XmEa6gx+W6Lg4ytHaHpzLfa4WYRyWxxJ27KbYQ4
         +7vVm5V5yguHjrR1iiLdfenyfMEEgu9KDvVLGVcvoTluJe4qpqRlwoFrdn+Px08FuwGH
         McUroPkzseTNNJ6lxNWrtzKzJY5nYhlBo7psSsgWW6RxWGRnswftJzXjtQX/9JpPRW9D
         fnexeUgLavv9icQCVWWhx4AAAcjL3fSB7sIad3932e/HqF69TbygWaDTPNOoKEbORfCs
         hEHQ==
X-Gm-Message-State: AJcUukfnCCVOwQD0A4ddI2ASzRgbiSrOeC2lihK/47XcAM8yA20q+h2A
        DjO4OnFZaRYqNsZ9W4oZgOE=
X-Google-Smtp-Source: ALg8bN7g5tSHIRSapnBEWxjNyAViqqmc++eYHEr5PmNl0SR+Ychbqq26zdGeeVwCer/KY49LGHsDvQ==
X-Received: by 2002:a37:a391:: with SMTP id m139mr28963124qke.11.1548894067897;
        Wed, 30 Jan 2019 16:21:07 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([2804:14c:482:a73::1])
        by smtp.gmail.com with ESMTPSA id p42sm3366676qte.8.2019.01.30.16.21.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Jan 2019 16:21:07 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     sboyd@kernel.org
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
Date:   Wed, 30 Jan 2019 22:20:56 -0200
Message-Id: <20190131002056.12024-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the entry for the CLKO1 clock.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/clk/imx/clk-imx8mq.c             | 3 +++
 include/dt-bindings/clock/imx8mq-clock.h | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 63001bc891d4..a2f8a8d3585c 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -264,6 +264,8 @@ static const char * const imx8mq_ecspi3_sels[] = {"osc_25m", "sys2_pll_200m", "s
 					   "sys1_pll_800m", "sys3_pll2_out", "sys2_pll_250m", "audio_pll2_out", };
 static const char * const imx8mq_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
+static const char * const imx8mq_clko1_sels[] = {"osc_25m", "sys1_pll_800m", "osc_27m", "sys1_pll_200m",
+					  "audio_pll2_out", "sys2_pll_500m", "vpu_pll_out", "sys1_pll_80m", };
 static const char * const imx8mq_clko2_sels[] = {"osc_25m", "sys2_pll_200m", "sys1_pll_400m", "sys2_pll_166m",
 					  "sys3_pll2_out", "audio_pll1_out", "video_pll1_out", "ckil", };
 
@@ -479,6 +481,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 	clks[IMX8MQ_CLK_GPT1] = imx8m_clk_composite("gpt1", imx8mq_gpt1_sels, base + 0xb580);
 	clks[IMX8MQ_CLK_WDOG] = imx8m_clk_composite("wdog", imx8mq_wdog_sels, base + 0xb900);
 	clks[IMX8MQ_CLK_WRCLK] = imx8m_clk_composite("wrclk", imx8mq_wrclk_sels, base + 0xb980);
+	clks[IMX8MQ_CLK_CLKO1] = imx8m_clk_composite("clko1", imx8mq_clko1_sels, base + 0xba00);
 	clks[IMX8MQ_CLK_CLKO2] = imx8m_clk_composite("clko2", imx8mq_clko2_sels, base + 0xba80);
 	clks[IMX8MQ_CLK_DSI_CORE] = imx8m_clk_composite("dsi_core", imx8mq_dsi_core_sels, base + 0xbb00);
 	clks[IMX8MQ_CLK_DSI_PHY_REF] = imx8m_clk_composite("dsi_phy_ref", imx8mq_dsi_phy_sels, base + 0xbb80);
diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
index 04f7ac345984..74f80b26f679 100644
--- a/include/dt-bindings/clock/imx8mq-clock.h
+++ b/include/dt-bindings/clock/imx8mq-clock.h
@@ -391,5 +391,7 @@
 
 #define IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK	267
 
-#define IMX8MQ_CLK_END				268
+#define IMX8MQ_CLK_CLKO1			268
+
+#define IMX8MQ_CLK_END				269
 #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
-- 
2.17.1

