Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B82371CFC
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839392; cv=none; b=aIkscRhBzs2ynfAfxixrCycT+AOjA/IDIjtwoxd9wS24GGEf0OMJKyQZYmN7NK/0aycCR3/fO9yH9mlUwZpvzUOiF+0H4QKMV6Zt1EgZcxpECkvYN5QImyMi2e5CPDjQYvUBy8rtSd/uSIAiBqblrmbjgm2IZUMA4RYHuLdhUDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839392; c=relaxed/simple;
	bh=tN+bOgbqEUSD/fsXM/J/vYjHKbj8iy+6blJ/Y2IT5dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIY//b9ll2A4FurkHAj/P6ACeE/vkH7Mgzn+gNfRK94akPVno3lq6MeVCAEEQg2nylnMgNGF7/mFqCHZZ746kJCaP3j5hsZ2dknLuEAdTm5HNOoxpYOBpwIhQIT4MrO0S+kBxDXdE/30yS4Yv1uFSWmax/L08JGQgFnd7iwGB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cqWu9zzo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CIiRdfd8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cqWu9zzo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CIiRdfd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772839390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJPXcds69fedxlOSd+bpeGywbazK6qaqr8rOBwqfWwQ=;
	b=cqWu9zzoJl4ThyXMmJHp7KdJnsLgKM7ZiwRz8UW6z/LHMIgyJGeGa8ZQ4/iIbjtKm4l6M4
	DWSQwkXJUDCB/wXciP0LqhQIm90qXFWYEb1iS0dI7SBa0kdvoe76duwpQa+9RERgYekQU3
	dcOcR3b94kLbveZ7amC+J3Hf7239+5s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-SU20dTn0PhK9ZT18oevtFA-1; Fri, 06 Mar 2026 18:23:09 -0500
X-MC-Unique: SU20dTn0PhK9ZT18oevtFA-1
X-Mimecast-MFC-AGG-ID: SU20dTn0PhK9ZT18oevtFA_1772839389
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd767c51efso46987085a.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 15:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772839389; x=1773444189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJPXcds69fedxlOSd+bpeGywbazK6qaqr8rOBwqfWwQ=;
        b=CIiRdfd8Iiw6YHHxIRmmH2s8U9oDq/eJj3fOAGgtUHmQh6QvOK8d6cICqHfInqZqks
         8+pnpU2SeXFOCbzdG8/W97HzaXA5yxO5jndOsxjW3VFjeTJDatB8IfYp2ZK7B+4y+/p2
         UoF4RKNIBh6sTljEtRJZMeLtwRItuLLGCmlwQezyXqKEkagNSXGTMlCkoLdtNfnQxKz/
         0jisCaPaV5p3i+8TuaDgfqFTUKTfXFlT9Q5BWyE2nrk8r/cQOA04zUvCNY2CrEAl8Tyr
         DNbYhkLiPoDanQUMlaf5EjOnyok8hxnYentlHSGv0/RyYrdyyT2vP8m/VUZNN6nbDnKx
         JoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839389; x=1773444189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hJPXcds69fedxlOSd+bpeGywbazK6qaqr8rOBwqfWwQ=;
        b=Z2FCLQoq2U/RJ+j0ebVIZgNzp0ZoSOpS1ylmsL+rfZAKNOxdH9x6c9+LdrMlXxF5D4
         iys+UgYFgS7oQRWASH3HwWG4EogFYKE7uDoS6nnHvIOuwTU4XQXKZe3YymuVBLP7/gkf
         yuJfbvmJcLAUZamdm0ssNi7vCNE2vu9WMdJQFusqEDUcOBcCbem7dHEjMLqzPoZNe/hn
         bbs/ashmDbs9CJmtOqBlg80gq8amCBl3KE3Ccx0Rhvng5DIOXBrvqLoitTMGfb/euIZZ
         bYSE9PdI/t6TwYby45RM0rNx+IBvx8z8RCMUovNb0vqOItaavsgh5m1eZr6BfxONZAxA
         //Jw==
X-Gm-Message-State: AOJu0Yyau9vcxTIqRsTjHHziz987muDkSb/vPrIJlapZ36ALG1xRsUv4
	B0L8OOCShI/e74UhaTO26z28voBxfs2faPrW7nAi6+blk44Gcc+3qRp0agsyQL7TeOBNsGr27j0
	DOHCVjLA2/RazlZmIuuLC+Ub8k/iRd1NqgK/W15uhdO7LBr+A8VvYjvmz01YG3vyzRKeOxrt42K
	7yz14HmW9MyV2qYLCZGvyfIU9G9+Xb+H3iR90FPuCJvVCZ
X-Gm-Gg: ATEYQzw6DEIHOc4dOjBAEjtU6LmfwRI12+wDNkzIKFk7u3r1LaenkUfyD55Hmw4Tmjb
	v761LFo2ijBvKoE7PtiQ5H4J72qmzfXtxr4Zpze+EOwPBeut9tR+0/f2siH3mZju9dlLOnDz420
	XLu2J3+3f4+6WlBQ5e5sjDBpPgM8aL/s85ROV4azK9kc2+1BQVM0V9hJAyes9sVVZYCjDlqycSV
	o2PG3oX8c1PVjFKKFeUM6e2CncqUVeXiZyPRLibJPl0XbDGzDVEK0mlQ0AJ3oOcarca9ax3esm+
	LuKzWJm8Q94jYF1F8JQAattlqPLcjRdIJVobcP97XF87B8NFdCzmSA/e5DsNiNfmBlITDZFVtTM
	ckTj4ODw/6EniF/McxK6q5LdABGsG
X-Received: by 2002:a05:620a:2541:b0:8cd:7835:880f with SMTP id af79cd13be357-8cd7835892cmr36507585a.82.1772839388644;
        Fri, 06 Mar 2026 15:23:08 -0800 (PST)
X-Received: by 2002:a05:620a:2541:b0:8cd:7835:880f with SMTP id af79cd13be357-8cd7835892cmr36504085a.82.1772839388080;
        Fri, 06 Mar 2026 15:23:08 -0800 (PST)
Received: from [10.125.247.224] ([2600:382:772b:4f24:8140:d6ff:f19a:7e11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f4856cesm203119585a.10.2026.03.06.15.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:07 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Mar 2026 18:21:39 -0500
Subject: [PATCH RFC v5 4/4] clk: test: add kunit test for coordinated rate
 change
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-clk-scaling-v5-4-d21b84ee6f27@redhat.com>
References: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
In-Reply-To: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6335; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=tN+bOgbqEUSD/fsXM/J/vYjHKbj8iy+6blJ/Y2IT5dY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJXJ14QWF75ZNM0gdfn3S98N8/ZqHtcMmWlVv3v0MbKi
 NC7r+e+6ChlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiEy8wMtxdkrlqf9u0cv9n
 e5+/avPMYQvUFTk+VaGo9Jiu1IllKb0M/4z6ctIYFrYbKBycyusXb7BJa0nLp79PfKpjdSpvP7m
 QzwUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add kunit tests to demonstrate how to use the coordinated rate change
clk APIs, and to validate that they are working as expected.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 97cbf9dd16ee504d7687d8f0729b6e6e22a21afb..886190408545635926689046f6237260303b2271 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -5,6 +5,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/clk-conf.h>
+#include <linux/lcm.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
@@ -180,6 +181,46 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+static int clk_dummy_div_coordinating_determine_rate(struct clk_hw *hw,
+						     struct clk_rate_request *req)
+{
+	struct clk_hw *parent_hw = clk_hw_get_parent(hw);
+	struct clk_rate_change *child_node;
+	unsigned long lcm_rate = 0;
+	LIST_HEAD(stable_clks);
+	int ret;
+
+	ret = clk_hw_get_v2_stable_clks(req, parent_hw, &stable_clks);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(child_node, &stable_clks, node) {
+		if (child_node->target_rate == 0)
+			continue;
+		if (lcm_rate == 0)
+			lcm_rate = child_node->target_rate;
+		else
+			lcm_rate = lcm(lcm_rate, child_node->target_rate);
+	}
+
+	ret = clk_hw_add_coordinated_rate_changes(req, parent_hw,
+						  clk_hw_get_rate(parent_hw),
+						  lcm_rate, &stable_clks);
+	if (ret)
+		return ret;
+
+	req->best_parent_rate = lcm_rate;
+	req->best_parent_hw = parent_hw;
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_coordinating_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_coordinating_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;
@@ -671,6 +712,14 @@ clk_rate_change_sibling_div_div_test_regular_ops_params[] = {
 KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_ops,
 		       clk_rate_change_sibling_div_div_test_regular_ops_params, desc)
 
+static const struct clk_rate_change_sibling_div_div_test_param
+clk_rate_change_sibling_div_div_test_coord_ops_params[] = {
+	{ .desc = "coordinating_ops", .ops = &clk_dummy_div_coordinating_ops },
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_coord_ops,
+		       clk_rate_change_sibling_div_div_test_coord_ops_params, desc)
+
 static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 {
 	const struct clk_rate_change_sibling_div_div_test_param *param = test->param_value;
@@ -689,14 +738,16 @@ static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 		return ret;
 
 	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
-					     param->ops, CLK_SET_RATE_PARENT);
+					     param->ops,
+					     CLK_SET_RATE_PARENT | CLK_V2_RATE_NEGOTIATION);
 	ctx->child1.div = 1;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
 	if (ret)
 		return ret;
 
 	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
-					     param->ops, CLK_SET_RATE_PARENT);
+					     param->ops,
+					     CLK_SET_RATE_PARENT | CLK_V2_RATE_NEGOTIATION);
 	ctx->child2.div = 1;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
 	if (ret)
@@ -803,6 +854,48 @@ static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+static void clk_test_rate_change_sibling_div_div_4(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * With coordinated rate changes, the parent should be at 48 MHz,
+	 * child1 at 48 MHz (div=1), and child2 at 24 MHz (div=2). Child2's
+	 * keeps the same frequency, and the divider is changed from 1 to 2.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+}
+
+static void clk_test_rate_change_sibling_div_div_5(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(ctx->child2_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * With coordinated rate changes, the parent should be at 96 MHz,
+	 * child1 at 32 MHz (div=3), and child2 at 48 MHz (div=2).
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+}
+
 static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
 	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_1,
 			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
@@ -810,6 +903,12 @@ static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
 			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
 	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_3,
 			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_1,
+			 clk_rate_change_sibling_div_div_test_coord_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_4,
+			 clk_rate_change_sibling_div_div_test_coord_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_5,
+			 clk_rate_change_sibling_div_div_test_coord_ops_gen_params),
 	{}
 };
 

-- 
2.53.0

