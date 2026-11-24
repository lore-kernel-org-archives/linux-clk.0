Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562303;
	b=wOuvX4sgBJ9H2Papdy2JhPSPgC5y03qoodlF2hTkga9NWeMVZtZYy+yUXWJnt8BL+XvR
	 ls5QnWsMnl6dcdxowOAKRypXdy+QGsjR0JzIicwhFwl266f+JTksL3sFqOCWzU2V1sgJe
	 vgsrqNS/mFCMh1TVibm4VHkxMgLu6eU1IBRgk2cmqIUCq1PqdGxLPqLDj6OQYUOSgUGFp
	 2qxnckSsTrmrXc2VjjOHsgN4+p8gunJxyQv6OI20BOQduz3qdBvS8C9Xi0NInY1J3Gq7B
	 4grhWG3I4UKXxcY9RlE5L5UMpS8gLnLWxVlcV3pK/X0YS4Bx25GgbaSIuLy2ae0MRVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JSPW10Pj7mWYrcYQV491CeBQq8pVVNVHWtKBSkpxQdY=;
	b=X/lkh7nnwRE7KITapISrPsFHUODx2BDiiwjhjSEVQ7USgjX6/GzYIdk0MQSdxV4asrgy
	 F2DBseVOipJwOPAeT2tfpIAShVPjzWgKEkrTQ7CpoQS+QvF/Js5jXUZx4mJgUIZ5+VcX/
	 a0TzeM0pUjJ/EYT3R/IR0/FUFKnO89MRrXDlgPldWQQ144jzPtTUY6/flhHLzi85fhhdZ
	 IJBrBiLKVGqeyToA50Lskve7BaymRet4G7Go+Fc7kxwCZWhytUg3z8Athrtw9ZFww5rbx
	 w1ZlMMVE6LeIz7dSBSgM9eMJF23xnS5PdtHZq7VGgwIk6nw+sUj2mcxHhbRo2wg9b0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SI0ND5xy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AAC606A333
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 23:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AAC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SI0ND5xy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so679345e9.2
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 15:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562301; x=1796167101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSPW10Pj7mWYrcYQV491CeBQq8pVVNVHWtKBSkpxQdY=;
        b=SI0ND5xybHzRNkTlF7R69RrtN0WhAy6NS3Dqdmm282zxlySUryxFPjZeqOA4ldnWb5
         FH5OmdYtPtrzSV66UbadG8hPTKejk4ztYaXVtXsnANibRwzyjV5hK4KeIQHNVBbQvaJ8
         M8ZqJzEZ1LjwxzAt1FAa0FRaRwWF14rRR9WAxrdJJVo4Gowm/qAmWnKjuBGVOjlJqv+r
         P3OyJS9FfRtChwteYvHKD12yKaZklv9pTtspU31NsUjDGL5LRdbPPsQVglSLOr1fWF+6
         hIMCrU4rXEasa62orHeuZTrLDr7L1PNS8HdrlgyGxv64YzXyfuvVxBW4ZKB3h+qA0NDk
         zg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562301; x=1796167101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSPW10Pj7mWYrcYQV491CeBQq8pVVNVHWtKBSkpxQdY=;
        b=ehfeMRElLULXP8UaSeA5/nUnpwbnsZoiXrGU9pxyg7v+HzR6I8A+2M7wkehVY+dELg
         RzUsT3rulmlldl28gJ0UbF9LWMaJdTCa1T4Af01D20Pws6hYVSAz2Nu9A2bOvlXA048X
         m+qMoXy8hHlLmhNkZzreA9p40xdqisOcHsiFgtgX4Qk1OmpRgjAL806G7UQgs3uaAEYr
         gJiUmk26lt+GhSgvJUsChAn+eme1poX5LteN8Rftb1x1OwIdlOybnAMQ0nf+ONYlF86M
         z6yFJagRDcOzACzhJVjNfV3n0i4T6oglv0yCRXULeiIm7f4a81qU6LOX3w1TJMAszzYF
         qvhg==
X-Forwarded-Encrypted: i=1; AL+hErGfB+Zni8AT0sSF6W9VnpxAbA8ZDspHJFUZ8Jj6dU5utPXnY7jd/fAYD3IcwF+QY8Eqou09N+ESXSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+rWtoLbpdmEJM9A48nym7RxhNH+Fkd7GlzUNBlyXsh4NrJDw2
	8OLuduCMJMh9hqTsFVru5Cb9oQKNnzM8XJQ5U6YYvOZdVipQKgZwgLA6
X-Gm-Gg: AZFdTZeqllGFFZqWfV/jUxQp8NsXelDF8TUAXnDqLSHejjO8013wWbVyU84BJ3TtYcm
	QBp022hmO6Q+YfheueoLm1FmDgn7gggiUvKBbF++fmnECFxoeH6zojKuHynFy02MBLAIxwCfvX3
	6YbLXp4IABqr1whqlvbkkJOl1uP7DbFxQ/0EG7KTxJX+mx5dQc8NIMfQUSlSixbKD4+PVlqLH1B
	1xioKBjlvMb/kqoxxVdDPWZ0A6HR7u0DYHL9CwmLPszM8gC8CFeGwtrRnn2Jbd0lwtvB5VeCUNo
	ExWDN5BdjZxYZJW6KsLMjVVDUz2/OwyQ62pVA3SzR1IqnE6FF7vQxgHh3FEV8J88Iwrge5U3HIN
	84q3NkW/s5t1jyvDuoAKvUzhyKZ4/6ZNaWE9BOB9/sPgxcXjmMKhXaQkD2wRzQrjIS6rv6zFsBr
	ySDXQPEL1EaG7Rskicf/6MNppgvhS25eaEUrzQQD4pTFnrPAp1WS/onCTw4wZXgKA71YLkAiH3S
	9VLXvoQYqjkm9xSDFuPKnP5dGMZExU2dIPBPcj6Zl+ynZ2GqLusRg+ZrAb9MsmuL69kWFwh+b0p
	MIHhhKG9XoMowYLqVn0N92sS7DUg5YhHOZPC80a67MQeR7Yh7LfuND9RVlUFOs8i01tp4lPc
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr303656325e9.4.1795562301128;
        Tue, 24 Nov 2026 15:18:21 -0800 (PST)
Received: from localhost-live.home.vlan10 (053d9243.dynamic.tele-ag.de. [5.61.146.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm554400825e9.11.2026.11.24.15.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:18:20 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <masneyb@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] clk: allow a clk_hw to be registered again after unregistering it
Date: Tue, 24 Nov 2026 23:17:49 +0000
Message-ID: <20261124231751.83938-2-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124231751.83938-1-joshuacov@gmail.com>
References: <20261124231751.83938-1-joshuacov@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__clk_register() sets hw->init to NULL, and clk_unregister() leaves
hw->core and hw->clk pointing to the clk_core and clk it is about to
release. A driver with statically allocated clk_hw structures can
therefore not register them again, e.g. when its device is unbound and
bound again. The second registration has no init data and oopses. A
clk_parent_data.hw reference to such a clk_hw also resolves to the
freed clk_core of the previous registration.

Keep the init pointer in the clk_core, and put it back into the clk_hw
when the registration fails and when the clock is unregistered. Init
data on the stack of the registering function is gone by the time the
clock is unregistered, so leave hw->init NULL in that case. This has to
be checked at registration, as object_is_on_stack() only looks at the
stack of the current task. Also clear hw->core and hw->clk on
unregistration, so that a reference to an unregistered clk_hw is
treated as an orphan.

Fixes: 0214f33c4e0e ("clk: Overwrite clk_hw::init with NULL during clk_register()")
Link: https://lore.kernel.org/all/179545567027.246915.947299820828330388.b4-review@b4/
Cc: stable@vger.kernel.org
Co-developed-by: Brian Masney <masneyb@kernel.org>
Signed-off-by: Brian Masney <masneyb@kernel.org>
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
 drivers/clk/clk.c            | 23 +++++++++++++++++++++++
 include/linux/clk-provider.h |  5 ++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4d2cc86bfb..c19ae1812c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
+#include <linux/sched/task_stack.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -70,6 +71,9 @@ struct clk_parent_map {
  * @ops:               Pointer to hardware-specific operations for this clk.
  * @hw:                Pointer for traversing from a struct clk to its
  *                     corresponding hardware-specific structure.
+ * @hw_init:           Init data of @hw, put back into @hw when the
+ *                     registration fails or the clk is unregistered. NULL
+ *                     if the init data was on the stack.
  * @owner:             Kernel module owning this clk (for reference counting).
  * @dev:               Device associated with this clk (optional)
  * @rpm_node:          Node for runtime power management list management.
@@ -119,6 +123,7 @@ struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;
 	struct clk_hw		*hw;
+	const struct clk_init_data *hw_init;
 	struct module		*owner;
 	struct device		*dev;
 	struct hlist_node	rpm_node;
@@ -4457,6 +4462,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	if (dev && dev->driver)
 		core->owner = dev->driver->owner;
 	core->hw = hw;
+	/* Stack init data is gone once the registering function returns. */
+	core->hw_init = object_is_on_stack(init) ? NULL : init;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;
 	core->min_rate = 0;
@@ -4505,6 +4512,9 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 		pr_err("%pOF: error %pe: failed to register clk '%s' (%pS)\n",
 		       np, ERR_PTR(ret), init->name, hw);
 	}
+
+	hw->init = init;
+
 	return ERR_PTR(ret);
 }
 
@@ -4656,11 +4666,16 @@ static void clk_core_evict_parent_cache(struct clk_core *core)
 /**
  * clk_unregister - unregister a currently registered clock
  * @clk: clock to unregister
+ *
+ * The clk_hw of @clk is returned to its state before registration, so
+ * that it can be registered again. Until then, a clk_parent_data.hw
+ * reference to it is treated as an orphan.
  */
 void clk_unregister(struct clk *clk)
 {
 	unsigned long flags;
 	const struct clk_ops *ops;
+	struct clk_hw *hw;
 
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
 		return;
@@ -4709,6 +4724,14 @@ void clk_unregister(struct clk *clk)
 	if (clk->core->protect_count)
 		pr_warn("%s: unregistering protected clock: %s\n",
 					__func__, clk->core->name);
+
+	hw = clk->core->hw;
+	if (!WARN_ON(hw->core != clk->core || hw->clk != clk)) {
+		hw->core = NULL;
+		hw->init = clk->core->hw_init;
+		hw->clk = NULL;
+	}
+
 	clk_prepare_unlock();
 
 	kref_put(&clk->core->ref, __clk_release);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee51..026efed876 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -359,7 +359,10 @@ struct clk_init_data {
  *
  * @init: pointer to struct clk_init_data that contains the init data shared
  * with the common clock framework. This pointer will be set to NULL once
- * a clk_register() variant is called on this clk_hw pointer.
+ * a clk_register() variant is called on this clk_hw pointer. It is restored
+ * if registration fails, and when the clock is unregistered unless the init
+ * data was on the stack of the registering function. The clk_hw can then be
+ * registered again as long as the init data it points to is still valid.
  */
 struct clk_hw {
 	struct clk_core *core;
-- 
2.56.0

