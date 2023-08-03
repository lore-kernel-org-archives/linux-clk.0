Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24339C04FE0
	for <linux-clk@archiver.kernel.org>; Thu,  3 Aug 2023 12:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbjHCMEL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Aug 2023 08:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235605AbjHCMEJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 08:04:09 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFC82D71
        for <linux-clk@vger.kernel.org>; Thu,  3 Aug 2023 05:04:08 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3174aac120aso763817f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Aug 2023 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064247; x=1691669047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk5RmU5hOCjyXiNvKJrFNIn+ds+IQi4ixYNI1v40l1o=;
        b=dmbvQXzU5YOxKr/5AHsZgK20/MbMO8YTcE+nnZyWIKTL5cNu+2gejW86Lgm3eQlvhO
         XqebyzFF12aOnA4VtP1e8OwSo2A4b1oXq8VPQ7K9LY14L39vgScYUx9Q5Wsdqg8dQ74y
         otS2vIdXwUX2XVwENmpbWOXJK3rSuAJsE9DN6U9nh5cb0qbBh/LMstTukseLc9Hjq23j
         FITafRouiTvQF1pVlKNP/BUmkFUlGn0W5cS6fWhrWpQeIhfULOwWwhM+i3ynV6bfKis2
         tJUgLqmVpQv5BrTCa9wwVqu5sAsbX9HwwKy9k6AY5mAF1zVAZLPDVfTOiyuV2XiuASkN
         uenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064247; x=1691669047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk5RmU5hOCjyXiNvKJrFNIn+ds+IQi4ixYNI1v40l1o=;
        b=PNrxmqgQJGKCUp3AjuxfJb+POSGoEO3AVdx3HfM0mHEVHS9alplhKyn5+BqlXVW/xp
         hPi4AB+acFJ/obIRGsOUX8rACcQpZp+zgFfrPeq/qY/6F5tcymUXTXZr+0xJ2udSIY/S
         0fERjCl6+uPcm9JhuDut4KRIDJmC+Goe6ZqoVS0QCZaAfAdYSCM5bOC/qBdRD3OBuX2m
         H9HzV8tWiG5ebz+HdhbifmgWkLcpkLemEahvF5mzjGTdR6LnP5pxbh7gy1kj79l/is1h
         7CBft5Dg7jnUnSEH1H/bdk85WTtRVik8mBi6qN9Itwp3gqHDD1IQuOHt+uHsE7A0E/6y
         KQ4A==
X-Gm-Message-State: ABy/qLahQIl+oBZC1HyFkD/B/qvCsaVE/V3o+J3nFE7z+IdV/4FTVwBZ
        p5uVGVdVudszF/jNyAunDzCcmA==
X-Google-Smtp-Source: APBJJlHAD8DUjoAlBJEb5XOFbsF/b80OtVlEc90hvF001d1wcQxVRGZIO0NkMAYWWpNGwprPfJbo3Q==
X-Received: by 2002:a5d:514e:0:b0:315:998d:6d25 with SMTP id u14-20020a5d514e000000b00315998d6d25mr6619915wrt.1.1691064246783;
        Thu, 03 Aug 2023 05:04:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:06 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 03 Aug 2023 14:03:56 +0200
Subject: [PATCH v7 2/9] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-2-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
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
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CX3kI3o4J7x9FeIX92jRW57M0+FTSTiUyYKTnCWLyDM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5evEYOkI2P6cFHvisFT2Xy456x7SQeR4MphAUBO
 lqYbTCiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXrwAKCRB33NvayMhJ0UPvD/
 9YlSRSI3mRy+zfpQwi9BxrviwLWLuOR8NfQGEXAqxY2hMO3UCRb0sDMroYLl42SMk/ms4a5fEdKEK5
 pHEMnwJI+XNpQa2uYQQTfikYepv8qa10ubCh0IxOPfBEHKxrxzajSQehAYLYO+yXYGfc9tCJs06QBA
 TcrSpcU/GPTDgoMgLkqzaL6m006sXYzjUUGjYqRM2zAMN8COfGwpeslM8KBq4+SfHT9FvA8yxGAqSc
 /C6CObtswB9micLgi/3q2fWzojlcLrpL5O0kvEtXc+ZR41P+MAagGy5s7cqtYVLaK1w8PrWAE2455s
 GCs2PhiZJvkgzTGxnLDQRBhlIQXouJ0soQ1wVaQOWbfqrDlivaFp02m2jckHJ6JN8QAplzEcmIW0qF
 Y42E6sewLTH/nz/R5U384neUgK3Hs0BNBbk6X9ClGtYmOlT8rL5Rng5WeAEpA13DXX8RgxmXtUPv9Y
 TRhYv5DWBp0BTMNg45Mt+22pm0DUXAQIfKxgS1mLmAzWvWLVwM8d6a9vfqsdjgsFjFCQS4LYAZ5hpg
 MTnPI1DBpaMj/i0TUOxhAOqh9GHz/AQ8W0vRE1AKi6+qwF8HO52spjIwAu/tk1QdE87kA04DhxzRwf
 L0bV+gj6WJHGOqTE9GSkdbcbhZQGUiKVlvq1SkjaxRaYHGeXX+t3nzVVmfbw==
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

