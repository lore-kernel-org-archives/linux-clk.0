Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B31FCD1F
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 18:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878834; cv=none; b=gqkrqFvyuB6ZndfltqtX6gkOMFB8uPrCFx6JZ4lekImjl3+ZaMQ0uJMXiIAMHTgUG0/+Q9AulNDPGdpciLyDGrY6vMWJrxM6ZksM7Rm+bIvkf0PtIoEk0KMr61hROPaMoxLSSU2I4EkOVx6mUsQ1mVUA00MsO4ouZxX6cZ6KaGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878834; c=relaxed/simple;
	bh=54AnFoYFZcZqYgavjCEUI5tS3rZv1k1LrPOchNuHl/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MT8QO9jqmvV768MSnG8Atc73gNgimjSJ6GDJhWUTpiUxC9QPxxgbDB4qak49M/PgutwDUuctegDhA/S2fPEIPa9GTzOS9UYre2rlrQVI3Jnl7wHp0ntubkb9juEwCUabE+Tg3V+tOtlKWxtpvXsHWeQPBkKVm417YxTEWnDMzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=J/XG3Tmx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="J/XG3Tmx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43634b570c1so42186435e9.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736878830; x=1737483630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=J/XG3TmxVxNxOaEVXd09pGGAEdlUlxkfu2aP/JKvNhmm3VWOAme82p/gz1EcCVlsmg
         Bu7xaR43zqzYdqvTHoeQQurLTXWJDGpU8iOpIq0MefXHdBCM7XAvkH6CFwQTP4DcGgjO
         9kAGAfDD9JrG9tpNFc7sxC4PD/znl+3L4cxnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878830; x=1737483630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=RciDwe4+VHkVu88CLOO8/ndsnD0wUzj9aTqDJV8dEOzPbltZpECdQPaXEQphyvNW3w
         pCIF2WYVVWb6XcZk2OxibOFla5pdhZmPpTLr6GrjUhNoaylzzJ69KfvG1kp6DWtjSTV8
         6CrmtHfDJecso+4jTP9wCzzMqO4OEUwrnAg0l0F/gpCtBo/nNTuPkkaeUyF6hwF+A072
         sxG0V/Jz+DYkpx0U+3i3FO8Ihf2KFtBBt1toI83NVVEX/3xInt1BeoLhJsYCZtQoqlv1
         triI7qZR/62Bxw5FIzIqJurqrWLqg0NJ4BbyqWKbm8aKWMnoFMNuOsKads5MYkTJe5Ob
         HPEA==
X-Forwarded-Encrypted: i=1; AJvYcCUaw/+t+72LVuT7Y8m71E33GiY7XbADeaVpeUQtQ0sgqIKuAxhBmCYlQtxEQRRD1irg44jXMDmh+Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF6gBvmwg4p0rI5joVgY+2kgQ3Dyq0/mMNLrQSsguxBFgDMJi4
	42OzgDYouVEmEAwGanogxjpSenmpfMrhggvKGjlSvmhuoZ4GsOX88rZGlyutXuQ=
X-Gm-Gg: ASbGncv3XEIUuogj2DGPfyfw8PrmyRf1/KUsu15dj4YqzzBoxKOt+vqAk7xhL/922KT
	oDYKd/GR0682D89gH138yRpCDBMVML4VXRKnm5EpYuKxM+4+wa5lyaHRDJRXwsxmaIG/sB5DMZy
	Byi5BgGlJT3CYJavfN5/hS73t9NGXCvafVoJKBiMTIpZe4sPzz1TLcmMrlXN/whzuoaKXCfet2m
	V5dv+l+Nu1BwvOAmCqu2qDxrukLbxB9iPz3URNVLFFKCY3hVunf7+AF9ht/eqOWEPy3GSJyTp0V
	/k6OV4blJBj/Nk71WT3N6A==
X-Google-Smtp-Source: AGHT+IGg8Flgcd5l6IUz8p8YGCesmVvDp+YPLJXbTETLgCS7syXTYsMMOkRNhniDeCoESET8hKOsHw==
X-Received: by 2002:a05:600c:4f0d:b0:434:ffe3:bc7d with SMTP id 5b1f17b1804b1-436e26ba521mr286846075e9.16.1736878830386;
        Tue, 14 Jan 2025 10:20:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:20:30 -0800 (PST)
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
Subject: [PATCH v4 3/4] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
Date: Tue, 14 Jan 2025 19:19:48 +0100
Message-ID: <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
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

