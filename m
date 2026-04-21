Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAD03659FF
	for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795947; cv=none; b=RIZh5WxF40gX1oX5XKDL80Y+cFNDiWLBB9O7JgxzXsC85PVgfV0+WeibNmrLkY8gZe3m71u+SUJViv/T56vR0QR+QDZlTRjAaqppVgOydpNsFmx1N41JJRJjRKyzSzCPg76uT+pHXvJsFQ7ITl65/Pwq+G/EdLKIw61DxN6KkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795947; c=relaxed/simple;
	bh=Re5gJZwAmHy8llKKOsNMx2M/78ANUl9lB5LH0gmbCWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=he2WY3FpRrgSjbLji46mONYrlwftM2rEA41YtyIutjQK+fGONsfuQpJxbOaU0WdDXnTUCyFYF4TmbFzirNrXqkZrooFPaJJPQAjkdaznWWzruATQG6OftT9sKI2KIu2tXXwfBy49OlPysEdex0dRq7jw3Cj8DPs+9l3wLU/mGfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhNLA2qt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhNLA2qt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so59351035e9.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776795934; x=1777400734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4zFajylv2hEREauigciCo0bW3w7NfjVPW0rAl01j5Q=;
        b=mhNLA2qtaUpGF7vhK6RA7P2Xl9yEO5u5Q2juTZ9VXG9ldRXnNAE/zlx0rtyFzbTlc4
         EJsn5WmUVp0GnVJjMV7l09ABRV3vUluAAuTGP4ik9l5V5QTNz2VCdctcFqQCBB3f/YS8
         kx6D7tts5cMbcVJqryxIBdl7hizCl7/dK61OlMV5gibBmNoXty5k8Zo3AOhiOl8xxxTF
         xBMXEnwyVdAwG10pW0QKvfMwgq50y1rvDCqQfHcaeMMTiG81WtUXW6+L5ZrOC77vXL6N
         x9B2aM9aEAuiLeXfDPwsOgIcK+B+SsMOqrYzFWkmSfs7Vo+jFhoveY3XyRVkMVF8ljKC
         lMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776795934; x=1777400734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I4zFajylv2hEREauigciCo0bW3w7NfjVPW0rAl01j5Q=;
        b=a4rIEyKyju0bKWudEDoVef2mm/o+BmSietTf/XqbyEQyhY+KSTWjNAJ4AQXDKNflQK
         q9N10n+Ps0VTQUJBr8lIEl1g3Uy+PeHqHKXm5WILYcCgCRJX+UCU9ogwVkvWRmMBEAzD
         dRISQRd82e7jZZZuuEkwQi5sFDCwVxvKrTXaqUNM9vSdkFo3HoLqvKCXjALXYKc/AIqp
         E2q32uWn7VWq7ZCE8NnNLIb0vQSTZzVDFZK1AZZ2O9q/xKa6gDTxYzXwtWPzL0Od6z+c
         CT02AHj4OKkjN+V5tQ25X38bE4wUMl+o5pWsdIUk9hl8h20pTl0EhjWI36CRPAMbcoDr
         ggQg==
X-Forwarded-Encrypted: i=1; AFNElJ8NDJXD6RulDbHAaa7s3FtdJScFir0g+l2s+StRZrmAhF8ZMX9LrcAPPCxCNhjlALHZc5TIoJGRlxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYbNizqMT05fdsxvU2LV5SEsk3ruHMO5pJ6qbLAtXDEvDyJSrG
	dnyD7RC1AS52xjxSlIZv1KRixRMUxof8To1lK5SIFetuX+zILTyCFKGdPYDaZpo+
X-Gm-Gg: AeBDies3BlXn1Uq8AfJGPKUVqu9cg1CvyiI84o/NtTzN7uZfk2wp6ngrJQHuMgS+KfK
	qgXjg8GrJkB50ky07zmLvRW+heRf01FFtxOSSh0yCD/5q3Cb68uuqS6yMNG/KidoegVrjRIg3n4
	2omIhhuOc0Rhsg/aQS0IpWOR1HOtqzhldHA0r9t6fINVuetwO6BFcZL16H2XEqJ+vege56ue0hn
	Pke7n79b/CdvAjp4QVLsJWx9hxB27C04cqUjehZVBZrJz0ftB3+FbXDFF+LigWZp49tlHhsHNuU
	mZRPlUij2jcbbddN/nRGOCQNNCOzYUQJk6Lp9tjIMa21ioIVqcJMOwPlnrat0e/wLXoKZjw87Fm
	Rbu7cVYpd/1iMfMAWVI1EGBlSYtXWEP8sdXd46ykRqkNXfM8qOaqf3/739VVf4aWrfx8fT9ilEG
	AwnSuUZE6Nl4ure0x5sf615TDn6vbqFvJgGN2lhB9X8WsWQPZ8Q6YOZFLpvrAgoG4JexCdsoPU4
	XcFaUH+K05hRkdnej+/3a6713NPAXXYcl47Ra5dyxgZgz9g
X-Received: by 2002:a05:600d:8408:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-488fb73dc6fmr221016215e9.6.1776795933722;
        Tue, 21 Apr 2026 11:25:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d3da:32d9:3f08:c6f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891941e05bsm66621565e9.36.2026.04.21.11.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 11:25:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/2] clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX handling
Date: Tue, 21 Apr 2026 19:25:25 +0100
Message-ID: <20260421182529.3055114-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421182529.3055114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260421182529.3055114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add KUnit tests to verify the behaviour of clk_divider_bestdiv() when
clk_round_rate() is called with ULONG_MAX, which is the canonical way
to probe the maximum rate a clock can produce.

Two test cases are introduced:

- clk_divider_bestdiv_ulong_max_returns_max_rate: registers a 1 GHz
  fixed-rate parent driving a table-based divider whose smallest entry
  is div=2 (entries: 2, 4, 8). Calls clk_hw_round_rate(div_hw, ULONG_MAX)
  and checks the result.

- clk_divider_bestdiv_mux_ulong_max_returns_max_rate: places a two-input
  mux (4 GHz and 2 GHz fixed-rate parents, CLK_SET_RATE_PARENT) ahead of
  the same table-based divider to verify correct parent selection under
  ULONG_MAX.

Both tests use an explicit clk_div_table with a minimum divider of 2 so
that the pre-loop maxdiv clamping in clk_divider_bestdiv():

    maxdiv = min(ULONG_MAX / rate, maxdiv);

clamps maxdiv to 1, causing _next_div() to return 2 on the first
iteration and skip the loop body entirely. This makes bestdiv fall back
to the maximum divider, returning the minimum rate rather than the
maximum.

The expected values intentionally reflect the buggy output:
  - test 1: PARENT_RATE_1GHZ / 8  (minimum rate, not maximum)
  - test 2: 0                      (invalid, loop never populated bestdiv)

These will be corrected to PARENT_RATE_1GHZ / 2 and PARENT_RATE_4GHZ / 2
respectively once the fix to clk_divider_bestdiv() is applied.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Added false positive expected values
- Updated the commit message
- Added dependency on !S390 in Kconfig
---
 drivers/clk/Kconfig            |   8 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider_test.c | 158 +++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 drivers/clk/clk-divider_test.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b2efbe9f6acb..fdeb87ff8fd9 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -573,4 +573,12 @@ config CLK_FD_KUNIT_TEST
 	help
 	  Kunit test for the clk-fractional-divider type.
 
+config CLK_DIVIDER_KUNIT_TEST
+	tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on !S390
+	default KUNIT_ALL_TESTS
+	help
+	  Kunit test for the clk-divider type.
+
 endif
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index a3e2862ebd7e..dc653b458f56 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -21,6 +21,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
+obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) += clk-divider_test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
 obj-$(CONFIG_CLK_FIXED_RATE_KUNIT_TEST)	+= clk-fixed-rate-test.o
diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
new file mode 100644
index 000000000000..3087c77fb157
--- /dev/null
+++ b/drivers/clk/clk-divider_test.c
@@ -0,0 +1,158 @@
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
+static const struct clk_div_table bestdiv_table[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 4 },
+	{ .val = 2, .div = 8 },
+	{ /* sentinel */ }
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
+	u32 *fake_reg;
+	unsigned long rate;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
+					       NULL, 0, PARENT_RATE_1GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, unregister_fixed_rate,
+						  parent_hw));
+
+	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-div",
+					       "bestdiv-parent",
+					       CLK_SET_RATE_PARENT,
+					       (void __iomem __force *)fake_reg,
+					       0, 2, 0, bestdiv_table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, unregister_divider, div_hw));
+
+	/*
+	 * ULONG_MAX is the canonical way to probe the maximum rate a clock
+	 * can produce.
+	 */
+	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
+}
+
+/*
+ * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximum rate
+ * when a mux clock sits between a divider and its parent candidates.
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
+	static const char * const mux_parents[] = {
+		"bestdiv-mux-parent-a",
+		"bestdiv-mux-parent-b",
+	};
+	struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
+	u32 *fake_reg_mux, *fake_reg_div;
+	unsigned long rate;
+
+	fake_reg_mux = kunit_kzalloc(test, sizeof(*fake_reg_mux), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg_mux);
+
+	fake_reg_div = kunit_kzalloc(test, sizeof(*fake_reg_div), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg_div);
+
+	/* Higher-rate parent: the mux should select this for ULONG_MAX. */
+	parent_a_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-a",
+						 NULL, 0, PARENT_RATE_4GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, unregister_fixed_rate,
+						  parent_a_hw));
+
+	/* Lower-rate parent: should not be selected. */
+	parent_b_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-b",
+						 NULL, 0, PARENT_RATE_2GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, unregister_fixed_rate,
+						  parent_b_hw));
+
+	/*
+	 * 1-bit mux register selects between the two parents.
+	 * CLK_SET_RATE_PARENT allows the divider's rate request to
+	 * propagate into clk_mux_determine_rate().
+	 */
+	mux_hw = clk_hw_register_mux(NULL, "bestdiv-mux",
+				     mux_parents, ARRAY_SIZE(mux_parents),
+				     CLK_SET_RATE_PARENT,
+				     (void __iomem __force *)fake_reg_mux,
+				     0, 1, 0, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, unregister_mux, mux_hw));
+
+	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
+					       "bestdiv-mux",
+					       CLK_SET_RATE_PARENT,
+					       (void __iomem __force *)fake_reg_div,
+					       0, 2, 0, bestdiv_table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, unregister_divider, div_hw));
+
+	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, rate, 0);
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

