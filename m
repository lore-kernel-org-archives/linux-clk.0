Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D13EEB64DA
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jun 2023 16:29:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbjF3Q32 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jun 2023 12:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbjF3Q30 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 12:29:26 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7573C29
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:22 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-311367a3e12so2428413f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142561; x=1690734561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk5RmU5hOCjyXiNvKJrFNIn+ds+IQi4ixYNI1v40l1o=;
        b=HID57LtmLKHOGNpk3y7/5WF8C9pezYsAgx67wZDmPO5JGDZIirEFqWMOAkqLN+3v3W
         K+/154ol0dD+swBBz/G/R9p04ECEdwM/uaWIFBE+P5PuSTDDtCaNw6o/Ll6BvwYyFpJg
         9aLaEgEcIFS/x4KFRVWoqA/d3oA0s1/7Qh1u8vySXb37DCc3+M5K9y2fe8nXmzdU4od1
         FV5SyHwFykaZQfFHS4IiecJkID4Jx5iZBIrdiYAhEIc0KWqmCSJgZCVUXQaNLHZvb4ty
         dJ75PyYHczVKep/7bu2Ig2ZmyldEue74St9W1kGrVhI7HcVHn91JxQlWIKHo14kwKSMi
         LvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142561; x=1690734561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk5RmU5hOCjyXiNvKJrFNIn+ds+IQi4ixYNI1v40l1o=;
        b=aRXWsymCAbeOdt9sURStjTfWHeERnVVJkqIvae6Od2zPwfBO5HmkK0bBMJZNeDky+2
         /POVK5Owo3PzT1GxviyWV9Pblsqy0hVDw3CISFD8zIlQ4MrjfrVd6ldZT8FO19vJFbhI
         mAmFLUeWi0gRWQlN6pI7mgkqxHzaakf/HqNq93Xjk5BdF2+QePRu+8lG0Q5+jSbZP72Y
         GAP+cplqwfzfKPC0arOMBIxurMpdZBe1XC8htJfNwaqK6zTz6XnaGVqfHUp2pVwQfMc2
         zHjHJJwRXDqQ8512xi9VLVRCiBvU2uzy2o7pOeAweEx760EaCJUVp6lgH0Anj6lhKQp2
         bXeQ==
X-Gm-Message-State: ABy/qLaDuWHlY5bgYihS4g9VIXSaADKIa13UE+hlOVWZbX3KMSkuVTDK
        /yXzl45ajqcVlCq9Nsg2h0hi2g==
X-Google-Smtp-Source: APBJJlEhBFS+fRll1TM/s14RcuyGpFnFzhqbJPPLfzdPrxC5m4AXCfPaoFoiTQwMpU3Vp/6o9/u8Qg==
X-Received: by 2002:adf:efcc:0:b0:313:e03c:292a with SMTP id i12-20020adfefcc000000b00313e03c292amr2679209wrp.61.1688142561324;
        Fri, 30 Jun 2023 09:29:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:29:20 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:29:09 +0200
Subject: [PATCH v6 2/9] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-2-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Belin <nbelin@baylibre.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CX3kI3o4J7x9FeIX92jRW57M0+FTSTiUyYKTnCWLyDM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLaeotEM6esYmIG8tnLepGwWJQBIps2OSmDrg2Y
 Y/eyvOOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2gAKCRB33NvayMhJ0Ys4D/
 9bIXwQy6W2jbrOxciZXKaYqpZYhBiyLrOdwvuraTgXBLzILm3PI8nx89G09Xl1wzOItLFJC/fsDAA+
 WCWqK5G5SnUWkgfhysCCKVrIqFkSE1sE5gm1gELd4MViUELA2HF3LXq5C7iy6BMt/d7sd0235UO6N0
 C9TdVdSDhZVLGLr0rr9x0pkz7ybRPJHmWwq9ETaXqav4JBd6n3NNR2yEYcDK8S6UaxA8p2erHI/ecT
 P4KNmcc6Htioyq0MtTiNnhKwIjQHNDimAPm0OIqSvNnecuwJznXGBmmh9oUTU/c8cD2lo0oeZJUDgP
 InZDjZYZ5oAxR+AVfrQWC5goR4LA4C2MFpxHvMCZAaCc9oOU9IXGomCO5lyhxNceEUbT48EqCF1yPo
 nN3ohQ2Dg3nfSUUE5Y2pXRK4DvY2qgz9Dy6ck+4Y/VFg85f/QY7bK8/Y0APTAEFVwn9PAKX+D6Prfs
 m0KzsOQpHKUe+IvbV3EntaMmmaclSAcUvrzhTjnLhdq160u946a2C9s1WFdUMjU98YIK3BjJG5T4OZ
 aEfL9XGh4qafGm/US65VhM0pw6wuC+VyExFdgME1Kl8kUqR5nc+DFN1l5GH4ZwdAGAJt2F75RzQuOj
 szjz7+JrvsWlZ4nNR2pMkkdnBavvOBrrWTAiy4ohYch+KtU+IWrtNnwbgFgw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new CTS_ENCL & CTS_ENCL_SEL clocks for the G12A compatible
SoCs, they are used to feed the VPU LCD Pixel encoder used for
DSI display purposes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index ceabd5f4b2ac..5d62134335c1 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3549,6 +3549,22 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	},
 };
 
+static struct clk_regmap g12a_cts_encl_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VIID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 12,
+		.table = mux_table_cts_sel,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_encl_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = g12a_cts_parent_hws,
+		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
 static struct clk_regmap g12a_cts_vdac_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VIID_CLK_DIV,
@@ -3628,6 +3644,22 @@ static struct clk_regmap g12a_cts_encp = {
 	},
 };
 
+static struct clk_regmap g12a_cts_encl = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL2,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cts_encl",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cts_encl_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
 static struct clk_regmap g12a_cts_vdac = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL2,
@@ -4407,10 +4439,12 @@ static struct clk_hw *g12a_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4632,10 +4666,12 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4892,10 +4928,12 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -5123,10 +5161,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vclk2_div12_en,
 	&g12a_cts_enci_sel,
 	&g12a_cts_encp_sel,
+	&g12a_cts_encl_sel,
 	&g12a_cts_vdac_sel,
 	&g12a_hdmi_tx_sel,
 	&g12a_cts_enci,
 	&g12a_cts_encp,
+	&g12a_cts_encl,
 	&g12a_cts_vdac,
 	&g12a_hdmi_tx,
 	&g12a_hdmi_sel,

-- 
2.34.1

