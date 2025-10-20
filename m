Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02D4264612
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974033; cv=none; b=SGUUDXnKjGvV6GPFgyw9XXhluNlMs5Bzx+KV0+KpDUWa8NUycqYx/i/OMx645sQWLmOEEeE3b9N2qsodzxyd/8qdTW7D5Gupu8SO0AeFckiPWDIlfjQKztTDWcSWDHtmExBHphaLNR/j8AOZeZS6Qpk7hBFsR1Q282mg8Gak1WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974033; c=relaxed/simple;
	bh=GAI+uGC6SFJNIjpzWPIuItSi9xgMU44NMEFN0JoMRC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffXVbisC7Y6nWDoq31ZWQiajbOB7g2lMwBLjVjxlXw9kdDtheQm863Jtho68RdaiPHBwXGJOxC1Cl39Dhf3CsA1jOS+Yp3wctvMqVGLeRXiYT4hsJHQW6DLq1+ycOVptWFTZ/6Tj4eUrWBA5WmyyJ04fDDZKrLgqaL0JT7E3Gwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl7xJ8fb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl7xJ8fb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471191ac79dso36764395e9.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760974029; x=1761578829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EctQdPK7/HV2BlXTQK2FpJXbDTj/G2Ge7tqo6AYQOpk=;
        b=Jl7xJ8fb7m4m4/1y5M+0kTf+XYCwldEF+sCh2/akCOpjfLpEqE+rknx5jkttbA5ssi
         KyKpYihErkpLsPhc1gRweZd3Frb0rk/0va4CHvJ/y5ucOrRI3fswLRJ3kpv6weWFhnxw
         9gphxCqzFmcIpcpgDdE2QdG9s77xmMSplnIE5Doi/nt094TAx2bOGR7VvRprQSfQoge4
         1yfPc7VM3VDT1ZQd0zZJKxBRTZaFrqWXgBSQb5vzDn8HpiDNMFpSLMqi8fyQmyaEVB4F
         VhsQYr2DTeYLCNQR4KiTXexiOZqDR5xIrBVk2ydX3IWAGOD2SY4lbvktKaQEhPUzItI9
         /fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760974029; x=1761578829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EctQdPK7/HV2BlXTQK2FpJXbDTj/G2Ge7tqo6AYQOpk=;
        b=MWz//c9/P/88nFZABPLRCOoEyU8CEbivizKAf/gpUSQ+zfz9m9USXnDv8UFYU6USRJ
         dP0NHBzbloewRM9Q47MdaCOWlRoMHG6hoS85m6vNLvEYyPZSuTWZvOx17eewHPSaEjz6
         35FgVhGOZRNAiqC8p3mqZ9iTjJi7sw3nugqitj20NJMZjTsqkcDEy0QmGyNHfvPewJQZ
         Uf8gvqjsBwfT88VgdibhXlkVrrZzs8i/WorEu8k9OoFc14rYQSi8s6b99JPl4LD66FgR
         kwOcOveU8bWsSP2wSHDmnx5nMNM4z+BHKMOgCU2L9LRBWM8jxD7jCK13+NdXSHT8CqVP
         Hoyw==
X-Forwarded-Encrypted: i=1; AJvYcCXYrT9cmlKTWHG2HbY245OOlRnHRkoAI8Xccr8NIVasSSAhnlf9DNaQbkNzcuHko5iFMXojPPxWOWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxllhbea4f1XZBEZFpCd77B+53RRIMaa/ipO3r3jmOEM+cq7vxZ
	FuwyQ0WFa7vVG517fx9N7vMty54rgIcB5gnYZL8LYsInBR11/L/ipVdw
X-Gm-Gg: ASbGncsHDn0gVh7luhT08B6/SyjJA+5qQLSvgWdMb+GLZJ0K8uQNqtRQtactLvnu7Wl
	14EfBtdcIHvW9RLwNKR1vhg5ToMd9ejw5ZKx7Oy/p9TP+PnOedZZ09iDshpTdxPLNsQd1h/NCgl
	2S0JWJ7Nt6MTrpNIC0y4MVN7rbjxEdXayt6zba5EG3JTLJ2ot6nGs2pIgzJH4LAO9RElP1qB0d4
	lxQg1pm0uRN5PIqAi0S4oLrtFC3cuFd4oVW1jsN4DOSH0hCdTJldBB8U0ZO16PJ6XD4knocfF5b
	O5xszqSB7pSRYtAxwgrH3WgPwk2MfJTonJKdBV92pXC5VEt6CD4iAEiP/GHya3RwlTee/EM5GNR
	yiW0Sf4VNI6bhieLVh3mqM2TB//hxAJ4IwR85LLC/cJW0H/Cf166RvnQS8SE7p3C9mxo9SfWCf0
	Aad3jordFExI9EDLiJGhIrmOrVbDUIys41vDW1+8frQmXi0Po+QtelOrdRHU+sC5SqC0p2HGcAw
	tEM
X-Google-Smtp-Source: AGHT+IFdnScd3UAa6FYvms7Mk8BD0zHKLaPHlgHblA0Aa/pK4mTEeu3ZIirJn6DvinarmuaN/TRYZA==
X-Received: by 2002:a05:600c:4507:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4711787276dmr102704965e9.4.1760974028776;
        Mon, 20 Oct 2025 08:27:08 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715e4e267fsm64723995e9.12.2025.10.20.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:27:08 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
Date: Mon, 20 Oct 2025 17:27:04 +0200
Message-ID: <20251020152704.4804-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bus-r-cpucfg clock is important for peripheral which takes care of
powering CPU cores on and off. Since this operation is done by firmware
(TF-A), mark it as critical. That way Linux won't interfere with that
clock.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
---
Changes from v1:
- fixed typos
- added r-b and t-b tags

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 70ce0ca0cb7d..c5b0d4a2e397 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -125,7 +125,7 @@ static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
 static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
 			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
-			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
+			 &r_apb0_clk.common.hw, 0x22c, BIT(0), CLK_IS_CRITICAL);
 
 static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
 	&r_ahb_clk.common,
-- 
2.51.1

