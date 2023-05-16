Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A192C7EE25
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 13:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbjEPNwg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 09:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbjEPNwc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 09:52:32 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0963A525D;
        Tue, 16 May 2023 06:52:18 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FDFB660585D;
        Tue, 16 May 2023 14:52:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684245136;
        bh=xJrBWD8s7Dcy+bUExkMFrLTynIqKaM6Kc9RZO68PL7w=;
        h=From:To:Cc:Subject:Date:From;
        b=TKO8ZOtQsGAZRDwzPgEZBTLNkec2g4sg8dAEwLncRqxQAkozVxgjFBhhR7azqjmTo
         SvKX4jZcrb+1RATAtwXqqkBlZ4c7Nro8kbooYR42cloPlgIq3P196k2/S19/ME9k/E
         YlsRXhk5zMcwlwvIVAGaaS6vwtizGw8ogQmGicsX5Q6Xv0WOIDswhBeitpOk3fziQ1
         67QEqfbZTFpBaCtgjMIaKYTM5EDvFCrers0GhAk5KIQJd2qEmUSWNIuqIJSY+rZ9n+
         7zFY6Dztlak3KbT/rihqdBNjiap8PxSVBCHEdQ+TpxQH43kdAchVe1Yb+2nTfvZu6p
         3hAOakiqszn/A==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        chun-jie.chen@mediatek.com, mandyjh.liu@mediatek.com,
        miles.chen@mediatek.com, zhaojh329@gmail.com,
        daniel@makrotopia.org, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, Garmin.Chang@mediatek.com,
        msp@baylibre.com, yangyingliang@huawei.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v2 0/2] clk/mediatek: Adjustments for MSDC rate accuracy
Date:   Tue, 16 May 2023 15:52:03 +0200
Message-Id: <20230516135205.372951-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Changes in v2:
  - Extended the changes in this series to MT8365 clocks

This series stops unconditionally forcing CLK_SET_RATE_PARENT on
MediaTek muxes, as that should be set in the clock driver for each
clock requiring it, and removes CLK_SET_PARENT from all MSDC core
clocks to allow mtk-sd to select the right clock parent when doing
mclk setting, improving the rate accuracy and avoiding both under
and overclocks of the eMMC/SD/SDIO card, both improving performance
and stability of the attached storage.

This series was successfully tested on MT8173, MT8192, MT8195.

AngeloGioacchino Del Regno (2):
  clk: mediatek: mux: Stop forcing CLK_SET_RATE_PARENT flag
  clk: mediatek: Remove CLK_SET_PARENT from all MSDC core clocks

 drivers/clk/mediatek/clk-mt6765.c          | 20 +++++-----
 drivers/clk/mediatek/clk-mt6779.c          | 24 +++++------
 drivers/clk/mediatek/clk-mt7981-topckgen.c | 12 +++---
 drivers/clk/mediatek/clk-mt7986-topckgen.c | 12 +++---
 drivers/clk/mediatek/clk-mt8173-topckgen.c | 24 +++++------
 drivers/clk/mediatek/clk-mt8183.c          | 22 ++++++-----
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 24 +++++------
 drivers/clk/mediatek/clk-mt8188-topckgen.c | 40 +++++++++++--------
 drivers/clk/mediatek/clk-mt8192.c          | 23 +++++------
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 46 +++++++++++++---------
 drivers/clk/mediatek/clk-mt8365.c          | 38 +++++++++---------
 drivers/clk/mediatek/clk-mux.c             |  2 +-
 12 files changed, 155 insertions(+), 132 deletions(-)

-- 
2.40.1

