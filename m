Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C727ECAAD3
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 16:59:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbiISQ7v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 12:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbiISQ7s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 12:59:48 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11A411456
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:47 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b35so221848edf.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=pe51xvlTzoxvP1PkLEmQi5YJGHaBQkqHjYX/h+KRrX4=;
        b=B+X1p1fH4JpGs34rfSwYzzSHzwu5qnL83GcremhYxa34LPTfzyuT54Qx4NkUrP80pu
         pQuuF2QUVoy7vzZV3h6TrERow//gfDL5XfrnuPPuhc+B4RHI2qc+3ex/jWKQ63RA0DfF
         hBB0zWcx0Lk6XvWHsF7Jch4RHJgIiSY2LK6gxuWKN/rgLWdkiQ6mLPjpWh4cz4AHHPtT
         pC4zGQhthMR+WPSyxbXBMc3qQw3YfboFI7Q7Yy9Bgo6ddHWkCSfutvSn4/NE2FUgXx1e
         NM29wYa2a+PX3vs2XgVJk1y+K5rnO2tGCxRjBGuogh3F3cFoZXeNpiG1Tcq1hcgaNJxd
         w1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pe51xvlTzoxvP1PkLEmQi5YJGHaBQkqHjYX/h+KRrX4=;
        b=wK1KG6/ioQaqYMEJA+vORWQsBwm/8oTzZ+6Ua4zF1BTWbcB5wO3umSGdFkufhGY14a
         mcCgIfMEVAFPAksOf3BR/9NragrWM2ta9caQ2jdwGJSZI0IOfCWnF/WPadDRT+qZq4c0
         OZa4zyyvHid6KvYhyDGFBobeWL2VBe1fRMgFlMNGLYCz5lgpx371+gKDCiAybFLSNH71
         Xg3gv0y6IfEkemyHhHaqOsDP41MwK27zD9mYp7eHKTBL+L/ZBCp//QmH6adkEsVXFTIc
         PCW8/3+fPy5uwn0gYjBWpPvNA5tL1VlquWg9Glsx8XGJ80JxO5L5qjjbniXGrNIpvTSW
         XDlA==
X-Gm-Message-State: ACrzQf1IUsYlR5v4OGxbaNhFVmySEwiHAyjY4tzLO30RzbEDcotm/mka
        nLUJH69mHU9Bu6M09TgHFJVKuA==
X-Google-Smtp-Source: AMsMyM4Kcqj7iaeTFSgnPboPDJcmYDvSGBzBAfopbwGlsGHAlwhMCX86GfBtADSsZGEx5aSm5j7eEQ==
X-Received: by 2002:a05:6402:2b8b:b0:43a:5475:f1ae with SMTP id fj11-20020a0564022b8b00b0043a5475f1aemr16246555edb.363.1663606787204;
        Mon, 19 Sep 2022 09:59:47 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:46 -0700 (PDT)
From:   Guillaume Ranquet <granquet@baylibre.com>
Date:   Mon, 19 Sep 2022 18:56:00 +0200
Subject: [PATCH v1 02/17] clk: mediatek: add VDOSYS1 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-2-4844816c9808@baylibre.com>
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

From: Pablo Sun <pablo.sun@mediatek.com>

Add the clock gate definition for the DPI1 hardware
in VDOSYS1.

The parent clock "hdmi_txpll" is already defined in
`mt8195.dtsi`.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index d54d7726d186..835335b9d87b 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -34,6 +34,12 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 	.sta_ofs = 0x140,
 };
 
+static const struct mtk_gate_regs vdo1_4_cg_regs = {
+	.set_ofs = 0x400,
+	.clr_ofs = 0x400,
+	.sta_ofs = 0x400,
+};
+
 #define GATE_VDO1_0(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -50,6 +56,9 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 #define GATE_VDO1_3(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_VDO1_4(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_4_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
 static const struct mtk_gate vdo1_clks[] = {
 	/* VDO1_0 */
 	GATE_VDO1_0(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "top_vpp", 0),
@@ -107,6 +116,8 @@ static const struct mtk_gate vdo1_clks[] = {
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf", "top_vpp", 17),
 	/* VDO1_3 */
 	GATE_VDO1_3(CLK_VDO1_26M_SLOW, "vdo1_26m_slow", "clk26m", 8),
+	/* VDO1_4 */
+	GATE_VDO1_4(CLK_VDO1_DPI1_HDMI, "vdo1_dpi1_hdmi", "hdmi_txpll", 0),
 };
 
 static int clk_mt8195_vdo1_probe(struct platform_device *pdev)

-- 
b4 0.10.0-dev
