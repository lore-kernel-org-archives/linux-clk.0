Return-Path: <SRS0=09nf=D4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1771C388F9
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 17:37:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9339F222E9
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 17:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503599AbgJURhB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Oct 2020 13:37:01 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40928 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409050AbgJURhA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Oct 2020 13:37:00 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A8D61A004F;
        Wed, 21 Oct 2020 19:36:58 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D5261A1293;
        Wed, 21 Oct 2020 19:36:58 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0FDC2203A1;
        Wed, 21 Oct 2020 19:36:58 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 2/4] clk: Add clk_gate_ro_ops for read-only gate clocks
Date:   Wed, 21 Oct 2020 20:36:53 +0300
Message-Id: <1603301815-24670-3-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603301815-24670-1-git-send-email-abel.vesa@nxp.com>
References: <1603301815-24670-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clocks that can be changed from outside of the clock common framework
scope (for example, EL3) need to have only the .is_enabled gate op.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/clk-gate.c       | 5 +++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 070dc47..41ca887 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -123,6 +123,11 @@ const struct clk_ops clk_gate_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_gate_ops);
 
+const struct clk_ops clk_gate_ro_ops = {
+	.is_enabled = clk_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_gate_ro_ops);
+
 struct clk_hw *__clk_hw_register_gate(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 94a78b3..6668d2d 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -485,6 +485,7 @@ struct clk_gate {
 #define CLK_GATE_BIG_ENDIAN		BIT(2)
 
 extern const struct clk_ops clk_gate_ops;
+extern const struct clk_ops clk_gate_ro_ops;
 struct clk_hw *__clk_hw_register_gate(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
-- 
2.7.4

