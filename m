Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E63203707
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457563; cv=none; b=U2A+opNdqaVPi1HVdkQ/536mZp0ZYMRRMyflF5PmCnC2jUS0CfpKmIci1miU1hep4MjhmYTtjiuFILYPaXZcE1Ptudpb4SFtcTSn1LCw+ymy6KD8nQa3S7+dcUoc/IgU4YfuNSDLOmyafR5Hrj5Sk5ZWN1yBTVKl/u7jqXKjUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457563; c=relaxed/simple;
	bh=54AnFoYFZcZqYgavjCEUI5tS3rZv1k1LrPOchNuHl/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+6ifMt797AO1MFZh322BragiXEJR0iL61KAImuOMia2BezrUUa7rUAPczJfumlBIaeS3NrRGDlIqfzkQwev4XFb/GD0ZW4PumFUA0Lru+ljlbl687rDu2VlpJuUGjTC1OGfjAy6ElU1BnZKizerjX+PD1n/wzaAcoy1FSIcLbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kx3vQzQe; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kx3vQzQe"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so218931666b.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 13:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457560; x=1737062360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=kx3vQzQekqacGs1PuiZ+nlGdz/CH/foFXOTLpYn6sJBC3cUq96I0djJ+2P3QXmaL3Z
         mHtsfH1mxdAUUtoK/AVh+ShpvzhlygiZUBaCnqDE6N381M+BTIpxXrlc0R35j7u/6Vi7
         BoAX8fiu5i1rgZWnzxK5pE+dz8Zk/ksrHNg/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457560; x=1737062360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=H3L/0EWCmZlB+tcaR8v41doYodwlexoISU9esiWrpOQJBGhCAiThGSFw8a5bHYOzMa
         vynWOMvLBO5V8FjC4r1iivDtEOFk2WQjcUc0JQU9bYUXYo4HLxEyVHptn0j74XiGDZVI
         3T9Y41IVXkVH9kBDvSHB2Xu6cWTmw8A0LwC2sJVCJBOSSRP+qOLa8gILGUKJEhF+TrYK
         +trjDadoTlqB0PBtqZ8WBOvfoGvinPJGbxaisVIM3oN1tSy6sf8L3x9H0IzQrE6KVT1O
         rzbHNHHZBfuAxqIYOdLsvjGJ+a8bYmQm6wzYjRwdFzOSIqktsDAp23yv+T942gOBvjiL
         qHKg==
X-Forwarded-Encrypted: i=1; AJvYcCVnPNrnAx0TfRetz+gPr9mW97FRyDN9tkSnxMC+AuHYp9UWchY6ghclac+X2S10lqqG5TFr/0AXlwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeReXH9YXHkA9DwgNhiqZNF3xXdq29wjKHKLvmsCIjoajnZv19
	BNBUES1TL5uNmyh0Z0vHdtitF9vEpFfVE5vCsDiJKFWrKGKgCZQReboWYtTUkGXyNUr/ThUGyAd
	t
X-Gm-Gg: ASbGncv+RD62cbHcyVUCBiY03oSV1xzmWw+lSuJ6rw71mJHjOpJzJzF6qyrlLSa4qgr
	sllmmPfCIiJwditqSk+jVtImwUTIWf2fZx5qYA2AcnrD8Y+IGwB4VZEDiMIdCChYMHGe9r4pnZa
	i0Y0l/iWZSU3hLu0VQw4njnq8acEP7IGyKohdurVq6+daBq9DsonJlPlJ7lIyNDhT37DcUM3Q6c
	2/6oOpq9v2w4cbHNHPQsUA7J/n49aiqP3Q1S/GHNMauGhIeyP/s+Ktis+zqH0AF0+zcpCOJf9Y4
	ZDRI5IHjmM4BKGNQ7NvFuWpiKV9+CEgSPmQhzD5AMZV9NrnXDXHhpw25stTHVeCVVvjVVosxHXG
	ua0keIka774brSPf9Vg==
X-Google-Smtp-Source: AGHT+IEJwiab5POVdxFq+KPMtd+AMk6FXjRfRzUyO6955YIp4KLeb/nmZtME/YvLjxsDXy27od+mJQ==
X-Received: by 2002:a05:6402:400a:b0:5d2:7199:ac2 with SMTP id 4fb4d7f45d1cf-5d972e00032mr18870795a12.2.1736457560441;
        Thu, 09 Jan 2025 13:19:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:19:20 -0800 (PST)
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
Subject: [PATCH v2 3/4] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
Date: Thu,  9 Jan 2025 22:18:30 +0100
Message-ID: <20250109211908.1553072-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
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

