Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8A6C001B2
	for <linux-clk@archiver.kernel.org>; Thu, 22 Dec 2022 11:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbiLVLzn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Dec 2022 06:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbiLVLyJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Dec 2022 06:54:09 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F1A2B614;
        Thu, 22 Dec 2022 03:49:29 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 477F26602CE1;
        Thu, 22 Dec 2022 11:49:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1671709768;
        bh=rF3hBLkOZsynEmNhOfEqoI9STJG9ZGoO3ta3ZVKp34k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TATSnZz70zQP9qm/YH5U9NVFhIomKt/gFFrwEoxIduf/pGcM+EWgiPgwsS+zbAaCa
         CXPLC4uhkaKQ3CDYg09FpaqjlvPFxPnK5gxKd083ZK6WDh0rW8C2sljQkQ/lkAZSkR
         WVfosgwvqbVYXy/WOfKYolB62x0EOfWOq1vjH7r9YWlx87Ox3HVnhIVkt5Sb1RpMcb
         Lu5noGZy2pt1weysQwuKx/avbtIsJYBXkJtw3eVuiQgWtgDrMkIOKyK0ICTt6sxjxZ
         tGYfRR9NCA3nKmRNHIdvnp+yMjPEJAdjKa1Frkr0tYI7xe7+BPbZSdZm0T27aeJJTD
         H15oRv5mNCWtA==
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
Subject: [PATCH v1 08/25] dt-bindings: clock: mt8173: Add dummy clock ID
Date:   Thu, 22 Dec 2022 12:48:40 +0100
Message-Id: <20221222114857.120060-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some old MediaTek clock drivers are starting the clock count (so, the
clock ID) from one instead of zero and this is logically incorrect,
as we should start from 0.
During a cleanup an issue emerged due to that and the cleanest and
shortest way to keep devicetree backwards compatibility while still
performing the well deserved cleanup is to add a dummy clock where
needed, with ID 0.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/clock/mt8173-clk.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3d00c98b9654..86c298e8eb89 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -7,6 +7,9 @@
 #ifndef _DT_BINDINGS_CLK_MT8173_H
 #define _DT_BINDINGS_CLK_MT8173_H
 
+/* Dummy clock for backwards compatibility */
+#define CLK_DUMMY			0
+
 /* TOPCKGEN */
 
 #define CLK_TOP_CLKPH_MCK_O		1
-- 
2.39.0

