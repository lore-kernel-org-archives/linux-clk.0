Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AB5C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 08:59:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232399AbiEWI7v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 04:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbiEWI7p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 04:59:45 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DC53FBDA
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 01:59:43 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id 202so6102682pfu.0
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b4toybDv1M53GirTn8tpXa0Kt2GdamhkRh4OIAgDtc4=;
        b=LugNNq9A1jRao45gwpaFfRD7S7nswT5/bN9+qs88iy9ir1JqkfveP2C+MySEfYAzuT
         mKzKAUZYqsijwo9LBHKKSONhsZWlCsheFWJWw8pZj7p1XZ1w/RX5nroUBXBpJdPidTen
         t6o43jxZtOQ2qPp0yLK3E02PfSxGjfxM864AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b4toybDv1M53GirTn8tpXa0Kt2GdamhkRh4OIAgDtc4=;
        b=xDIJzmrJB0gJgcYy6LG7yVeUzaIlAFWwSSbNJO+dqY1+sbUyY94cJL5HBxzbsEcvDS
         0j0osjox1r7jpkn4RFU9gmMT3FughdXuglvg6MqACchwr6X7gSe0J226Z2SInezKRfo0
         cjBKxcKcL0nWxhM8KvmPnlw1QMCLOpvH136N020K4Fp0i8Atdn6aj2udg5dKmxONv+NE
         aMxe5WY4Sbh5ZUSg76m8GVCUKguwCn8G6v746xYOf88acad1mRbdHGuCPyJAaOZV2CUu
         LJAkUyt3Jv9MTvYHU8MztKaD8Juf+BFtrs0rSHsHerckM49tutB3slnSWrfu4M4AHXQP
         QKug==
X-Gm-Message-State: AOAM5305kqqLFZIUfMEC128H9Xqg2cqmDu+VKiJOZerBiNWYXNScMU4v
        oVO4cfczCRu3WuSkb7Jrfd0Nig==
X-Google-Smtp-Source: ABdhPJyzzCmYWZva4xngidgLFHgwZkMLeSN/5IngSAyroT2BA0b9QiJFbU1J1oNzacQ2caYizNg6gw==
X-Received: by 2002:a65:6cc3:0:b0:3f6:26e9:5c1 with SMTP id g3-20020a656cc3000000b003f626e905c1mr19125032pgw.28.1653296383341;
        Mon, 23 May 2022 01:59:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1b8:7eae:9793:ff95])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902cf4b00b0015e8d4eb22csm4524719plg.118.2022.05.23.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 01:59:42 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
Date:   Mon, 23 May 2022 16:59:21 +0800
Message-Id: <20220523085923.1430470-3-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523085923.1430470-1-wenst@chromium.org>
References: <20220523085923.1430470-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The only clock in the MT8183 MFGCFG block feeds the GPU. Propagate its
rate change requests to its parent, so that DVFS for the GPU can work
properly.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index d774edaf760b..230299728859 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -18,9 +18,9 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.sta_ofs = 0x0,
 };
 
-#define GATE_MFG(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift,	\
-		&mtk_clk_gate_ops_setclr)
+#define GATE_MFG(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_SET_RATE_PARENT)
 
 static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_sel", 0)
-- 
2.36.1.124.g0e6072fb45-goog

