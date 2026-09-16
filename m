Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE752D7BF;
	Wed, 16 Sep 2026 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.15.109.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532960; cv=none; b=haycBB2vOYhkdkDTCroErjvzpy00+HsPFiaViT8VGLKN7phJwRKmJJ9NRm7pjWCKKdu3GzwwTeWnk0qrBzg9YOW689I6d4/Z8aWDFxhGJVEIsCizGNADNWZ4NoNBlAcvM5XdDMb6Pzy2/L5QIpZE8Sj+Ra+CIiU3mVo1Jp+xE7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532960; c=relaxed/simple;
	bh=6xjbFweYz6SXmWig9Y09VkBNKCHtAos0bnMQpqOlR2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPubFdnfS1Y/EhhuhAEZVRcwwq5iUcRGWBCW5y4hM7W24oVinfPkAmRhttbLQ5Ao7wqOkenZsI7ZXV++BY1ou2Ec7eCY8WOTriyACBTBNTiSxXDkUVOQhUGZ//L/3TSqLrYVUm3vsXeH11Kd9ZLx1PmOFQ/FxStd+NYK7SzkKSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org; spf=pass smtp.mailfrom=d-silva.org; dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b=y8al5Vmp; arc=none smtp.client-ip=119.15.109.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b="y8al5Vmp"
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 9233140B5A;
	Wed, 16 Sep 2026 14:29:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1789532950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7ZQplUXCXPwONkaQVfHCh08s+vTaBNTqiRwAN4FcQQ=;
	b=y8al5VmpWJe4/uIU+idvj4y1aBoH+2hm38evlDgPZzw+pIH0qwSBonzq0ihCBoGyEwsVOY
	pGQWOhwzy5H5RAwj6P0wi1iyo3+HZvxd1TsHsKQ2Xloaw6zI9v2R4sKm7oAD3UEFzUQWdj
	5/A2Tp+HNPcCMNj+A9TR9a8t4W+eF8kCTY2UpG0uL53TRYP5rHzE4n5bhcd+nU3het+jje
	LzuuM/Wno9w6IF3Xos+BXEx9/9H0IbR61A9DRA3JXG8aTRI55rAaAdAA+mbZO4AyKMxZk5
	eLJCshEyZkSdL0lLvjX3ObkOiURjjzErBTZd/otLzv3QN7wo45TPwr5lpcypBg==
X-GPT-Reason: legitimate; the email is a technical software patch
	submission (Linux kernel style) that perfectly aligns with the
	recipient's identity (alastair@d-silva.org), shows consistent sender
	identity (alastair@d-silva.org), and contains highly specific technical
	code diffs with no phishing indicators, urgency, or external links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2] clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock
Date: Wed, 16 Sep 2026 14:29:10 +1000
Message-ID: <20260916042910.382744-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916041104.239999-1-alastair@d-silva.org>
References: <20260916041104.239999-1-alastair@d-silva.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner sunxi-ng CCU driver currently uses
readl_relaxed_poll_timeout() in ccu_helper_wait_for_lock() to wait for
PLLs to lock.

This non-atomic poll macro relies on ktime_get() and the kernel
timekeeping infrastructure. During early boot or sensitive clock
transitions (such as CPUfreq DVFS scaling) where timer interrupts or
timekeeping may be suspended or unstable, ktime_get() fails to advance.
This turns the timeout calculation into an infinite busy-wait loop,
causing RCU stalls and system freezes if the PLL lock bit does not
assert immediately.

Switch to readl_relaxed_poll_timeout_atomic(). This atomic variant relies
on udelay() rather than timekeeping, making it safe to execute even when
timekeeping is suspended or uninitialized.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---

Notes:
    v2:
    - Replace custom udelay loop with readl_relaxed_poll_timeout_atomic()
      as suggested by review.
    
    Tested on Allwinner H618 (Mellow Fly-C5) and H616 boards in Armbian, resolving intermittent boot freezes and CPUfreq DVFS scaling lockups when timekeeping interrupts were suspended.

 drivers/clk/sunxi-ng/ccu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 43d8eca6abee..248e58c9562d 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -35,7 +35,7 @@ void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
 	else
 		addr = common->base + common->reg;
 
-	WARN_ON(readl_relaxed_poll_timeout(addr, reg, reg & lock, 100, 70000));
+	WARN_ON(readl_relaxed_poll_timeout_atomic(addr, reg, reg & lock, 100, 70000));
 }
 EXPORT_SYMBOL_NS_GPL(ccu_helper_wait_for_lock, "SUNXI_CCU");
 
-- 
2.53.0

