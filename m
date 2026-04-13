Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA753C8706
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084563; cv=none; b=T7fH+Wd7PfEk4IqXAVW7UgR2lF7LUJzL2Pl2xir+ttEula3WEDCbJOnmvhhelEgmEgEoncdUT2qiKkZX8ODj7vMUWG7c2tBsddyR0ay/p8siZ5uowMhc6BDJAxGSaziwV+6aEfGdg1ofq3Sk6mdLVXJcDTmWkRskTk/1PUtUwd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084563; c=relaxed/simple;
	bh=/L73E0ZuOj9b7tO+qUXm2BUgZmzJx25hqEciKe/Vffs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsVC9HaOoSCp2d377phJ3JWJ35iUfgQh10bzVUGMjv6iM9PeFWFx7SiUbpaO/7SeZxazOPO2McCqv6W+JNT34n6/NCbqHIVbnNq8cAy59CifS25mymA1AI8QSGV3VjDs5RfwloKf+mdK3BiXq9N14u5EvV4wPZa4S9/nx7XvDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROVGCJMc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROVGCJMc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d72875729so841647f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776084560; x=1776689360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zILI3bSq+qhFMWUMzmmHd5z5cGi7XjJl7b2Gmvd6Z/4=;
        b=ROVGCJMcqqzajsQBcnW50RKB87WorbNTkqQzl6mqk53sVqF8MQUiL89QiRV4IvYCJM
         ae+IwO09fzaUn4S2B3V/bfHFYTFtXIN84cBe6QTCXIxDOytR/yv7nc0tlOfUDvFQzHqe
         y6cwocoSkmw6YenkAdQPKIVLM2Nud+FZUPtxJD6JrKdwzhb8eBCu/VWj2wBlbq6fYy1X
         1l/D9wYmVyLK1Y0pFAcRderTOgwjOkr0e6BZQPwaPvHZSo0Na+BosMyZPiL1Gb9h5BRw
         HDLguF8QZM9p91zc5mt/KQfDA8LHfkYLnWb1IwplXY7W9JS0eADMFz0s/b7mav3+ik+l
         Le8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776084560; x=1776689360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zILI3bSq+qhFMWUMzmmHd5z5cGi7XjJl7b2Gmvd6Z/4=;
        b=S/3NeAZ6vG4dyCWIljIcHNEIQUwJJPm6XiiDfk2Rwr+9gr0yLPPysIo+aE1xIZ2wwW
         kOShy28gWcuxWO9kOMZYwZglXbP/SGpootelFii9LbIuH7SMRYCw+Q9QiDt+bzHXRv7g
         rk9XEkHApm4tWIGHoktu6gYSlDbXLrilrj8oTJYhgsNM5dPAefDLFDCmrpgJRLKbyNGy
         DGdz2BvOIAajmpTx7cDLIRHrQUMo0ddAQY6+IP0jb3n/rU2pIS6X5q5aaWoqRrd2kQaJ
         hG7FBSUe9hp9gKKYC73XLe7PcC8EyG5bUpnI+J0QOYSoSb7AhThuhRVlCyYqGQdysKwH
         l0bg==
X-Forwarded-Encrypted: i=1; AFNElJ8QlYs/qr91PohDNZYqjpOQOvtUOx7NI27VzBjDqT72edBQBmxm4a9NcLWm4CITrzPx7fxRoJc4ZXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaBGqFugj3p4/dOXtW+muhOmMK2JZDekjt3NT7uXcalGkIV1Xs
	5IF82eXmonHDetQht/06/lAk1YB7RAXSVtxcEcBkWeHW+oJibU6ftXax
X-Gm-Gg: AeBDiesdQaFeiw0zmgDAm0ZXojhmk0807T7rluDJTbbv3JeBCjNn3fwZg3QIO4408cx
	jtJhnhFF7nVTudQR2a8XyTkcVPIuGbLKvU3u1o3B12u2pnDzON191dN370JZNvXDrVzpz+dZRzY
	hJXjRzBt3yLmeVDDe39zEg+GM9LXiT3H6fKwDCjWAUELrPRdoeWoxkZOoRjI52mDHmAkM4RWWek
	Dtj/nIEuf2eF6yXufBsLPof02mh9CKSc+HoYDzqrv7xfPlpzzqFlrzFVrSnXWFIANgABwZvTitP
	BYsAVZtRrh9RWJs/UT9n1ls3amDBYItEq/X1nuh/m4iUhkYAuf32MCTQtDdrXaUSAjzGYqISj8j
	qLuvYp4Vbth4C7wxOuLK1sq+mUCjTl3fZhdK4l2zBMrsMydQ8n+ewLPMUbMyUMRl7P2Zd4Ki9zo
	LMFAcOYfSoWWeROvXw620K3ze8+QsHfab7VI8OFHpvkeOihfZ3bvMB3MIm0QHES8cVGMF5DJT63
	FYoCaWVQf5qIBh6s30Z98xkUAtFo5+K/GX1n/GKr2UfOBQ=
X-Received: by 2002:a05:6000:2486:b0:43d:7518:b0fc with SMTP id ffacd0b85a97d-43d7518b2a1mr7508526f8f.43.1776084559589;
        Mon, 13 Apr 2026 05:49:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm34634318f8f.27.2026.04.13.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:49:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] clk: divider: Add some kunit test suites
Date: Mon, 13 Apr 2026 13:49:12 +0100
Message-ID: <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add KUnit tests to verify clk_divider_bestdiv() returns the maximum
achievable rate when clk_round_rate() is called with ULONG_MAX, which
is the canonical way to probe the maximum rate a clock can produce.

The first test uses a fixed-rate parent driving a table-based divider
with no div=1 entry. The second test places a two-input mux between
the divider and its root clocks to verify correct parent selection and
that the divider loop does not make redundant calls to
clk_hw_round_rate() for each remaining table entry after the first
overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/Kconfig            |   7 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider_test.c | 151 +++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 drivers/clk/clk-divider_test.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index cc8743b11bb1..c8f9eaef6f6b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -573,4 +573,11 @@ config CLK_FD_KUNIT_TEST
 	help
 	  Kunit test for the clk-fractional-divider type.
 
+config CLK_DIVIDER_KUNIT_TEST
+	tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Kunit test for the clk-divider type.
+
 endif
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index a3e2862ebd7e..0c915c6cf3fa 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -20,6 +20,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
+obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) += clk-divider_test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
new file mode 100644
index 000000000000..3a5e3adccb2e
--- /dev/null
+++ b/drivers/clk/clk-divider_test.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for clk_divider_bestdiv()
+ */
+#include <kunit/test.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/limits.h>
+#include <linux/units.h>
+
+#define PARENT_RATE_1GHZ	GIGA
+#define PARENT_RATE_2GHZ	(2 * GIGA)
+#define PARENT_RATE_4GHZ	(4 * GIGA)
+
+static u32 fake_reg_a, fake_reg_b;
+
+static const struct clk_div_table no_div1_table[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{0, 0},
+};
+
+static void unregister_fixed_rate(void *hw)
+{
+	clk_hw_unregister_fixed_rate(hw);
+}
+
+static void unregister_divider(void *hw)
+{
+	clk_hw_unregister_divider(hw);
+}
+
+static void unregister_mux(void *hw)
+{
+	clk_hw_unregister_mux(hw);
+}
+
+/*
+ * Test that clk_round_rate(clk, ULONG_MAX) returns the maximum achievable
+ * rate for a divider clock.
+ */
+static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
+{
+	struct clk_hw *parent_hw, *div_hw;
+	unsigned long rate;
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
+					       NULL, 0, PARENT_RATE_1GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	kunit_add_action(test, unregister_fixed_rate, parent_hw);
+
+	fake_reg_a = 0;
+	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-div",
+					       "bestdiv-parent",
+					       CLK_SET_RATE_PARENT,
+					       (void __iomem *)&fake_reg_a,
+					       0, 2, 0, no_div1_table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	kunit_add_action(test, unregister_divider, div_hw);
+
+	/*
+	 * ULONG_MAX is the canonical way to probe the maximum rate a clock
+	 * can produce. With a parent at 1 GHz and the smallest table divider
+	 * being 2, the expected maximum is 500 MHz.
+	 *
+	 * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
+	 * minimum rate, because the search loop was bypassed entirely.
+	 */
+	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
+}
+
+/*
+ * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximum rate when
+ * a mux clock sits between a divider and its parent candidates.
+ *
+ * Topology:
+ *
+ *   [fixed 4 GHz] --\
+ *                    +--> [mux CLK_SET_RATE_PARENT] --> [div {2,4,8} CLK_SET_RATE_PARENT]
+ *   [fixed 2 GHz] --/
+ *
+ */
+static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *test)
+{
+	static const char *const mux_parents[] = {
+		"bestdiv-mux-parent-a",
+		"bestdiv-mux-parent-b",
+	};
+	struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
+	unsigned long rate;
+
+	/* Higher-rate parent: the mux should select this for ULONG_MAX. */
+	parent_a_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-a",
+						 NULL, 0, PARENT_RATE_4GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
+	kunit_add_action(test, unregister_fixed_rate, parent_a_hw);
+
+	/* Lower-rate parent: should not be selected. */
+	parent_b_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-b",
+						 NULL, 0, PARENT_RATE_2GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
+	kunit_add_action(test, unregister_fixed_rate, parent_b_hw);
+
+	/*
+	 * 1-bit mux register selects between the two parents.
+	 * CLK_SET_RATE_PARENT allows the divider's rate request to
+	 * propagate into clk_mux_determine_rate().
+	 */
+	fake_reg_a = 0;
+	mux_hw = clk_hw_register_mux(NULL, "bestdiv-mux",
+				     mux_parents, ARRAY_SIZE(mux_parents),
+				     CLK_SET_RATE_PARENT,
+				     (void __iomem *)&fake_reg_a,
+				     0, 1, 0, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
+	kunit_add_action(test, unregister_mux, mux_hw);
+
+	fake_reg_b = 0;
+	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
+					       "bestdiv-mux",
+					       CLK_SET_RATE_PARENT,
+					       (void __iomem *)&fake_reg_b,
+					       0, 2, 0, no_div1_table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	kunit_add_action(test, unregister_divider, div_hw);
+
+	/*
+	 * Expected maximum: mux selects the 4 GHz parent, divider applies
+	 * the smallest table entry (2): 4 GHz / 2 = 2 GHz.
+	 */
+	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
+}
+
+static struct kunit_case clk_divider_bestdiv_test_cases[] = {
+	KUNIT_CASE(clk_divider_bestdiv_ulong_max_returns_max_rate),
+	KUNIT_CASE(clk_divider_bestdiv_mux_ulong_max_returns_max_rate),
+	{}
+};
+
+static struct kunit_suite clk_divider_bestdiv_test_suite = {
+	.name = "clk_divider_bestdiv",
+	.test_cases = clk_divider_bestdiv_test_cases,
+};
+
+kunit_test_suite(clk_divider_bestdiv_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for clk_divider_bestdiv()");
+MODULE_LICENSE("GPL");
-- 
2.53.0

