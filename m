Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6485C2AF1D;
	Wed,  3 Sep 2025 00:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858188; cv=none; b=o/aveai8moaZqvUZmJtaPWKBucqmTLBVVFaQBBL7n41rNuaCA2FIhb5Etrhb2HcAPC7Cf+cYuZcKEyYtL3HH5at9bnbB3zU/WjpV2Ak+o4proUfdLvuKaT8LoahYmhS/Ql8s7ha/vD72egj8xEg3+kBlrXXM61xV1VipnKLwUGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858188; c=relaxed/simple;
	bh=hE8113scdICHsShBG8oBmXxWQNEp+INYIGDYfDvYDC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dx5pj5t+SaMhbyvW8ldINq7AjUIFXIdnLtZcwJNY18slKd9QOMRpzykYQVtTTgKonpIhK2V3cDjN9C9Uf4dYpmHd8nMjU9gALNMymg4SKqC79iuP7gg92MFbmHmqD9eeTMPJh2i+qN/xGEuPTQZkkwmsVYNNrs4vHZyBjLs02kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85081176A;
	Tue,  2 Sep 2025 17:09:36 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E3DB3F63F;
	Tue,  2 Sep 2025 17:09:43 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift register
Date: Wed,  3 Sep 2025 01:09:08 +0100
Message-ID: <20250903000910.4860-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250903000910.4860-1-andre.przywara@arm.com>
References: <20250903000910.4860-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "mp" clock models a mod clock with divider and a shift field. At
least one clock in the Allwinner A523 features just a power-of-2 divider
field, so support an initialisation of the clock without providing an
actual divider field.

Add a check whether the "width" field is 0, and skip the divider
handling in this case, as the GENMASK macro will not work with a zero
length.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 354c981943b6f..a03dac294d048 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
 	spin_lock_irqsave(cmp->common.lock, flags);
 
 	reg = readl(cmp->common.base + cmp->common.reg);
-	reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
+	if (cmp->m.width)
+		reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
 	reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
-	reg |= (m - cmp->m.offset) << cmp->m.shift;
+	if (cmp->m.width)
+		reg |= (m - cmp->m.offset) << cmp->m.shift;
 	if (shift)
 		reg |= ilog2(p) << cmp->p.shift;
 	else
-- 
2.46.3

