Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88CFC61DA4
	for <linux-clk@archiver.kernel.org>; Tue, 14 Feb 2023 13:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbjBNNpY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 08:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbjBNNpE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 08:45:04 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC39129437;
        Tue, 14 Feb 2023 05:43:47 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DF9A66021AD;
        Tue, 14 Feb 2023 13:42:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676382153;
        bh=KePsqy5PqdeX7Wen9K1KIlUKfVKK1kzyd8Oo4StS3PQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HKp3/OhQJMIRnJqmKLiwFts9pWXShUko77YxUgpblsH8iC3Sv4e33s3oaUv7Bi2Bx
         HAglD4w/uUAMXDfKVxmyTJ6nhGzxNYB0OOavvjHfdYfKv2Lfxh/KXLzmSxBrmvT0Y8
         6FeFLjSsVqmvdxPegF8gD4W+d9ooXZ1k/zqKmSBoTFMIYnZYn8FczhQIBvjO79FbeR
         GCfPZrW0dsa9FTOQAy2W8/bWFJomjeNP8jaro0BgS02eaCP0U+1lmkt7CzPCzFpDKV
         6nYMneXBOHB/Cy8EksOsHIzCawCEMiTmCBk7O7k8qEzVTvIt1XQ2B90KFyTCKXGfjU
         25J2foiyO7Vug==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v2 39/47] clk: mediatek: Allow MT7622 clocks to be built as modules
Date:   Tue, 14 Feb 2023 14:41:19 +0100
Message-Id: <20230214134127.59273-40-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that all drivers are using the simple probe mechanism change the
MT7622 clock drivers to tristate in Kconfig to allow module build.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b5636b3225e8..55727889ebf5 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -336,7 +336,7 @@ config COMMON_CLK_MT6797_VENCSYS
 	  This driver supports MediaTek MT6797 vencsys clocks.
 
 config COMMON_CLK_MT7622
-	bool "Clock driver for MediaTek MT7622"
+	tristate "Clock driver for MediaTek MT7622"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
@@ -345,21 +345,21 @@ config COMMON_CLK_MT7622
 	  required for various periperals found on MediaTek.
 
 config COMMON_CLK_MT7622_ETHSYS
-	bool "Clock driver for MediaTek MT7622 ETHSYS"
+	tristate "Clock driver for MediaTek MT7622 ETHSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver add support for clocks for Ethernet and SGMII
 	  required on MediaTek MT7622 SoC.
 
 config COMMON_CLK_MT7622_HIFSYS
-	bool "Clock driver for MediaTek MT7622 HIFSYS"
+	tristate "Clock driver for MediaTek MT7622 HIFSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver supports MediaTek MT7622 HIFSYS clocks providing
 	  to PCI-E and USB.
 
 config COMMON_CLK_MT7622_AUDSYS
-	bool "Clock driver for MediaTek MT7622 AUDSYS"
+	tristate "Clock driver for MediaTek MT7622 AUDSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver supports MediaTek MT7622 AUDSYS clocks providing
-- 
2.39.1

