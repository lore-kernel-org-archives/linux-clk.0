Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA11465AE;
	Mon, 13 Jan 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756905; cv=none; b=qSiQUgyiQpAPWyIsQIElkCpscaVEJT2AkkqWzj1viIpVr48FEQuEXzSxuzEnCqPx87wuxv8T9sW7H9E95pW8okZYU1tCKn/NXb6JAHSgALo3DXNSAhR8+3MiYERuXX4+lW0UM7JOAKbNdWcSuzn++OPvgjM4Kwr3DquOUkoy528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756905; c=relaxed/simple;
	bh=9GcZNGYXUOJJm7jWi0O4TxfNwGLaRA9xwYO7Xu40d4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xy83KoC7D83EUQhOaLUeWfgsdRVhSBrN8oLnJsuXdE90knjnCS2NzMnbB2JAeAIuJwMsTecHeNS/WuwKZ1B3qWx3XQfm206AqoNoA4AysjlmUf+j8+faT7amTFOpXd3+Fl9Hh63ut2J6MkXBIem2OVfxdIXrYwHgbe7KszMkzOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5/J6rgV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5/J6rgV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436281c8a38so27787355e9.3;
        Mon, 13 Jan 2025 00:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736756902; x=1737361702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1JLCqsSNK2ejYJ1H0MfwCzbM1HS2oy5ooeNyIokMGU=;
        b=T5/J6rgVixdu9gS/iDmyn+r2BtSdDQ/Dh8K05mzGZ9P91oaGJ9F/RAqNMvobaNqqd/
         QR37xewkVmPKlwJyNQYDi3Jm8ZmtSWaaFEuuayXHhPnNYcyh16w/SC+Kz70EMvGQL2TC
         4vIVwwGxnIcNlA6IeqA7UKpf0/knpg7LetQygOVbcj336pAuVTRZIZGCvNqp3ugH/jU/
         IHk4Qaz4gvfGkFYi5v/tdKb6ZXVRK/bUPgf7EN/ugAjsv7mS3S9gxdoUETCoQ+ZExA7i
         8zzhWcQwMCfqGKVEwcxFwNzuj5+Meg4NzVTeCcxCsXoz5tXs5DIfVU8vcZdQKbdJMm6q
         mPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756902; x=1737361702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1JLCqsSNK2ejYJ1H0MfwCzbM1HS2oy5ooeNyIokMGU=;
        b=NpHyfw2gKnGbrw3r96e9tWY/dXUAO6cho9HlJgShb05nHORkoaTomt07AEjJTH9uKT
         V0+yoavFmDu8lRH5CK1v6kwVDa4gu0yEhQxZL0iY+SOwNDxENgJu7g8A4x8VAF8U6NY2
         KFWOneymn+Vcj+iKPXn7AcanI2NKJrA6HskeDDWr9v4DwlNPKybCgIKzkkkxMc1eBp6s
         ve9ztlnMOTSc/Der5xD0Q0j9Viovtb4sKFH8kPGPaMSBH/yjGp94Amcq6RN+vzzjyt7C
         Ia5vCjXBBg8HmYqb3jqLxF9SnUStKvmaD1lKUDP7IHLu6Fm6f4RkwhR8PH+8CZ1OrQBA
         3xKA==
X-Forwarded-Encrypted: i=1; AJvYcCVQOHUwwN9ynUf/o+TJO/AYESn+TfmsrKryex5Y3P77riS0yT2rlF3FN85p+JG3lBAWQjtk2VQdjfcXcuw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcf/mcRkhk1zBdf6ZdUleOoAP5MMDaLO+iloDsB2LNje0l/o9D
	yv6WolPtLjBusW+snwoTlMu3F+ZWryWDAniueDZUpeHlITisiVp1Q+micw==
X-Gm-Gg: ASbGncu8OpuO/cQYNgm6KOKc4b8fNn21oRbI2qjRqL12IGhc01+V94tcHaPL4RJeHh3
	u2P+/x1Hjj7Ykg2fFbu+rQHiqCTjjXBarG8x/RJ85TMWOBi/uhymPGxwiOHB+6FDt2XwaWbNjl4
	F2nf3holXnyOmKk0EKH7HmHfDzAPndDpeaIEK/s7nilkc38YylGYiqh71jfbpq9MTD+S0d4kBAw
	D3dyXWNhK+/OPy5SRm9HdcIxaX/rXsV3DDxe6/7yGUQRDBPx2ZGWNbBZ2TQajXeJaJ2yiXqK5SZ
	i7ggqsQLqjdO13NlGds8i2m3mQ1DC2kkjJQTNY2Fki2l2Co=
X-Google-Smtp-Source: AGHT+IF7Sr6ux956/fnvucH3mXwEdBgdEN18KwaoHCLRX2Yjc5lNehPQeeqsbBzEdXuOalHCnSOHDg==
X-Received: by 2002:a05:600c:314e:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-436e269aad7mr173787465e9.8.1736756901343;
        Mon, 13 Jan 2025 00:28:21 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03f54sm135902315e9.21.2025.01.13.00.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:28:20 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
Date: Mon, 13 Jan 2025 09:28:18 +0100
Message-Id: <20250113082818.345939-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock missing definitions for RT2880, RT305X, RT3352, RT3383, RT5350,
MT-7620 and MT-76X8 Ralink SoCs.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 include/dt-bindings/clock/mtmips-clk.h | 130 +++++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 include/dt-bindings/clock/mtmips-clk.h

diff --git a/include/dt-bindings/clock/mtmips-clk.h b/include/dt-bindings/clock/mtmips-clk.h
new file mode 100644
index 000000000000..a03335b0e077
--- /dev/null
+++ b/include/dt-bindings/clock/mtmips-clk.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MTMIPS_H
+#define _DT_BINDINGS_CLK_MTMIPS_H
+
+/* Ralink RT-2880 clocks */
+
+#define RT2880_CLK_XTAL		0
+#define RT2880_CLK_CPU		1
+#define RT2880_CLK_BUS		2
+#define RT2880_CLK_TIMER	3
+#define RT2880_CLK_WATCHDOG	4
+#define RT2880_CLK_UART		5
+#define RT2880_CLK_I2C		6
+#define RT2880_CLK_UARTLITE	7
+#define RT2880_CLK_ETHERNET	8
+#define RT2880_CLK_WMAC		9
+
+/* Ralink RT-305X clocks */
+
+#define RT305X_CLK_XTAL		0
+#define RT305X_CLK_CPU		1
+#define RT305X_CLK_BUS		2
+#define RT305X_CLK_TIMER	3
+#define RT305X_CLK_WATCHDOG	4
+#define RT305X_CLK_UART		5
+#define RT305X_CLK_I2C		6
+#define RT305X_CLK_I2S		7
+#define RT305X_CLK_SPI1		8
+#define RT305X_CLK_SPI2		9
+#define RT305X_CLK_UARTLITE	10
+#define RT305X_CLK_ETHERNET	11
+#define RT305X_CLK_WMAC		12
+
+/* Ralink RT-3352 clocks */
+
+#define RT3352_CLK_XTAL		0
+#define RT3352_CLK_CPU		1
+#define RT3352_CLK_PERIPH	2
+#define RT3352_CLK_BUS		3
+#define RT3352_CLK_TIMER	4
+#define RT3352_CLK_WATCHDOG	5
+#define RT3352_CLK_UART		6
+#define RT3352_CLK_I2C		7
+#define RT3352_CLK_I2S		8
+#define RT3352_CLK_SPI1		9
+#define RT3352_CLK_SPI2		10
+#define RT3352_CLK_UARTLITE	11
+#define RT3352_CLK_ETHERNET	12
+#define RT3352_CLK_WMAC		13
+
+/* Ralink RT-3883 clocks */
+
+#define RT3883_CLK_XTAL		0
+#define RT3883_CLK_CPU		1
+#define RT3883_CLK_BUS		2
+#define RT3883_CLK_PERIPH	3
+#define RT3883_CLK_TIMER	4
+#define RT3883_CLK_WATCHDOG	5
+#define RT3883_CLK_UART		6
+#define RT3883_CLK_I2C		7
+#define RT3883_CLK_I2S		8
+#define RT3883_CLK_SPI1		9
+#define RT3883_CLK_SPI2		10
+#define RT3883_CLK_UARTLITE	11
+#define RT3883_CLK_ETHERNET	12
+#define RT3883_CLK_WMAC		13
+
+/* Ralink RT-5350 clocks */
+
+#define RT5350_CLK_XTAL		0
+#define RT5350_CLK_CPU		1
+#define RT5350_CLK_BUS		2
+#define RT5350_CLK_PERIPH	3
+#define RT5350_CLK_TIMER	4
+#define RT5350_CLK_WATCHDOG	5
+#define RT5350_CLK_UART		6
+#define RT5350_CLK_I2C		7
+#define RT5350_CLK_I2S		8
+#define RT5350_CLK_SPI1		9
+#define RT5350_CLK_SPI2		10
+#define RT5350_CLK_UARTLITE	11
+#define RT5350_CLK_ETHERNET	12
+#define RT5350_CLK_WMAC		13
+
+/* Ralink MT-7620 clocks */
+
+#define MT7620_CLK_XTAL		0
+#define MT7620_CLK_PLL		1
+#define MT7620_CLK_CPU		2
+#define MT7620_CLK_PERIPH	3
+#define MT7620_CLK_BUS		4
+#define MT7620_CLK_BBPPLL	5
+#define MT7620_CLK_SDHC		6
+#define MT7620_CLK_TIMER	7
+#define MT7620_CLK_WATCHDOG	8
+#define MT7620_CLK_UART		9
+#define MT7620_CLK_I2C		10
+#define MT7620_CLK_I2S		11
+#define MT7620_CLK_SPI1		12
+#define MT7620_CLK_SPI2		13
+#define MT7620_CLK_UARTLITE	14
+#define MT7620_CLK_MMC		15
+#define MT7620_CLK_WMAC		16
+
+/* Ralink MT-76X8 clocks */
+
+#define MT76X8_CLK_XTAL		0
+#define MT76X8_CLK_CPU		1
+#define MT76X8_CLK_BBPPLL	2
+#define MT76X8_CLK_PCMI2S	3
+#define MT76X8_CLK_PERIPH	4
+#define MT76X8_CLK_BUS		5
+#define MT76X8_CLK_SDHC		6
+#define MT76X8_CLK_TIMER	7
+#define MT76X8_CLK_WATCHDOG	8
+#define MT76X8_CLK_I2C		9
+#define MT76X8_CLK_I2S		10
+#define MT76X8_CLK_SPI1		11
+#define MT76X8_CLK_SPI2		12
+#define MT76X8_CLK_UART0	13
+#define MT76X8_CLK_UART1	14
+#define MT76X8_CLK_UART2	15
+#define MT76X8_CLK_MMC		16
+#define MT76X8_CLK_WMAC		17
+
+#endif /* _DT_BINDINGS_CLK_MTMIPS_H */
-- 
2.25.1

