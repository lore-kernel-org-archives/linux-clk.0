Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD5BC64EC4
	for <linux-clk@archiver.kernel.org>; Mon, 20 Feb 2023 15:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjBTPDd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 10:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjBTPDJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 10:03:09 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3FF2056F;
        Mon, 20 Feb 2023 07:02:00 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 247566602169;
        Mon, 20 Feb 2023 15:01:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676905318;
        bh=xhH2n5XmogkvcmxqMIc1jv/49UOL0BNOcn3TahthPEQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SD2itfCWdRnDqBZ21k4ppPSVXMDmvQJvvQF2dlNYAN27aVsNgYAyrgv/e5Nwl328t
         uczMzQsb1aGogzvk6dVIzR3X4msY8DrS1XdbDpQVDBwUkpfq1b8d/f57bEnlP0tHxe
         0h9IqMO8g5dC2O/Y7VcTtCYUONUAyenAXDa3ZrN0+OSixdaC9/rnsBNq0mgOyzbqNb
         q4/OY/wSa4AhTbyhadM/xLZ05qywfgFwM7mqhiiO0W1q/wl47hY40CTCL57FXQMno0
         AV6A3VaTxr39Xy27vUFNXPAd3tfwfv0Zs0NDAobA9SOE77n2BW/NwgIlc2wzc2CHDO
         29DUB7Fe61SPA==
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
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 30/55] clk: mediatek: mt8516: Allow building clock drivers as modules
Date:   Mon, 20 Feb 2023 16:00:46 +0100
Message-Id: <20230220150111.77897-31-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that all MT8516 drivers have been converted to platform driver,
change the configuration options to tristate.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2d14855dd37e..b9c0a9e21cf1 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -743,7 +743,7 @@ config COMMON_CLK_MT8365_VENC
 	  This driver supports MediaTek MT8365 venc clocks.
 
 config COMMON_CLK_MT8516
-	bool "Clock driver for MediaTek MT8516"
+	tristate "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
@@ -751,7 +751,7 @@ config COMMON_CLK_MT8516
 	  This driver supports MediaTek MT8516 clocks.
 
 config COMMON_CLK_MT8516_AUDSYS
-	bool "Clock driver for MediaTek MT8516 audsys"
+	tristate "Clock driver for MediaTek MT8516 audsys"
 	depends on COMMON_CLK_MT8516
 	help
 	  This driver supports MediaTek MT8516 audsys clocks.
-- 
2.39.1

