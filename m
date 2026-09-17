Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5738F472096;
	Thu, 17 Sep 2026 22:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684776; cv=none; b=dKRga9lyV/fz3rp6PcBplbe6gRK5j7/e1nEIoSj65+fNF7VoWkBiZsafxa5N3nv3DkCeRh3Al7xTxDlZf+CP8+QLlBtnowzYdeayUullBIHTGZu0Fpu8sz2sjWqvkljyLzEhtw13MBU8wwF0dzPVqbUMdHIdgZh1xx1lyT7xpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684776; c=relaxed/simple;
	bh=MqxByHHRAMiILQpCwGLbqvoCedSkxvWgAOUz0k/g3VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2JEDxh3YMBq0Z7OEtVcgZYg9/hq3h3r7iVu+3u7e7cl1E3n/2ID+rt0XPObjtPRGqfHmPeaDq/IBX1Rpbfd0pnBHjXGzqfR8G1KQHWaybwhTLIwXSqlEG3WIMu1z80YcOHQjn2fF8tAZkMmoeToyjX7c08TCeAwrpjUGtrF9pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hNrgkGFB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hNrgkGFB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F1FA1FC7;
	Thu, 17 Sep 2026 15:39:30 -0700 (PDT)
Received: from e142021.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 561313F86F;
	Thu, 17 Sep 2026 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789684773; bh=MqxByHHRAMiILQpCwGLbqvoCedSkxvWgAOUz0k/g3VE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hNrgkGFB33xBqnbOof23Nb1JNHTs1T1uevRzc70iq+LvboDRdZ2Gl4EcdQ/anH8Mx
	 Rx/ZmrKwwLlFLqrTioT7p4GpvGphV2D17YaPFUfvyLFXC+wmVypBA5J9xFuznp2HRl
	 op5KqREyqiCiW0Fwq1RMvKo4w5Z/CMI2LFVU0qgA=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/5] clk: sunxi-ng: mp: support clocks with just a shift register
Date: Fri, 18 Sep 2026 00:39:10 +0200
Message-ID: <20260917223913.1855301-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223913.1855301-1-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
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
index 7cdb0eedc69b5..3896cb94bf733 100644
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
2.43.0

