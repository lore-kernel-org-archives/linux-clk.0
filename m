Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BA01CCB4A
	for <linux-clk@vger.kernel.org>; Sun,  5 Jan 2025 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736100946; cv=none; b=mbwfwzVKEEm0RLu6IupInnJUPKnb+XNA6gcDWsryeJNUgVmuwP+nO46QUmPar+ucCDkzH0UoSUpkrermflL4OqDh8vPESmxNgNS595f3n6E1cOdVo88S1UjyhkG2Wna7iNLKKziaoucmTEx9oImkrnLrcsWaBsfbE9i6bRAcsls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736100946; c=relaxed/simple;
	bh=uyYm4AkMvyc5cNDTbp+U5fuCFOWH+DVbD8gtKAdlEIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJSywUnUF226WeFS1UFRLH/gOAeORrzmGDoeOzVwuSU6hbbWblBGD0L9G/LYyremnv6WYD3/bwdu1w+71Cw1z5tCjlSxmk/qF+nNzoEzG0JNGfH6jGXsUmGPoKjCBnAK+UxRdNYWI2r0t1xnGZAf79CmvHmp7uNR3Womg/Shgvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CQh2d8V6; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CQh2d8V6"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso20331701a12.0
        for <linux-clk@vger.kernel.org>; Sun, 05 Jan 2025 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100941; x=1736705741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCWum8u2aSE0H9NGugk1g+nl+FSObYpFAdsp0A4AhFk=;
        b=CQh2d8V6fMapEPmyoZng4SCtlKbEkpihSEOf2MgK3yVgahynmPLDNqoLvFgMD4Vr0a
         ZldnVRCGik6dnF9DQwsZRU+uRYOJcHq/KNGdxzeKQJgdRtih2M92nefDEvmhqhaX48Aj
         AvRW1TK5ASWYzT1rgzmFNN87KJewp4jZZ6l4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100941; x=1736705741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCWum8u2aSE0H9NGugk1g+nl+FSObYpFAdsp0A4AhFk=;
        b=upFKWFpfrtSiPN7sfJKzKji3aqqKSckEdQJnmoCzraqqS4DfSfyK6Vq0V/8hX8ViMk
         0DyMhgmhEG08LJ0v3UyvuYJuonpGk+K2P71nlolUEWjPZMIPJeLnVJBVrrOqCGW+fJK/
         /l4g8hIgrI8iSvd2b8TXZZ5SleTVmteXkdXcy8nDhVlsBaBLkf8lXCBb3wjzEIprAVsX
         ywt5BlRWmgiDN3eFccpM5ereIWltp0X/Y7WIhe2Tw1XEFtTPUt/fIheuNMeLw3tfh3nA
         EopWRSN/6zJpWWFb0y8UZANDoM85jaMJd+k/NJFyqsk4xwQUXViViJSvhH7hZB1tvF5C
         /adQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlHGQ0de2G9kr3ivRxWadJyL58mbuZFkfYbsfd7tovqj5ggoLDo7wGdUTtRdC5a7VMg1BeP7eUvNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDnwjy3Wa3FJUsq7gDShPHnPTK/X7jfpd7j22zoAuPx19SSHBA
	5prU4zn+33rABSIeVfRu8FTVp5+JHA6IU7S/rEgEck1lE5eAE+VcV+gguvCXjlQ=
X-Gm-Gg: ASbGncuHYl0KcIEeAsoXgmcVUXgAUcdiy4RhvHdhvoIrQI/KcoqUSHUP5D1x80zrJKb
	ryfcIBqPchgzDooMEVbQZnyplSnEG6Uf02ebD7i6l8ecN9LcfCEg/fv6fkLnzWHyeT6qdh/Glpz
	fQ6rqqj4cBEHpQkfv3+Fqgz6oKi/AqzoS40DBzRd0D6UTcpDiYzcbKZz3V0Lc3PJZoULl8D5Mpg
	zsjksbugBxDjVQMYah4GvQZdePZE22ZLaGX/guiAETH1CTRvZRE9OFqK+U5txgSlbfGnZr57Z5C
	tLddtjvmQvwbD8tjCjuhy2WTUiwxkewJYuFb0Uyvgxe8Mur4R6oMmYGCqXqKIjdQiYgLQkYsSaf
	h43oW27ZBG6vlQaJA2Q==
X-Google-Smtp-Source: AGHT+IFeu46e7LHQ6MyNCXFCxnHyuX7vCIGWrO/EtiZn47VacrN5DdmgWvSrKWY5flVSdhQ2UzUVwg==
X-Received: by 2002:a05:6402:540b:b0:5d6:48ef:c19f with SMTP id 4fb4d7f45d1cf-5d81de1c28fmr134000185a12.29.1736100941394;
        Sun, 05 Jan 2025 10:15:41 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:40 -0800 (PST)
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
Subject: [PATCH 5/6] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
Date: Sun,  5 Jan 2025 19:14:17 +0100
Message-ID: <20250105181525.1370822-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
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

