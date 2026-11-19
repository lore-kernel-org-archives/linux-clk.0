Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121417;
	b=pq8NOUmpCUxcoPEAukMTzstkoTjJ1x5FvrCJIzq1cXJEv5M3co22Clt+qHA+1Yu/odd/
	 cm++TbY4bsI+uZYkonV9ZOnvwMZs1MnuI1g4O+Gkj9DoeDle1pV8Y4dpY+wG7THqApu7b
	 v0Ahoq9XSorwMBxsbc/3lQvgKMX3AMKVEIJPoga5ThdWXlfDhnsVZMmTzaEb88THpJ8wM
	 mO4U9Ysb4xV4VqzoJuX3ftqPrZbkQnuv4hlTP2bcVWx9tVCV5Z4xsRFjvZzLAVCBva9Ft
	 3rrR3j08cPivLEpSf4hwovOa5QSIIeClAb2uhl5l6iJhqauqFo48slqntKbJ70AGqiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=A+J8ZMKd8Oxqs6aLVr38XjoQ7tt3RPFD6UdrTOEY+BE=;
	b=vLGP9/X39vsHcLTYi/PSqNo9n/j5QiT+ZYFCE8m+Tk7vOjobI+eA1XOBo/pQHAj0iAbo
	 jLGmBKGC03hgiSfA4ccTKBMBalN5F2rvTibgsgbLIvhGhrwPd+YUC9/u3Zf/jtiWkW7vM
	 W9YJobgAuH+3mHXfjsMP2XoVRJ/u1mvV/w5/Nufxlos0Pk/sQ3vFTLZoBuPQVusXPHsTe
	 VbyrY9M+bGAKYI+60F0yQtOauYPFNKr64ntfpZzhHHbyPeHC0hzfnFDe8pYplJmEAzXt+
	 G+M+5R9DTamrpNVFK/c+dbFttV+DUPZLZVYVJ/Yaz5MIlWrnqAohpaUafG6GP1SOf2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RculgbxS;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DF8606B748
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 20:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DF8606B748
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RculgbxS
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491971ac844so127342f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 12:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795121415; x=1795726215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+J8ZMKd8Oxqs6aLVr38XjoQ7tt3RPFD6UdrTOEY+BE=;
        b=RculgbxSVUVv/hF858dSW9CM2krl/b9lo/pToS8Eagh7wN4NHg+qbrvN6liy+wRX4T
         Jo7kpNvsrlYLlzjxALnS87/LnD900R1k94eWk1Kag+v5JvXIcemoEpG+BzVxQXzzKeYx
         ZL5SZBdRn+XGnvT+jQPLDRmRp5mnT1kf9PrlzD56rrEf74NLXH54W5vbbatHOl/3mxjT
         VKr0Cp/HIQtw82PXNJJ9lZiZEAXqXIRpOflq+brcWSjIalX9jq6WnH535whrTUWpLlVl
         pOTNO9rY6c2dYgaRpXgV17bw7VzyqnyrTQQwTEGZvWYD9jdVr8M8mooFH4GtcW8w4lHr
         3H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121415; x=1795726215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+J8ZMKd8Oxqs6aLVr38XjoQ7tt3RPFD6UdrTOEY+BE=;
        b=Mz1lmT8In3cw3/lFbJyQzv6Acp/MfzP4CIG0xI/k9Fif+D4C6SeBFXvahcl0vGOQek
         lrotGtItS1/9+1oSy83qI6H7y7gJ4eVtb5fSVNmQLHHQ9M0GjJT3h/uqpn7g+PFUD0hS
         8WqY0QZ6kw7ZLjZKhg6sYUTSqNviuAcysAFyGCEvwi1oUu6jPEfcv8lACLEq+0V3XSnv
         elwj7JInr2n92nKE/8DpwPdAsxLNut5pS30i8YeWKi4YwuqvLA3MtJq0tDuswkABG7iD
         TRXW2N3W88gRmIntuLrbB+kA4Dtx7usA1CGpY0gUJLG93WM/c3nZV7vwZWaHNg2EVlXv
         S8Pw==
X-Forwarded-Encrypted: i=1; AL+hErENSznU+mvuhOe6CAW4HTkZG40m6A+YcIhHCqrIOXgkSzouOK4ksmPK2xFuL6Ai4UILr+3QSaVmwNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z882wORES35fIh5aV1T6FCs32Y8cBmE/Ev5cvzN4g9BezM71PEO
	PUGZ5RW3CsrPB7aIDtgJn7Wv1djNp6sLCb7r2/+//ZjkVKWtadSECs6UAJJjbeXuNJk=
X-Gm-Gg: AZFdTZeHeZzmTVOjHsbA4gTLpPUVyr7M7QkFdS/bytQj0kD3VsDq2gnxd4/LZROE93F
	s0x3tCP9zs2ngBBlGa78d8Vn5fAFXMvM9Nfim5ekcIemP5mdxaPmWtQt9ACX994JpEQo6Ww5AVp
	RbsLOTrUF9c3y9q0IWdIbDHm6hgfU2ikm9DoxPc3YlcrUTikOzGeukdFJ/woCz/6/y3EsSuwk+J
	pU3Wj6C6Zb5ac4cdM7SO9YaWtN71x7rh4MrQMkxweCAIv9AEbc4Ry7YX+Of1XwuMoV5O8a5Sari
	68/+dLJtTf14xqle9KqS6qiedV7974435XsRmKWm/P0AvfVY49E26cLBafboKwdqEj6VEdGHWVF
	dkEng/Lkqn6d0/j3MmYlQhmgIsjxHtX8ephwMxgxaduCcKhSD1ZHpTnBS2kBLY2JyF6oSqhpeo1
	CDq9N4pU+fhYV58oYCuvLN9todaLMxqaFeanYx/ZNFoBlJdPM0qemC4BH+LeVLShhT6WREBUiZr
	ozl2b82VOofyvHLB66F3EszTvfphYFBMa7BMAkQ12To6rOOhngqItBXokjVgDXn+wDza/cEJb+h
	Aep4wY5IE2TWlUm6j7XDjI4Nw3GfcH7XR8Sw3B+JnTNOvOl/MjpjVBx1zyo0d3/ivSfY5wwMkui
	ez4uoheGThEC+P+WiNQ==
X-Received: by 2002:a05:6000:990:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-4abb0c5d686mr1334490f8f.11.1795121415390;
        Thu, 19 Nov 2026 12:50:15 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1654826f8f.33.2026.11.19.12.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:50:14 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 19 Nov 2026 21:49:34 +0100
Subject: [PATCH v3 4/4] clk: divider: test: Add tests for rates above 4.29
 GHz
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-upstream-clk-divider-large-rates-v3-4-838eccd2e497@baylibre.com>
References: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
In-Reply-To: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the divider truncated rates above 4.29 GHz when
computing a divisor.

Add tests rounding and setting such rates on a divider with a 6 GHz
parent, one for each divisor computation, and rounding the maximum rate
(ULONG_MAX). Those above 4.29 GHz are skipped on 32-bit platforms, where
rates cannot exceed it. Also test round-closest dividers above their
parent rate and divisors above INT_MAX.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider_test.c | 394 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 392 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index 8ee1614128d0..2322b92b7f53 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -1,16 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * KUnit tests for clk_divider_bestdiv()
+ * KUnit tests for clk divider
  */
+#include <kunit/clk.h>
 #include <kunit/test.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/units.h>
 
 #define PARENT_RATE_1GHZ	GIGA
 #define PARENT_RATE_2GHZ	(2 * GIGA)
 #define PARENT_RATE_4GHZ	(4 * GIGA)
+#define PARENT_RATE_6GHZ	(6 * GIGA)
+#define PARENT_RATE_10GHZ	(10 * GIGA)
 
 KUNIT_DEFINE_ACTION_WRAPPER(clk_hw_unregister_fixed_rate_wrapper,
 			    clk_hw_unregister_fixed_rate, struct clk_hw *);
@@ -147,7 +151,393 @@ static struct kunit_suite clk_divider_bestdiv_test_suite = {
 	.test_cases = clk_divider_bestdiv_test_cases,
 };
 
-kunit_test_suite(clk_divider_bestdiv_test_suite);
+/*
+ * Register a fixed-rate parent at @parent_rate and a 3-bit divider (/1 to
+ * /8) using @fake_reg as its register, and return a consumer clk for the
+ * divider.
+ */
+static struct clk *clk_divider_large_rate_init(struct kunit *test,
+					       u32 *fake_reg,
+					       unsigned long parent_rate,
+					       unsigned long flags,
+					       u8 div_flags)
+{
+	struct clk_hw *parent_hw, *div_hw;
+	struct clk *clk;
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "large-rate-parent",
+					       NULL, 0, parent_rate);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate_wrapper,
+						  parent_hw));
+
+	div_hw = clk_hw_register_divider(NULL, "large-rate-div",
+					 "large-rate-parent", flags,
+					 (void __iomem __force *)fake_reg,
+					 0, 3, div_flags, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_divider_wrapper,
+						  div_hw));
+
+	clk = clk_hw_get_clk_kunit(test, div_hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
+
+	return clk;
+}
+
+/*
+ * Test that rounding a rate above 4.29 GHz computes the divisor from the
+ * full rate: the parent rate needs /1.
+ */
+static void clk_divider_large_rate_round_up(struct kunit *test)
+{
+	struct clk *clk;
+	u32 *fake_reg;
+
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	clk = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ, 0, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_round_rate(clk, PARENT_RATE_6GHZ),
+			PARENT_RATE_6GHZ);
+}
+
+/*
+ * Same with CLK_DIVIDER_ROUND_CLOSEST: 4.4 GHz is closer to 3 GHz (/2) than
+ * to 6 GHz (/1).
+ */
+static void clk_divider_large_rate_round_closest(struct kunit *test)
+{
+	struct clk *clk;
+	u32 *fake_reg;
+
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	clk = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
+					  0, CLK_DIVIDER_ROUND_CLOSEST);
+
+	KUNIT_EXPECT_EQ(test, clk_round_rate(clk, 4400 * MEGA),
+			PARENT_RATE_6GHZ / 2);
+}
+
+/*
+ * Test that setting a rate above 4.29 GHz programs the right divisor.
+ * With CLK_SET_RATE_PARENT the rounding searches the parent rates and
+ * finds /1, so this only checks the set_rate path.
+ */
+static void clk_divider_large_rate_set_rate(struct kunit *test)
+{
+	struct clk *clk;
+	u32 *fake_reg;
+
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	/* Start from /2 */
+	writel(1, (void __iomem __force *)fake_reg);
+
+	clk = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
+					  CLK_SET_RATE_PARENT, 0);
+
+	KUNIT_ASSERT_EQ(test, clk_set_rate(clk, PARENT_RATE_6GHZ), 0);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(clk), PARENT_RATE_6GHZ);
+	KUNIT_EXPECT_EQ(test, *fake_reg, 0);
+}
+
+/*
+ * Round ULONG_MAX, the usual way to ask for the maximum rate, on a divider
+ * with a @parent_rate parent: it must return the parent rate.
+ */
+static void clk_divider_large_rate_check_max(struct kunit *test,
+					     unsigned long parent_rate,
+					     u8 div_flags)
+{
+	struct clk *clk;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	clk = clk_divider_large_rate_init(test, fake_reg, parent_rate, 0,
+					  div_flags);
+
+	KUNIT_EXPECT_EQ(test, clk_round_rate(clk, ULONG_MAX), parent_rate);
+}
+
+static void clk_divider_large_rate_round_max(struct kunit *test)
+{
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	clk_divider_large_rate_check_max(test, PARENT_RATE_6GHZ, 0);
+}
+
+/* Same with a parent more than twice the 32-bit limit */
+static void clk_divider_large_rate_round_max_10ghz(struct kunit *test)
+{
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	clk_divider_large_rate_check_max(test, PARENT_RATE_10GHZ, 0);
+}
+
+/* Same with CLK_DIVIDER_ROUND_CLOSEST */
+static void clk_divider_large_rate_round_max_closest(struct kunit *test)
+{
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	clk_divider_large_rate_check_max(test, PARENT_RATE_6GHZ,
+					 CLK_DIVIDER_ROUND_CLOSEST);
+}
+
+/* Same with CLK_DIVIDER_POWER_OF_TWO and a 1 GHz parent */
+static void clk_divider_large_rate_round_max_pow2(struct kunit *test)
+{
+	clk_divider_large_rate_check_max(test, PARENT_RATE_1GHZ,
+					 CLK_DIVIDER_POWER_OF_TWO);
+}
+
+static struct kunit_case clk_divider_large_rate_test_cases[] = {
+	KUNIT_CASE(clk_divider_large_rate_round_up),
+	KUNIT_CASE(clk_divider_large_rate_round_closest),
+	KUNIT_CASE(clk_divider_large_rate_set_rate),
+	KUNIT_CASE(clk_divider_large_rate_round_max),
+	KUNIT_CASE(clk_divider_large_rate_round_max_10ghz),
+	KUNIT_CASE(clk_divider_large_rate_round_max_closest),
+	KUNIT_CASE(clk_divider_large_rate_round_max_pow2),
+	{}
+};
+
+static struct kunit_suite clk_divider_large_rate_test_suite = {
+	.name = "clk_divider_large_rate",
+	.test_cases = clk_divider_large_rate_test_cases,
+};
+
+/*
+ * Register a 1 GHz fixed-rate parent and a round-closest 3-bit divider using
+ * @fake_reg as its register and @table, if not NULL, as its divider table,
+ * and return a consumer clk for the divider.
+ */
+static struct clk *clk_divider_above_parent_init(struct kunit *test,
+						 u32 *fake_reg,
+						 const struct clk_div_table *table)
+{
+	struct clk_hw *parent_hw, *div_hw;
+	struct clk *clk;
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "above-parent-parent",
+					       NULL, 0, PARENT_RATE_1GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate_wrapper,
+						  parent_hw));
+
+	div_hw = clk_hw_register_divider_table(NULL, "above-parent-div",
+					       "above-parent-parent", 0,
+					       (void __iomem __force *)fake_reg,
+					       0, 3, CLK_DIVIDER_ROUND_CLOSEST,
+					       table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_divider_wrapper,
+						  div_hw));
+
+	clk = clk_hw_get_clk_kunit(test, div_hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
+
+	return clk;
+}
+
+/*
+ * Test that a round-closest divider asked for more than its parent rate
+ * picks its smallest divider: /1.
+ */
+static void clk_divider_above_parent_round_closest(struct kunit *test)
+{
+	struct clk *clk;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	clk = clk_divider_above_parent_init(test, fake_reg, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_round_rate(clk, PARENT_RATE_2GHZ),
+			PARENT_RATE_1GHZ);
+}
+
+/* Same with a divider table, whose smallest divider is /2 */
+static void clk_divider_above_parent_round_closest_table(struct kunit *test)
+{
+	struct clk *clk;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	clk = clk_divider_above_parent_init(test, fake_reg, bestdiv_table);
+
+	KUNIT_EXPECT_EQ(test, clk_round_rate(clk, PARENT_RATE_2GHZ),
+			PARENT_RATE_1GHZ / 2);
+}
+
+static struct kunit_case clk_divider_above_parent_test_cases[] = {
+	KUNIT_CASE(clk_divider_above_parent_round_closest),
+	KUNIT_CASE(clk_divider_above_parent_round_closest_table),
+	{}
+};
+
+static struct kunit_suite clk_divider_above_parent_test_suite = {
+	.name = "clk_divider_above_parent",
+	.test_cases = clk_divider_above_parent_test_cases,
+};
+
+static const struct clk_div_table large_div_table[] = {
+	{ .val = 0, .div = 1U << 31 },
+	{ .val = 1, .div = UINT_MAX },
+	{ }
+};
+
+struct clk_divider_large_div_param {
+	const char *name;
+	u64 parent_rate;
+	unsigned long rate;
+	unsigned long flags;
+	u8 div_flags;
+	const struct clk_div_table *table;
+	unsigned int expected_div;
+};
+
+static const struct clk_divider_large_div_param clk_divider_large_div_params[] = {
+	{
+		.name = "above_int_max_pow2",
+		.parent_rate = 3 * GIGA,
+		.rate = 1,
+		.div_flags = CLK_DIVIDER_POWER_OF_TWO,
+		.expected_div = 128,
+	}, {
+		.name = "above_uint_max",
+		.parent_rate = (1ULL << 32) + 1,
+		.rate = 1,
+		.expected_div = 8,
+	}, {
+		.name = "above_uint_max_closest",
+		.parent_rate = (1ULL << 32) + 1,
+		.rate = 1,
+		.div_flags = CLK_DIVIDER_ROUND_CLOSEST,
+		.expected_div = 8,
+	}, {
+		.name = "near_ulong_max_pow2",
+		.parent_rate = ULONG_MAX - 127,
+		.rate = 1,
+		.div_flags = CLK_DIVIDER_POWER_OF_TWO,
+		.expected_div = 128,
+	}, {
+		.name = "large_table_div",
+		.parent_rate = 1ULL << 33,
+		.rate = 4,
+		.table = large_div_table,
+		.expected_div = 1U << 31,
+	}, {
+		.name = "large_table_div_closest",
+		.parent_rate = 1ULL << 33,
+		.rate = 4,
+		.div_flags = CLK_DIVIDER_ROUND_CLOSEST,
+		.table = large_div_table,
+		.expected_div = 1U << 31,
+	}, {
+		.name = "last_table_div_set_rate_parent",
+		.parent_rate = 3 * GIGA,
+		.rate = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.table = large_div_table,
+		.expected_div = UINT_MAX,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_divider_large_div, clk_divider_large_div_params, name);
+
+static void clk_divider_large_div_round_rate(struct kunit *test)
+{
+	const struct clk_divider_large_div_param *param = test->param_value;
+	struct clk_hw *parent_hw, *div_hw;
+	struct clk *clk;
+	u32 *fake_reg;
+
+	if (param->parent_rate > ULONG_MAX)
+		kunit_skip(test, "parent rate needs a 64-bit unsigned long");
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "large-div-parent", NULL,
+					       0, param->parent_rate);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate_wrapper,
+						  parent_hw));
+
+	div_hw = clk_hw_register_divider_table(NULL, "large-div", "large-div-parent",
+					       param->flags,
+					       (void __iomem __force *)fake_reg,
+					       0, 3, param->div_flags, param->table,
+					       NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_divider_wrapper,
+						  div_hw));
+	clk = clk_hw_get_clk_kunit(test, div_hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
+
+	KUNIT_EXPECT_EQ(test, clk_round_rate(clk, param->rate),
+			DIV_ROUND_UP_ULL(param->parent_rate, param->expected_div));
+}
+
+static void clk_divider_large_div_get_val(struct kunit *test)
+{
+	unsigned long parent_rate = (unsigned long)UINT_MAX + 3;
+
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "divisor above UINT_MAX needs a 64-bit unsigned long");
+
+	/* An oversized divisor must not wrap to /2 before it is encoded. */
+	KUNIT_EXPECT_EQ(test, divider_get_val(1, parent_rate, NULL, 3, 0), 7);
+	KUNIT_EXPECT_EQ(test, divider_get_val(1, parent_rate, bestdiv_table, 3, 0),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, divider_get_val(1, parent_rate, NULL, 3,
+					      CLK_DIVIDER_POWER_OF_TWO), -EINVAL);
+}
+
+static struct kunit_case clk_divider_large_div_test_cases[] = {
+	KUNIT_CASE_PARAM(clk_divider_large_div_round_rate,
+			 clk_divider_large_div_gen_params),
+	KUNIT_CASE(clk_divider_large_div_get_val),
+	{}
+};
+
+static struct kunit_suite clk_divider_large_div_test_suite = {
+	.name = "clk_divider_large_div",
+	.test_cases = clk_divider_large_div_test_cases,
+};
+
+kunit_test_suites(&clk_divider_bestdiv_test_suite,
+		  &clk_divider_large_rate_test_suite,
+		  &clk_divider_above_parent_test_suite,
+		  &clk_divider_large_div_test_suite);
 
 MODULE_DESCRIPTION("KUnit tests for clk divider");
 MODULE_LICENSE("GPL");

-- 
2.56.1

