Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8459315D30
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772008463; cv=none; b=sqESNhT7Et6G2Qnxmu4YfZ4Q8FOrkRX8Lwp6ylKYq1uMe3NN3pV5aX/li6z6Vwo9ovZiXiSlD+HVnlWL2y+E1/wOuWPc/aCedZKQjQc3MDNfAGiRrMopJxqpQxIKWSPI3X/UTscUs0s9TRic6uBJ8d4Z6h9MBqA2cHd40PXS6DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772008463; c=relaxed/simple;
	bh=7JBUVayV0NMEgX+T7EfTYsRapx9T76tsJA1pEbEiqQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+z1jD24gBIjQXU0L0Sf64cx1iz5zAkOb0k3dYEWLCWDs9ZzYmo7PaBPxyHvZD2JuSv1muD29DqhCOBfxFUUWabC3WIa2dq+1rBe9uNomHrhHoaqT2uQ62+iO9yTYQgI2r/+wkkrI/V15iMx/+zU0eel2yhaGmQeD9BzbDU+XJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iq3d6HXX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iq3d6HXX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2adbd435864so4052925ad.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 00:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772008461; x=1772613261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8J/M8eLYeataFyRICzbOXaxoWzHoBXZ4dCqNWIECRg=;
        b=Iq3d6HXXB3Y/bVYBc401K7hB3QdGZeB+EiZ0Um3cBTs7KlxPMVGeGUGyj+LiDFpxRS
         gr6c1ykVGnfSawjc78UwXsrMxBi6F/BLUMeUrZ6Tht/CS2HCWzTJmGy9QoxcZJYclCUa
         gW9v1qEdonTDjWMvgxoydl5nk9eFzYR/bfdDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772008461; x=1772613261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8J/M8eLYeataFyRICzbOXaxoWzHoBXZ4dCqNWIECRg=;
        b=NBaD17uhP8i6CCLzB62iRP/zsbNmK2wahBSUzx33jqs0Gn0De3eJA1TyxPjErcgFKL
         y/XqYIevz7JMemmvdWIDhsTcgkvwGPhb4ZGh5HgruA93Sdi85MOec302qhzQsoeOpSMr
         zx40IJIpNNVDuq1cdRZRKyWfj77zAjjITxW6Dz5G674K7tVUfDeeAsIqm0JPTn0x/BfU
         lkeuY2mVw5kVmtjBK7GefUxTuewZXtJLVPkY3NceOuScwHT3uXGs7W7E62N/UVXJSpkc
         /8r1sM6dp6KewQ8bnPRuTYlvj1eoNPs41V2GtSN7Z8BnWFHt4xmPDA3mVNtzxeRPdDrU
         0E3g==
X-Forwarded-Encrypted: i=1; AJvYcCWRM7RCIfCUGUhGDIx6azxJsLvQqy3fJkEnRpFrutLvIKAN3hMX+HZjgM1SXnknc7HHiS374WgTX3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhfW2zyUvq41M4Glme9CqhSFOIzFAedKcwiYW4Vzr+RiVr5kW7
	ooDOKy1bjy5B5j9DM7NPCtHr63JGddFSFwXCI2KqqqiDzMZe6kiwO6lRR5xFQph6gQ==
X-Gm-Gg: ATEYQzyrXcggUVO+o9/uefxcFAFSPugChMii8CrAyW7wa7X1RCVzpze0wxO7sPeBKh9
	NKp0gZz70gz4HvyP4+m4nnFx5rBS6EAY0rYpq6WpbH2xfPt6Qs0H7kUn3RQrKbtMi7Zk3spJ73q
	OMowTsk1uXiAnfhT6PsVRP0HJc4KIK2oSFNQCr2muBI4quGXhrpZLAtENNlo3s5h6YGgda8W/JW
	x+miGes2u6FEIQywP6yLC2MR6g1TKQgXRkSjZGT4N8VOaxuvHAJH+GT1AiBB8eEonFgWyl0mvaz
	CQc5MI8KB3Dj8H64t0F7vhLspIdQ/RyBqUf+QRiDGbJRAchbZQLTk659ooFxlIcIn2aaRXVW6QK
	Fw+F0hfqEikyMJpv3Jk3Z9vH9kpDOibTeC8+vUtVsFEH1lDLCoRVCSRFH5BejHo+apAtR1n/gkB
	3w7fSn0NcCCaLIaKgwpZ2xy+cFy0CSbP8ccD+ckl2uumAhaneByADTrotbXbkpEzRRXoPibHcp1
	wxNOA==
X-Received: by 2002:a17:903:2c05:b0:2a7:afca:fd1d with SMTP id d9443c01a7336-2ad74444db8mr120777315ad.14.1772008461310;
        Wed, 25 Feb 2026 00:34:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adae6c6674sm55011655ad.73.2026.02.25.00.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 00:34:20 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH RESEND v2] clk: tests: Add tests for clk lookup by name
Date: Wed, 25 Feb 2026 16:34:11 +0800
Message-ID: <20260225083413.3384950-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clk lookup (by name) recently gained some performance improvements at
the expense of more complexity within the lookup code.

To make sure that this works as intended and doesn't break, add some
basic tests for this part of the CCF.

A new "clk_hw_lookup()" function is added purely for running kunit
tests.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v1:
- Added missing prepare lock/unlock
- Switched to EXPORT_SYMBOL_IF_KUNIT and VISIBLE_IF_KUNIT kunit
  visibility macros for consistency (Brian)
  This probably doesn't make much difference except that the symbol is
  now in the EXPORT_SYMBOL_IF_KUNIT namespace
---
 drivers/clk/clk.c      | 18 ++++++++++++
 drivers/clk/clk.h      |  4 +++
 drivers/clk/clk_test.c | 67 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df3..ca15a61c8f6b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -10,6 +10,7 @@
 #include <linux/clkdev.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/compiler_attributes.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hashtable.h>
@@ -25,6 +26,8 @@
 #include <linux/string.h>
 #include <linux/stringhash.h>
 
+#include <kunit/visibility.h>
+
 #include "clk.h"
 
 static DEFINE_SPINLOCK(enable_lock);
@@ -778,6 +781,21 @@ struct clk *__clk_lookup(const char *name)
 	return !core ? NULL : core->hw->clk;
 }
 
+/* This is only provided for kunit tests to test the core lookup functions. */
+#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
+VISIBLE_IF_KUNIT struct clk_hw * __maybe_unused __must_check clk_hw_lookup(const char *name)
+{
+	struct clk_core *core;
+
+	clk_prepare_lock();
+	core = clk_core_lookup(name);
+	clk_prepare_unlock();
+
+	return !core ? NULL : core->hw;
+}
+EXPORT_SYMBOL_IF_KUNIT(clk_hw_lookup);
+#endif
+
 static void clk_core_get_boundaries(struct clk_core *core,
 				    unsigned long *min_rate,
 				    unsigned long *max_rate)
diff --git a/drivers/clk/clk.h b/drivers/clk/clk.h
index 2d801900cad5..a8ed54f5b572 100644
--- a/drivers/clk/clk.h
+++ b/drivers/clk/clk.h
@@ -8,6 +8,10 @@ struct clk_hw;
 struct device;
 struct of_phandle_args;
 
+#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
+struct clk_hw *clk_hw_lookup(const char *name);
+#endif
+
 #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
 struct clk_hw *of_clk_get_hw(struct device_node *np,
 				    int index, const char *con_id);
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb..a8989566946b 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -175,6 +175,8 @@ static const struct clk_ops clk_multiple_parents_no_reparent_mux_ops = {
 	.set_parent = clk_multiple_parents_mux_set_parent,
 };
 
+#define DUMMY_CLK_NAME	"test_dummy_rate"
+
 static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
 {
 	struct clk_dummy_context *ctx;
@@ -187,7 +189,7 @@ static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
 	ctx->rate = DUMMY_CLOCK_INIT_RATE;
 	test->priv = ctx;
 
-	init.name = "test_dummy_rate";
+	init.name = DUMMY_CLK_NAME;
 	init.ops = ops;
 	ctx->hw.init = &init;
 
@@ -3541,6 +3543,67 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
 	.test_cases = clk_hw_get_dev_of_node_test_cases,
 };
 
+/*
+ * Test that clk lookup with a name that is not registered returns NULL.
+ */
+static void clk_lookup_not_registered_clk_returns_NULL(struct kunit *test)
+{
+	KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup(DUMMY_CLK_NAME));
+}
+
+/*
+ * Test that clk lookup with a name that is registered returns the clk.
+ */
+static void clk_lookup_registered_clk_returns_clk(struct kunit *test)
+{
+	struct clk_hw *hw;
+	struct clk_init_data init = {
+		.name = DUMMY_CLK_NAME,
+		.ops = &empty_clk_ops,
+	};
+
+	hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
+
+	hw->init = &init;
+	KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, NULL, hw));
+
+	KUNIT_EXPECT_PTR_EQ(test, hw, clk_hw_lookup(DUMMY_CLK_NAME));
+}
+
+/*
+ * Test that clk lookup with a name that was unregistered returns NULL.
+ */
+static void clk_lookup_unregistered_clk_returns_NULL(struct kunit *test)
+{
+	struct clk_hw *hw;
+	struct clk_init_data init = {
+		.name = DUMMY_CLK_NAME,
+		.ops = &empty_clk_ops,
+	};
+
+	hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
+
+	hw->init = &init;
+	KUNIT_ASSERT_FALSE(test, clk_hw_register(NULL, hw));
+
+	clk_hw_unregister(hw);
+
+	KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup(DUMMY_CLK_NAME));
+}
+
+static struct kunit_case clk_lookup_test_cases[] = {
+	KUNIT_CASE(clk_lookup_not_registered_clk_returns_NULL),
+	KUNIT_CASE(clk_lookup_registered_clk_returns_clk),
+	KUNIT_CASE(clk_lookup_unregistered_clk_returns_NULL),
+	{}
+};
+
+static struct kunit_suite clk_lookup_test_suite = {
+	.name = "clk-lookup",
+	.test_cases = clk_lookup_test_cases,
+};
 
 kunit_test_suites(
 	&clk_assigned_rates_suite,
@@ -3560,6 +3623,8 @@ kunit_test_suites(
 	&clk_register_clk_parent_data_device_suite,
 	&clk_single_parent_mux_test_suite,
 	&clk_uncached_test_suite,
+	&clk_lookup_test_suite,
 );
 MODULE_DESCRIPTION("Kunit tests for clk framework");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_LICENSE("GPL v2");
-- 
2.53.0.414.gf7e9f6c205-goog

