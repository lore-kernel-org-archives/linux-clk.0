Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DCC25B08A
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 00:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784681811; cv=none; b=AkOVG/5Dcjy9mqL1fV/msgMwWkcphX4x/NkN1+ox4+K8BjNQW5YqC8fpTsva7Msh+8WQ9fIDhwfOw1VtwQNQ1+M/Kchv1m0jpnlFFoZQbZgvamV5wZvXnw6l3PKHVoxKFP0xUuRddln88u8cbqupVOb++h2qybtQnilNwBFaPDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784681811; c=relaxed/simple;
	bh=41yheuYTzflwsC9az/eVDNLUtGn/wFSKA6g0rPFhxGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CYw0sebNoTvJW9zlQhot8HrqgrshGI+BGBbnhYye6YskyOuORaaeMJdo4n261+f432RSFoZ7RyBTK9/ujYXLYA3RBqRhDOwFWn+SBxF2Tx0yd38QMW0f/OGIb+O4c3J+RYVvywc+9/uO2nUXGi/BQuBKHr0KdmOQMIeHW1XXbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaXhUw/T; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaXhUw/T"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so64829196d6.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 17:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784681806; x=1785286606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3zas7MpBZKk+oDgMVzjx3UamWGdsP8MxVU5Ixr7UTA=;
        b=KaXhUw/TONstc2DirY7Q4uqPLcbH1BDDlU0FMD+50c1jEC9uoX6XOV/QOzQ3fdQ4oS
         7gcVAQJahFraCJ5vcMDfiZA3f9HMq8fEIgTzaZ04NZIs+RLhCHCX1X6OlgjrzUkEmUOs
         Y8Wnwod8asnmCrUqryCyjRSi8QhlUeLnK2ipAx+h3pIb0de7NECLhrIgslDi+oO3iDMq
         emKR7dV5uQSDtZq22q381Z/RZsBCbNscmzkaBeMShB/Z8qJZuqS6b4kGPjHi2NlyQ39t
         4ezk1KxZMQfbwrDpC9fH68EB1Lmu4fontOTFr1iFpkfuhBVFEwa9ZqjVmCJ2CtfH8YZV
         jRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784681806; x=1785286606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3zas7MpBZKk+oDgMVzjx3UamWGdsP8MxVU5Ixr7UTA=;
        b=eErZ2r0ZQANcjc2Ho7YyaHfMWn0zDeaHp5wkdQQAhqFs+gEgznYIWBV+BGoJTlCJLg
         L0LD/xtlT5ZIXJ/2n9NGjKZkUD/Z7n6C0EBxY7EP5aOXO4HVeYFB90I7ivpC/SU0Q5em
         yqgu6/FhIeSZu2Zq5Jy+McTJmXf7X5v0VoFcR4A4adxD+SYDk4VutrEvl9oTJjzo7j4D
         4CfeK9H4gTdMlhTt73DCx0udkk2OzZQhEoNMtfSR2t4aPC4//HFL+Z1NSqRcVzbB1JgW
         xojKQKCEIstG4qVw0zFQ7xJ/cJg7nuHjBWlSri+BO7HwVRTcS/SMs7ep/F/rfTXuMSgJ
         MhWg==
X-Forwarded-Encrypted: i=1; AHgh+RqHcrs3hghfI6YAOhZdMT4CpAOtPpnD+E7zVkYM66qQFhx/sz+0Q+OHyZeTE7MQmpyWUNREJKzu9Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+lBw8irYNYPHvpKNljRL1pZGI/xZSa7uGupqeaxWASe7bCXmp
	n8PBNKtXuLW3WTuko9hwP8a8qxpASppfP5BH8PPuONw0ES8yM+jL2PbA
X-Gm-Gg: AR+sD11wNoH2yDlyRz1yYgkeUVZO7AyHiWBpsuNPENQsZdKxjH0ifcNHIrU87xRayG3
	0N9y1uXCWW45uIfhCFq+Dcn1W9ehs7lVuJHB2zSIomul1XuQ/V3TbDg0WZtm2lemYof7o/H1ZCM
	Zo345apDFuWKi1em6t17eXtWNqxP6g3V5pTHYvMjljJtuaXeLWgBs5ybSyJzJDZ4n3hW07oXG7E
	Ar4tr48WcuL/bmIhDaelN9VNswAs3WOoBXG9U605gIFfWLtHfqxZNnL6qk2d9Ex7s9PRma6A8iz
	c46Kw8QroS2nABlTKIZaSAc68At3zgd86/N6JXYYOXwfjUJya0FPrt3ZJmka+6uwAuy2m4217U/
	eC1dV0VvlSim52WD+h92d9b5fNhZcYQLCmVRtU60ssmUWiPdMOfaYN4lPV5vHWQmaTSu4dM+ef3
	hrMKA/AJVtYAhQt7+QGpdwUY8YSIs29JZP+JXxTPu5v+FeJntqA6lRdQ==
X-Received: by 2002:ad4:4ee4:0:b0:8f2:22c8:e71b with SMTP id 6a1803df08f44-907b9bfed43mr25560426d6.24.1784681806174;
        Tue, 21 Jul 2026 17:56:46 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cfcsm8623966d6.44.2026.07.21.17.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:56:45 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Date: Tue, 21 Jul 2026 20:56:43 -0400
Message-ID: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some sunxi-ng MP clocks have an M divider but no P divider. The A523
MBUS, IOMMU and DRAM clocks use this layout and also require the update
bit when changing their rate.

ccu_mp_set_rate() unconditionally builds and applies a mask for the P
field. With a zero-width P field this produces an invalid GENMASK()
range and can clear bits outside a P divider, including the clock gate.

The callback also ignores CCU_FEATURE_UPDATE_BIT, so hardware that
requires the update bit may not latch the new divider value.

Only update the P field when it exists, and set CCU_SUNXI_UPDATE_BIT for
MP clocks carrying the feature. This matches the existing sunxi-ng div,
mux and gate helper behavior.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel.org
Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Based on clk-next 8cdeaa50eae8 (Linux 7.2-rc2).
Tested with strict checkpatch and an arm64 W=1 build of ccu_mp.o.
No hardware runtime claim is made.

 drivers/clk/sunxi-ng/ccu_mp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 7cdb0eedc69b..aa6cb20447f1 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -237,12 +237,17 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg = readl(cmp->common.base + cmp->common.reg);
 	reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
-	reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
+	if (cmp->p.width)
+		reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
+	if (cmp->common.features & CCU_FEATURE_UPDATE_BIT)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 	reg |= (m - cmp->m.offset) << cmp->m.shift;
-	if (shift)
-		reg |= ilog2(p) << cmp->p.shift;
-	else
-		reg |= (p - cmp->p.offset) << cmp->p.shift;
+	if (cmp->p.width) {
+		if (shift)
+			reg |= ilog2(p) << cmp->p.shift;
+		else
+			reg |= (p - cmp->p.offset) << cmp->p.shift;
+	}
 
 	writel(reg, cmp->common.base + cmp->common.reg);
 
-- 
2.53.0
