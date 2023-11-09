Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A571096B
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hN/YCCT6"
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CF825BC
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 01:00:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so10231765e9.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Nov 2023 01:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520421; x=1700125221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NufD4rIrXXVswDRLLGN1v8mzear6C88bLMu3144o0cg=;
        b=hN/YCCT6c7R6dOZdVpkhHKipAL21TFhEth3485Qy6BT7rJmo/X/rHOSzA50+0RUs6Q
         6zb8S5LxdqBeIdXcr+j+N2dNQRbxnfPb+sbCvvUzcM3UGABc7HHZS6LiRdUTITsmfHES
         QTQdZaYCCoPeYMmdEe41jwvQDoGGR0KCeLIzetGqDktDikONXi9R44xYDWmpcjDQC6HV
         GbXlOPRrqzt1GTMSS+eZlYlTMQi3ppW90M1dK1j28pG0Hs7z0qXBFqP9z6zFN/KLNmcO
         ZwuWZawcM+m/8yYzBQeMdv30jLYak02pmbttNOPhLqQKsIcGCv+5cZFCe3Zk3z0du/YD
         HhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520421; x=1700125221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NufD4rIrXXVswDRLLGN1v8mzear6C88bLMu3144o0cg=;
        b=HX6tHyRA6jcfkmlVeX6h7uYTRssB5w/Ubc3ireT9MNyGunOJHH5hbGvbACgW0voWJE
         BePpsUfzT+iegtGT8svEN88ai7NhfTu56IHfwMRtXWGqYY4Yvv393mwublXJB+wklRJH
         CtNhPMeusC8gQ2FoTjw997ySSCgQq+pkpNDgluDdWd6aFbJzQJMLnjg26xAfsX8Hq310
         Ke/+2lSfuHMrakISyeFToxHvgNb/UR/yeM9pdCubf/FwhMPPx/PVA9uFhD+ZK+RE9+vm
         atRSSyPXdNgGylrB1zCADRpzkYXY3B+G4CqY/esu+TgFXL6UymCfgo0/gbjpojfyYfLF
         +b4Q==
X-Gm-Message-State: AOJu0YxsiWaMP26S9e/uSFFwgivJ1u0UKbesOgbmg0rjB79Ikz3HOvpv
	2Vk6NHwdfaMF7TSDeJXhjtkbYnvC1PqPEfBTlDjhiXc0
X-Google-Smtp-Source: AGHT+IGxSg1mr5xDwzqGjpnOTb8EnhbM3pbNiRU5Y/NFrQeBwQ2mIGRMQXdWeExekl2i8P6EQzzQLg==
X-Received: by 2002:a05:600c:c0c:b0:401:b425:2414 with SMTP id fm12-20020a05600c0c0c00b00401b4252414mr9733730wmb.18.1699520420735;
        Thu, 09 Nov 2023 01:00:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:07 +0100
Subject: [PATCH v8 06/12] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-6-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zJsrzxQnYGg+gnkYOtONfQmErbGuCQDfLn/cHrjnMZI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+XAu9aFd+uhj7htL8zXg0s1UYgLC9HzlrM/vb4
 7lZkuhuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflwAKCRB33NvayMhJ0U3HEA
 CdCArUDEZEXlIJe4yS07vvou6fhXSMQ4+VKD50M2Cpocdho1yVp9ljgu+juoADLrWaxgggx0GB0HTH
 HUVdkEg3LXGMIi3A2TfFN+c7PuG/XbssgQs2uT3CobUB0iXYxs4N5mIoUuXGv7npd++vHnUgcBHajb
 kr3OfFXiyizbVmwTUVnh385tnaxA6nuqml63JKc4Dji79cj7Rfm5qYwtAaiTYAFAajctkmFzZA4wBm
 eHhzLTTFm7/L64tSi0pLWFtNlHFkmJdQsBv73F2E6sLrnlh3y82CEYgyGs3a7juDZQz2tHr13ldPfp
 K0ZQn1m3i3O84j6ESpDbg2ACUXdj8VjOlTVCxgIuDLSU7et7KrRMkthobvNZldMj88dJG9aBWrDp1l
 29U/gqY/2IkEjzYb6ShdvDYxmCuiJDi9TKFV0HB+UWqno8dRILizN+Uz9Fc5k+kXkczn2Y20p70/r3
 qy1OX52Zvv6PX2m52IKcHUzBJxAfNLKbrkh75p9RBULC2R07t0FqgkUzaIbJuCanVjLhho/WBjep1u
 AIgEtL21blXgV3rvovIRyFwtioa1KL/Ft4iCq9xlNOBNZJBH311LTTPoxzPryMZIOa/JNtewQ3R0BS
 7/6UYmNTEGu2LYBw1znMHPDco9mcFduu9KVdb23siKUtffeZict4FLLxVfwA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add new CTS_ENCL & CTS_ENCL_SEL clocks for the G12A compatible
SoCs, they are used to feed the VPU LCD Pixel encoder used for
DSI display purposes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index f373a8d48b1d..cadd824336ad 100644
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

