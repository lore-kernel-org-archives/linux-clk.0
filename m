Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D58DC6FA86
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 17:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiISRAM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 13:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiISRAI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 13:00:08 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD0A32EF4
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:54 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lc7so259149ejb.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=luoO1LxKDmftX99eiF83qZnJXT6xOXQyVnCCkkwkdZ0=;
        b=vgqXPnwJfBaDfi4hVLCviUh3Gx+X6JzI45XAKLuOUe2h2jHSiPiCAyLXcxsC8P5RX8
         mta4oVeCIoH7ljc8WQ1ufUbqSXG+JeHfF2n9XlW25tLQG4BNAEXLcv/BfM/5Qqh31CDw
         dR5uoEZ+9CPX1nLrigQUnUFhp01iu2MqLIRhZV16zhGCpSUSc08x0yl1LIhZI0j6ubo/
         HNz7tWo0DAhRyZ/1LM/TVbEnEjGa33dBNjwTlf0gOpW2f6h9k30WlZMJIu93SnWPW4JS
         69GS6lI/fA7OAzCXcd8Bgc13gq5urO9ok5789REso4IcaVC2cs4G6s6RHxENYewjNzam
         9RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=luoO1LxKDmftX99eiF83qZnJXT6xOXQyVnCCkkwkdZ0=;
        b=bTdb9k6oK4skFE3i3mI7k8bdXyWV+TtXgRtt7UEi2R5yySwYMx+UWaGS7OH4oTzVu4
         GEyU1kDWYfU3UkDJjGrrY0+bbBLVAazo/fL49la30rpDcBRsqyLCtZf9nKXzTASsVjFd
         byV3zsYQ/x4K+d8QH1QgFU9X8x3QP6xaeNmbq82Z6qRplS98ekCkiNT5DcMWItV699cV
         jL8mUvEV9+ua5Tx8mnyfD23C1LzBazCSl3PCI2pHZF5U6SkdcRcAk6Z5uAlGHl/oRJzn
         1k3b6ioNzcU/HazkMkJEjfYWCTDeFtlp0VXFxWMS0LHtiIrtUb1rC1MFYvjPWQubJ+TK
         VALQ==
X-Gm-Message-State: ACrzQf1FDtuiO03qmz3o2FS17e4bUx91kcNLGk18ZS7TOcUGkl2A5Am2
        JPh4StH3tJ/J7aWEaGoiS/wi1w==
X-Google-Smtp-Source: AMsMyM5rnDUnukBVd+yEqOxJIHItyo96vhlvjjoScLMZLrhi/dI2zDekSyBitbbTOdXRgSb4OzTwlg==
X-Received: by 2002:a17:906:da86:b0:740:7120:c6e6 with SMTP id xh6-20020a170906da8600b007407120c6e6mr13618036ejb.44.1663606793008;
        Mon, 19 Sep 2022 09:59:53 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:52 -0700 (PDT)
From:   Guillaume Ranquet <granquet@baylibre.com>
Date:   Mon, 19 Sep 2022 18:56:03 +0200
Subject: [PATCH v1 05/17] drm/mediatek: hdmi: use a syscon/regmap instead of iomem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-5-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org,
        Guillaume Ranquet <granquet@baylibre.com>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To prepare support for newer chips that need to share their address
range with a dedicated ddc driver, move to a syscon.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 3196189429bc..5cd05d4fe1a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -172,7 +172,7 @@ struct mtk_hdmi {
 	u32 ibias_up;
 	struct regmap *sys_regmap;
 	unsigned int sys_offset;
-	void __iomem *regs;
+	struct regmap *regs;
 	enum hdmi_colorspace csp;
 	struct hdmi_audio_param aud_param;
 	bool audio_enable;
@@ -188,44 +188,29 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
 	return container_of(b, struct mtk_hdmi, bridge);
 }
 
-static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
+static int mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset, u32 *val)
 {
-	return readl(hdmi->regs + offset);
+	return regmap_read(hdmi->regs, offset, val);
 }
 
 static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
 {
-	writel(val, hdmi->regs + offset);
+	regmap_write(hdmi->regs, offset, val);
 }
 
 static void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
 {
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp &= ~bits;
-	writel(tmp, reg);
+	regmap_clear_bits(hdmi->regs, offset, bits);
 }
 
 static void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
 {
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp |= bits;
-	writel(tmp, reg);
+	regmap_set_bits(hdmi->regs, offset, bits);
 }
 
 static void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask)
 {
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp = (tmp & ~mask) | (val & mask);
-	writel(tmp, reg);
+	regmap_update_bits(hdmi->regs, offset, mask, val);
 }
 
 static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
@@ -474,7 +459,7 @@ static void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG0);
+	mtk_hdmi_read(hdmi, GRL_CFG0, &val);
 	val &= ~(CFG0_W_LENGTH_MASK | CFG0_I2S_MODE_MASK);
 
 	switch (i2s_fmt) {
@@ -566,7 +551,7 @@ static void mtk_hdmi_hw_aud_set_input_type(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG1);
+	mtk_hdmi_read(hdmi, GRL_CFG1, &val);
 	if (input_type == HDMI_AUD_INPUT_I2S &&
 	    (val & CFG1_SPDIF) == CFG1_SPDIF) {
 		val &= ~CFG1_SPDIF;
@@ -597,7 +582,7 @@ static void mtk_hdmi_hw_aud_src_reenable(struct mtk_hdmi *hdmi)
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_MIX_CTRL);
+	mtk_hdmi_read(hdmi, GRL_MIX_CTRL, &val);
 	if (val & MIX_CTRL_SRC_EN) {
 		val &= ~MIX_CTRL_SRC_EN;
 		mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
@@ -611,7 +596,7 @@ static void mtk_hdmi_hw_aud_src_disable(struct mtk_hdmi *hdmi)
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_MIX_CTRL);
+	mtk_hdmi_read(hdmi, GRL_MIX_CTRL, &val);
 	val &= ~MIX_CTRL_SRC_EN;
 	mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
 	mtk_hdmi_write(hdmi, GRL_SHIFT_L1, 0x00);
@@ -622,7 +607,7 @@ static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG5);
+	mtk_hdmi_read(hdmi, GRL_CFG5, &val);
 	val &= CFG5_CD_RATIO_MASK;
 
 	switch (mclk) {
@@ -1428,7 +1413,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	struct device_node *cec_np, *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
-	struct resource *mem;
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
@@ -1474,8 +1458,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 	hdmi->sys_regmap = regmap;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(dev, mem);
+	hdmi->regs = syscon_node_to_regmap(dev->of_node);
 	if (IS_ERR(hdmi->regs)) {
 		ret = PTR_ERR(hdmi->regs);
 		goto put_device;

-- 
b4 0.10.0-dev
