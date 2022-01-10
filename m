Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70E9C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jan 2022 18:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238833AbiAJSNo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jan 2022 13:13:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40012 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238832AbiAJSNn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jan 2022 13:13:43 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: alyssa)
        with ESMTPSA id 2303F1F43C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641838422;
        bh=n0yhSvOkX/YKC7+yMoQzR39vuDC3gvq+odokEEpUJsU=;
        h=From:To:Cc:Subject:Date:From;
        b=UfwLa9pS96C0zv1QZY/++AXY94AyamKlGmfT3IF9e9Nax7zwzTpQeMvcYwkwYbHHV
         QjLqfBshb82Gx4oWg+Q406eKOeBEy+/OwEameJjxutbBsWVVUqDFgD1muVnOLhFHeq
         v0Ik7dxGWkWVVRgBnc7jVbxStjRlYU4gY7itLPMekzVk52Q6xIzWIZoKFNDvr1U63F
         Vw8yuxoXxostFP5PYTKZq6Mbc3sNhGMc+STLbo/OSzRzLfoojrbL3mmWar5kbbot1P
         TS59unKOYv/5NBdOo259M6ovHf7b4ZRg9NMx9NAwnVupRHpuFT6nVXvKdTPmM1Dxgg
         BtI8bWSknfltg==
From:   Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To:     linux-mediatek@lists.infradead.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Date:   Mon, 10 Jan 2022 13:13:30 -0500
Message-Id: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Set a mysterious chicken bit in the MT8192 clock driver (!) to get the
Mali GPU on MT8192 to work. This workaround is from the downstream Mali
driver shipped in ChromeOS. The change there is unsuitable for mainline
but good as a reference for the hardware behaviour:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2781271/5

That links to an internal Google issue tracker which I assume has more
information on the bug. I would appreciate if someone from Google or
MediaTek could explain what this change actually does and why it's
necessary on MT8192.

At any rate, this register logically belongs to the MT8192 "infra" clock
device, so it makes sense to set it there too. This avoids adding any
platform-specific hacks to the 3D driver, either mainline (Panfrost) or
legacy (kbase).

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Nick Fan <Nick.Fan@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/clk/mediatek/clk-mt8192.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index cbc7c6dbe0f4..e3673494d08d 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1179,6 +1179,10 @@ static const struct mtk_pll_data plls[] = {
 
 static struct clk_onecell_data *top_clk_data;
 
+/* Control registers in the infra block used to set a chicken bit */
+#define INFRA_CTRL 0x290
+#define INFRA_CTRL_DISABLE_MFG2ACP BIT(9)
+
 static void clk_mt8192_top_init_early(struct device_node *node)
 {
 	int i;
@@ -1224,6 +1228,29 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	return of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
 }
 
+/*
+ * Disable ACP on the infra clock. Setting this quirk is required for 3D to
+ * work correctly. Without this quirk, any work queued to the Mali GPU faults,
+ * for example raising a Data Invalid Fault. This suggests the GPU is failing
+ * to read back the contents of shared CPU/GPU memory correctly, perhaps due to
+ * a MT8192 platform integration issue breaking memory or caches.
+ *
+ * Relevant downstream change:
+ * https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2781271/5
+ */
+static int clk_mt8192_infra_disable_mfg2acp(struct platform_device *pdev)
+{
+	void __iomem *base = devm_platform_ioremap_resource(pdev, 0);
+	void __iomem *infra_ctrl = base + INFRA_CTRL;
+
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	writel(readl(infra_ctrl) | INFRA_CTRL_DISABLE_MFG2ACP, infra_ctrl);
+
+	return 0;
+}
+
 static int clk_mt8192_infra_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -1238,6 +1265,10 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 	if (r)
 		return r;
 
+	r = clk_mt8192_infra_disable_mfg2acp(pdev);
+	if (r)
+		return r;
+
 	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 }
 
-- 
2.30.2

