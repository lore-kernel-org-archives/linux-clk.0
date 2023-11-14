Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B4E18631
	for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWCXkvGo"
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED07191
	for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 02:14:53 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32d895584f1so3301456f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699956891; x=1700561691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Usa3VquYxAPDycVqQKpd67nWp9ekHUYyeEdbo8Ek7jY=;
        b=PWCXkvGoyX7xtv9EsP589Z9/O9sTh03ISJYfcQ17mZCmXjxBaI1BeRYPgrtIeW49Wv
         CzhFDtbRB2cwgnFQPmUvTokkPtrhH9AmPYhTyQaC2aqCGXOsyxIROtJ8+1oc0cFKfSRz
         WXviwy+H0Ubpq4SO1sYD064G2Iy0vgjdNeveGXgOjCNoykXpzZLQbxRKKzGm8DviLMvn
         TJd99xgPToetstOwGkEhXDnCxugOObMOzLlQNKc0HdY1TUz3lBGvzOFvdXtuPf60bvMd
         aFCPDDsmxQud+0sLEFOzLbcA3YRdNBulV3183SnJHVea8OJ0Znqee5/WqMNhrsYChSh4
         kzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956891; x=1700561691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Usa3VquYxAPDycVqQKpd67nWp9ekHUYyeEdbo8Ek7jY=;
        b=JuOSTNxy1mAEDR1pxaV5ApJtwpfrPJf3N/MI6Q1ev4UKFOnJHgOiRi/t6LAKyusyAn
         bvQvUKuE/SmgpJKK8qqTdLjcvrEkdoVV0Tuc2BJOi6Ks+BsMTcJmd89gqhJo3iuemrPV
         heSMSkY2Vzwxx0RxUPqG3TMXRbRDZXhs6BKJJpUGUawQcUzpiZ8u+ik32zZ7SBY/q9BY
         abRpty0FqqJV13++QzWARXDIt6HEfijpWkE/NnQiyhKczwA6+ScMFIwh40OzQA1ZGI0N
         KiOz9NHZIEQmAsVG4TX6h7Vlv2y72tNStlLOc/KwjCFhaDAhML9wY2j7TfRXtFRcdkOX
         PHpg==
X-Gm-Message-State: AOJu0YyjQJGU34tXwl+L7gu+xApg/bIDfIu6rRxi1KgSYnowhAO6rg4F
	Ys7WZeRxl4oDM9b/8Hi6jxRkzQ==
X-Google-Smtp-Source: AGHT+IEzVZMK67kMUGREpJZSlwqk/XFJZSzmj5Cu4UNpZkY1pqqaaiRElgez6kW52TTfdqVYtkAZjg==
X-Received: by 2002:a05:6000:1565:b0:32f:7ebe:3e5a with SMTP id 5-20020a056000156500b0032f7ebe3e5amr7525048wrz.50.1699956891208;
        Tue, 14 Nov 2023 02:14:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4202000000b0032d886039easm7335585wrq.14.2023.11.14.02.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:14:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 14 Nov 2023 11:14:44 +0100
Subject: [PATCH 2/3] clk: meson: g12a: add MIPI ISP clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-topic-amlogic-upstream-isp-clocks-v1-2-223958791501@linaro.org>
References: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
In-Reply-To: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3403;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dZke1iq4FAITvgVMIUDhLoZap1P+Z6ah4DJyhujVIds=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlU0iXlwUukpCz/mpc05k9GDypuFrhFLdOZG5tKQ+r
 wnMvS0yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVNIlwAKCRB33NvayMhJ0cx7D/
 9z5wa9btnYn9c2UrV+P9UhiZazbpjGG9COykZ17lwepwf4InMJLNjO+5SpCbzT9BV8I+Gr6RdoUozQ
 P2EbVQKscHgusKvlYKyNza3n/6DZ2VnW33BP40nGIs0Ji1cDCUqSQjKdUKWXgniTL++Mc70l0fM9Ar
 LfDQ0VJCEVRUaIMU5mCIu7vc0J67V7ebMuM//zvkGkeq3dGGq22yC/1/r3LJuaRBOQXF4Nm7+tKCc9
 YB/jttKphPf0lHvaeJoKdidTON6c7okJUOLTPTWHqTnkTsYHtosGPJ0R3SJsG8GhZ2CH/KFlJgsjdN
 gTQ8eJJ7aUwYoh2lVlU8QgNr/urUXcsgrR9e1hgVuneNdkFtrprpwI7/S3Vpfg0jQ5J4SNAtgaohr1
 vIUw/7WDyctSoRFZF1FSOQHFLEzzTwVQDILOBAAfZTIKs4ISy/RXXk3FL7y09nYDAO2Q1LKJ9Yzn7h
 YMHIpVnTcyQ9RiB2SsCvCb09SmQ52nF263gMdC6nX/fDyIHqZmHziALJSfaoLME98At8AK2LzaKiKO
 0zyHJCHYBgYxqJPuBW8oyoJO4nRU8+UaUo03HQa+dlVVUkSx8oI/nnib35TcwImCuuLUtfxTzDc5Vo
 VP2M+eyZKiVPxhPysDcyqh3ie419ejLZuJvW5FDAbt37/md2GLj+0cDa+xdw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the MIPI ISP gate, divider and mux used to feed the MIPI CSI ISP
(Image Signal Processor) IP on the Amlogic G12B SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  1 +
 2 files changed, 67 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index f373a8d48b1d..a8312f29d1cc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3722,6 +3722,66 @@ static struct clk_regmap g12a_mipi_dsi_pxclk = {
 	},
 };
 
+/* MIPI ISP Clocks */
+
+static const struct clk_parent_data g12b_mipi_isp_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &g12a_gp0_pll.hw },
+	{ .hw = &g12a_hifi_pll.hw },
+	{ .hw = &g12a_fclk_div2p5.hw },
+	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div4.hw },
+	{ .hw = &g12a_fclk_div5.hw },
+	{ .hw = &g12a_fclk_div7.hw },
+};
+
+static struct clk_regmap g12b_mipi_isp_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_ISP_CLK_CNTL,
+		.mask = 7,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mipi_isp_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = g12b_mipi_isp_parent_data,
+		.num_parents = ARRAY_SIZE(g12b_mipi_isp_parent_data),
+	},
+};
+
+static struct clk_regmap g12b_mipi_isp_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_ISP_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mipi_isp_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_mipi_isp_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap g12b_mipi_isp = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_ISP_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "mipi_isp",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_mipi_isp_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* HDMI Clocks */
 
 static const struct clk_parent_data g12a_hdmi_parent_data[] = {
@@ -4729,6 +4789,9 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
 	[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
 	[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
+	[CLKID_MIPI_ISP_SEL]		= &g12b_mipi_isp_sel.hw,
+	[CLKID_MIPI_ISP_DIV]		= &g12b_mipi_isp_div.hw,
+	[CLKID_MIPI_ISP]		= &g12b_mipi_isp.hw,
 };
 
 static struct clk_hw *sm1_hw_clks[] = {
@@ -5221,6 +5284,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_mipi_dsi_pxclk_sel,
 	&g12a_mipi_dsi_pxclk_div,
 	&g12a_mipi_dsi_pxclk,
+	&g12b_mipi_isp_sel,
+	&g12b_mipi_isp_div,
+	&g12b_mipi_isp,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index f11ee3c59849..27df99c4565a 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -70,6 +70,7 @@
 #define HHI_MALI_CLK_CNTL		0x1b0
 #define HHI_VPU_CLKC_CNTL		0x1b4
 #define HHI_VPU_CLK_CNTL		0x1bC
+#define HHI_ISP_CLK_CNTL		0x1C0
 #define HHI_NNA_CLK_CNTL		0x1C8
 #define HHI_HDMI_CLK_CNTL		0x1CC
 #define HHI_VDEC_CLK_CNTL		0x1E0

-- 
2.34.1

