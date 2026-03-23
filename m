Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8D3C7E01
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286743; cv=none; b=Otao8ItBSqhryoUe9YIDc777/IWDDBms6fC0UQbdosb21f+pIlu9Tk6VZMf/K629+z7mwb8IT0OjtcaRi0ZJb6oUW2RsSvsklZH7rVdeAGC9bsDfEvne4Ydv2EQVfgKw6ZpqVgLtTkRh/CkbJflJzzHLzwbuLF1d8azZoHgsF2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286743; c=relaxed/simple;
	bh=CgZwb7h0Lrx3Ro3dOuYbsmKBBaRIB98siIpf9VE69j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyCsGVOkMSyPfx9+bUlMeV8oINiAyTAvHe0NaD/Uc6xI48xcEWR9ImX07ThnbB1MnzVDKN8Nif/PGLvfvG9SxOT+YTmGtsGX4JUDLWeJQqsPWs5ie3oAs3qj1WcWFe1Kg2bS41aPbtd6JAS0eB5HAkGQQDt+quSjNso2E/xoQSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aRJpkZCY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8w3ZXUW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aRJpkZCY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8w3ZXUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pupRNbhM9qW5q4wP02mhMBzXmq28/3Y+QgXeGlFMiVM=;
	b=aRJpkZCYTLfe6VaXHBlX7M487p95R5G83BvpLEo5AUigGBgnewZvEUhKm8d/Uep1FLtESu
	JzqA/4fhf3HrD/gxE43VpT7E1NU+xp5ipPLCouSPalTCh6l9EbtIcEfTO23Txu+LtXY6Qo
	pA3sXrin7hyinO+PrRPl+GYTJzxd72w=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422--ORAed60MFmMhFME_6deGg-1; Mon, 23 Mar 2026 13:25:38 -0400
X-MC-Unique: -ORAed60MFmMhFME_6deGg-1
X-Mimecast-MFC-AGG-ID: -ORAed60MFmMhFME_6deGg_1774286738
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so21235641cf.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286738; x=1774891538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pupRNbhM9qW5q4wP02mhMBzXmq28/3Y+QgXeGlFMiVM=;
        b=g8w3ZXUW47EW7OwdhCenOo2tDbLNcuzz07Rsclo8sGY13W8WvEdYeOzyf6BVNkA3ki
         dMwrBesOzX92y2WOKthc8iBoo2W+M3Ixuiv/EqMfLNDAe9OGu7h9cO/SuraNmbEF6nBE
         vYO8kVtNCl74FpR+XnPH+OogAahOpnaBeGiBfCmZ2VLKcG8tra0CckW1XIzw8dMsJk4r
         7qkW8Zp5lM5Hyr3vipZQKplRbCA4bqb64rXmcB7kUfDS7m3krQKugfUKFJS9V/E0lxYS
         izKinkb8/0U05KgM7DQoQeUpW9qM7V710MWw8Y87+iBsQy//4dbFDVlsLS5PuIHklj4X
         KE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286738; x=1774891538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pupRNbhM9qW5q4wP02mhMBzXmq28/3Y+QgXeGlFMiVM=;
        b=rnuAnOVea2WzGJddpkPS+oIFg0r6vfKG1Rga1Qt9R0V8AWL+HGw362+xdAcqe845Nf
         3XTdAgUVCR+Z3L2RS6JQOqG2fZinYvYhgTF3Ml/ptcOcq4dGYTeAUseRSUUTiQMnTlk6
         86wY5+ShrISAZFy/ZYpPFwWmFWnhzZXFBD/0Q2y/QDYzqXoDHIlBtqO4sBkm8nAT3a8t
         4C8YTjC83pcn8S3+okoEgUhQmIaa1BPOks0FSViEKJKsGQzyQB4Zc9XtNbBDFXxG/xKv
         tJh+sxca8LVbQIvOCjLDXNGSmButhCP18Eclbj8JiykDFR3YXaHk15PFluKtEEotsB6m
         bmYw==
X-Gm-Message-State: AOJu0Yy571o3IANJyqy82+OHVXmAIJchawakV54bWC6uGgJbzGlGe/NL
	ugdQKl+yAt9l4xqzBtafUm8kreE6DlN3a/5J8324Dama22fBhLBXlpSx4CqgX8FVuK2zsDIXisx
	+7A+Wrq3MstE0WDxKBmScvguWEvo5cq1awwqz7bJsUWRkdqvY0ZJ6srl6QkSaoQ==
X-Gm-Gg: ATEYQzy6pE7mc6Bx4kfvIpmGWZ1OZ/MqbkS5X0JO5RGYws4Guw7KL5TG60nZVPW04aO
	FyiRMVZnOUt0FsYuv6aQkB/NVc5f8Z6di/elzkM2GaZMOlQwT1cUB1PKCLWDr3GzaKdAvRsoXnJ
	egyP6feSvoECJjukC1FJzmM4eClWcrV4vgcAP3O0rxJJR89/3Sud2um0xO5l0exg/vJc+lKl21C
	6TDnyTs16cKvnm/l+hKY8UqxCPcUn9v6h8uK4h0qD0zFvKn9fNkeT9Zp8IpWH/GtUYr2/nZbU9r
	oRt/5sNJj7oabCikaxexg6isjbsoPKrgQY0RXTO+NYFW2yVGuaL4tJpBzj2FTgXYTBz8LW8/mzY
	QN5WRNnnzuVGPyG2nmJQdSc3wdVlhKxOnaRj24fkW4AaLFv6MHyNLVDk5LsOX
X-Received: by 2002:a05:622a:5c9:b0:509:2455:2b53 with SMTP id d75a77b69052e-50b37545ee8mr209673421cf.49.1774286738277;
        Mon, 23 Mar 2026 10:25:38 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:509:2455:2b53 with SMTP id d75a77b69052e-50b37545ee8mr209672921cf.49.1774286737627;
        Mon, 23 Mar 2026 10:25:37 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:53 -0400
Subject: [PATCH v7 2/8] clk: divider: introduce divider kunit tests
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-2-8e7193dc9405@redhat.com>
References: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
In-Reply-To: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10994; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CgZwb7h0Lrx3Ro3dOuYbsmKBBaRIB98siIpf9VE69j8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlrdl1V2do+MlynX/s2RngMx7+USWYu/wVZoa1p/Xz
 GeXcFzYUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwER05jIyrH7LuG3SRmOn4DKX
 mMXL5CpOlRxO70u6vPk3/2Ph2b/4dzL8D0mMd+pwlP/9mCtylr+3Jk+2R4xo2sILC+3yhBarf3/
 MAQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce some kunit tests for the generic clk-divider.c implementation.
This test suite demonstrates the current behavior of how a clock can
unknowingly change the rate of it's siblings. Some boards are
unknowingly dependent on this behavior, and per discussions at the
2025 Linux Plumbers Conference in Tokyo, we can't break the existing
behavior. So let's add kunit tests with the current behavior so that we
can be made aware if that functionality changes in the future.

The tests in this commit use the following simplified clk tree with
the initial state:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
set, and the parent is capable of achieving any rate.

For consistency with clk-fixed-rate_test.c and
drivers/clk/clk-gate_test.c, the divider tests are setup as it's own
separate kernel module.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/.kunitconfig       |   1 +
 drivers/clk/Kconfig            |   7 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider_test.c | 226 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 235 insertions(+)

diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
index 8a0ea41934a2100e1bb1521ce3ad490baec76ec2..ea05b9a28c8000c647c76c4adf813da97c500ab6 100644
--- a/drivers/clk/.kunitconfig
+++ b/drivers/clk/.kunitconfig
@@ -4,6 +4,7 @@ CONFIG_OF=y
 CONFIG_OF_OVERLAY=y
 CONFIG_COMMON_CLK=y
 CONFIG_CLK_KUNIT_TEST=y
+CONFIG_CLK_DIVIDER_KUNIT_TEST=y
 CONFIG_CLK_FIXED_RATE_KUNIT_TEST=y
 CONFIG_CLK_GATE_KUNIT_TEST=y
 CONFIG_CLK_FD_KUNIT_TEST=y
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 8cc300b90b5fd9fb38ce94fcb1098810c3f52c36..ba4af56949e39249652fc414eb23b44aee1d37f5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -550,6 +550,13 @@ config CLK_KUNIT_TEST
 	help
 	  Kunit tests for the common clock framework.
 
+config CLK_DIVIDER_KUNIT_TEST
+	tristate "Basic divider clk type KUnit test" if !KUNIT_ALL_TESTS
+	depends on KUNIT && CLK_KUNIT_TEST
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit tests for the basic divider clk type.
+
 config CLK_FIXED_RATE_KUNIT_TEST
 	tristate "Basic fixed rate clk type KUnit test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f52cf3ac64fcce7e20f3fd91f837c5096375521a..f11d37cb09423b914d7653fa4c3fa17370430aa7 100644
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
index 0000000000000000000000000000000000000000..2a01b0201e9d919c36bb70eeb21c9f4ae113254e
--- /dev/null
+++ b/drivers/clk/clk-divider_test.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit tests for clk divider
+ */
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/units.h>
+
+#include <kunit/clk.h>
+#include <kunit/test.h>
+
+/* 4 ought to be enough for anybody */
+#define CLK_DUMMY_DIV_WIDTH 4
+#define CLK_DUMMY_DIV_FLAGS (CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST)
+
+struct clk_dummy_div {
+	struct clk_hw hw;
+	unsigned int div;
+};
+
+static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
+				   CLK_DUMMY_DIV_FLAGS, CLK_DUMMY_DIV_WIDTH);
+}
+
+static int clk_dummy_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	div->div = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+				   CLK_DUMMY_DIV_FLAGS);
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
+struct clk_rate_change_divider_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1, child2;
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+struct clk_rate_change_divider_test_param {
+	const char *desc;
+	const struct clk_ops *ops;
+	unsigned int extra_child_flags;
+};
+
+static const struct clk_rate_change_divider_test_param
+clk_rate_change_divider_test_regular_ops_params[] = {
+	{
+		.desc = "regular_ops",
+		.ops = &clk_dummy_div_ops,
+		.extra_child_flags = 0,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_regular_ops,
+		       clk_rate_change_divider_test_regular_ops_params, desc)
+
+static int clk_rate_change_divider_test_init(struct kunit *test)
+{
+	const struct clk_rate_change_divider_test_param *param = test->param_value;
+	struct clk_rate_change_divider_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.rate = 24 * HZ_PER_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ret;
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
+					     param->ops,
+					     CLK_SET_RATE_PARENT | param->extra_child_flags);
+	ctx->child1.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ret;
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     param->ops,
+					     CLK_SET_RATE_PARENT | param->extra_child_flags);
+	ctx->child2.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ret;
+
+	ctx->parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ret = clk_prepare_enable(ctx->parent_clk);
+	if (ret)
+		return ret;
+
+	ctx->child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	clk_prepare_enable(ctx->child1_clk);
+	if (ret)
+		return ret;
+
+	ctx->child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+	clk_prepare_enable(ctx->child2_clk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void clk_rate_change_divider_test_exit(struct kunit *test)
+{
+	struct clk_rate_change_divider_context *ctx = test->priv;
+
+	clk_put(ctx->parent_clk);
+	clk_put(ctx->child1_clk);
+	clk_put(ctx->child2_clk);
+}
+
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT set
+ * and one requests a rate compatible with the existing parent rate, the parent and
+ * sibling rates are not affected.
+ */
+static void clk_test_rate_change_divider_1(struct kunit *test)
+{
+	struct clk_rate_change_divider_context *ctx = test->priv;
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+
+	ret = clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 6 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 4);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is also affected. This preserves existing behavior in the clk
+ * core that some drivers may be unknowingly dependent on.
+ */
+static void clk_test_rate_change_divider_2_v1(struct kunit *test)
+{
+	struct clk_rate_change_divider_context *ctx = test->priv;
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * The last sibling rate change is the one that was successful, and
+	 * wins. The parent, and two children are all changed to 32 MHz. This
+	 * keeps the long-standing behavior of the clk core that some drivers
+	 * may be unknowingly dependent on.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
+static struct kunit_case clk_rate_change_divider_cases[] = {
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_1,
+			 clk_rate_change_divider_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_2_v1,
+			 clk_rate_change_divider_test_regular_ops_gen_params),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two divider-only children, and
+ * documents the behavior of what happens to the sibling clock when one child
+ * changes its rate.
+ */
+static struct kunit_suite clk_rate_change_divider_test_suite = {
+	.name = "clk-rate-change-divider",
+	.init = clk_rate_change_divider_test_init,
+	.exit = clk_rate_change_divider_test_exit,
+	.test_cases = clk_rate_change_divider_cases,
+};
+
+kunit_test_suites(
+	&clk_rate_change_divider_test_suite,
+);
+
+MODULE_DESCRIPTION("Kunit tests for clk divider");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+MODULE_LICENSE("GPL");

-- 
2.53.0

