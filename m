Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606B1C4707A
	for <linux-clk@archiver.kernel.org>; Tue, 12 Oct 2021 00:54:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 492D1610C8
	for <linux-clk@archiver.kernel.org>; Tue, 12 Oct 2021 00:54:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhJLAz7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Oct 2021 20:55:59 -0400
Received: from mx.socionext.com ([202.248.49.38]:36443 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231837AbhJLAz6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 11 Oct 2021 20:55:58 -0400
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 12 Oct 2021 09:53:56 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id D6EA92058B40;
        Tue, 12 Oct 2021 09:53:56 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 12 Oct 2021 09:53:56 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 5C920AB192;
        Tue, 12 Oct 2021 09:53:56 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v3 5/5] clk: uniphier: Add SoC-glue clock source selector support for Pro4
Date:   Tue, 12 Oct 2021 09:53:55 +0900
Message-Id: <1634000035-3114-6-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634000035-3114-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1634000035-3114-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add SoC-glue clock source selector for ahci controller on UniPhier SoCs.
Currently this supports Pro4 only.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/clk/uniphier/clk-uniphier-core.c |  5 +++++
 drivers/clk/uniphier/clk-uniphier-sys.c  | 17 +++++++++++++++++
 drivers/clk/uniphier/clk-uniphier.h      |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniphier/clk-uniphier-core.c
index 0a947e757d13..46c66fac48e6 100644
--- a/drivers/clk/uniphier/clk-uniphier-core.c
+++ b/drivers/clk/uniphier/clk-uniphier-core.c
@@ -210,6 +210,11 @@ static const struct of_device_id uniphier_clk_match[] = {
 		.compatible = "socionext,uniphier-nx1-peri-clock",
 		.data = uniphier_pro4_peri_clk_data,
 	},
+	/* SoC-glue clock */
+	{
+		.compatible = "socionext,uniphier-pro4-sg-clock",
+		.data = uniphier_pro4_sg_clk_data,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/uniphier/clk-uniphier-sys.c b/drivers/clk/uniphier/clk-uniphier-sys.c
index e8bf85cd2d30..0180470b24db 100644
--- a/drivers/clk/uniphier/clk-uniphier-sys.c
+++ b/drivers/clk/uniphier/clk-uniphier-sys.c
@@ -330,3 +330,20 @@ const struct uniphier_clk_data uniphier_nx1_sys_clk_data[] = {
 			     "cpll/32"),
 	{ /* sentinel */ }
 };
+
+const struct uniphier_clk_data uniphier_pro4_sg_clk_data[] = {
+	UNIPHIER_CLK_DIV("gpll", 4),
+	{
+		.name = "sata-ref",
+		.type = UNIPHIER_CLK_TYPE_MUX,
+		.idx = 0,
+		.data.mux = {
+			.parent_names = { "gpll/4", "ref", },
+			.num_parents = 2,
+			.reg = 0x1a28,
+			.masks = { 0x1, 0x1, },
+			.vals  = { 0x0, 0x1, },
+		},
+	},
+	{ /* sentinel */ }
+};
diff --git a/drivers/clk/uniphier/clk-uniphier.h b/drivers/clk/uniphier/clk-uniphier.h
index c54fb7895889..dea0c7829aee 100644
--- a/drivers/clk/uniphier/clk-uniphier.h
+++ b/drivers/clk/uniphier/clk-uniphier.h
@@ -155,5 +155,6 @@ extern const struct uniphier_clk_data uniphier_ld4_mio_clk_data[];
 extern const struct uniphier_clk_data uniphier_pro5_sd_clk_data[];
 extern const struct uniphier_clk_data uniphier_ld4_peri_clk_data[];
 extern const struct uniphier_clk_data uniphier_pro4_peri_clk_data[];
+extern const struct uniphier_clk_data uniphier_pro4_sg_clk_data[];
 
 #endif /* __CLK_UNIPHIER_H__ */
-- 
2.7.4

