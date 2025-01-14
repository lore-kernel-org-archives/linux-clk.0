Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D443DABF0
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845900; cv=none; b=Vv708mQPKFdkCto4XbAL+OffppZipNfpXmzdowR5DjFaLHdG8FLVQAoqDByou7bYzejFliExxryOF7j312qqTsLpz62l3XUcY6GcAI0iQrDg/W70fbv7QAf+YknqE9sySI1aHMRokUc1XW6pCdbjzjY+cILOLPuPAxb7tj6pBPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845900; c=relaxed/simple;
	bh=54AnFoYFZcZqYgavjCEUI5tS3rZv1k1LrPOchNuHl/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NahNCUoX5JwERq7cik9HOw1dN/z5vAjce19OJbrHLw4G15Df1lCwDYOjRyhI26ZGptRBJeGtba1My8Ly6UMVzuUVBoHdJOEL/egxvHdm0Z/mYp9S2pWCofKxtTVjYhqaTdj+VSJ5pB8Ninb9p0iwD6jwOnVq8VtdgvrzF/ILWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ed4VDlvp; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ed4VDlvp"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so8776076a12.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 01:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845897; x=1737450697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=ed4VDlvpfolrC5IqrtPkLtgAgFXBLjx1WMDerBlqzlobbEUSTMcfctmZWmyyzvQOyF
         MRYb0k15vTXQkD7oqn8xzapEe1vX2sAH+2bxtasYAV9Mhz4VFvphCfA0qB+LyT/PFmTm
         XPONzUkruaC6St6eo3d2gN0Yllvqoq3wJWBXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845897; x=1737450697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=TPmwmTqPtfRBvJ8vTCV1jis3ly3ynKZr9NG0B99QEUvNVZJT3SpIPZPbsG9caprp/d
         K0LI7f8RioOODZAJn60PUUJLUXof9EOWG7Fstsuj7ct2XPcdftiFqmM5TJZ1g46qsCjB
         IdXxictMbxceQx3DIO6cYxvBeU4FvV8jMEw0VVkMbHXSgV+Fx0q20DniTGisno0GBeDK
         AfTZy3NRzbAzPXp1CIp+LSqOx/z/jLiuFH82TOOOTitlU8bQPav2Zj8vYLdSWefMM1IB
         8LtUdqU1uSfVzEYlWksXHaMScj41d4RXHb++2WnFkYNmyHEF9FE9kvbGmqlW9dracRUU
         Xmhw==
X-Forwarded-Encrypted: i=1; AJvYcCXv8luuiXm5gRkOilOusO7yi4uc1wqXDKNRdku+ajEY1TqzUEIc0eOQBgtXTqQEzgHWSOn8bOI7vfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLqxNnyARo6tPKQfQp80gCeilD5iPYZXhEJxGi5N+MLBiyg3xA
	HADPaR7sBzbmZuohGFpqoVGXPVF8WG8YV2ZMrMkf6vpiI41DvIPlUvpvL547FVk=
X-Gm-Gg: ASbGncuBiENYS8wqyg+Ho4OMBoZvrWkc3anOICiAgH2WTfMkf6N46tFhP5LYSAg92Th
	tRxijuQBGGuoeN36FDpDVypBeVjzA12MKc4nQlPrnZvQoTEmxlkOeGRVBrOPooPTy0cBEHc6PHm
	YkKgIbxssBb9zPN5tFEo2Q2SvSTWHhsBHuOD9ODTifEgDTZHavv0aiLz2I3QN8nH4C9Uxc54v0Q
	vU0Dx7dVODBGXPM7z/+HVU17AsZIBca3iYs/6qhThHPFKVLoBMCsQtAFEOSWS+DkHfGqnLBeh87
	jMXyJ43FsfqumyswPIgykQ==
X-Google-Smtp-Source: AGHT+IFg5688v9iu2Z6jN1GBfV5nDayopSS598535VN8IIxu6UQsTzwr6yLMykzma1EPL9vJgQo+tw==
X-Received: by 2002:a17:907:7e95:b0:aaf:c19a:cc1c with SMTP id a640c23a62f3a-ab2ab6c6625mr1898191166b.22.1736845897042;
        Tue, 14 Jan 2025 01:11:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 01:11:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 3/4] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
Date: Tue, 14 Jan 2025 10:11:15 +0100
Message-ID: <20250114091128.528757-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use GENMASK() along with FIELD_GET() and FIELD_PREP() helpers to access
the PLLCFGR fields instead of manually masking and shifting.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/clk-stm32f4.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 07c13ebe327d..db1c56c8d54f 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -5,6 +5,7 @@
  * Inspired by clk-asm9260.c .
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -39,6 +40,8 @@
 #define STM32F4_RCC_DCKCFGR		0x8c
 #define STM32F7_RCC_DCKCFGR2		0x90
 
+#define STM32F4_RCC_PLLCFGR_N_MASK	GENMASK(14, 6)
+
 #define NONE -1
 #define NO_IDX  NONE
 #define NO_MUX  NONE
@@ -632,9 +635,11 @@ static unsigned long stm32f4_pll_recalc(struct clk_hw *hw,
 {
 	struct clk_gate *gate = to_clk_gate(hw);
 	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	unsigned long val;
 	unsigned long n;
 
-	n = (readl(base + pll->offset) >> 6) & 0x1ff;
+	val = readl(base + pll->offset);
+	n = FIELD_GET(STM32F4_RCC_PLLCFGR_N_MASK, val);
 
 	return parent_rate * n;
 }
@@ -673,9 +678,10 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	n = rate  / parent_rate;
 
-	val = readl(base + pll->offset) & ~(0x1ff << 6);
+	val = readl(base + pll->offset) & ~STM32F4_RCC_PLLCFGR_N_MASK;
+	val |= FIELD_PREP(STM32F4_RCC_PLLCFGR_N_MASK, n);
 
-	writel(val | ((n & 0x1ff) <<  6), base + pll->offset);
+	writel(val, base + pll->offset);
 
 	if (pll_state)
 		stm32f4_pll_enable(hw);
-- 
2.43.0

