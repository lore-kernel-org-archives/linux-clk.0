Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0C2DC771
	for <linux-clk@vger.kernel.org>; Thu,  2 Oct 2025 09:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396847; cv=none; b=uH+jy1hrnmhnImDVYNZnvOWfeUAOpTX19Xjz9nDBU581HWy6CYnZWEaa+ssummTfS8VHG/7kut0/cxkJkS5a6i1ufIkCFDZrCOb3PAk2JmdgLbZAvFBm6AsaLoLNu2ATE9gToS3ffhf9pLCPvch8qvg92zNKMKuJHAM7zDYInsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396847; c=relaxed/simple;
	bh=kZw9F7Lh2RYicqW8c/0dnsDClsMKLP+FvXBKFUUeXFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQRDwk7+MknQijCC7P6xt29yhKEkM/YzgtwISfJQDW38KuiDNJre872M7MbldK92y50PyjWLJ1OlsseJB+gBFC/+J3Ri7la844dW0PXYn3etr6lQEJ+ITLv7lEYbJIVsJZP4Bo/Rjz4GQM3PHNxthjY+uKQERYPnG4SJqZKK8TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fsoX9i4q; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fsoX9i4q"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b55517e74e3so900633a12.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Oct 2025 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759396844; x=1760001644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQDxw8Hfh8Y8mQlGaDxHtor3fvvIJuG60cJHSTBd1Q4=;
        b=fsoX9i4qxJW1EmjWp1T6HIX9J6fIdXahAMFj8ullF/E8wTrvb9HWBvyDaFczErZT0d
         twW8QWPRIsgsUDGiqgseJOhfSLBVAItMuESHB1D/lkqqWyTthGSrOjzYNHHF9MUqza3L
         zGGwdLmpcmLVN/Wxj4COtYFkb4kd3eqC9AvWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396844; x=1760001644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQDxw8Hfh8Y8mQlGaDxHtor3fvvIJuG60cJHSTBd1Q4=;
        b=I1qwQXqwVpXcyxiIaudZ9K7mwtaWxsMIhwNy01WtOySFNqPzf22MwZZ7tp7abLF7u4
         VX+NCnjvxT84CJdFUu88nMvmtGZMrexn7M0NJe2RAzNU17JD3pNcsErOmQt2+vgRcsL/
         tOeHulBxsBKJ0TkCyEl7jvd/Dr1B9ccY/zVPlG8LjPJMO+klJEAa+u+4c1xa/mfJNv/F
         tE87QB+66Wry4Z+36nw271vFgRdX0avfeD8TkkzPhGrbKhsPELXWV0oTIwHJsbtu5RSI
         hD698TtyP8RzzOz9MEmVsqHDQK9TCxwgwHw7/7MmtfjP5pUv6neUy/QG9JQdHCnd5YsX
         8onQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL6JFL74OmnQUBRUBKX/aXJJAZsOHmMpTAG6bTJHDhgU7vzyPz95MO74ss0aisihpLhtpf2S8kF0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK+r53TNW92PlW0kibtKG1a6BpX/pLNQ7zlT/5rdQiWd1ws794
	myLwKack86ZnsjQ0rfSSNonypQJLR5o+pLh1f/drSPljyBItKK5PdmghtmsnUM/bMA==
X-Gm-Gg: ASbGncsi0F5dnBjMcvJse/Z5Hj/js4hy/ngeQ5gLbH0bV8ltqiz3YPD1mQGaaBb59yo
	KzYTmI6SsCYQdTuyviY9QaOmoOujU1AANsFXf/lkfvR3pvzuzuD3mRujLZ4yk07U4v/AZCQscYi
	CbKKaboIdwkHbFNHOGnN5g2wg4UovRQkt8gvJ9dsmyYlqXtGEZbCQqoY8qW6FnEqlKGoLvVNah4
	a3wAsbpqpui2Ti9ocXFecjNm++PDB+WUO7B1DeTA55csaV6mN6icZIBXDwO83qb+tUfSbOPxsM4
	O61cKqsgGqWulbWHdX8vQS15s0Kz77fIERLnvl6P6iExWPA1yA43FXe+i0EsJRRv0hVkEBEGk+L
	xuYebImXsYsN+wQZfYFk++L96KmhTf1JGa9v7/OGD6JD2Bad8Yx800RAyMkRHBozJVsPDCEpfAT
	m9HIaVt9As4/JtSTEnXS56bZ7DrJMkyy1Y3Kjigw==
X-Google-Smtp-Source: AGHT+IHMtN6ZJkMHIj5HdMYlnYyAczHcoKg+g+PecKKLereDk3zQkSokXvTzEx9YpyqnCmsVnxbEug==
X-Received: by 2002:a17:903:f84:b0:28e:9427:68f7 with SMTP id d9443c01a7336-28e94276a97mr5653845ad.6.1759396843616;
        Thu, 02 Oct 2025 02:20:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3299:ab9e:3686:a840])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1f2dbesm17531825ad.135.2025.10.02.02.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:20:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: tests: Add tests for clk lookup by name
Date: Thu,  2 Oct 2025 17:20:35 +0800
Message-ID: <20251002092036.2504858-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
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
 drivers/clk/clk.c      | 11 +++++++
 drivers/clk/clk.h      |  4 +++
 drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..a17d0070d11f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
 	return !core ? NULL : core->hw->clk;
 }
 
+#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
+/* This is only provided for kunit tests to test the core lookup functions. */
+struct clk_hw *clk_hw_lookup(const char *name)
+{
+	struct clk_core *core = clk_core_lookup(name);
+
+	return !core ? NULL : core->hw;
+}
+EXPORT_SYMBOL_GPL(clk_hw_lookup);
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
index a268d7b5d4cb..b3b5ce0ad897 100644
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
@@ -3560,6 +3623,7 @@ kunit_test_suites(
 	&clk_register_clk_parent_data_device_suite,
 	&clk_single_parent_mux_test_suite,
 	&clk_uncached_test_suite,
+	&clk_lookup_test_suite,
 );
 MODULE_DESCRIPTION("Kunit tests for clk framework");
 MODULE_LICENSE("GPL v2");
-- 
2.51.0.618.g983fd99d29-goog

