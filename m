Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE447C4708D
	for <linux-clk@archiver.kernel.org>; Thu, 22 Dec 2022 11:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbiLVLyQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Dec 2022 06:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235530AbiLVLwz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Dec 2022 06:52:55 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007682934B;
        Thu, 22 Dec 2022 03:49:20 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 453746602CD8;
        Thu, 22 Dec 2022 11:49:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1671709758;
        bh=X/oZl8ocJQt071EbQHuHIaXUvTU5xZlpFyUlUhGeBQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FBt+uV3u8xFLavYUouyD4THDFwqNxoEaHEktDIVywjGjckt0EtRQhDAHPLAAUdEBZ
         FXxNXT6XYiEoWOOqu46VAGLb2OYaGlo9JIsdqREMitXhu4/tB0YzsIk0cyVyEh4+MV
         DlyWwiY6Fle3lyyQyUhvnCUNHAptdtlz3cY8KYn3jHoEFUvOmdjVfNm8sa5TVySoFk
         6RZEFg7F9VzOrFl7K7yoo3+vhM0/A7ER9QjiF3k24cGAQYMzTzWN++itIqUw1kn2Yk
         YkD2h/lonXVHUTbBqDdOATpj1Sd6AXksbox0UJKrdvmjuJZ3kM9bCz4WGCO5rs65mj
         dl2bpJVT5qmXQ==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Subject: [PATCH v1 02/25] clk: mediatek: mt8192: Propagate struct device for gate clocks
Date:   Thu, 22 Dec 2022 12:48:34 +0100
Message-Id: <20221222114857.120060-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert instances of mtk_clk_register_gates() to use the newer
mtk_clk_register_gates_with_dev() to propagate struct device to
the clk framework.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index eff66ca6c6a7..991d78a71644 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1127,7 +1127,8 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_top_composites;
 
-	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	r = mtk_clk_register_gates_with_dev(node, top_clks, ARRAY_SIZE(top_clks),
+					    top_clk_data, &pdev->dev);
 	if (r)
 		goto unregister_adj_divs_composites;
 
@@ -1167,7 +1168,8 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	r = mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks), clk_data);
+	r = mtk_clk_register_gates_with_dev(node, infra_clks, ARRAY_SIZE(infra_clks),
+					    clk_data, &pdev->dev);
 	if (r)
 		goto free_clk_data;
 
@@ -1198,7 +1200,8 @@ static int clk_mt8192_peri_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	r = mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks), clk_data);
+	r = mtk_clk_register_gates_with_dev(node, peri_clks, ARRAY_SIZE(peri_clks),
+					    clk_data, &pdev->dev);
 	if (r)
 		goto free_clk_data;
 
@@ -1226,7 +1229,9 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
-	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	r = mtk_clk_register_gates_with_dev(node, apmixed_clks,
+					    ARRAY_SIZE(apmixed_clks), clk_data,
+					    &pdev->dev);
 	if (r)
 		goto free_clk_data;
 
-- 
2.39.0

