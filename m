Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFED33FE05
	for <linux-clk@vger.kernel.org>; Sat, 29 Aug 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996884; cv=none; b=qhHaW5LoOYBNl10hMF+M9StrO/spQvXymwgWbplTkq52xN4u1qtv8vwMhceev6hPkTu6j+iI4pS/iweMUKr3yxdIpq6vo/vzlVeTLt7Rz5dAwPv4auUw+5IMPAlMe9UftIiCSDl1W0pPHEPw07x7aO2yDrl48BUSpgwFzG2u5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996884; c=relaxed/simple;
	bh=qtHihgUfVJ7dLLyKBNMnY1uHg9+U0eAjPmJBvsAA+mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbGYdyvvhSdlNCECs66sHPY+NTvI/E/qoJ/P0kjy4EGe14STXJ3DJ9hsqqaXJIu5jgFwjn5P5tWQqyYkAikQgP4SDM4zxMD2QW+3haHK5c1E0GHhIwIa+sow+bw9Vb870h0xrKV85AsJv+wBgSBkVOheFr/FcBlC4QCzesbqA+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1045225f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996881; x=1788601681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGDbub8U4HXvEWoNu7b7TUqir4ckSWpnsJ/08Cf1vHM=;
        b=iuR6Tx88QskTYBLHQMe+aNZZkaZGFA2lHcgyIlMzHBPp5eBZIp3C/60ZjZepE8RGOp
         jP1uFH633s/PRF6t62e8m8TiRzB/VdrqHEwREHhrbau5qlp6hOi4ZRZBn7EkmZQAh2cw
         2MaKf2CWILWmkqDG3qrqkY/uBZsjTYe2/10P8c/yOZhv7MfeST4kDc/oyJUqrA0DfrDm
         gopx0Mc+KPOloSRJGzRNP2VbTd/VqRD/whI5ql0H0MzjLZgV/s14h9/4bYdzCrZFvfXw
         v0Z/aFDcCriK7vOA4R6OJcssT3fGP7RJrmHe+oolFKOUvZpppjhf7LeitY9zdh4+BXax
         T4iw==
X-Forwarded-Encrypted: i=1; AKwUvBzWKY7oFwysPgvBkAcdfou7fkmlWnDQQuKYzcmSijA0PzAOIHzqh6/yfEjlLqulq3S167TEXez5wHY=@vger.kernel.org
X-Gm-Message-State: AFuF++mL8omrWvB1IPGv7WOHVK7UkzuYu8S3MtY7Ed+KBDx2e4mRCTBi
	WGBrU9vTKk9IbL4irD8D3dhxFjAKdEfef4Ptgdq87YIdpdNKOZOvtvk2
X-Gm-Gg: AYBFou1isSyVImCUAMHVaxmzh9aBEnNtv7UvunVxrySFIcjmUJIP8NvXFCWwCbeatAq
	DetZIn2u1h09miHmkIHtvL7vrqpzby9n78V8AsQIQj0JT18Xz7QZjqhQG7zqIiQJsaB0NzKTPGg
	bKiCJ7cZS+B8I0Y/Eo6HITUMSfC7YD6y/R6hoGDSO1xbcXgHnw+7gOyRhnVYIhbfMhSnb9QS6xu
	D9hjt+VHiaoEi01xeOwRDe8Bq402ZQgV2068WnKhwx+N5uDjgdEsh3OUvTbp8v+osjy5EWgniRG
	U8Mvj4zvqwgEUmtQkx0jdIJhWNBibp4qTAO6FFEowMj2HXgOKzDntWfGR35Z3DB227dYUPSlbQ0
	izxiinCEj2DzpsBfKr3AwVVnDM+GfBvOgSHebLelr3C2wZGMd1evjWWBH5zaYHjWRVMThXo0Gzx
	Nv1e9iRppt3ZqtuBsYaXBBRcjL/bSJ1UM6AvEC7Bn1Sy0rpjqJo5hmAlzjC+fC9ZtXLRoVIJ9lR
	nM2Oix2P0Es8AXKYoeNoIK/C7c=
X-Received: by 2002:a05:6000:2207:b0:484:3310:f398 with SMTP id ffacd0b85a97d-4843310f455mr2068417f8f.25.1787996880459;
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/4] clk: meson: t7: keep the memory fabric clocks running
Date: Sat, 29 Aug 2026 10:47:55 +0100
Message-ID: <20260829094758.23248-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four clocks feed the bus that moves data between the peripherals and
memory. Nothing in Linux claims them, so they were switched off shortly
after boot, and any device that started a transfer after that point
simply stopped. The SD card, which comes up about two seconds in, never
finished reading its identification.

There is no device these clocks belong to, so mark them as always
needed.

Fixes: fab4d651b592 ("clk: meson: t7: add t7 clock peripherals controller driver")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 214db7850d86..55d09e78593b 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,11 +945,16 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+/*
+ * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
+ * used for DMA between the peripherals and the DRAM. After the clocks are
+ * disabled, a device that starts a transfer cannot complete it.
+ */
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
-static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	0);
-static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	0);
-static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	0);
+static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_sd_emmc_a,	SYS_CLK_EN0_REG0, 24,	0);
 static T7_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG0, 25,	0);
 static T7_SYS_PCLK(sys_sd_emmc_c,	SYS_CLK_EN0_REG0, 26,	0);
-- 
2.55.0

