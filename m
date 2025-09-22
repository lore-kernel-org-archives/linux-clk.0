Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E0F2FD7BD
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528757; cv=none; b=rBoXIkQ5+eSyFuozVvkE+KpKYIasu/7po3FLIk3w/Z/arc6qXgNXpTaLWewkmr65S30ZXv0mq/mOXx1ffuzOswHZLKUIn9BDaANmBw7kUoNfVz3a7QKmrv938eKrHVfbgnI6ZyZ5aQJB5fIuVlUuGrdQk2bBzRztToUwaj9sAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528757; c=relaxed/simple;
	bh=ciJyOR3eGK2gidrZT8YeI5fy6dg+FxklvW19mrX4w1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=loIWa6eSgOP+VUfpc6Y5p3VbOYszF2NGpStIx1RSJ4bYqYSv8+7tZHriy52q+NVTX7Hssd9/GcNGy6pB3H/f2rTmuPJoyxMC94T/1XBhbMq0JeJdR2ZEC5+u/ICKHTfzADHilTtseDjOGUaS3TCUZAKsTDJ5Q0X5OOZBxwqMcHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ika7VvFy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ika7VvFy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so26799275e9.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528753; x=1759133553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=ika7VvFyBacSeponGeHLxMa6+BeAoLmoJ4tYJK4e75JasN2tkJjTN5CcLp0QaEBvIQ
         LNX90UoyX99bbDfX1z+Rvq1J973wgXht0/2eUDSMFPs0682h1PFcSoEdkz6fTarsgYN4
         JPEOGFo8z/oS/F89c6Lh3BqeIaQ/GKdQGmD9We9qD9vFGK7hyHkCYBb/2m+PskzZltBS
         J0XnRnz8Jv4NELa+22mwpo0F9FUhmb9eKoHAbqQ4G9AOMx2r4Rq/F6nxcYm3nph0Q/jR
         MCvAjxw5IHufDkyLK/vnmvjvnsSMekB8NEsPz9QTgBe/HE5Stz9Wf9iJXVfNcHYAVn3p
         8+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528753; x=1759133553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=QJ3h7QBSQz6nX55+YaJEntWznG0SD4OAPgEfCU4hLbubxd60WXZ6hSAMlEzidGdrPS
         gNsfmxs/4lWqxfgjz0NryzwP+4oyw+IYWX7p3Mys5TNFlA+QXIVrBto8CbfqQj5QORQV
         AQMmNPD/lWKUfwIRlWO3OrferMnLdTh2cAj5pZUMho8vlk4WXWQhbNZOTBI0edbYI4V4
         3OSe2PqNnGgqP6rpT3RQGhFZeBY32W6MePWCoxnuRZx+WwgsUcNvzlBKaTKt24IX65M/
         9bRwSZPhXLxlC0UTa0mTxmz62gvWZt/EHSNe75GZBwNP53Fl3qlLkywiesmmDsewYOI8
         Er6Q==
X-Gm-Message-State: AOJu0YwCxJk5Vlx2vv40W3+V5oR/NnWeZSUrHeYcMWBV4fc1dHAakiy2
	x0jQ9sNg+xWcjdxnc7Tq+DatnyNTgHN3oi1yfwI1BDg0qrE8Co3C7y7A
X-Gm-Gg: ASbGncuK/UWHUQ0ipowqozXTGp3qCt+CLe4FM7GJuNOBcZ6AQZxPDQvuzvQstVHjgnS
	nKTqwRxaFw0timFYB0Dh6DwGCLJ8wxIJzaE5swjJeZx1bezFvJIh8nOT6xB4qkEopQKNUYMD7pq
	F8xGDWvxz6Eq2FRmX35v8bVTo6/9K3miQY9uaKooqBLlHeqUafrO/CgI3yRqlw5salgcOqtq6h9
	QsZKh7EXQ51UeEKlknoCUIWwfa0k5bTccDyxJg66XXBkkofeL/K+97/egYi0ctitpD53et5nPRO
	szPWye5/HrO40NXco12XgCcMU+i0akflFJa+4Umu97aFOklmpaTiVJ+S2bBsNIvYIpTu2Fsu2uz
	XvpNlKgkesmbDIlOe2z4tEkEFjat2j/tMpL7x8g4LL2olNQ0HIUIyMZyofZg6GVrc1mvdfXouVa
	VlI6LEyNUVxIT/JnHw
X-Google-Smtp-Source: AGHT+IHErk/g/+nIENyJ6+q+pyXV8qOgYAZOyjvomg2ntIsCHA25Lz454iGFXy1dqVhhd2gwP8RBKA==
X-Received: by 2002:a05:600c:4ecf:b0:45d:cfc6:5166 with SMTP id 5b1f17b1804b1-467ea89db1bmr112950935e9.23.1758528752582;
        Mon, 22 Sep 2025 01:12:32 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f3d8csm17958416f8f.9.2025.09.22.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:12:32 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:19 +0200
Subject: [PATCH v7 2/3] clk: stm32mp25: add firewall grant_access ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-rcc-upstream-v7-2-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
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

