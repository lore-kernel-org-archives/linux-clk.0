Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921793F3268
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811679; cv=none; b=pruDXlulp61OMJ7paH6CknPAFU28wuLCFkjzJE4JitBj0NCzdEvIV/qWCL8p8Beq0dCsva4LskcHd6fL2YTo0tCIRh0u9ZiITtpxlciJZDgipSchAHOMj6Tp0xmR1MLN+zvazLZczonUUIf3gyiTW/vRSPQ77wl4hkOWgxiviBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811679; c=relaxed/simple;
	bh=P+/0zBot8x4qOXLvqJkRvDY+WbDDpPfVT5UHeF1F98M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P0+z5d0Th0Sw/8kqxeIoqBpEi1wb+e2CqMnj2H15b+S+pivx2qp0lEbkWjbwjBWid7zAjPkdpRVySkmLN9PULfJNtnaXR5QEqIy5HTZAGmsD06k6tgXZSC5qufW3jGZl6J1kAeB7LWKAQfE3h8DP6YrC4rgFafB5JRtMG72+u3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nUEuj5Nq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nUEuj5Nq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso3391995e9.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784811675; x=1785416475; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aFcWQZtsOaTJqZL9+XHfh6CZtEhn6WtQTeGOpbwxm6M=;
        b=nUEuj5Nq5AzsDSgKVNc/d7U7bVJ7Y7kc6rIMHalHW9qate3nFg8vqGfZMzX77EbiMv
         IxWbqfqzNkOoNqdogqh+iREgNvMwk/nNPYaNuJzCyFFhRtVjbTeqRMb8Fnw7wuRAaSU9
         XICDR9QpyHdfl8MPuYMQSq3zbWY+3mce7c3jZLQIIzDUHTspD+iB19AxQVrvRNnLCwNG
         ORqe1xy+wfqQFPZGOjuibKzzXpKSAud+DfVj/zB6sEN2C/i17f66M7EA/Z2ALEdsFuiH
         8cFGM+te6hFZXVcvF4bSMYyA8573C1RYBKoLWSeKmovahKobIfGxCFuQErYUGuOlwm0B
         UERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811675; x=1785416475;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aFcWQZtsOaTJqZL9+XHfh6CZtEhn6WtQTeGOpbwxm6M=;
        b=Wehknm2euKu72cSRdxglE5wINvBgJvn6KxMorgXmIijRZ+hhw9X4+fIAm1NtMjBYsK
         hQd2yPb6OcQhtOJWw+hkjOALoeMpETBL31FCewbm6EWY6koQqkaBNdmLI02jQ5NY0OLr
         wdFweqjKFn/HfgRyg3cQTr4kbP/dq8ts/GWDbIqAN/BWwWtQLnk47BzSZLHFjprX20iY
         Gg0dHgvwetJJxVFn80onh+Mq3Qnpysvi5Qh2l7IhXraI7MFn4Fz4nF8S2NQ7Vuz3eFwC
         IEvnFP2SM500cYVTATdTpYLPJll77oKqdQ+IlDi6tZXmqtXgpEe3po4ZjTi0YbRg9BVs
         r8ig==
X-Gm-Message-State: AOJu0YxDsmb1lBMWE9X6XYLodkXmImVvsThcDw7v+qKGMIrRx+6RSi8A
	x9KCHz64fSFK55JabG92gtswVwZFjBL/8pnVtjyWaDP1Nz5Xm8mjodxxBJ8JA+yE18g=
X-Gm-Gg: AR+sD13kNoec0jArDgk34LLzlIN4ayFE/gvDo8YlALNP0mnNcX4QZHzRKjv8f0t0uuV
	aciYB+tg1VUMQUkacuBy3PrLqtEgxJG6YqP7YvGEH067grPR1KQBCf3aowpRQsqB+/PEQiUsr2r
	hlKALcrmokyGfvuoXYOOGP/ZiTkwx3jfDMCH5OdimkUkp7ve/pBmqm0JWhqQWFq3HG1AkOMJOoX
	8mkdXu+5mfpOhGbwlzyINPia/4pc22zzI/esZNMYnX9GYW8fr5aqOZfjyifCxA54YZSuUpq9rvj
	t/5+rRihkFjUTaCReu3vUG+7QQ5Dm0MSHn2xENkOlztT6Vob1DK3XjASnt1sPu/eurp2y9pu6N1
	Eo7lN83H4O299SrYFIMSIVbdw0KOhAz3BEDauezB9jksPDIkXV9ba1q8w8RL6Cevt5kREPoukKk
	fo2No5DmPQTw==
X-Received: by 2002:a05:600c:1f92:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-49573d1ff7bmr32337035e9.34.1784811674652;
        Thu, 23 Jul 2026 06:01:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a867:44d7:3dfb:853])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85b9a659sm15986987f8f.6.2026.07.23.06.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:01:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 15:00:51 +0200
Subject: [PATCH v2] clk: fix self-consuming provider module pinning
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAIIQYmoC/4WNTQ6CMBBGr0Jm7RhatIgr72FY0HaE8aclLTYSw
 t0FPIDLl7zvfRNECkwRztkEgRJH9m4BucvAdI1rCdkuDDKXKi+lQPN8YB98YksBe3aOXYtCFuV
 BaHk62gaWaR/oxp8te61/HN/6TmZYW6vRcRx8GLffJFbvz0USKFAVVktSqqyq4qKb8ck60N74F
 9TzPH8Bm0Vt+s0AAAA=
X-Change-ID: 20260721-clk-provider-pinning-123741b285da
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10503; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=P+/0zBot8x4qOXLvqJkRvDY+WbDDpPfVT5UHeF1F98M=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYhCTN1vuvieu1YUFKiKxB3srPsPOVCRFeinuA
 tKCgu+tHNKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamIQkwAKCRDm/A8cN/La
 hf4ID/4oRsuwZVy2w9Zov8P+ZbIwZekDOj7XGrh2cQGjyrAcq4bOya66B1cwPXnZ1t+xgcVa6ik
 K8JfreAvCCLNiT6RXDknd3ZZp+qTUktyx8Sx8B7jxlehZAppkOF0GlhD4vE4x7HIkTUESODWcvg
 dtjrxaxziCtxEw3xhq/U3aaQn4xhM07oAqQbpFFmvl5IBbD0x2DRc9t2nN+X9m5WlwZ64wxdGmw
 Yj8J1uv4U9EnceAi6saAB8XxAvwQZrbjlAPS8G6zBv+i2T9rWgsMr/9leJMyhcPfXVqszVKZASn
 VnvUMU1ZAdEAn8CH2I1nDg9cP05P56zUVZYYk4b68cp8QkhCN7cU1eCJztHEDyniK2EQhE4Gmae
 tzS2az0LnZ/qWfQgGM7bQq8DyKy/zwQdK5HscOhqu24YYzXtx4P1Ju4rPX6lmS4a4hXxL71mxO5
 G8ThVHCLu9uqk/9aGLXQdHLIKVoKk5OlZoIEKvzovJLMNIjb03yatRQbEmm1xhHFCWpHk19ZPCm
 G3teUmTNu5b6eaUTrd6ZrylMGTY63e49mXbgoGz6+0cw1+m0Th59mY7MC8++zce83O1q19JiUos
 5UPJgdVLuoouYk5MRDqwfFJ1AD+xP2W5e/L1Hl3xyncXUrrXZxguVCCZ1c4sfOF22NevGIzG7tj
 rcY57VQibaki9tg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

clk_hw_get_clk() lets a provider get a struct clk for one of its own
struct clk_hw.

When a struct clk is created, the module usage count of the provider
is unconditionally increased. For a self-consuming provider, this means
it pins itself and the module can never be unloaded.

Increasing the module usage count should only be done when the consumer
lives in a different module from the provider. Use THIS_MODULE to
capture caller's module and increase the module usage count accordingly.

It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
pass a NULL owner. As a result, any provider module will get pinned,
same as before.

Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This issue has been present for a while. Virtually all users of
clk_hw_get_clk() are affected. The majority are compiled as builtins
according to the defconfigs. It is not problem in this case but it is
if the configuration is changed to module.

The following modules are using clk_hw_get_clk() and are compiled as
module with some shipped defconfigs:
* drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
* drivers/phy/cadence/phy-cadence-sierra.c
* drivers/pwm/pwm-meson.c
* sound/soc/codecs/lpass-va-macro.c

Currently those module cannot be unloaded once they have been loaded.

"""
rmmod: ERROR: Module blabla-module is in use
"""

With this applied, we can get back to removing the direct usage
of the struct clk in struct clk_hw and eventually remove this
struct member entirely.
---
Changes in v2:
- Update comment in __clk_register()
- Add missing documention for the new parameter of clk_hw_create_clk()
- No functional change
- Link to v1: https://patch.msgid.link/20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com
---
 drivers/clk/clk.c            | 46 +++++++++++++++++++++++++-------------------
 drivers/clk/clk.h            |  5 +++--
 drivers/clk/clkdev.c         |  4 ++--
 include/linux/clk-provider.h | 22 ++++++++++++++++++---
 4 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..9f138988efbf 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -115,6 +115,7 @@ struct clk {
 	unsigned long max_rate;
 	unsigned int exclusive_count;
 	struct hlist_node clks_node;
+	bool pinning;
 };
 
 /***           runtime pm          ***/
@@ -4141,13 +4142,15 @@ static void free_clk(struct clk *clk)
  * @hw: clk_hw associated with the clk being consumed
  * @dev_id: string describing device name
  * @con_id: connection ID string on device
+ * @owner: reference to the module creating the clock
  *
  * This is the main function used to create a clk pointer for use by clk
  * consumers. It connects a consumer to the clk_core and clk_hw structures
  * used by the framework and clk provider respectively.
  */
 struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
-			      const char *dev_id, const char *con_id)
+			      const char *dev_id, const char *con_id,
+			      struct module *owner)
 {
 	struct clk *clk;
 	struct clk_core *core;
@@ -4162,7 +4165,13 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 		return clk;
 	clk->dev = dev;
 
-	if (!try_module_get(core->owner)) {
+	/*
+	 * Pin the provider module only when the consumer lives in a different
+	 * module. A provider getting a clk from its own clk_hw would otherwise
+	 * pin itself and could never be unloaded.
+	 */
+	clk->pinning = owner != core->owner;
+	if (clk->pinning && !try_module_get(core->owner)) {
 		free_clk(clk);
 		return ERR_PTR(-ENOENT);
 	}
@@ -4173,24 +4182,19 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 	return clk;
 }
 
-/**
- * clk_hw_get_clk - get clk consumer given an clk_hw
- * @hw: clk_hw associated with the clk being consumed
- * @con_id: connection ID string on device
- *
- * Returns: new clk consumer
- * This is the function to be used by providers which need
- * to get a consumer clk and act on the clock element
- * Calls to this function must be balanced with calls clk_put()
+/*
+ * Internal helper backing the clk_hw_get_clk() macro, which passes the caller's
+ * module via THIS_MODULE.
  */
-struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
+struct clk *__clk_hw_get_clk(struct clk_hw *hw, const char *con_id,
+			     struct module *owner)
 {
 	struct device *dev = hw->core->dev;
 	const char *name = dev ? dev_name(dev) : NULL;
 
-	return clk_hw_create_clk(dev, hw, name, con_id);
+	return clk_hw_create_clk(dev, hw, name, con_id, owner);
 }
-EXPORT_SYMBOL(clk_hw_get_clk);
+EXPORT_SYMBOL(__clk_hw_get_clk);
 
 static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
 {
@@ -4354,8 +4358,9 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	INIT_HLIST_HEAD(&core->clks);
 
 	/*
-	 * Don't call clk_hw_create_clk() here because that would pin the
-	 * provider module to itself and prevent it from ever being removed.
+	 * Don't call clk_hw_create_clk() here because it would systematically
+	 * add a consumer to the hw clock and all clocks would appear to have
+	 * consumer in the clock summary.
 	 */
 	hw->clk = alloc_clk(core, NULL, NULL);
 	if (IS_ERR(hw->clk)) {
@@ -4712,7 +4717,7 @@ struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
 	if (!clkp)
 		return ERR_PTR(-ENOMEM);
 
-	clk = clk_hw_get_clk(hw, con_id);
+	clk = __clk_hw_get_clk(hw, con_id, dev->driver->owner);
 	if (!IS_ERR(clk)) {
 		*clkp = clk;
 		devres_add(dev, clkp);
@@ -4759,7 +4764,8 @@ void __clk_put(struct clk *clk)
 
 	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);
-	module_put(owner);
+	if (clk->pinning)
+		module_put(owner);
 	free_clk(clk);
 }
 
@@ -5280,7 +5286,7 @@ struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
 {
 	struct clk_hw *hw = of_clk_get_hw_from_clkspec(clkspec);
 
-	return clk_hw_create_clk(NULL, hw, NULL, __func__);
+	return clk_hw_create_clk(NULL, hw, NULL, __func__, NULL);
 }
 EXPORT_SYMBOL_GPL(of_clk_get_from_provider);
 
@@ -5307,7 +5313,7 @@ static struct clk *__of_clk_get(struct device_node *np,
 {
 	struct clk_hw *hw = of_clk_get_hw(np, index, con_id);
 
-	return clk_hw_create_clk(NULL, hw, dev_id, con_id);
+	return clk_hw_create_clk(NULL, hw, dev_id, con_id, NULL);
 }
 
 struct clk *of_clk_get(struct device_node *np, int index)
diff --git a/drivers/clk/clk.h b/drivers/clk/clk.h
index 2d801900cad5..5009380863a9 100644
--- a/drivers/clk/clk.h
+++ b/drivers/clk/clk.h
@@ -23,13 +23,14 @@ struct clk_hw *clk_find_hw(const char *dev_id, const char *con_id);
 
 #ifdef CONFIG_COMMON_CLK
 struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
-			      const char *dev_id, const char *con_id);
+			      const char *dev_id, const char *con_id,
+			      struct module *owner);
 void __clk_put(struct clk *clk);
 #else
 /* All these casts to avoid ifdefs in clkdev... */
 static inline struct clk *
 clk_hw_create_clk(struct device *dev, struct clk_hw *hw, const char *dev_id,
-		  const char *con_id)
+		  const char *con_id, struct module *owner)
 {
 	return (struct clk *)hw;
 }
diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index abaa0f9e0083..919fc680ae4d 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -88,7 +88,7 @@ static struct clk *__clk_get_sys(struct device *dev, const char *dev_id,
 {
 	struct clk_hw *hw = clk_find_hw(dev_id, con_id);
 
-	return clk_hw_create_clk(dev, hw, dev_id, con_id);
+	return clk_hw_create_clk(dev, hw, dev_id, con_id, NULL);
 }
 
 struct clk *clk_get_sys(const char *dev_id, const char *con_id)
@@ -105,7 +105,7 @@ struct clk *clk_get(struct device *dev, const char *con_id)
 	if (dev && dev->of_node) {
 		hw = of_clk_get_hw(dev->of_node, 0, con_id);
 		if (!IS_ERR(hw) || PTR_ERR(hw) == -EPROBE_DEFER)
-			return clk_hw_create_clk(dev, hw, dev_id, con_id);
+			return clk_hw_create_clk(dev, hw, dev_id, con_id, NULL);
 	}
 
 	return __clk_get_sys(dev, dev_id, con_id);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b01a38fef8cf..40e3eacb569b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -37,6 +37,7 @@ struct clk;
 struct clk_hw;
 struct clk_core;
 struct dentry;
+struct module;
 
 /**
  * struct clk_rate_request - Structure encoding the clk constraints that
@@ -310,8 +311,9 @@ struct clk_init_data {
  * @core: pointer to the struct clk_core instance that points back to this
  * struct clk_hw instance
  *
- * @clk: pointer to the per-user struct clk instance that can be used to call
- * into the clk API
+ * @clk: pointer to the per-user struct clk instance. This will be removed at
+ * some point in the future, Please consider the field obsolete and do not use
+ * it. Use clk_hw_get_clk() to get a per-user struct clk from a struct clk_hw.
  *
  * @init: pointer to struct clk_init_data that contains the init data shared
  * with the common clock framework. This pointer will be set to NULL once
@@ -1401,10 +1403,24 @@ static inline struct clk_hw *__clk_get_hw(struct clk *clk)
 }
 #endif
 
-struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id);
+struct clk *__clk_hw_get_clk(struct clk_hw *hw, const char *con_id,
+			     struct module *owner);
 struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
 				const char *con_id);
 
+/**
+ * clk_hw_get_clk - get clk consumer given a clk_hw
+ * @hw: clk_hw associated with the clk being consumed
+ * @con_id: connection ID string on device
+ *
+ * Return: new clk consumer
+ * This is the function to be used by providers which need
+ * to get a consumer clk and act on the clock element
+ * Calls to this function must be balanced with calls to clk_put()
+ */
+#define clk_hw_get_clk(hw, con_id) \
+	__clk_hw_get_clk((hw), (con_id), THIS_MODULE)
+
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260721-clk-provider-pinning-123741b285da

Best regards,
--  
Jerome

