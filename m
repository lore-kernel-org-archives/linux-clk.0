Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EC92F3622;
	Wed, 16 Sep 2026 04:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.15.109.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789531877; cv=none; b=q78RRSGZaNFdiF22ezYtBtPMxAq7UdzL0SwKCaPFb56N+wRccOI92iRzIlArzyRX60XRnBJn9f9dCfXdocQEMgpe31rfiD+cKy/x/8NeDrbFxhikdaEBxa/6qcCgv7afdH8JRfvTyQ3PuNobgwv8PmZVgYfGe75RAum15RJ5g1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789531877; c=relaxed/simple;
	bh=oMxDrZS0Qkg8qZQlfeEmbLducVkPJVC6TpmFK4w7nKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWOhsPfFTwdZQV16KpkXSt29Dh1A/zoaytIcdY8Zudbr8sgzdxysPEcjdc5p9JUJpLEvSV+5DJxoPY3SS6GBTEmtppqN/TCxI3UqPvTQk35OE3I9ZAO7SXDVSZ7g8FHzJvCi8j/Y6l9Bf6ijZw+QdklgZt0j+2loQyQrtzQJuQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org; spf=pass smtp.mailfrom=d-silva.org; dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b=EqCa6fzR; arc=none smtp.client-ip=119.15.109.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b="EqCa6fzR"
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 0666440B5A;
	Wed, 16 Sep 2026 14:11:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1789531865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q2FVziLi99mj2DM6fRhVdm0hGSzlFmznN0LCu/Ng4sM=;
	b=EqCa6fzR/Io1SUSDQ/ZMiY8mmWM2ii6JKsM1YymRaueqOqqIfzzS/Qf/WjPuNe5YQOzPAO
	p+oV7khZqQeB0xh7MqJecOUKEdJT8x0bVW19uDeKeoiYzQY3WMhSWy5856lyzV603ANlz9
	C7XooV4ufKhBiRkhFamTF4/LkIfdKCkIrvyCX0acg1qDelFhKiZo+sxac/ZiGb+0KdtWnS
	Mv3qPsGrdwV8/td+2jc52rnHJWy78tN9PzTHVaO3grQfcyc6q+EaolLa2RtwBKoMne7P93
	CeVf6IGDLAskMq4zKF8r/AtQAkzGpTC/0/54eHfA9jsEDw/9h4NpV+QWQdu3GQ==
X-GPT-Reason: This is a legitimate technical communication. The
	content is a Linux kernel patch (indicated by the [PATCH] prefix
	and "git" diff format) regarding a driver fix for Allwinner hardware,
	which aligns with the professional/technical nature of the personal
	mailbox "alastair@d-silva.org". The From domain (d-silva.org)
	matches the sender's identity, there are no phishing red flags
	(no URLs, no urgency, no requests for credentials), and the message
	content is highly specific to systems programming.
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
Subject: [PATCH] clk: sunxi-ng: ccu_common: Replace ktime-dependent lock wait loop with udelay
Date: Wed, 16 Sep 2026 14:11:04 +1000
Message-ID: <20260916041104.239999-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner sunxi-ng CCU driver uses readl_relaxed_poll_timeout() in
ccu_helper_wait_for_lock() to wait for PLLs to lock.

This poll macro relies on ktime_get() and the kernel timekeeping
infrastructure. During early boot or sensitive clock transitions
(such as CPUfreq DVFS scaling) where timer interrupts or timekeeping may
be suspended or unstable, ktime_get() fails to increment. This turns the
timeout calculation into an infinite busy-wait loop, causing RCU stalls
and system freezes if the PLL lock bit does not assert immediately.

Decouple the PLL lock wait loop from the timekeeping framework by replacing
readl_relaxed_poll_timeout() with an iteration loop using udelay(1) up to
100ms.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---

Notes:
    Tested on Allwinner H618 (Mellow Fly-C5) and H616 boards in Armbian, resolving intermittent boot freezes and CPUfreq DVFS scaling lockups when timekeeping interrupts were suspended.

 drivers/clk/sunxi-ng/ccu_common.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 43d8eca6abee..00daedadb5c8 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -25,7 +26,7 @@ struct sunxi_ccu {
 void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
 {
 	void __iomem *addr;
-	u32 reg;
+	int i;
 
 	if (!lock)
 		return;
@@ -35,7 +36,14 @@ void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
 	else
 		addr = common->base + common->reg;
 
-	WARN_ON(readl_relaxed_poll_timeout(addr, reg, reg & lock, 100, 70000));
+	for (i = 0; i < 100000; i++) {
+		if (readl_relaxed(addr) & lock)
+			return;
+		udelay(1);
+	}
+
+	if (!(readl_relaxed(addr) & lock))
+		pr_warn("%s: clock lock timeout\n", clk_hw_get_name(&common->hw));
 }
 EXPORT_SYMBOL_NS_GPL(ccu_helper_wait_for_lock, "SUNXI_CCU");
 
-- 
2.53.0

