Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1464B2D94A5
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758707097; cv=none; b=tlQUBpLSzWxrn+szPkkJy90IoDx/2srM9L5qrdHmJ0HQ5Hu16UKRRZWtkJ4v4qGz2sT5B+s5909ccrOgUjn0WcU+KnDIFBIKxjS6/aJzourg5gv52TfZdm4g9mgfBXfIs5f5BAP6PSThh8NQ9HB75dWnXanQlTRU+Pds80iBmcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758707097; c=relaxed/simple;
	bh=ciJyOR3eGK2gidrZT8YeI5fy6dg+FxklvW19mrX4w1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRaOUT2rzx17HfG3/T2i4q2Mib3JI9YjPYVmQ+vJZQTN7/Yuav2urRgD8+tLJdjBh/K2VgAtR0QqfanxxkWmjTdcuyr5TkvBfZ7UiNEbI7z74e74YPp/Ti+0o+E7o7sNzXyb7oW/Fzh5uHyPrz9qtbvctlU0BQzHiAWfsfdZYbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wws6VjMz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wws6VjMz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso2293665e9.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 02:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707090; x=1759311890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=Wws6VjMzHCcBeuBqc/VWUPquM3KzllnF+5VZgNsPQqiGXKl7p+BonBA9x+ew9HLdzx
         1Knq3VunrDzaOquoQqX2N276RjQX4aqgILjQjz+ti55ASQwGT4qrJal2T5Va9tTcDT7o
         Kv2/anThBiV+g0L9fxXFb2bLBH01uKqYPJISWdqDiAX98miSLMwn3rEHfKJHXe/PsRX9
         xX6vv2j5XOw7iYdMAZFSLd/pTZAaxHPswi5m7MJ6+ut/gH1beVhLxXyifEY3vboKPQWo
         mPBZ/0NqfmpcpoiLXCNHs3Fq3BNYcvlATSMScxua2EGbrEz2bzbUeNsFxk35gTpfg7MB
         fuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707090; x=1759311890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=KNFksglD/A4h+rqT5f0YnSxBfyRU4kMpEC6pxNCyCfTX8givVM2J38sqELVX8u5wHL
         bxgE0RUx+fp/5WuA6RPfoyPiKvhqjvsxe9rigieghGPRqcXmKd/LW6n6bNa7p+1fZeiE
         w1T2q+IAvCUSHEsBebn2WotqzAhvbYEpTNxyDoDtvyovNvG2MedVRxqw6tMJDJvTIk/L
         fYDuCWsQJK2Uo7mQDnCtq+5GapnLF83d5SBl2WYReLoqlQjujG74ngFRSud/UVmqMKkf
         QKbiYfzoHZ6+bwKERuRU+yKiJS8AAcYhZGiTU/rRRVf4M+uDELUWhWbC4Tk0wMtuPpFZ
         U3fw==
X-Gm-Message-State: AOJu0YxLEira6/TOdudC/1DFwhN7LjEZTfpM8xOItmkj9NZIDXqxP+lx
	Z01JDM4Sx2zDptXWsAQ/BFBI8CVTC5tWwFG7nwTUHXY1HGIxZneEjOHxTxWiGQ==
X-Gm-Gg: ASbGncsB9c/0+Lf1bMb0v3O6Z5br0NA4yhyAAfV7bjsXexQE6U6I3gMWP/HkEEbAuLR
	AIeSKStagrgCeYIa+SSH/Ajn75CtJMTbxYLJ6JEsmdMTwcpM7K/K+7en3bNie+bSQIX5xgkP3Ko
	g8UiWGj2kU7DQwTZx17P3Ax2Yzk6cqZ/P9fyt+jNC1zbvp7e3Kz1G9mtqongCC6kkRpVsqDeM5L
	uxD+ay3UuPBAOx054Jmt6febuEbUXCDJDyqMAtYMbzY+7hguuqQC0OOSVVhVISXVqSV2q1Xj/p8
	lrqrTNVIzQ1JSoOKGUc36Gj/0gke0ANSsbGvahzsnb9pa3nQGCTjEJDXj7W9nLe59th2Xs3OgsT
	LnBwMTvWp48q79X8BFVt1TiEaI9pjy8IsxBysa0+8aNi4vvB3ZzVPtuQZPBdA47T8Sn+74/5E2T
	A1iEEQnDhiuaWZMw==
X-Google-Smtp-Source: AGHT+IEhM0YgF2Kn4HKT8PplTIrFiGxgI+VDLPFn2Qw0xzee/LIuyoGd6FHnJttuYVQuUAjdxDoCmw==
X-Received: by 2002:a05:600c:468f:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-46e1d979fc5mr51230185e9.1.1758707090354;
        Wed, 24 Sep 2025 02:44:50 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm30729625e9.7.2025.09.24.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:44:50 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:43 +0200
Subject: [PATCH v8 2/3] clk: stm32mp25: add firewall grant_access ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250924-b4-rcc-upstream-v8-2-b32d46f71a38@gmail.com>
References: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
In-Reply-To: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4

From: Clément Le Goffic <clement.legoffic@foss.st.com>

On STM32MP25, the RCC peripheral manages the secure level of resources
that are used by other devices such as clocks.
Declare this peripheral as a firewall controller.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..af4bc06d703a 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,8 +4,10 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bus/stm32_firewall.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 
@@ -1602,6 +1604,11 @@ static int stm32_rcc_get_access(void __iomem *base, u32 index)
 	return 0;
 }
 
+static int stm32mp25_rcc_grant_access(struct stm32_firewall_controller *ctrl, u32 firewall_id)
+{
+	return stm32_rcc_get_access(ctrl->mmio, firewall_id);
+}
+
 static int stm32mp25_check_security(struct device_node *np, void __iomem *base,
 				    const struct clock_config *cfg)
 {
@@ -1970,6 +1977,7 @@ MODULE_DEVICE_TABLE(of, stm32mp25_match_data);
 
 static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
 {
+	struct stm32_firewall_controller *rcc_controller;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	int ret;
@@ -1982,7 +1990,36 @@ static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return stm32_rcc_init(dev, stm32mp25_match_data, base);
+	ret = stm32_rcc_init(dev, stm32mp25_match_data, base);
+	if (ret)
+		return ret;
+
+	rcc_controller = devm_kzalloc(&pdev->dev, sizeof(*rcc_controller), GFP_KERNEL);
+	if (!rcc_controller)
+		return -ENOMEM;
+
+	rcc_controller->dev = dev;
+	rcc_controller->mmio = base;
+	rcc_controller->name = dev_driver_string(dev);
+	rcc_controller->type = STM32_PERIPHERAL_FIREWALL;
+	rcc_controller->grant_access = stm32mp25_rcc_grant_access;
+
+	platform_set_drvdata(pdev, rcc_controller);
+
+	ret = stm32_firewall_controller_register(rcc_controller);
+	if (ret) {
+		dev_err(dev, "Couldn't register as a firewall controller: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void stm32mp25_rcc_clocks_remove(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *rcc_controller = platform_get_drvdata(pdev);
+
+	stm32_firewall_controller_unregister(rcc_controller);
 }
 
 static struct platform_driver stm32mp25_rcc_clocks_driver = {
@@ -1991,6 +2028,7 @@ static struct platform_driver stm32mp25_rcc_clocks_driver = {
 		.of_match_table = stm32mp25_match_data,
 	},
 	.probe = stm32mp25_rcc_clocks_probe,
+	.remove = stm32mp25_rcc_clocks_remove,
 };
 
 static int __init stm32mp25_clocks_init(void)

-- 
2.43.0

