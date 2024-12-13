Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63E51E04BF
	for <linux-clk@vger.kernel.org>; Fri, 13 Dec 2024 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734100228; cv=none; b=tfAbeRAYq3gxPG7jgLm+bth6p0a1Xgknu/lKq42ChXY2WSGZE9msKK2HyufgK7mI4zK7QUGUB0gDjFN2YxJrUEuAiPNLzGMkp5sT4dNyt/DGjwc7wleZGimke9fYQcMlbkBU019XF4ncta8889YqKPJvlWXF+aiDZz3ZCZSbkYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734100228; c=relaxed/simple;
	bh=l+LOytW4KMl4YzA8MDmiu6FsOw4fpbkKcHgg4999JHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t0tBBkCMzgo00tN4/mTJmHfVeCQUvi0rd84nk3d5ryb9th+LI4RqfgOUjZLP/xEZsfmvuHsCMiwGX/+dfM92ErwlUNhNc9HwzE+gxYahgqzTvlitk3zXaQqfqjYZ0xAx13I5nnosdOYsIacXRfkMhv4SzqSBKgDoIIYRI8nyezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0pWMkvCO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0pWMkvCO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a766b475so18439975e9.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Dec 2024 06:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734100223; x=1734705023; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi1TXEqqDBiezezG8nYR4uQXdlaFaxavbh3mrGsln2Q=;
        b=0pWMkvCOTJrT2kn9fwe4Okalukj5zMiI17hN7TVGE1JdIXUYYYiq/308giGOZdGqDy
         /F3V06jHbIYMkxlUkRLG2GhNl8W10qJQa9oVusPDT5WBHGxX1lNskzauWCntaVk1Ma6W
         mqSq1ZKLSb2S0AADQ2uMtO+WA0hRwfRn7S2l8hDyABUIR25rpT9ng/c1Rx5FPQQeg2Fs
         z9hYXQn3mTfySuXRH5iDAUeLvk7w6pyodEQGxgR+gklY8m07lK8JEhh69XER0G8aBCy/
         75jvI3Drpv0dYl1IoCRV87pgeHMcOqvepN5w0XJLubEUUXhSgCKaQOBJJITuaB6vf018
         pAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734100223; x=1734705023;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi1TXEqqDBiezezG8nYR4uQXdlaFaxavbh3mrGsln2Q=;
        b=q8ZEq15gDud4TKikkxTwZPIcUouDfdBgjqI+NlV0kgaD/EREd4kxQRMod7rNNCPK09
         rIKhFbwxlDTt4yt7Mp/WVytdQPmm7Jb63sQQ4zVd/mZssC3FhDkIf/mkQ8h/dxO3VNly
         /Pqjn1Vkwg82MrKC8AYpRdxv198c5E6tlxSh21KWoiYAKsfazNEtSJePJPAz/26w9CsT
         kahvZuf0aMBmtqbp7G7qNpm2OQyjPwZ3zEjVxx8w550ZTuYGl5H5ZKmZPR9yfzdF7x0w
         KwXJPC4l3f4nlsPNrmOdW9nOrHgk9qOTHjMq7R48nJvTuXxxSN7V1oP/yi8ssn0JksZD
         064g==
X-Forwarded-Encrypted: i=1; AJvYcCUrT1F7cfPyqULMHGSaG8GghwJMoy7XlAttqzFZiSMx32hw56rJZnkKTW5gI2Z6ahBRpMKtFstqaJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6OKTVIHN5wYWwsksBdpIFBQh53ITo7YOb9GpiiAxziT21P3v/
	ODepfjVV23/YJSrmn4dFYPEgmPZzPUjiw2g2mosXrYiJtcdz5CJdW2SgplChOrQ=
X-Gm-Gg: ASbGnctEoI/J3+V9qLNWx7xJiTeicI8++FI/Bi8zVI6Cao0gMYKcEQ+oGhRLMQYcnMs
	3FuT+w2dkaUvN0eZ9/rCvsFu8Pd4TRcfM/sULmNcbTILAXEtq3oSbHWCFxTiXe6677IcXCRDOKw
	44wqVi8dAnyMWyziLgowmbTZ0Q48qnuvPuz5/2Idyl7KzRW1pu2Ok7ZCo/Hahbvu45odSUSGaBM
	bGnoHCEveQ7nUBWL47KapFo/1Yt6OOR+q8m6cCMQZwtJ/7ha0bfHGguFmyw1TbL3Uk=
X-Google-Smtp-Source: AGHT+IEBmcupQ7jLd1GlerO1KBdvvlUtU+d7uGcD/hEi+3rvYzaqGrrDbYHOw1AfBKz8/xsv1HIlnQ==
X-Received: by 2002:a05:600c:a08b:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-4362aa1543dmr28303935e9.2.1734100223162;
        Fri, 13 Dec 2024 06:30:23 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3da8:c88:4a1:9b7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43625579464sm50747805e9.10.2024.12.13.06.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:30:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 13 Dec 2024 15:30:17 +0100
Subject: [PATCH] clk: amlogic: g12b: fix cluster A parent data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAPhEXGcC/x2NQQqDMBAAvyJ77oJZU8F+pfSw3a5xqY0hUSmIf
 2/oceYwc0DRbFrg1hyQdbdiS6zgLg3IxDEo2qsyUEvekeuQP/MSTFDmNwZHjJI2xsRZ44qjfbH
 3XU9+uI4yPKFmUtaq/4v74zx/w3KPD3IAAAA=
X-Change-ID: 20241213-amlogic-clk-g12a-cpua-parent-fix-64362495fc9b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3449; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=l+LOytW4KMl4YzA8MDmiu6FsOw4fpbkKcHgg4999JHE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnXET9FTQHlDf7COIAQ8tPKiSkEOeg1ym4k8nLN
 w2YmO/f+xSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ1xE/QAKCRDm/A8cN/La
 hV1vD/oDVg1JFi3oFO2Jgffxn8O9WOKcGf5BljQHVgYNnYlO0R5E8Z0XETf+jKNf1t9+l7n65n9
 LEj685/INquJNq/DB0GqKRtBy8FuWJWEfoK35F07328l+LSh98VzWqB3QWMRb+LkyT9NQwrkN4h
 t19ECF0qW8AhO/kisqFU7bChtVoTrigfi+JCmmyE8vQgiMWaeUizUh1/DIlFOZ1iXOp805T1PLi
 FwQtPej0JyLfkjyw2lJ6ryu/EOEAmaYXvPGLCD3e24yt8Y5kFWnHdt/AfgylfLBnZEAW3+mkRnn
 +k+ClGBYBKjUnbx5PFWZ4+8zqK1meKPXwy8ZT8DFrC+48zevkLBGtZ5PVQwBywDwjYRBya/a2NH
 Q90mai8gFNfmTAKeK4P7i4wwzywzXg8uD9NX5vGczQoThKOcSJPaF69dGyY5/tGDo+lktSv8t6u
 Cl6cPEtw2RpLhzOCw2NQK8QSyaHfKUIfVayUZGttC1muG5li22PY/yE/2nXl+rdjNFL80fzKkMA
 uQuGWkG1ESYa0BE8q+5FFStR5UdMTRAZJQ99crrEJomu09ftxVfNAd9JpuIf89vvJoFXzSUQe06
 PWyv2wb3sA87J3EJrOgBID930xZbfC2KIXq1zbiI4kUXzYflicq4EJfNGNFkAyhFCNBpxjt9upc
 pSxW8yaFTC0phXw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Several clocks used by both g12a and g12b use the g12a cpu A clock hw
pointer as clock parent. This is incorrect on g12b since the parents of
cluster A cpu clock are different. Also the hw clock provided as parent to
these children is not even registered clock on g12b.

Fix the problem by reverting to the global namespace and let CCF pick
the appropriate, as it is already done for other clocks, such as
cpu_clk_trace_div.

Fixes: 25e682a02d91 ("clk: meson: g12a: migrate to the new parent description method")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 20be7b037c07535bd2115f6e70404a95a7832756..4e6584377e43fa7c9956017ddfcd3f295fafd686 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1137,8 +1137,18 @@ static struct clk_regmap g12a_cpu_clk_div16_en = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "cpu_clk_div16_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk.hw
+		.parent_data = &(const struct clk_parent_data) {
+			/*
+			 * Note:
+			 * G12A and G12B have different cpu clocks (with
+			 * different struct clk_hw). We fallback to the global
+			 * naming string mechanism so this clock picks
+			 * up the appropriate one. Same goes for the other
+			 * clock using cpu cluster A clock output and present
+			 * on both G12 variant.
+			 */
+			.name = "cpu_clk",
+			.index = -1,
 		},
 		.num_parents = 1,
 		/*
@@ -1203,7 +1213,10 @@ static struct clk_regmap g12a_cpu_clk_apb_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_apb_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "cpu_clk",
+			.index = -1,
+		},
 		.num_parents = 1,
 	},
 };
@@ -1237,7 +1250,10 @@ static struct clk_regmap g12a_cpu_clk_atb_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_atb_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "cpu_clk",
+			.index = -1,
+		},
 		.num_parents = 1,
 	},
 };
@@ -1271,7 +1287,10 @@ static struct clk_regmap g12a_cpu_clk_axi_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_axi_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "cpu_clk",
+			.index = -1,
+		},
 		.num_parents = 1,
 	},
 };
@@ -1306,13 +1325,6 @@ static struct clk_regmap g12a_cpu_clk_trace_div = {
 		.name = "cpu_clk_trace_div",
 		.ops = &clk_regmap_divider_ro_ops,
 		.parent_data = &(const struct clk_parent_data) {
-			/*
-			 * Note:
-			 * G12A and G12B have different cpu_clks (with
-			 * different struct clk_hw). We fallback to the global
-			 * naming string mechanism so cpu_clk_trace_div picks
-			 * up the appropriate one.
-			 */
 			.name = "cpu_clk",
 			.index = -1,
 		},

---
base-commit: 799ce46951dcc75682223cdab12fdc905f2fe735
change-id: 20241213-amlogic-clk-g12a-cpua-parent-fix-64362495fc9b

Best regards,
-- 
Jerome

