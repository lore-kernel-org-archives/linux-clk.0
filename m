Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942973;
	b=s5LdaZpeddlUY3ZbMnzv2W2183xjBk6kbLcmGTwbdouanfBGRyYw+VUCd2OFUR69eaW7
	 Xs1+tAJe82vUybP2YyYpaV2kCaFy0mTmrPBDdc0Qf4PhiZS6nQ9J9b8oXLP9OWZ1qfs/q
	 upx1Ywqg+hGpTVop9YPxffG67KJGLnySlGwqwvdrO+bzdMBT8NfBARZjJ+96Lzqw9mlqo
	 tpb/7sYTIn8KGkL1bD7qx5TcrEm42V6Ul07wfpLo4vv7BSDOOkVXUXGqHoP9DVYLGjkE9
	 7WCpSVIMqyheuLnn5LE45lONF+KrW+t603iq23B1jexqLME1Hdmvs244h9jASDRnq3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
	b=wyBf3YG6Bj1Dcpo9blNTxT1JOD+L0pzGMui1nJf4xBvanq/zDL6IcGVybRY2s2vqUkM7
	 uL/6G6Y7GZWzcuIcC9Yhv2Z5pL+QaZp9wUoXPhyB0nYJdpY3ti/uKcnW5ci2Q92Yfp9wt
	 N8plVo9E+Dm/oImxtX55kYI6m76tDiSRS3ESyFcoEirgp7tQJ0DVzAnIy+Kfrru3ADbYF
	 lYUfgMEnHAb2L71PNmV7iTaH1xIxidQ1qIOItoV6r0rPxPyGbHr/V907MxfbPkWd60kmD
	 6jglv2g/IXo4MEEVzV9fLnGbMMh8kG47eSSPFgXYBEnLj2EGs+T5O1rPxM1bR489YlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MQhSiGUi;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99126606A31C
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 19:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99126606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MQhSiGUi
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so55924f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 11:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942971; x=1795547771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
        b=MQhSiGUiKYUNjsxYbJpr2H2peA6r5L/6blxVL+o7hYSjwkW9K51Dgg8z87VH/nu6KU
         80618/BBuEQ2J91nD/FbYuADN3buxR3bYvtL2ydAsl29ILU8yYxz8J4TK5aVE4YiSZFP
         NZqTgCAklUOHG0GCZKYsI9Grxd+st2Sl9KPPwagq6sLCxpiwCfdpGavgOgN+4nkwjWX7
         olkjQKESHgYd1/or5dtLJDzahK5d9Dk4THXEg8bvZjviKMj2LwTFir9HumfUGfDN++ut
         2Nuk0hpUipZyRYZPkVRyfVWNmYO4vx7Sy3HZN0w/eclaOS8gB0JiTL17ImgkEcUTZFNy
         6s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942971; x=1795547771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
        b=GoESW7ciZcnysAB3iDq9YDKab9QKFLrItuokyNBoS+2aO14qT/RCk1pP+ZwRyOOJbQ
         evfWNqfiBxi/+mSzn4WVG3z1CRP6vDSXXwryw7yq/TsGCObkWhJvRYgs2G/Lk1Twrzcr
         V+IZ7xHAdpO7sEfu+BevBQFZtQivYqYLzJPG0U35SGmUTpT6OW0QvznUfIW7vvesmsgt
         TGJsm05YBzbi7iW+iO0GfsIkFpa/M6SCjvSvfYWkc2NgNnsp152rDIvh8r9sa3Y58gTt
         YNRgsirqeT32FUmSxlX3M4qo9WFg+VkXXYQkqSLUV4lvZrrCN2RXUXskA2xh56gxa2Od
         6Pjg==
X-Forwarded-Encrypted: i=1; AL+hErHK2wVGy/EKjks7LwvTrXGCsAd8DicDBlOzDlNZdG/mwW3HhH5hjiWUK7Zuy56i6hr4m+qqn9dVbOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z93B+QfgQA+spPo2iqM0NiuUihBnw5v+efMN7EuTpULdm5jTzSA
	ZZ1mdlftJc1ddyIG0in50Ah3E6ckJnj3W7P704gihrRJKwvWR96bYVO4SPF41UMk0IQ=
X-Gm-Gg: AYBFou3Bz5jRM2B9OA2jUg/o0hVXwmqtM8V97CpYHuuI1ankaOd0kKDuFJ6QIFKXYJ2
	3NSmNI/5f+V12WtCDqoNhghOVfTyLB5t1Rbrfqlu1jxnjEjjpPpU3J4ck+CByhvFd7LOtkZpx5b
	dsPbAJMiOl+qIBECOp/dS3KLT+bUMlppJvV07yN8zB19Kh89IXGsmkb51GvwmeRKd29yWCU1ixZ
	U0IATm3BPywiqvEsuuKJ7Xq0BaXCQi/o7oxRk+OFfwT3HKX0wUmWBgqFNFaLmYFCzM4cR75RM0G
	zY0FjdlXKqE017UkwbfYLXDhemgCKN6j5N+HQ4fvc19nopWZYFhusdng324PcnM7G0lFa1o8zv7
	s7IxsFXs4LyV0cweOI+PrmvdYPy75KNtAApZOBlu8kYE7ufyQv3/xTi8Cpreq63m6E6t7W7XFE9
	bvrfacESqZ3R+WEqxADshQBPrlt3XBePmYCxshE0nZKm+35jemg260IZaRrAeqmHrE1G29v/8VZ
	LdUCt73xnRCNj227/AirIoSAFjgsOLJ+h4y7d4hhc3uo0WREOsjNqvHAMroPdwwnQMcaCKWNEy1
	pNBoYq+/umd4evzCT4Xo6EFY7JxVP0GuZ/GNxX9oO0q9IEx1jOuQLGlT
X-Received: by 2002:a05:600c:4fc6:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb7da26fc7mr2486695e9.20.1794942970661;
        Tue, 17 Nov 2026 11:16:10 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:04 +0000
Subject: [PATCH 3/3] clk: mediatek: Add MT8196 PWM source muxes
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-3-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

The four MT8196 PWM channel clocks and X16W_BCLK each have a source
selector in pericfg_ao, choosing between clk32k, clk26m and the
topckgen pwm clock. The peri_ao driver models their gates as fixed
children of the topckgen pwm clock, so when a selector picks another
input, CCF reports the wrong rate. For the channel clocks, the PWM
driver then computes wrong period and duty counters.

Model the five selectors as muxes and parent the gates on them, so
CCF reports the rate of the selected input. The selection made at
boot is kept, and consumers can change it with assigned-clock-parents.
The selectors do not forward rate requests to the topckgen pwm clock,
which all five share.

Fixes: 212779900009 ("clk: mediatek: Add MT8196 peripheral clock support")
Co-developed-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8196-peri_ao.c | 38 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-peri_ao.c b/drivers/clk/mediatek/clk-mt8196-peri_ao.c
index f227a86c5d60..00873264c18e 100644
--- a/drivers/clk/mediatek/clk-mt8196-peri_ao.c
+++ b/drivers/clk/mediatek/clk-mt8196-peri_ao.c
@@ -85,11 +85,16 @@ static const struct mtk_gate peri_ao_clks[] = {
 	GATE_PERI_AO0(CLK_PERI_AO_UART4_BCLK, "peri_ao_uart4_bclk", "uart", 4),
 	GATE_PERI_AO0(CLK_PERI_AO_UART5_BCLK, "peri_ao_uart5_bclk", "uart", 5),
 	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_HCLK, "peri_ao_pwm_x16w", "p_axi", 12),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_BCLK, "peri_ao_pwm_x16w_bclk", "pwm", 13),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK0, "peri_ao_pwm_pwm_bclk0", "pwm", 14),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK1, "peri_ao_pwm_pwm_bclk1", "pwm", 15),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK2, "peri_ao_pwm_pwm_bclk2", "pwm", 16),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK3, "peri_ao_pwm_pwm_bclk3", "pwm", 17),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_BCLK, "peri_ao_pwm_x16w_bclk",
+		      "peri_ao_pwm_x16w_bclk_sel", 13),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK0, "peri_ao_pwm_pwm_bclk0",
+		      "peri_ao_pwm_pwm_bclk0_sel", 14),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK1, "peri_ao_pwm_pwm_bclk1",
+		      "peri_ao_pwm_pwm_bclk1_sel", 15),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK2, "peri_ao_pwm_pwm_bclk2",
+		      "peri_ao_pwm_pwm_bclk2_sel", 16),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK3, "peri_ao_pwm_pwm_bclk3",
+		      "peri_ao_pwm_pwm_bclk3_sel", 17),
 	/* PERI_AO1 */
 	GATE_HWV_PERI_AO1(CLK_PERI_AO_SPI0_BCLK, "peri_ao_spi0_bclk", "spi0_b", 0),
 	GATE_HWV_PERI_AO1(CLK_PERI_AO_SPI1_BCLK, "peri_ao_spi1_bclk", "spi1_b", 2),
@@ -117,9 +122,32 @@ static const struct mtk_gate peri_ao_clks[] = {
 	GATE_PERI_AO2(CLK_PERI_AO_MSDC2_HCLK_WRAP, "peri_ao_msdc2_h_wrap", "peri_ao_msdc2", 13),
 };
 
+static const char * const pwm_src_sel_parents[] = {
+	"clk32k",
+	"clk26m",
+	"pwm",
+};
+
+static const u32 pwm_src_sel_table[] = { 0, 1, 3 };
+
+static const struct mtk_composite peri_ao_muxes[] = {
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_X16W_BCLK_SEL, "peri_ao_pwm_x16w_bclk_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 6, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK0_SEL, "peri_ao_pwm_pwm_bclk0_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 8, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK1_SEL, "peri_ao_pwm_pwm_bclk1_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 10, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK2_SEL, "peri_ao_pwm_pwm_bclk2_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 12, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK3_SEL, "peri_ao_pwm_pwm_bclk3_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 14, 2, 0),
+};
+
 static const struct mtk_clk_desc peri_ao_mcd = {
 	.clks = peri_ao_clks,
 	.num_clks = ARRAY_SIZE(peri_ao_clks),
+	.composite_clks = peri_ao_muxes,
+	.num_composite_clks = ARRAY_SIZE(peri_ao_muxes),
 };
 
 static const struct of_device_id of_match_clk_mt8196_peri_ao[] = {

-- 
2.43.0

