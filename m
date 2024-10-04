Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B225117BBE
	for <linux-clk@vger.kernel.org>; Fri,  4 Oct 2024 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049214; cv=none; b=EcUxg/TutvMuiuY+CV54lhz4qgSXZ0i2zEYlQl9SmZr7nwlsfpCqAoghXVkp9TYC1SSnOlByt0QPaig9eRZOvgT085uPQlVVyOLbEZ8kWX+6dNs2Wg44bfYUXwdwn72tXwrZiygWIo4MeYItOmZTCnxMsrtgZngzTn2/iYEcqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049214; c=relaxed/simple;
	bh=wntCVapy28GmNxQg5zI25m/BmOa7Bc+u5I7uz3rJkEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMh/s4OA4JZfkHxlta1FMFz5PsLoqEJIxU/4Alihrr56acNtelMfVegq5kLBN9oDWS9uoxFVW72YGJtyNR6IKupAEmV13LmywGX8J7joip1hvc3NZY2DM4ZiQxQrBM6xl7KIXgZY1Hsm00EAwZm13efhselkGqwqh8Qi/VEPSNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=juz3R45P; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="juz3R45P"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so21052085e9.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Oct 2024 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728049210; x=1728654010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzfLqXZYcdpOPiXhfkVN5MDcqG6LaK1oeXPNWXuwdY4=;
        b=juz3R45Pa755zCWcS0k4DkhYPsjA1bhyN4eFvvBxj8oHkaW52IpsS8mB8hdVPqHUBh
         Wbyz5/2VatRsV2fxm7GfhTRPwr4Z5WAJoLz3sR+dzQ9dCHEIozOc6FqogRMNanbs1J9b
         hQhdODedSzQkX2hDsCFjKPEzLfrCJ5mlaNmzN3VcLu1lrrc1oMuVsVuKEph3qfKeRcvs
         0KbnI8Poc/hpyvh0xKMi4fUSbmhKF9KrLmf95KUKL9HDnp7wLDlX8M/0NvMDBz27gDUr
         BNO68WJaXoh+n/QJVuEYuGEzAvf7YIhs7EPkmDw34WYtORzxCEVEnSyhL3zseHFQ4CTo
         C6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049210; x=1728654010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzfLqXZYcdpOPiXhfkVN5MDcqG6LaK1oeXPNWXuwdY4=;
        b=GyS1YPMMcZ32S9Mc90GFoJR6JHW1gf7brY3wNnzRNOvTltdfyUv180wegnCRkv1/Id
         kPoqNdv0kyeKKXJSUXZNIHPQERqIOe1vuSw7gU3ZbANvWejZWY6M8Uzh/Z3uyvANe+d/
         ECVI2QNbT7ap6UtOmYzhO3y4z1t6Rhi8FE64ZsUEH2u3oyUzudBCC+p37bnmyUTSM5XP
         MPNUeb1D0RTH6L56b3rxjkzGSM4PhBn9flUowBNCJgexw7zV9neT4dzqRkJ5bFERazba
         AINxLrwdbwgNeWWcpGzlbjuGxitE4AKu7ISpQNoA6r2K51o0OhqfOcDtFSqAfl3SXlOB
         XbvA==
X-Forwarded-Encrypted: i=1; AJvYcCXEfhvJqjtwCptIWRS+d0Of62leh+kSFeU2Di76oC/ov8gz5E8N3WjzK/EMuR7rZGLSdECjhBRE46k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxppPlSHBzl340ouVgeY2vbNZUeTcMfgX0PeCHQnLPMbSRa6WC
	f0P9h0U77w/zLw8mDZcVfrjTP4JQwOP/rEVEN3h+sJik3J2k8G5zpX4Y1paClcI=
X-Google-Smtp-Source: AGHT+IHiAyKa6+sTxt5RQjPMcUomxlt2ynxOmN8lxvsxkQAcqSyVNuCpEd+TgC21eAwnlA/Q34jzsw==
X-Received: by 2002:a05:600c:3b27:b0:42c:de34:34be with SMTP id 5b1f17b1804b1-42f85a6d765mr22106535e9.3.1728049209822;
        Fri, 04 Oct 2024 06:40:09 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:6080:c6bd:7a14:2250])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42f86b4475asm15794285e9.35.2024.10.04.06.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:40:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: chuan.liu@amlogic.com,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH] clk: core: refine disable unused clocks
Date: Fri,  4 Oct 2024 15:39:38 +0200
Message-ID: <20241004133953.494445-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
References: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it as been pointed out numerous times, flagging a clock with
CLK_IGNORE_UNUSED does _not_ guarantee that clock left enabled will stay
on. The clock will get disabled if any enable/disable cycle happens on it
or its parent clocks.

Because enable/disable cycles will disable unused clocks,
clk_disable_unused() should not trigger such cycle. Doing so disregard
the flag if set for any parent clocks. This is problematic with
CLK_OPS_PARENT_ENABLE handling.

To solve this, and a couple other issues, pass the parent status to the
child while walking the subtree, and return whether child ignored disable,
or not.

* Knowing the parent status allows to safely disable clocks with
  CLK_OPS_PARENT_ENABLE when the parent is enabled. Otherwise it means
  that, while the clock is not gated it is effectively disabled. Turning on
  the parents to sanitize the sitation would bring back our initial
  problem, so just let it sanitize itself when the clock gets used.

* If a clock is not actively used (enabled_count == 0), does not have
  CLK_IGNORE_UNUSED but the hw enabled all the way to the root clock, and a
  child ignored the disable, it should ignore the disable too. Doing so
  avoids disabling what is feading the children. Let the flag trickle down
  the tree. This has the added benefit to transfer the information to the
  unprepare path, so we don't unprepare the parent of a clock that ignored
  a disable.

* An enabled clock must be prepared in CCF but we can't rely solely on
  counts at clk_disable_unused() stage. Make sure an enabled clock is
  considered prepared too, even if does not implement the related callback.
  Also make sure only disabled clocks get unprepared.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This is sent as an RFC to continue the discussion started by Chuan.
 It is not meant to be applied as it is.


 drivers/clk/clk.c | 92 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d02451f951cf..41c4504a41f1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -332,17 +332,6 @@ static bool clk_core_is_enabled(struct clk_core *core)
 		}
 	}
 
-	/*
-	 * This could be called with the enable lock held, or from atomic
-	 * context. If the parent isn't enabled already, we can't do
-	 * anything here. We can also assume this clock isn't enabled.
-	 */
-	if ((core->flags & CLK_OPS_PARENT_ENABLE) && core->parent)
-		if (!clk_core_is_enabled(core->parent)) {
-			ret = false;
-			goto done;
-		}
-
 	ret = core->ops->is_enabled(core->hw);
 done:
 	if (core->rpm_enabled)
@@ -1454,22 +1443,39 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+static bool __init clk_unprepare_unused_subtree(struct clk_core *core,
+						bool parent_prepared)
 {
 	struct clk_core *child;
+	bool prepared;
 
 	lockdep_assert_held(&prepare_lock);
 
+	/*
+	 * Relying on count is not possible at this stage, so consider
+	 * prepared an enabled clock, in case only .is_enabled() is
+	 * implemented
+	 */
+	if (parent_prepared)
+		prepared = (clk_core_is_prepared(core) ||
+			    clk_core_is_enabled(core));
+	else
+		prepared = false;
+
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_unprepare_unused_subtree(child);
+		if (clk_unprepare_unused_subtree(child, prepared) &&
+		    prepared && !core->prepare_count)
+			core->flags |= CLK_IGNORE_UNUSED;
 
-	if (core->prepare_count)
-		return;
+	if (core->flags & CLK_IGNORE_UNUSED || core->prepare_count)
+		goto out;
 
-	if (core->flags & CLK_IGNORE_UNUSED)
-		return;
+	if (!parent_prepared && (core->flags & CLK_OPS_PARENT_ENABLE))
+		goto out;
 
-	if (clk_core_is_prepared(core)) {
+	/* Do not unprepare an enabled clock */
+	if (clk_core_is_prepared(core) &&
+	    !clk_core_is_enabled(core)) {
 		trace_clk_unprepare(core);
 		if (core->ops->unprepare_unused)
 			core->ops->unprepare_unused(core->hw);
@@ -1477,27 +1483,50 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 			core->ops->unprepare(core->hw);
 		trace_clk_unprepare_complete(core);
 	}
+
+out:
+	return (core->flags & CLK_IGNORE_UNUSED) && prepared;
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static bool __init clk_disable_unused_subtree(struct clk_core *core,
+					      bool parent_enabled)
 {
 	struct clk_core *child;
 	unsigned long flags;
+	bool enabled;
 
 	lockdep_assert_held(&prepare_lock);
 
-	hlist_for_each_entry(child, &core->children, child_node)
-		clk_disable_unused_subtree(child);
+	flags = clk_enable_lock();
 
-	if (core->flags & CLK_OPS_PARENT_ENABLE)
-		clk_core_prepare_enable(core->parent);
+	/* Check if the clock is enabled from root to this clock */
+	if (parent_enabled)
+		enabled = clk_core_is_enabled(core);
+	else
+		enabled = false;
 
-	flags = clk_enable_lock();
+	hlist_for_each_entry(child, &core->children, child_node)
+		/*
+		 * If any child ignored disable, this clock should too,
+		 * unless there is, valid reason for the clock to be enabled
+		 */
+		if (clk_disable_unused_subtree(child, enabled) &&
+		    enabled && !core->enable_count)
+			core->flags |= CLK_IGNORE_UNUSED;
 
-	if (core->enable_count)
+	if (core->flags & CLK_IGNORE_UNUSED || core->enable_count)
 		goto unlock_out;
 
-	if (core->flags & CLK_IGNORE_UNUSED)
+	/*
+	 * If the parent is disabled but the gate is open, we should sanitize
+	 * the situation. This will avoid an unexpected enable of the clock as
+	 * soon as the parent is enabled, without control of CCF.
+	 *
+	 * Doing so is not possible with a CLK_OPS_PARENT_ENABLE clock without
+	 * forcefully enabling a whole part of the subtree.  Just let the
+	 * situation resolve it self on the first enable of the clock
+	 */
+	if (!parent_enabled && (core->flags & CLK_OPS_PARENT_ENABLE))
 		goto unlock_out;
 
 	/*
@@ -1516,8 +1545,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 
 unlock_out:
 	clk_enable_unlock(flags);
-	if (core->flags & CLK_OPS_PARENT_ENABLE)
-		clk_core_disable_unprepare(core->parent);
+	return (core->flags & CLK_IGNORE_UNUSED) && enabled;
 }
 
 static bool clk_ignore_unused __initdata;
@@ -1550,16 +1578,16 @@ static int __init clk_disable_unused(void)
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, true);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, true);
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, true);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, true);
 
 	clk_prepare_unlock();
 
-- 
2.45.2

