Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A418F3C9421
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420255; cv=none; b=psO2Ke5TAxgbmc2gf+0qiHuGZb+YawbDp9lGtjTtcshIHXbmhsbZtg6y0dTGuXP1LTdc7M7qnD+0ocO1rrh/8z1BF2NB/EOIfbQlNAmnGmwCa+H70TxzYEhEv6nh9QGQu7B+Q38rCDZuqS1MG+9x/FFDh5Nn2zEuZwjvQ0J/fgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420255; c=relaxed/simple;
	bh=Bm7pp+07qGJu1B0VUFy7Z/f2WSbgupLCXm/OyTHO3Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bITKgN8K9IiPXKOxz8dKR9EAGWgUAWXZBrrf+RgzxH3Cdf3XEnOvRF6Q9BA4S4U7Ujt9M568CUh8TEh3chKzLPRlACAbM0dhIln7cKM5ktXjeeQIFbTx4yM+nglBxUMJJV9r0S0KN0ZmBZnmCNVxqRVUSIvys7i84gBNFtEDHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=abMio7HN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dHHT5rny; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="abMio7HN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dHHT5rny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8VqiPfNyRpz8kYAKQ2w76sOZmgiz0HEwyYNTcglMAU=;
	b=abMio7HN2QIPIvERgNT1kB1Y0HohYfDpqA/pe/5rsakr3rE602mjBWIfReLzS8G6numGMu
	4jYClouTHrXxtTYVo7hRS1VrF3xdHz1/97rabtenD6dT0Du4wLwfjt/f6t8UbXsd+12QXy
	jpQBycxHGdxpWOcjMvrFZFdszR7yTrE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-U9z-8vqOMGKkN62tyqEXrQ-1; Fri, 13 Mar 2026 12:44:09 -0400
X-MC-Unique: U9z-8vqOMGKkN62tyqEXrQ-1
X-Mimecast-MFC-AGG-ID: U9z-8vqOMGKkN62tyqEXrQ_1773420249
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd781c0d90so1851174085a.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420249; x=1774025049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8VqiPfNyRpz8kYAKQ2w76sOZmgiz0HEwyYNTcglMAU=;
        b=dHHT5rny3WO1aJpgrr042uGNUn2xR3cIKO/81bPUuwbp/Rx0rSTigFtiyIEuuNeCEi
         9PIhbDA0UtugPiY+uHga1b7f6vDXM3SwVobcb0+RTbCKSTm3g1PLmEFETYkOUoSfpyCa
         4MdsxMpn9ezOph+LYLpCcEZpwMGgI4l5MkCOFuyytG2DvwjXRfDkbpGwQDKjR6BgElJG
         V4ZxZRNp8ZL3dwo0gT0Uyrfumf4juRtA06NDbacckgR7MfElfS8HnaPiS2/LIeiPbC8K
         ojLHhzjKbYTqZOZhPQi1k3M9g+lmZXLvdedwJXQb0FeoI9ix3uTG9z/jTL3ta/dtOKS+
         ThXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420249; x=1774025049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i8VqiPfNyRpz8kYAKQ2w76sOZmgiz0HEwyYNTcglMAU=;
        b=fI/DYrYxtwRWAZFnKpSvu2ZoYL1O8FHxYC4Yob43ZnSKZH1b55VHniNCDgYoH/tiqu
         yys23W376ejsZhjyZJ+4oBSSlfnMu2f9FaTMO/QxMLs+pJkF9IKja/oogUTaSN0u0NgT
         PyNKfOXhuCttZCYuvWZrY4yxKSB20oJDTEupvIdFYqwNPrxy+9t9a6E7dmbq0eW+qZZ4
         0jI9pgVn1P0QhvEgL0Vhobbmn71bNM8N1ApGQPKyZJHSVi9znMflEhhpf2ZMIIVdAGY7
         st+PemNrdpYXfgpLP0x2BN/j3bzr2zAIJSab5xuaUqhh0agxKsPUpuUlpLUD/hH7MM9D
         GSag==
X-Gm-Message-State: AOJu0Yy8+prOH2TPVRe2F6vrcAgZxVnIN3ZcwPIVgD7DgHWJCsX6N0hY
	nfKb6DIvRrZiDJ/Br/ThKlzMpfolefzyl8MLWPOP+VNBX2eLq848US+YA95dgRKL0SLqaPuL58e
	E9/cdq2Vakxuqv/FjKWvjgf6B/uBkGxtEs/9hyXbNQgsDcLPGBpV8sEaQieuokg==
X-Gm-Gg: ATEYQzyharyXrkqpYLB23zqa3SXtvJkYznnkQudfv+fHzZx9GpVgVZvGQvEOycZtjoZ
	RRbqeAtzh/s8mTDNdh25nOffybTCKEpfrzfKURITllZV1DHzWc6scXfnO2JIzivBw8xNd4erEsn
	tjUNsbQ44dyWBRqnUVvdBJip5kYPkDowGVno1Zsq/ZJgcNnw3SNEv8VAb5KmUkdvj6sFXOS83GM
	lSYrxRmu6VzMGpwHvl1Gkax4Y8PHmY7qNp0w+CcYYmZThcuJic6pzORjbFSUqndd45cHcPpUhs0
	b1RairfLmN8MOJdmPrbKRd/SlN5obbLOosJ1MFhZFdMctg5/exBYNR6MxUL/aGTnIVj5UNjrF46
	vGHkA2oOgK7gXLJMCnDFraIjkNtswItcZEpcr60h55lRG7CNJqOoNlUbObvrv
X-Received: by 2002:a05:620a:4713:b0:8cd:aa61:ad8f with SMTP id af79cd13be357-8cdb5a795e9mr532307985a.14.1773420248850;
        Fri, 13 Mar 2026 09:44:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4713:b0:8cd:aa61:ad8f with SMTP id af79cd13be357-8cdb5a795e9mr532304585a.14.1773420248383;
        Fri, 13 Mar 2026 09:44:08 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda215c2a9sm587964785a.46.2026.03.13.09.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:44:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 13 Mar 2026 12:43:11 -0400
Subject: [PATCH v6 4/7] clk: test: introduce additional test case showing
 sibling clock rate change
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-clk-scaling-v6-4-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
In-Reply-To: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5295; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Bm7pp+07qGJu1B0VUFy7Z/f2WSbgupLCXm/OyTHO3Qc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDK32J2ujmM6mWyXsXG6l1hJ67ZHdzWvVbp0e7EJrZghN
 ck32WdCRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMpv8zI8K1OZ77Fx79ntGV3
 /vy4Yzbf6vNaz6+E7m4N6vAvD2tvWcTw3+dH84OaFcJsi/gErdX3RO7+fexx8J17HgVbw84m859
 v4QIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a test case where the parent clk rate is set to a rate that's
acceptable to both children, however the sibling clk rate is affected.

The tests in this commit use the following simplified clk tree with
the initial state:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
set, and the parent is capable of achieving any rate.

child1 requests 32 MHz, and the tree should end up with the state:

                     parent
                     96 MHz
                    /      \
              child1        child2
              32 MHz        24 MHz

However, child2 ends up with it's parent rate due to the way the clk
core currently calculates handles rate changes.

                     parent
                     96 MHz
                    /      \
              child1        child2
              32 MHz        96 MHz
                            ^^^^^^
                            Incorrect. Should be 24 MHz.

Let's document this behavior with a kunit test since some boards are
unknowingly dependent on this behavior.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 325da7c84ab2ecdcf6b7a023ce4c2c4ef2d49862..40bc01a0259d8d49ca4c1983b6c10a3684a95f0b 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -181,6 +181,26 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	struct clk_hw *parent_hw = clk_hw_get_parent(hw);
+
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	req->best_parent_rate = clk_hw_get_children_lcm(parent_hw, hw, req->rate);
+	req->best_parent_hw = parent_hw;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static const struct clk_ops clk_dummy_div_lcm_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_lcm_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;
@@ -677,6 +697,18 @@ clk_rate_change_sibling_div_div_test_regular_ops_params[] = {
 KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_ops,
 		       clk_rate_change_sibling_div_div_test_regular_ops_params, desc)
 
+static const struct clk_rate_change_sibling_div_div_test_param
+clk_rate_change_sibling_div_div_test_lcm_ops_v1_params[] = {
+	{
+		.desc = "lcm_ops_v1",
+		.ops = &clk_dummy_div_lcm_ops,
+		.extra_child_flags = 0,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_lcm_ops_v1,
+		       clk_rate_change_sibling_div_div_test_lcm_ops_v1_params, desc)
+
 static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 {
 	const struct clk_rate_change_sibling_div_div_test_param *param = test->param_value;
@@ -777,11 +809,40 @@ static void clk_test_rate_change_sibling_div_div_2_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is also affected. This preserves existing behavior in the clk
+ * core that some drivers may be unknowingly dependent on.
+ */
+static void clk_test_rate_change_sibling_div_div_3_v1(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * With LCM-based coordinated rate changes, the parent should be at
+	 * 96 MHz (LCM of 32 and 24), child1 at 32 MHz (div=3), and child2
+	 * at 24 MHz (div=4). However, the clk core by default will clobber
+	 * the sibling clk rate, so the sibling gets the parent rate.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
 static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
 	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_1,
 			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
 	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_2_v1,
 			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_3_v1,
+			 clk_rate_change_sibling_div_div_test_lcm_ops_v1_gen_params),
 	{}
 };
 

-- 
2.53.0

