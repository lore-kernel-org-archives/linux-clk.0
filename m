Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6111E0488
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894509; cv=none; b=LGEZqeJal+QzJDXah+S3J/4QhfpS6hbMseRyxNn5h7h6AsseUGxL4iq9MuFfrF4WgI2jGdwLSb+Ruyv5UtOKB+9WwEhik2YxUbvVGNIKnzw0R+k/C/rWD5SOLyWxJ0bruhU6an1jmJuHSeJx6SjqbQBJU+MrOWGJoLZw0LPkMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894509; c=relaxed/simple;
	bh=Cq6v4CVFupgSskk64+DOZThy2pz5y39e7tLe6/S0pBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XWr13cPe6KZOyf+ca9wqiMuW52jDLvUDCfOUoh7Mqa8IKtKNyyLxsQuM3dtg2m/+R1uMdpiVGjpzPl5/+avCB+hbFYAY7gaNT73jmppeM0Kks2DhTvKcjhLp1udRObZqLVbrV+pgy+I+1Vp0APBUJAInQHQAxSrEr5JbnK0U6rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SGBbSwos; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SGBbSwos"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cedea84d77so3643595a12.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730894505; x=1731499305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0NoUQ9uUATYOWwfbNEUKFGvBuFbVRyeRTQOzTFJM+k=;
        b=SGBbSwosLEi7Zs7N9ltjZnSXtMX7KMPo11ZRtbr77kYyyD0kAIi368PMkcN1k5vaaZ
         YR+528wrZ5uy9cpPBhQ5Nuz/SwjGQNqx2hBO/dVFagO0TDSRytu487yqjjWN1yVwXOqG
         vQCdYJZG0iob3QkTw2Pk24mXFrPGQ9FuIKY8wjFYYc4gwogGwu12N14Jpbp5XH10oosV
         pBfgKYeYqzPmBUNOAIZzBv4p7HgTMBzXvDipgo+Mf5dcw2bkEw5tIRpRQbqIFaSID44p
         FeUWmrzmsXgwRXoAH86KMNw0XOp9CreKXrQXPUDK/BZkjW8J8Un5kzSnXXgc37X2AQiA
         HdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894506; x=1731499306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0NoUQ9uUATYOWwfbNEUKFGvBuFbVRyeRTQOzTFJM+k=;
        b=k1T/G3sNgTDT7nJsI/fVaqLLbCIPrfCKHtuHUd2pxzvQAxetore0A76a4tqPg2s4tk
         bn0nN41+LBB93Pn7JKarJIWRH1K61w536TuVPxkzVuPU6qDhxLQdy/ILoiLoRaRbc8mU
         h/uMaefyaJb/MeLq28CC8oQP2MLy+D0c9yHpQnBjqvtMV/elEjWbrXtyt9bIcl8KOHcL
         NCZ/iCt6KIRxfWCh0BmWVeWYJvtKEr9BaL5gMAe0omigILRqa8E7zaRnxs58AqAhspNa
         4dyOxm+BUEwz+I3ynQgsvCj594nb4zWK5+QH3C1lZKWfNsoPcrl8oVjIUO/BjOlod3Ai
         hGkw==
X-Forwarded-Encrypted: i=1; AJvYcCUFqbjZOrSdgEuJ8amNSfwVQbm2nLuC0PbdcbZMM26kClGJsB6x/dnQ4mVP51tPpHJDOqFPWUtG3Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwumN1mAiUph+iNrIwdT2hYKFiOQB5kjlYVCCnAXwLGXpnk3GSY
	5B6r9UYpbjWDetQD+O3Ii1eITF0Fh0iaRYcqJqYVHUKmWzGw78JZzhDcJmm3ijk=
X-Google-Smtp-Source: AGHT+IHSbEQ4qrc4BxaDWQnK3AprPaGW4s/qTzpWrhWgR2lHsq0Vr0p6Z2CuYqxvfGmlHU6ILfMhBA==
X-Received: by 2002:a05:6402:2351:b0:5ce:d6b0:85c0 with SMTP id 4fb4d7f45d1cf-5ced6b086e4mr9302730a12.22.1730894505249;
        Wed, 06 Nov 2024 04:01:45 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6afe528sm2697984a12.55.2024.11.06.04.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:01:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 7/9] arm64: dts: renesas: rzg3s-smarc-switches: Add a header to describe different switches
Date: Wed,  6 Nov 2024 14:01:16 +0200
Message-Id: <20241106120118.1719888-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There are different switches available on both the RZ/G3S SMARC Module and
RZ SMARC Carrier II boards. These switches are used to route different SoC
signals to different parts available on board.

These switches are described in device trees through macros. These macros
are set accordingly such that the resulted compiled dtb to describe the
on-board switches states.

Based on the SW_CONFIG3 switch state (populated on the module board), the
SCIF3 SoC interface is routed or not to an U(S)ART pin header available on
the carrier board. As the SCIF3 is accessible through the carrier board,
the device tree enables it in the carrier DTS. To be able to cope with
these type of configurations, add a header file where all the on-board
switches can be described and shared accordingly between module and carrier
board.

Commit prepares the code to enable SCIF3 on the RZ/G3S carrier device
tree.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 20 +-----------
 .../boot/dts/renesas/rzg3s-smarc-switches.h   | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 55c72c8a0735..5c88e130c89e 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -9,25 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
-/*
- * On-board switches' states:
- * @SW_OFF: switch's state is OFF
- * @SW_ON:  switch's state is ON
- */
-#define SW_OFF		0
-#define SW_ON		1
-
-/*
- * SW_CONFIG[x] switches' states:
- * @SW_CONFIG2:
- *	SW_OFF - SD0 is connected to eMMC
- *	SW_ON  - SD0 is connected to uSD0 card
- * @SW_CONFIG3:
- *	SW_OFF - SD2 is connected to SoC
- *	SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
- */
-#define SW_CONFIG2	SW_OFF
-#define SW_CONFIG3	SW_ON
+#include "rzg3s-smarc-switches.h"
 
 / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
new file mode 100644
index 000000000000..e2d9b953f627
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * On-board switches for the Renesas RZ/G3S SMARC Module and RZ SMARC Carrier II
+ * boards.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#ifndef __RZG3S_SMARC_SWITCHES__
+#define __RZG3S_SMARC_SWITCHES__
+
+/*
+ * On-board switches' states:
+ * @SW_OFF: switch's state is OFF
+ * @SW_ON:  switch's state is ON
+ */
+#define SW_OFF		0
+#define SW_ON		1
+
+/*
+ * SW_CONFIG[x] switches' states:
+ * @SW_CONFIG2:
+ *	SW_OFF - SD0 is connected to eMMC
+ *	SW_ON  - SD0 is connected to uSD0 card
+ * @SW_CONFIG3:
+ *	SW_OFF - SD2 is connected to SoC
+ *	SW_ON  - SCIF3, SSI3, IRQ0, IRQ1 connected to SoC
+ */
+#define SW_CONFIG2	SW_OFF
+#define SW_CONFIG3	SW_ON
+
+#endif /* __RZG3S_SMARC_SWITCHES__ */
-- 
2.39.2

