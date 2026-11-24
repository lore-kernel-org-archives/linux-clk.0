Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562304;
	b=b8bAyKyRus/9dMJDwvU0VAZ/xYwZJlPzFWIaZ2R5As6Pv4Ea55yH/aPjKE7mW3F8/Xs1
	 QgPyI/RPlCGk78C9HyMfTvJjKKNGwS6PfaEFAoJ0/bhRSw5x9gGZfNLFJDrvM/TQG0iIh
	 IPz35R+htrqGEqZLFe8DkzwPfnkKr9PYKLID446enM7Esn26KxUVfGr3Dsf9cDyNGW2Lc
	 8CnP4j06y+GF1iF4PdhFPHxKo0AfxuSY8lZ3lqmZRInpkV6U44X9oJgF2kpvqOdMf+ASf
	 g8yBqDqGvAqqTGC0/5baqDGBv84Q258pA2L6PECTJ43rU9V3ykl4pHA0v93ATmChCdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zws3+0qJXedwr5K37EOTqn6aaQV/PF1R0UsJI3VdM8c=;
	b=HNGRiinFYgGagy2ZRhhox4oIcghMOhYOR26iQbpGye2HfRjHJBs66LlCF8sQuov0c8Dn
	 ze7idJ2MAPEsDNK16VtdOB2w6QuQfULnlZakEb6uKz8IPyDQfhhdB+jXIhRNkFjk63JPo
	 OQGWywYzr6h415TN42Dk4VZcBUi2RPtKFouEUzUFEk5Kso0DIumMnk90YoQPqmVUoeHgd
	 rah7CbXn5n9bpLRM2zZFXQOudyMFal9EIjqm1EbACx1FCEa46QV2FxFrFC4BYseybq5nf
	 FGj0mQAyhrZlamx3+2x7M2Pw1OEgacw9fZd3JvQuTMVcD6Th05/SVEh/JnowLTwVj/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPH2U2MO;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B597D606A333
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 23:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B597D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPH2U2MO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so44415675e9.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 15:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562302; x=1796167102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zws3+0qJXedwr5K37EOTqn6aaQV/PF1R0UsJI3VdM8c=;
        b=uPH2U2MOzie2i8+oOLQwwx5UpnhlYYzbYUKfKCdTzZRB+9HAWp3Fn7HaUU1HWac1Qe
         iEMRL0VKzBa8SqyGYbJVAN9MqXOVqLHElK0ks9ISF2afFJI1c40CpJJ7m7YOehX6GEhN
         yN4+YxkqscUe8rg8PdJqFmYGcm7DyjxFMc3xX6/SsYJ3Nu9FtkfJ1reisIppWRLnugjR
         IKaQMioW/SExMoZ7AVl+o3J0Qn/61/AVrqDD8X9EZ1yhHI3Wp3zEJd2CDatiKeEBeAMj
         jk2b+jiLckqDLgWL/U0rSY7fBHRMAda8HRV7enkoHOnjVoRcbdGhsGSC4NyxNrN5790+
         GDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562302; x=1796167102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zws3+0qJXedwr5K37EOTqn6aaQV/PF1R0UsJI3VdM8c=;
        b=SxixOVFCYS/hshoKSXxMWnItkWfIeHUgSEyb/MctPJ48VMlSWIVyC4UlwVWrQgkpRf
         N3pBaRdJ0qca6plJv6Yc+swbAADg2fVzX0PC9yTyABkW6uzFF6txE1cfoPI1cF20mHZK
         S05K4zCLTmjGYbHU4a8jnpEJr0s2VMRoLhrEhDy/koXk+zSUNH9N5rHpXBMcPVGoWIq2
         FntD0MjQKOmysjnuFuaDgthQO98yNzs5WaSPW5q9Af/9LovT8CbptfwMN0MgKOlFPIb0
         tXAq+nysPW63SZKDNcSdVv+CZO6ub4YiHP3JkOoCErWHG4PyKnUWL+UEfUBlebQA2FDq
         e1kQ==
X-Forwarded-Encrypted: i=1; AL+hErGgmyN2g5MugjVs4Swu1DeeMPlO/sSd1A1bTDaDwed+i28OTyTgqSvbJAqleJlfRxMX1wWtL0lOJw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xjLFKqi6LZdzJkjCOCbLGU+/2dh/fxw+shHxx0IcvllZcLtfy
	Au3rzZbEWi6EZZan86AI7+BioZJ1bRXwyT6u63CbgFChfsOi4rvp7TXf
X-Gm-Gg: AZFdTZeRNUe47V1NaohZGJUI/wnpIg3YWDfID8syT2ntCsvnmwOkhULWQ8VxMz2CTHq
	FD5JXHytDGLfEAsLskLxuXjbWVovMzZENdOsI9dh2n+HhXP5uiXK/cch4F0KrxXGI0QqLkMySSt
	m7Fdg4x7g2a7t7/Rz37HuXJFckhMulbjlGDicJlkxt5xxYdsYeknszno7lecn/QDSXUrkyLvFPh
	TAU2UqDqnrYpTI38KL83PWhj9kDix2hi0DXaSekCuc8V9Fqm8Fjul7jS4bWLMEKFna8fnxD72t1
	+XcIlLtFqgJoAIGCdjJpBDCbYmkwvQ1hjEL00ojtzvZXqpkeba8Frkhf+Q2fdw1v0zskI3o2U/4
	kfE+FVnBqH2+GMscwNDPfxhyCdewOlfKwYNJ1ekb4a9E4t28j75WRNgc7X1LQ4HxFB84pWMo07f
	l9tS7OSJ7k1OUsm2hVAFCIff0Pgjw3JoUiy0jAfnozBNMYjAWt2fb27QrmmBLX/DI4Ef3C26C7i
	jtjsZwXYoyJgrS6yWhwH51hm3KtpOzZkrAEE8JYLM3sOZrS7bsPM5oklfuW/rwEUZ3pNkyKPa2Q
	qhwGZiFMaG81RIia0lYJip+gJhh6uVMqAp3pHeMcfC74qHgZlJ6nlVoSQzkBwIZagFuwmEjo1Q=
	=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr337493705e9.12.1795562301983;
        Tue, 24 Nov 2026 15:18:21 -0800 (PST)
Received: from localhost-live.home.vlan10 (053d9243.dynamic.tele-ag.de. [5.61.146.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm554400825e9.11.2026.11.24.15.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:18:21 -0800 (PST)
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
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH v3 2/3] clk: tests: add tests for registering a clk_hw again
Date: Tue, 24 Nov 2026 23:17:50 +0000
Message-ID: <20261124231751.83938-3-joshuacov@gmail.com>
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

Add tests that a statically allocated clk_hw can be registered again
after it has been unregistered and after its registration has failed,
that a parent referenced through clk_parent_data.hw is treated as an
orphan after it has been unregistered, then reparented once it is
registered again, and that init data on the stack of the registering
function is not handed back on unregistration.

Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
 drivers/clk/clk_test.c | 191 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 0505ed357b..0b6fa518cf 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -7,6 +7,7 @@
 #include <linux/clk/clk-conf.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/sched/task_stack.h>
 #include <linux/units.h>
 
 /* Needed for clk_hw_get_clk() */
@@ -3876,6 +3877,195 @@ static struct kunit_suite clk_parse_clkspec_test_suite = {
 	.test_cases = clk_parse_clkspec_test_cases,
 };
 
+/*
+ * Allocate init data that outlives the registering function, as the init data
+ * of a statically allocated clk_hw does.
+ */
+static struct clk_init_data *
+clk_register_again_init(struct kunit *test, const char *name,
+			const struct clk_ops *ops, struct clk_hw *parent)
+{
+	struct clk_init_data *init;
+	const struct clk_hw **parents;
+
+	init = kunit_kzalloc(test, sizeof(*init), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, init);
+	init->name = name;
+	init->ops = ops;
+
+	if (parent) {
+		parents = kunit_kzalloc(test, sizeof(*parents), GFP_KERNEL);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parents);
+		parents[0] = parent;
+		init->parent_hws = parents;
+		init->num_parents = 1;
+	}
+
+	return init;
+}
+
+/*
+ * Test that a statically allocated clk_hw can be registered again after it
+ * has been unregistered, and that unregistering returns it to the state it
+ * had before the first registration.
+ */
+static void clk_register_again_after_unregister(struct kunit *test)
+{
+	struct clk_dummy_context *ctx;
+	struct clk_init_data *init;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+	init = clk_register_again_init(test, "reregister-clk",
+				       &clk_dummy_rate_ops, NULL);
+	ctx->rate = DUMMY_CLOCK_INIT_RATE;
+	ctx->hw.init = init;
+
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, &ctx->hw), 0);
+	KUNIT_EXPECT_NULL(test, ctx->hw.init);
+
+	clk_hw_unregister(&ctx->hw);
+	KUNIT_EXPECT_PTR_EQ(test, ctx->hw.init, init);
+	KUNIT_EXPECT_NULL(test, ctx->hw.core);
+	KUNIT_EXPECT_NULL(test, ctx->hw.clk);
+
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, &ctx->hw), 0);
+	KUNIT_EXPECT_STREQ(test, clk_hw_get_name(&ctx->hw), "reregister-clk");
+	KUNIT_EXPECT_EQ(test, clk_hw_get_rate(&ctx->hw), DUMMY_CLOCK_INIT_RATE);
+
+	clk_hw_unregister(&ctx->hw);
+}
+
+/*
+ * Test that a failed registration leaves the init data in the clk_hw, so
+ * that the clk_hw can be registered once the cause of the failure is gone.
+ */
+static void clk_register_again_after_failure(struct kunit *test)
+{
+	struct clk_dummy_context *ctx1, *ctx2;
+	struct clk_init_data *init;
+
+	ctx1 = kunit_kzalloc(test, sizeof(*ctx1), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx1);
+	ctx2 = kunit_kzalloc(test, sizeof(*ctx2), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx2);
+	init = clk_register_again_init(test, "reregister-dup",
+				       &clk_dummy_rate_ops, NULL);
+	ctx1->hw.init = init;
+	ctx2->hw.init = init;
+
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, &ctx1->hw), 0);
+
+	/* A second clock with the same name must fail to register. */
+	KUNIT_EXPECT_EQ(test, clk_hw_register(NULL, &ctx2->hw), -EEXIST);
+	KUNIT_EXPECT_PTR_EQ(test, ctx2->hw.init, init);
+	KUNIT_EXPECT_NULL(test, ctx2->hw.core);
+	KUNIT_EXPECT_NULL(test, ctx2->hw.clk);
+
+	clk_hw_unregister(&ctx1->hw);
+
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, &ctx2->hw), 0);
+	clk_hw_unregister(&ctx2->hw);
+}
+
+/*
+ * Test that a clk_parent_data.hw reference to a clk_hw that has been
+ * unregistered is treated as an orphan rather than resolved to the clk_core
+ * of the previous registration, and that the clock is reparented once the
+ * parent is registered again.
+ */
+static void clk_register_again_parent_hw_orphan(struct kunit *test)
+{
+	struct clk_init_data *parent_init, *child_init;
+	struct clk_dummy_context *parent;
+	struct clk_hw *child;
+
+	parent = kunit_kzalloc(test, sizeof(*parent), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+	child = kunit_kzalloc(test, sizeof(*child), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, child);
+
+	parent_init = clk_register_again_init(test, "reregister-parent",
+					      &clk_dummy_rate_ops, NULL);
+	child_init = clk_register_again_init(test, "reregister-child",
+					     &clk_dummy_single_parent_ops,
+					     &parent->hw);
+	parent->rate = DUMMY_CLOCK_INIT_RATE;
+	parent->hw.init = parent_init;
+	child->init = child_init;
+
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, &parent->hw), 0);
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, child), 0);
+	KUNIT_EXPECT_PTR_EQ(test, clk_hw_get_parent(child), &parent->hw);
+
+	clk_hw_unregister(child);
+	clk_hw_unregister(&parent->hw);
+
+	/*
+	 * Set the init data again so that this test only depends on the
+	 * parent reference, not on the init data being restored.
+	 */
+	parent->hw.init = parent_init;
+	child->init = child_init;
+
+	/* The child comes back first: its parent must be an orphan. */
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, child), 0);
+	KUNIT_EXPECT_NULL(test, clk_hw_get_parent(child));
+
+	/* Once the parent is back, the child must be reparented to it. */
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, &parent->hw), 0);
+	KUNIT_EXPECT_PTR_EQ(test, clk_hw_get_parent(child), &parent->hw);
+	KUNIT_EXPECT_EQ(test, clk_hw_get_rate(child), DUMMY_CLOCK_INIT_RATE);
+
+	clk_hw_unregister(child);
+	clk_hw_unregister(&parent->hw);
+}
+
+/*
+ * Test that init data on the stack of the registering function is not
+ * handed back when the clock is unregistered, as it would point to a stack
+ * frame that is gone by then.
+ */
+static void clk_register_again_stack_init(struct kunit *test)
+{
+	struct clk_init_data init = {
+		.name = "reregister-stack",
+		.ops = &clk_dummy_rate_ops,
+	};
+	struct clk_dummy_context *ctx;
+
+	if (!object_is_on_stack(&init))
+		kunit_skip(test, "init data is not on the stack");
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+	ctx->hw.init = &init;
+
+	KUNIT_ASSERT_EQ(test, clk_hw_register(NULL, &ctx->hw), 0);
+	clk_hw_unregister(&ctx->hw);
+
+	KUNIT_EXPECT_NULL(test, ctx->hw.init);
+	KUNIT_EXPECT_NULL(test, ctx->hw.core);
+	KUNIT_EXPECT_NULL(test, ctx->hw.clk);
+}
+
+static struct kunit_case clk_register_again_test_cases[] = {
+	KUNIT_CASE(clk_register_again_after_unregister),
+	KUNIT_CASE(clk_register_again_after_failure),
+	KUNIT_CASE(clk_register_again_parent_hw_orphan),
+	KUNIT_CASE(clk_register_again_stack_init),
+	{}
+};
+
+/*
+ * Test suite for registering a clk_hw again after it has been unregistered
+ * or after its registration has failed.
+ */
+static struct kunit_suite clk_register_again_test_suite = {
+	.name = "clk-register-again-test",
+	.test_cases = clk_register_again_test_cases,
+};
+
 kunit_test_suites(
 	&clk_assigned_rates_suite,
 	&clk_assigned_sscs_suite,
@@ -3892,6 +4082,7 @@ kunit_test_suites(
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
 	&clk_range_minimize_test_suite,
+	&clk_register_again_test_suite,
 	&clk_register_clk_parent_data_of_suite,
 	&clk_register_clk_parent_data_device_suite,
 	&clk_single_parent_mux_test_suite,
-- 
2.56.0

