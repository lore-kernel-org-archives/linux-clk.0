Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C7437451
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780486; cv=none; b=KEglw7VTNCC/LqESqQ3ArxpP+bR5dUmd05cZdsERVlM/kb9mEQcs4zFokEKgIDE7BRVYPdCNe1VdVwU6naboFKI277BLAIvbP+t+xcFdR19KpfH0uEcg3l/jtMgZIKwKRSPN1pgJnzJMhACk1GREapi78u90jclZtmTMPOp3jM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780486; c=relaxed/simple;
	bh=dA2uXTgNNR86KHbjxMP39oPXSrapg6wgRAAEbxfVTkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSEyqT9ERYh71oBl128U/1aI6fh+phBTGq7TybU0plB+ejhCAe8a2M529Spy210AGIVvrQy51UQdI0PVcYPfxdlm8je02KJXiuaJqpVilSe4znYqVmjntNHU+GVJPFwcJBBVBxTZYTNhI+K06jbTvG38hleAjZ5WMe/7UoobgsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9xKvVZb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9xKvVZb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fdd674e17so1062337f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780482; x=1786385282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FrlG6RlhnBaNqMMkw4zNAoZMeZEfrMq/GASnuyPUjjg=;
        b=O9xKvVZbe7+smV43dJJYm73AUs3JoJty72LZDClREggPQ2BH3IrhZiMSXYrI93oEKD
         lITEtgJyg7y48A0KbAEdT6RF6rhiV1OpnFS8rrR2tH49OzuC9Icm11dNYMxrpwg4p7Bo
         0lbnSEVmjCMM8wc5zyE5bR8BvK48hvlRqb1CPiX0oWuklffh30B0hrcnd5uaQkCC1Mr9
         0v+70xoDuKVYj/37LetJBUN/TIwvpRCpoj1kAltIemjUe4WBPxi8Z61csdRFNe8F5mdw
         PW6ZeR1ALyyeRh177b4GLWH2px8J508od/wRQ2MC3+nhhjA06oV39tAZbJ6m8Tw2Lt85
         OsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780482; x=1786385282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrlG6RlhnBaNqMMkw4zNAoZMeZEfrMq/GASnuyPUjjg=;
        b=CvdOkujBmceCxpU3T195ewkkZoTI8pMjW0pBfAafeCVNamB/+vEx86Vf/feyo7fJ4S
         36vUP8jJrgqBGuvzDt4+XBxL9Ct+M38EhvcsYTuEs4HaZ7/ZwCC8mWQTEpUOQSdkBEke
         0V9datCv3OmwvOsW9YeHJX0QbaS4Qt+zKirEWF1hQQMgtqjMpG/erPqnLxbWMxzak6yB
         l5AnZwStjr8MnjDvk5YOwbk7GSqtjDPQsNqQ1oxtxdYYbWyxF7aNkpusDKqP212dwYob
         KoGxqx1hLQNiq1aD6qa5JQELGfE58I0mPRO0bK96puK6KVMPyGGdUUshQ4qj1IKyUUl0
         6IRA==
X-Forwarded-Encrypted: i=1; AHgh+Roi+FMag814fOPbsMX9NQHmN6SvD3BgwF7bpk/uFIhJRXVywyGx+eVbvMs1L8quM/ujfbBwGqdUOvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxElKP7eONnlkzMVnlFTQvNckhIZd4Rwc1HHWhjp7GmCP9cQyi0
	Z5cvmzAjrGgzgA9RxhhqQmUo+Z0Mo4XAWf3VA8Ggbd5GpQXaLNZa80fz
X-Gm-Gg: AR+sD11MYrK5Zf+Lac7DRCqiRaYClS0niG5DJ9uabQJ2D4Lk7zOBf4//t+7/7w2Hxmk
	BSgJIIKsqQCZpUXIc58FXR5W5tpQeaPcHkJZW5MiIQFWpUZrI02DAhuJ2lwj6NQjm7Hm/dqnZZ1
	AnpQLJAkR/OiGKtG1A9NcC4zYDhc5Gms6mWIBAhUeTZSzWgnafyGog6IcHJBaAS/BbtPdkQ1q6q
	6NCKeXBW/JzFZ7XATCOXVzNzpWG6tXktq79lnpn0IxVE0yjZJi3/OaN2ALhO4o7OBSSWRagxjas
	364evL2GeriTPv/d2sv8WolhZVxKZg3g68ojCSd+tVDM++GZccDMWLxu+F2JvDj3kVfU5aJVEQ1
	wMBPO5DpYLwkTKWLTZ6hx5LrnOfwitOzkvU59X9bxxi49yDl0UsU0B501zWFwVH3RO9UEJ8fbeJ
	jVVgABRsJB8wnmhlR4RMe8B0tupRpBIUePLHZF4nOkeNmDnXkbDVhckYc6UxZmDCeXbVrbGy62n
	1b1TsPcTgPSitbq9q5bdNM=
X-Received: by 2002:a05:6000:2709:b0:474:d7a5:4b7a with SMTP id ffacd0b85a97d-47fd73098d1mr21312162f8f.28.1785780481921;
        Mon, 03 Aug 2026 11:08:01 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:08:01 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 1/3] clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
Date: Mon,  3 Aug 2026 20:07:53 +0200
Message-ID: <20260803180755.288793-2-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some mod clocks do not divide their parent with a linear M+1 divider:
the M factor masks (swallows) M pulses out of every 2^width parent
cycles, so the average output rate is

	rate = parent * (2^width - M) / 2^width

and the surviving pulses keep the parent period.  The A523/T527 GPU
clock (GPU_CLK_REG, 0x670) is such a divider: "FACTOR_M: mask M cycles
at 16 cycles", GPU_CLK = Clock Source * ((16-M)/16) (T527 user manual
v0.92, section 2.7.6.58).

Modelling these registers with the linear ccu_div type programs a
faster clock than requested for every M > 0 (e.g. M=1 on a 800 MHz
parent yields 750 MHz, not 400 MHz).

Add a small ccu type implementing the masking semantics.  Because the
masked output is not an even pulse train, determine_rate prefers, among
the parents that reach the requested rate, the one needing the least
masking, and clamps the result to the request's min_rate/max_rate
bounds.  set_rate_and_parent follows the same ordering rule as
clk_composite_set_rate_and_parent() so no intermediate configuration
overshoots both the old and the new rate, and honours the
CCU_FEATURE_UPDATE_BIT and CCU_FEATURE_KEY_FIELD features, so the type
can be reused on registers that need them.

CLK_SET_RATE_PARENT is deliberately not supported: the masking factor
and a parent rate change are two independent knobs and picking a
combination of both is out of scope for this type.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/Makefile      |   1 +
 drivers/clk/sunxi-ng/ccu_common.h  |   3 +
 drivers/clk/sunxi-ng/ccu_maskdiv.c | 213 +++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h |  76 ++++++++++
 drivers/clk/sunxi-ng/ccu_mux.c     |   2 -
 5 files changed, 293 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h

diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index a1c4087d7241..26313083c2f8 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -10,6 +10,7 @@ sunxi-ccu-y			+= ccu_reset.o
 # Base clock types
 sunxi-ccu-y			+= ccu_div.o
 sunxi-ccu-y			+= ccu_frac.o
+sunxi-ccu-y			+= ccu_maskdiv.o
 sunxi-ccu-y			+= ccu_gate.o
 sunxi-ccu-y			+= ccu_mux.o
 sunxi-ccu-y			+= ccu_mult.o
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index d9dc24ad5503..0260af263d05 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -29,6 +29,9 @@
 /* Some clocks need this bit to actually apply register changes */
 #define CCU_SUNXI_UPDATE_BIT		BIT(27)
 
+/* Key value for clocks with CCU_FEATURE_KEY_FIELD (reads as zero) */
+#define CCU_MUX_KEY_VALUE		0x16aa0000
+
 struct device_node;
 
 struct ccu_common {
diff --git a/drivers/clk/sunxi-ng/ccu_maskdiv.c b/drivers/clk/sunxi-ng/ccu_maskdiv.c
new file mode 100644
index 000000000000..4ad49d51405b
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_maskdiv.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 Juan Manuel López Carrillo
+ *
+ * Cycle-masking divider: the M factor masks M pulses out of every
+ * 2^width parent cycles instead of dividing the parent rate, so
+ *
+ *	rate = parent * (2^width - M) / 2^width
+ *
+ * The masked output is not an even pulse train: the surviving pulses
+ * keep the parent period. Rate selection therefore prefers, among the
+ * parents that reach the requested rate, the one needing the least
+ * masking.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+
+#include "ccu_gate.h"
+#include "ccu_maskdiv.h"
+
+static unsigned long ccu_maskdiv_calc_rate(unsigned long parent_rate,
+					   unsigned int m, unsigned int width)
+{
+	unsigned int n = 1 << width;
+
+	return div_u64((u64)parent_rate * (n - m), n);
+}
+
+/*
+ * Smallest M (least masking) whose output does not exceed the requested
+ * rate; masking everything (M == 2^width) is never returned.
+ */
+static unsigned int ccu_maskdiv_find_m(unsigned long parent_rate,
+				       unsigned long rate, unsigned int width)
+{
+	unsigned int n = 1 << width;
+	u64 kept;
+
+	if (!parent_rate || rate >= parent_rate)
+		return 0;
+
+	kept = div64_ul((u64)rate * n, parent_rate);
+	if (!kept)
+		kept = 1;
+
+	return n - (unsigned int)kept;
+}
+
+static void ccu_maskdiv_disable(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_disable(&cmd->common, cmd->enable);
+}
+
+static int ccu_maskdiv_enable(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_enable(&cmd->common, cmd->enable);
+}
+
+static int ccu_maskdiv_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_is_enabled(&cmd->common, cmd->enable);
+}
+
+static unsigned long ccu_maskdiv_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned int m;
+	u32 reg;
+
+	reg = readl(cmd->common.base + cmd->common.reg);
+	m = (reg >> cmd->shift) & ((1 << cmd->width) - 1);
+
+	return ccu_maskdiv_calc_rate(parent_rate, m, cmd->width);
+}
+
+static int ccu_maskdiv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned long best_rate = 0, best_parent_rate = 0;
+	struct clk_hw *best_parent = NULL;
+	unsigned int best_m = UINT_MAX;
+	unsigned int i;
+
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
+		unsigned long parent_rate, new_rate;
+		unsigned int m;
+
+		if (!parent)
+			continue;
+
+		parent_rate = clk_hw_get_rate(parent);
+		m = ccu_maskdiv_find_m(parent_rate, req->rate, cmd->width);
+		new_rate = ccu_maskdiv_calc_rate(parent_rate, m, cmd->width);
+
+		if (new_rate > req->rate)
+			continue;
+
+		/*
+		 * Reject rates outside the framework's bounds: a maskdiv
+		 * rounds by masking parent cycles, so it can only produce
+		 * sub-multiples of a parent rate; without this check a
+		 * consumer asking for, say, a tight [max_rate, max_rate]
+		 * window would silently get a smaller rate.
+		 */
+		if (new_rate < req->min_rate || new_rate > req->max_rate)
+			continue;
+
+		/* Closest rate first; on ties, the least masking */
+		if (new_rate > best_rate ||
+		    (new_rate == best_rate && m < best_m)) {
+			best_rate = new_rate;
+			best_parent_rate = parent_rate;
+			best_parent = parent;
+			best_m = m;
+		}
+	}
+
+	if (!best_parent)
+		return -EINVAL;
+
+	req->best_parent_hw = best_parent;
+	req->best_parent_rate = best_parent_rate;
+	req->rate = best_rate;
+
+	return 0;
+}
+
+static int ccu_maskdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned int m;
+	unsigned long flags;
+	u32 reg;
+
+	m = ccu_maskdiv_find_m(parent_rate, rate, cmd->width);
+
+	spin_lock_irqsave(cmd->common.lock, flags);
+
+	reg = readl(cmd->common.base + cmd->common.reg);
+	reg &= ~GENMASK(cmd->shift + cmd->width - 1, cmd->shift);
+	if (cmd->common.features & CCU_FEATURE_KEY_FIELD)
+		reg |= CCU_MUX_KEY_VALUE;
+	if (cmd->common.features & CCU_FEATURE_UPDATE_BIT)
+		reg |= CCU_SUNXI_UPDATE_BIT;
+	writel(reg | (m << cmd->shift), cmd->common.base + cmd->common.reg);
+
+	spin_unlock_irqrestore(cmd->common.lock, flags);
+
+	return 0;
+}
+
+static u8 ccu_maskdiv_get_parent(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_mux_helper_get_parent(&cmd->common, &cmd->mux);
+}
+
+static int ccu_maskdiv_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_mux_helper_set_parent(&cmd->common, &cmd->mux, index);
+}
+
+static int ccu_maskdiv_set_rate_and_parent(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate, u8 index)
+{
+	/*
+	 * Same ordering rule as clk_composite_set_rate_and_parent(): if
+	 * switching the mux with the current M would overshoot the
+	 * requested rate, program the divider first, so the
+	 * intermediate rate never exceeds both the old and the new
+	 * rate.
+	 */
+	if (ccu_maskdiv_recalc_rate(hw, parent_rate) > rate) {
+		ccu_maskdiv_set_rate(hw, rate, parent_rate);
+		ccu_maskdiv_set_parent(hw, index);
+	} else {
+		ccu_maskdiv_set_parent(hw, index);
+		ccu_maskdiv_set_rate(hw, rate, parent_rate);
+	}
+
+	return 0;
+}
+
+const struct clk_ops ccu_maskdiv_ops = {
+	.disable	= ccu_maskdiv_disable,
+	.enable		= ccu_maskdiv_enable,
+	.is_enabled	= ccu_maskdiv_is_enabled,
+
+	.get_parent	= ccu_maskdiv_get_parent,
+	.set_parent	= ccu_maskdiv_set_parent,
+
+	.determine_rate	= ccu_maskdiv_determine_rate,
+	.recalc_rate	= ccu_maskdiv_recalc_rate,
+	.set_rate	= ccu_maskdiv_set_rate,
+	.set_rate_and_parent = ccu_maskdiv_set_rate_and_parent,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_maskdiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_maskdiv.h b/drivers/clk/sunxi-ng/ccu_maskdiv.h
new file mode 100644
index 000000000000..e070798f1533
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_maskdiv.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Juan Manuel López Carrillo
+ */
+
+#ifndef _CCU_MASKDIV_H_
+#define _CCU_MASKDIV_H_
+
+#include <linux/clk-provider.h>
+
+#include "ccu_common.h"
+#include "ccu_mux.h"
+
+/*
+ * struct ccu_maskdiv - cycle-masking ("fractional") divider
+ *
+ * This divider does not divide the parent clock: it masks (swallows) M
+ * pulses out of every 2^width parent cycles, so the average output rate
+ * is
+ *
+ *	rate = parent * (2^width - M) / 2^width
+ *
+ * with the remaining pulses keeping the parent period. The A523/T527
+ * GPU clock (GPU_CLK_REG, 0x670) is such a divider: "FACTOR_M: mask M
+ * cycles at 16 cycles", GPU_CLK = Clock Source * ((16-M)/16) (T527 user
+ * manual v0.92, section 2.7.6.58).
+ *
+ * This type does not support CLK_SET_RATE_PARENT: determine_rate
+ * evaluates parents at their current rate and does not propagate rate
+ * requests upstream.  If a future user needs parent rate propagation,
+ * switch to clk_hw_round_rate() in the determine_rate loop.
+ *
+ * @shift:	shift of the M field in the register
+ * @width:	width of the M field; the mask window is 2^width cycles
+ */
+struct ccu_maskdiv {
+	u32			enable;
+
+	u8			shift;
+	u8			width;
+
+	struct ccu_mux_internal	mux;
+	struct ccu_common	common;
+};
+
+#define SUNXI_CCU_MASKDIV_HW_WITH_MUX_TABLE_GATE(_struct, _name,	\
+						 _parents, _table,	\
+						 _reg,			\
+						 _mshift, _mwidth,	\
+						 _muxshift, _muxwidth,	\
+						 _gate, _flags)		\
+	struct ccu_maskdiv _struct = {					\
+		.enable	= _gate,					\
+		.shift	= _mshift,					\
+		.width	= _mwidth,					\
+		.mux	= _SUNXI_CCU_MUX_TABLE(_muxshift, _muxwidth,	\
+					       _table),			\
+		.common	= {						\
+			.reg		= _reg,				\
+			.hw.init	= CLK_HW_INIT_PARENTS_HW(_name,	\
+								 _parents, \
+								 &ccu_maskdiv_ops, \
+								 _flags), \
+		},							\
+	}
+
+static inline struct ccu_maskdiv *hw_to_ccu_maskdiv(struct clk_hw *hw)
+{
+	struct ccu_common *common = hw_to_ccu_common(hw);
+
+	return container_of(common, struct ccu_maskdiv, common);
+}
+
+extern const struct clk_ops ccu_maskdiv_ops;
+
+#endif /* _CCU_MASKDIV_H_ */
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 4503c9780c39..fa1f5fd2a1fd 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -12,8 +12,6 @@
 #include "ccu_gate.h"
 #include "ccu_mux.h"
 
-#define CCU_MUX_KEY_VALUE		0x16aa0000
-
 static u16 ccu_mux_get_prediv(struct ccu_common *common,
 			      struct ccu_mux_internal *cm,
 			      int parent_index)
-- 
2.47.3

