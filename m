Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F83C7618A
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 09:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjCTJOa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 05:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjCTJOF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 05:14:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1EC65BBD;
        Mon, 20 Mar 2023 02:14:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67292B80DB4;
        Mon, 20 Mar 2023 09:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157DAC433D2;
        Mon, 20 Mar 2023 09:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679303640;
        bh=gHTA93997ac/lT4FWEpkyp00sb8e4oMfl8zZDFoB+68=;
        h=From:To:Cc:Subject:Date:From;
        b=VZDDQSvIN70rqjaMoA2za6Lqic4jggpVTfq2CTOaGqBES5jzl/iukA657Bh27rpMu
         Vhmt+gCKBeij1bhSeSpsXRS4vNxNr2bCOk2Wbv4BBTRVxxk5VkJyjAUNw1wB2bCWwB
         VnpwI7MEohNBZgHas0hjz6L/F48MCeVRefyOSuIsq5zsHI3crpSzXBX6xTgTwkphmt
         eRk/ajKdb/djKyl1JoP2YmOp71e4LSVcITs3xAPHzwPrJPNK4Rnw460ZElGAY1I82L
         PDJDTqTtbs6hg6JjEjSQS+wA/TbuwBEy02fpk6QfXEQBNd4JZQy2fSky7iiyIddTQu
         YdybK0M5e93Jw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt81xx: Ensure fhctl code is available
Date:   Mon, 20 Mar 2023 10:13:42 +0100
Message-Id: <20230320091353.1918439-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Just like in commit eddc63094855 ("clk: mediatek: Ensure fhctl code is
available for COMMON_CLK_MT6795"), these three need the shared driver
code, otherwise they run into link errors such as:

aarch64-linux/bin/aarch64-linux-ld: drivers/clk/mediatek/clk-mt8192-apmixedsys.o: in function `clk_mt8192_apmixed_probe':
clk-mt8192-apmixedsys.c:(.text+0x134): undefined reference to `fhctl_parse_dt'

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Fixes: 4d586e10c428 ("clk: mediatek: mt8192: Add support for frequency hopping through FHCTL")
Fixes: da4a82dc67b0 ("clk: mediatek: mt8195: Add support for frequency hopping through FHCTL")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/mediatek/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index c707c6fe45a3..61e3266d2346 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -478,6 +478,7 @@ config COMMON_CLK_MT8173
 	tristate "Clock driver for MediaTek MT8173"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
+	select COMMON_CLK_MEDIATEK_FHCTL
 	default ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8173 basic clocks and clocks
@@ -686,6 +687,7 @@ config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
+	select COMMON_CLK_MEDIATEK_FHCTL
 	default ARM64
 	help
 	  This driver supports MediaTek MT8192 basic clocks.
@@ -766,6 +768,7 @@ config COMMON_CLK_MT8195
         bool "Clock driver for MediaTek MT8195"
         depends on ARM64 || COMPILE_TEST
         select COMMON_CLK_MEDIATEK
+	select COMMON_CLK_MEDIATEK_FHCTL
         default ARCH_MEDIATEK
         help
           This driver supports MediaTek MT8195 clocks.
-- 
2.39.2

